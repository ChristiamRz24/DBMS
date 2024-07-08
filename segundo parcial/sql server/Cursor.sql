-- Procedimiento almacenado para registrar mudanza y actualizar estado del vehículo
CREATE PROCEDURE RegistrarMudanzaYActualizarVehiculo2
    @ID_CLIENTE INT,
    @ID_SUCURSAL INT,
    @ID_VEHICULO INT,
    @COSTO_MUDANZA FLOAT,
    @DESCUENTO_MUDANZA NUMERIC(2,0),
    @ID_ESTADO_VEHICULO INT,
    @ID_ESTADO_MUDANZA INT
AS
BEGIN
    SET NOCOUNT ON;

    BEGIN TRANSACTION;

    BEGIN TRY
        -- Insertar una nueva mudanza
        DECLARE @ID_MUDANZA INT;
        INSERT INTO MUDANZA (COSTO_MUDANZA, DESCUEMTO_MUDANZA)
        VALUES (@COSTO_MUDANZA, @DESCUENTO_MUDANZA);

        SET @ID_MUDANZA = SCOPE_IDENTITY();

        -- Insertar detalle de mudanza
        INSERT INTO DETALLE_MUDANZA (ID_MUDANZA, ID_SUCURSAL, ID_CLIENTE, ID_ESTADO_MUDANZA)
        VALUES (@ID_MUDANZA, @ID_SUCURSAL, @ID_CLIENTE, @ID_ESTADO_MUDANZA);

        -- Actualizar estado del vehículo
        UPDATE VEHICULO
        SET ID_ESTADO_VEHICULO = @ID_ESTADO_VEHICULO
        WHERE ID_VEHICULO = @ID_VEHICULO;

        COMMIT TRANSACTION;
    END TRY
    BEGIN CATCH
        ROLLBACK TRANSACTION;
        THROW;
    END CATCH;
END
GO

-- Cursor para procesar mudanzas y actualizar estados de vehículos
CREATE PROCEDURE sp_cursorMudanza
AS
BEGIN
    SET NOCOUNT ON;

    DECLARE @ID_MUDANZA INT;
    DECLARE @ID_VEHICULO INT;

    DECLARE cursorMudanza CURSOR FOR
    SELECT dm.ID_MUDANZA, e.ID_VEHICULO
    FROM DETALLE_MUDANZA dm
    JOIN EMPLEADO e ON e.ID_SUCURSAL = dm.ID_SUCURSAL;

    OPEN cursorMudanza;

    FETCH NEXT FROM cursorMudanza INTO @ID_MUDANZA, @ID_VEHICULO;

    WHILE @@FETCH_STATUS = 0
    BEGIN
        BEGIN TRANSACTION;

        BEGIN TRY
            -- Actualizar estado del vehículo
            UPDATE VEHICULO
            SET ID_ESTADO_VEHICULO = 1 -- ESTADO ACTUALIZADO
            WHERE ID_VEHICULO = @ID_VEHICULO;

            -- Actualizar estado de la mudanza
            UPDATE DETALLE_MUDANZA
            SET ID_ESTADO_MUDANZA = 1 -- ESTADO ACTUALIZADO
            WHERE ID_MUDANZA = @ID_MUDANZA;

            COMMIT TRANSACTION;
        END TRY
        BEGIN CATCH
            ROLLBACK TRANSACTION;
            THROW;
        END CATCH;

        FETCH NEXT FROM cursorMudanza INTO @ID_MUDANZA, @ID_VEHICULO;
    END

    CLOSE cursorMudanza;
    DEALLOCATE cursorMudanza;
END
GO

