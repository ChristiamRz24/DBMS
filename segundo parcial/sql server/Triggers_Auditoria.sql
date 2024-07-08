
                    IF NOT EXISTS (
                        SELECT * FROM INFORMATION_SCHEMA.TABLES 
                        WHERE TABLE_NAME = 'auditoria'
                    )
                    BEGIN
                        CREATE TABLE auditoria (
                            ID INT IDENTITY(1,1) PRIMARY KEY,
                            TablaAfectada NVARCHAR(255),
                            FechaHora DATETIME,
                            UsuarioActual NVARCHAR(255),
                            DetalleAccion NVARCHAR(MAX)
                        )
                    END


                CREATE TRIGGER RUTAS_Insert_Audit
                ON RUTAS
                AFTER INSERT
                AS
                BEGIN
                    DECLARE @UsuarioActual NVARCHAR(255) = SYSTEM_USER
                    INSERT INTO auditoria (TablaAfectada, FechaHora, UsuarioActual, DetalleAccion)
                    SELECT 'RUTAS', GETDATE(), @UsuarioActual, 'INSERT'
                    FROM INSERTED
                END
GO

                CREATE TRIGGER RUTAS_Update_Audit
                ON RUTAS
                AFTER UPDATE
                AS
                BEGIN
                    DECLARE @UsuarioActual NVARCHAR(255) = SYSTEM_USER
                    INSERT INTO auditoria (TablaAfectada, FechaHora, UsuarioActual, DetalleAccion)
                    SELECT 'RUTAS', GETDATE(), @UsuarioActual, 'UPDATE'
                    FROM INSERTED
                END
GO

                CREATE TRIGGER RUTAS_Delete_Audit
                ON RUTAS
                AFTER DELETE
                AS
                BEGIN
                    DECLARE @UsuarioActual NVARCHAR(255) = SYSTEM_USER
                    INSERT INTO auditoria (TablaAfectada, FechaHora, UsuarioActual, DetalleAccion)
                    SELECT 'RUTAS', GETDATE(), @UsuarioActual, 'DELETE'
                    FROM DELETED
                END
GO

                CREATE TRIGGER VUELOS_Insert_Audit
                ON VUELOS
                AFTER INSERT
                AS
                BEGIN
                    DECLARE @UsuarioActual NVARCHAR(255) = SYSTEM_USER
                    INSERT INTO auditoria (TablaAfectada, FechaHora, UsuarioActual, DetalleAccion)
                    SELECT 'VUELOS', GETDATE(), @UsuarioActual, 'INSERT'
                    FROM INSERTED
                END
GO

                CREATE TRIGGER VUELOS_Update_Audit
                ON VUELOS
                AFTER UPDATE
                AS
                BEGIN
                    DECLARE @UsuarioActual NVARCHAR(255) = SYSTEM_USER
                    INSERT INTO auditoria (TablaAfectada, FechaHora, UsuarioActual, DetalleAccion)
                    SELECT 'VUELOS', GETDATE(), @UsuarioActual, 'UPDATE'
                    FROM INSERTED
                END
GO

                CREATE TRIGGER VUELOS_Delete_Audit
                ON VUELOS
                AFTER DELETE
                AS
                BEGIN
                    DECLARE @UsuarioActual NVARCHAR(255) = SYSTEM_USER
                    INSERT INTO auditoria (TablaAfectada, FechaHora, UsuarioActual, DetalleAccion)
                    SELECT 'VUELOS', GETDATE(), @UsuarioActual, 'DELETE'
                    FROM DELETED
                END
GO

                CREATE TRIGGER ARTICULOS_Insert_Audit
                ON ARTICULOS
                AFTER INSERT
                AS
                BEGIN
                    DECLARE @UsuarioActual NVARCHAR(255) = SYSTEM_USER
                    INSERT INTO auditoria (TablaAfectada, FechaHora, UsuarioActual, DetalleAccion)
                    SELECT 'ARTICULOS', GETDATE(), @UsuarioActual, 'INSERT'
                    FROM INSERTED
                END
GO

                CREATE TRIGGER ARTICULOS_Update_Audit
                ON ARTICULOS
                AFTER UPDATE
                AS
                BEGIN
                    DECLARE @UsuarioActual NVARCHAR(255) = SYSTEM_USER
                    INSERT INTO auditoria (TablaAfectada, FechaHora, UsuarioActual, DetalleAccion)
                    SELECT 'ARTICULOS', GETDATE(), @UsuarioActual, 'UPDATE'
                    FROM INSERTED
                END
GO

                CREATE TRIGGER ARTICULOS_Delete_Audit
                ON ARTICULOS
                AFTER DELETE
                AS
                BEGIN
                    DECLARE @UsuarioActual NVARCHAR(255) = SYSTEM_USER
                    INSERT INTO auditoria (TablaAfectada, FechaHora, UsuarioActual, DetalleAccion)
                    SELECT 'ARTICULOS', GETDATE(), @UsuarioActual, 'DELETE'
                    FROM DELETED
                END
GO

                CREATE TRIGGER CIUDAD_Insert_Audit
                ON CIUDAD
                AFTER INSERT
                AS
                BEGIN
                    DECLARE @UsuarioActual NVARCHAR(255) = SYSTEM_USER
                    INSERT INTO auditoria (TablaAfectada, FechaHora, UsuarioActual, DetalleAccion)
                    SELECT 'CIUDAD', GETDATE(), @UsuarioActual, 'INSERT'
                    FROM INSERTED
                END
GO

                CREATE TRIGGER CIUDAD_Update_Audit
                ON CIUDAD
                AFTER UPDATE
                AS
                BEGIN
                    DECLARE @UsuarioActual NVARCHAR(255) = SYSTEM_USER
                    INSERT INTO auditoria (TablaAfectada, FechaHora, UsuarioActual, DetalleAccion)
                    SELECT 'CIUDAD', GETDATE(), @UsuarioActual, 'UPDATE'
                    FROM INSERTED
                END
GO

                CREATE TRIGGER CIUDAD_Delete_Audit
                ON CIUDAD
                AFTER DELETE
                AS
                BEGIN
                    DECLARE @UsuarioActual NVARCHAR(255) = SYSTEM_USER
                    INSERT INTO auditoria (TablaAfectada, FechaHora, UsuarioActual, DetalleAccion)
                    SELECT 'CIUDAD', GETDATE(), @UsuarioActual, 'DELETE'
                    FROM DELETED
                END
GO

                CREATE TRIGGER CLIENTE_Insert_Audit
                ON CLIENTE
                AFTER INSERT
                AS
                BEGIN
                    DECLARE @UsuarioActual NVARCHAR(255) = SYSTEM_USER
                    INSERT INTO auditoria (TablaAfectada, FechaHora, UsuarioActual, DetalleAccion)
                    SELECT 'CLIENTE', GETDATE(), @UsuarioActual, 'INSERT'
                    FROM INSERTED
                END
GO

                CREATE TRIGGER CLIENTE_Update_Audit
                ON CLIENTE
                AFTER UPDATE
                AS
                BEGIN
                    DECLARE @UsuarioActual NVARCHAR(255) = SYSTEM_USER
                    INSERT INTO auditoria (TablaAfectada, FechaHora, UsuarioActual, DetalleAccion)
                    SELECT 'CLIENTE', GETDATE(), @UsuarioActual, 'UPDATE'
                    FROM INSERTED
                END
GO

                CREATE TRIGGER CLIENTE_Delete_Audit
                ON CLIENTE
                AFTER DELETE
                AS
                BEGIN
                    DECLARE @UsuarioActual NVARCHAR(255) = SYSTEM_USER
                    INSERT INTO auditoria (TablaAfectada, FechaHora, UsuarioActual, DetalleAccion)
                    SELECT 'CLIENTE', GETDATE(), @UsuarioActual, 'DELETE'
                    FROM DELETED
                END
GO

                CREATE TRIGGER DETALLE_ARTICULOS_Insert_Audit
                ON DETALLE_ARTICULOS
                AFTER INSERT
                AS
                BEGIN
                    DECLARE @UsuarioActual NVARCHAR(255) = SYSTEM_USER
                    INSERT INTO auditoria (TablaAfectada, FechaHora, UsuarioActual, DetalleAccion)
                    SELECT 'DETALLE_ARTICULOS', GETDATE(), @UsuarioActual, 'INSERT'
                    FROM INSERTED
                END
GO

                CREATE TRIGGER DETALLE_ARTICULOS_Update_Audit
                ON DETALLE_ARTICULOS
                AFTER UPDATE
                AS
                BEGIN
                    DECLARE @UsuarioActual NVARCHAR(255) = SYSTEM_USER
                    INSERT INTO auditoria (TablaAfectada, FechaHora, UsuarioActual, DetalleAccion)
                    SELECT 'DETALLE_ARTICULOS', GETDATE(), @UsuarioActual, 'UPDATE'
                    FROM INSERTED
                END
GO

                CREATE TRIGGER DETALLE_ARTICULOS_Delete_Audit
                ON DETALLE_ARTICULOS
                AFTER DELETE
                AS
                BEGIN
                    DECLARE @UsuarioActual NVARCHAR(255) = SYSTEM_USER
                    INSERT INTO auditoria (TablaAfectada, FechaHora, UsuarioActual, DetalleAccion)
                    SELECT 'DETALLE_ARTICULOS', GETDATE(), @UsuarioActual, 'DELETE'
                    FROM DELETED
                END
GO

                CREATE TRIGGER DETALLE_MANTENIMIENTO_Insert_Audit
                ON DETALLE_MANTENIMIENTO
                AFTER INSERT
                AS
                BEGIN
                    DECLARE @UsuarioActual NVARCHAR(255) = SYSTEM_USER
                    INSERT INTO auditoria (TablaAfectada, FechaHora, UsuarioActual, DetalleAccion)
                    SELECT 'DETALLE_MANTENIMIENTO', GETDATE(), @UsuarioActual, 'INSERT'
                    FROM INSERTED
                END
GO

                CREATE TRIGGER DETALLE_MANTENIMIENTO_Update_Audit
                ON DETALLE_MANTENIMIENTO
                AFTER UPDATE
                AS
                BEGIN
                    DECLARE @UsuarioActual NVARCHAR(255) = SYSTEM_USER
                    INSERT INTO auditoria (TablaAfectada, FechaHora, UsuarioActual, DetalleAccion)
                    SELECT 'DETALLE_MANTENIMIENTO', GETDATE(), @UsuarioActual, 'UPDATE'
                    FROM INSERTED
                END
GO

                CREATE TRIGGER DETALLE_MANTENIMIENTO_Delete_Audit
                ON DETALLE_MANTENIMIENTO
                AFTER DELETE
                AS
                BEGIN
                    DECLARE @UsuarioActual NVARCHAR(255) = SYSTEM_USER
                    INSERT INTO auditoria (TablaAfectada, FechaHora, UsuarioActual, DetalleAccion)
                    SELECT 'DETALLE_MANTENIMIENTO', GETDATE(), @UsuarioActual, 'DELETE'
                    FROM DELETED
                END
GO

                CREATE TRIGGER DETALLE_MUDANZA_Insert_Audit
                ON DETALLE_MUDANZA
                AFTER INSERT
                AS
                BEGIN
                    DECLARE @UsuarioActual NVARCHAR(255) = SYSTEM_USER
                    INSERT INTO auditoria (TablaAfectada, FechaHora, UsuarioActual, DetalleAccion)
                    SELECT 'DETALLE_MUDANZA', GETDATE(), @UsuarioActual, 'INSERT'
                    FROM INSERTED
                END
GO

                CREATE TRIGGER DETALLE_MUDANZA_Update_Audit
                ON DETALLE_MUDANZA
                AFTER UPDATE
                AS
                BEGIN
                    DECLARE @UsuarioActual NVARCHAR(255) = SYSTEM_USER
                    INSERT INTO auditoria (TablaAfectada, FechaHora, UsuarioActual, DetalleAccion)
                    SELECT 'DETALLE_MUDANZA', GETDATE(), @UsuarioActual, 'UPDATE'
                    FROM INSERTED
                END
GO

                CREATE TRIGGER DETALLE_MUDANZA_Delete_Audit
                ON DETALLE_MUDANZA
                AFTER DELETE
                AS
                BEGIN
                    DECLARE @UsuarioActual NVARCHAR(255) = SYSTEM_USER
                    INSERT INTO auditoria (TablaAfectada, FechaHora, UsuarioActual, DetalleAccion)
                    SELECT 'DETALLE_MUDANZA', GETDATE(), @UsuarioActual, 'DELETE'
                    FROM DELETED
                END
GO

                CREATE TRIGGER EMPLEADO_Insert_Audit
                ON EMPLEADO
                AFTER INSERT
                AS
                BEGIN
                    DECLARE @UsuarioActual NVARCHAR(255) = SYSTEM_USER
                    INSERT INTO auditoria (TablaAfectada, FechaHora, UsuarioActual, DetalleAccion)
                    SELECT 'EMPLEADO', GETDATE(), @UsuarioActual, 'INSERT'
                    FROM INSERTED
                END
GO

                CREATE TRIGGER EMPLEADO_Update_Audit
                ON EMPLEADO
                AFTER UPDATE
                AS
                BEGIN
                    DECLARE @UsuarioActual NVARCHAR(255) = SYSTEM_USER
                    INSERT INTO auditoria (TablaAfectada, FechaHora, UsuarioActual, DetalleAccion)
                    SELECT 'EMPLEADO', GETDATE(), @UsuarioActual, 'UPDATE'
                    FROM INSERTED
                END
GO

                CREATE TRIGGER EMPLEADO_Delete_Audit
                ON EMPLEADO
                AFTER DELETE
                AS
                BEGIN
                    DECLARE @UsuarioActual NVARCHAR(255) = SYSTEM_USER
                    INSERT INTO auditoria (TablaAfectada, FechaHora, UsuarioActual, DetalleAccion)
                    SELECT 'EMPLEADO', GETDATE(), @UsuarioActual, 'DELETE'
                    FROM DELETED
                END
GO

                CREATE TRIGGER EMPRESA_Insert_Audit
                ON EMPRESA
                AFTER INSERT
                AS
                BEGIN
                    DECLARE @UsuarioActual NVARCHAR(255) = SYSTEM_USER
                    INSERT INTO auditoria (TablaAfectada, FechaHora, UsuarioActual, DetalleAccion)
                    SELECT 'EMPRESA', GETDATE(), @UsuarioActual, 'INSERT'
                    FROM INSERTED
                END
GO

                CREATE TRIGGER EMPRESA_Update_Audit
                ON EMPRESA
                AFTER UPDATE
                AS
                BEGIN
                    DECLARE @UsuarioActual NVARCHAR(255) = SYSTEM_USER
                    INSERT INTO auditoria (TablaAfectada, FechaHora, UsuarioActual, DetalleAccion)
                    SELECT 'EMPRESA', GETDATE(), @UsuarioActual, 'UPDATE'
                    FROM INSERTED
                END
GO

                CREATE TRIGGER EMPRESA_Delete_Audit
                ON EMPRESA
                AFTER DELETE
                AS
                BEGIN
                    DECLARE @UsuarioActual NVARCHAR(255) = SYSTEM_USER
                    INSERT INTO auditoria (TablaAfectada, FechaHora, UsuarioActual, DetalleAccion)
                    SELECT 'EMPRESA', GETDATE(), @UsuarioActual, 'DELETE'
                    FROM DELETED
                END
GO

                CREATE TRIGGER ESTADO_MUDANZA_Insert_Audit
                ON ESTADO_MUDANZA
                AFTER INSERT
                AS
                BEGIN
                    DECLARE @UsuarioActual NVARCHAR(255) = SYSTEM_USER
                    INSERT INTO auditoria (TablaAfectada, FechaHora, UsuarioActual, DetalleAccion)
                    SELECT 'ESTADO_MUDANZA', GETDATE(), @UsuarioActual, 'INSERT'
                    FROM INSERTED
                END
GO

                CREATE TRIGGER ESTADO_MUDANZA_Update_Audit
                ON ESTADO_MUDANZA
                AFTER UPDATE
                AS
                BEGIN
                    DECLARE @UsuarioActual NVARCHAR(255) = SYSTEM_USER
                    INSERT INTO auditoria (TablaAfectada, FechaHora, UsuarioActual, DetalleAccion)
                    SELECT 'ESTADO_MUDANZA', GETDATE(), @UsuarioActual, 'UPDATE'
                    FROM INSERTED
                END
GO

                CREATE TRIGGER ESTADO_MUDANZA_Delete_Audit
                ON ESTADO_MUDANZA
                AFTER DELETE
                AS
                BEGIN
                    DECLARE @UsuarioActual NVARCHAR(255) = SYSTEM_USER
                    INSERT INTO auditoria (TablaAfectada, FechaHora, UsuarioActual, DetalleAccion)
                    SELECT 'ESTADO_MUDANZA', GETDATE(), @UsuarioActual, 'DELETE'
                    FROM DELETED
                END
GO

                CREATE TRIGGER ESTADO_VEHICULO_Insert_Audit
                ON ESTADO_VEHICULO
                AFTER INSERT
                AS
                BEGIN
                    DECLARE @UsuarioActual NVARCHAR(255) = SYSTEM_USER
                    INSERT INTO auditoria (TablaAfectada, FechaHora, UsuarioActual, DetalleAccion)
                    SELECT 'ESTADO_VEHICULO', GETDATE(), @UsuarioActual, 'INSERT'
                    FROM INSERTED
                END
GO

                CREATE TRIGGER ESTADO_VEHICULO_Update_Audit
                ON ESTADO_VEHICULO
                AFTER UPDATE
                AS
                BEGIN
                    DECLARE @UsuarioActual NVARCHAR(255) = SYSTEM_USER
                    INSERT INTO auditoria (TablaAfectada, FechaHora, UsuarioActual, DetalleAccion)
                    SELECT 'ESTADO_VEHICULO', GETDATE(), @UsuarioActual, 'UPDATE'
                    FROM INSERTED
                END
GO

                CREATE TRIGGER ESTADO_VEHICULO_Delete_Audit
                ON ESTADO_VEHICULO
                AFTER DELETE
                AS
                BEGIN
                    DECLARE @UsuarioActual NVARCHAR(255) = SYSTEM_USER
                    INSERT INTO auditoria (TablaAfectada, FechaHora, UsuarioActual, DetalleAccion)
                    SELECT 'ESTADO_VEHICULO', GETDATE(), @UsuarioActual, 'DELETE'
                    FROM DELETED
                END
GO

                CREATE TRIGGER MATENIMIENTO_Insert_Audit
                ON MATENIMIENTO
                AFTER INSERT
                AS
                BEGIN
                    DECLARE @UsuarioActual NVARCHAR(255) = SYSTEM_USER
                    INSERT INTO auditoria (TablaAfectada, FechaHora, UsuarioActual, DetalleAccion)
                    SELECT 'MATENIMIENTO', GETDATE(), @UsuarioActual, 'INSERT'
                    FROM INSERTED
                END
GO

                CREATE TRIGGER MATENIMIENTO_Update_Audit
                ON MATENIMIENTO
                AFTER UPDATE
                AS
                BEGIN
                    DECLARE @UsuarioActual NVARCHAR(255) = SYSTEM_USER
                    INSERT INTO auditoria (TablaAfectada, FechaHora, UsuarioActual, DetalleAccion)
                    SELECT 'MATENIMIENTO', GETDATE(), @UsuarioActual, 'UPDATE'
                    FROM INSERTED
                END
GO

                CREATE TRIGGER MATENIMIENTO_Delete_Audit
                ON MATENIMIENTO
                AFTER DELETE
                AS
                BEGIN
                    DECLARE @UsuarioActual NVARCHAR(255) = SYSTEM_USER
                    INSERT INTO auditoria (TablaAfectada, FechaHora, UsuarioActual, DetalleAccion)
                    SELECT 'MATENIMIENTO', GETDATE(), @UsuarioActual, 'DELETE'
                    FROM DELETED
                END
GO

                CREATE TRIGGER MUDANZA_Insert_Audit
                ON MUDANZA
                AFTER INSERT
                AS
                BEGIN
                    DECLARE @UsuarioActual NVARCHAR(255) = SYSTEM_USER
                    INSERT INTO auditoria (TablaAfectada, FechaHora, UsuarioActual, DetalleAccion)
                    SELECT 'MUDANZA', GETDATE(), @UsuarioActual, 'INSERT'
                    FROM INSERTED
                END
GO

                CREATE TRIGGER MUDANZA_Update_Audit
                ON MUDANZA
                AFTER UPDATE
                AS
                BEGIN
                    DECLARE @UsuarioActual NVARCHAR(255) = SYSTEM_USER
                    INSERT INTO auditoria (TablaAfectada, FechaHora, UsuarioActual, DetalleAccion)
                    SELECT 'MUDANZA', GETDATE(), @UsuarioActual, 'UPDATE'
                    FROM INSERTED
                END
GO

                CREATE TRIGGER MUDANZA_Delete_Audit
                ON MUDANZA
                AFTER DELETE
                AS
                BEGIN
                    DECLARE @UsuarioActual NVARCHAR(255) = SYSTEM_USER
                    INSERT INTO auditoria (TablaAfectada, FechaHora, UsuarioActual, DetalleAccion)
                    SELECT 'MUDANZA', GETDATE(), @UsuarioActual, 'DELETE'
                    FROM DELETED
                END
GO

                CREATE TRIGGER PROVINCIA_Insert_Audit
                ON PROVINCIA
                AFTER INSERT
                AS
                BEGIN
                    DECLARE @UsuarioActual NVARCHAR(255) = SYSTEM_USER
                    INSERT INTO auditoria (TablaAfectada, FechaHora, UsuarioActual, DetalleAccion)
                    SELECT 'PROVINCIA', GETDATE(), @UsuarioActual, 'INSERT'
                    FROM INSERTED
                END
GO

                CREATE TRIGGER PROVINCIA_Update_Audit
                ON PROVINCIA
                AFTER UPDATE
                AS
                BEGIN
                    DECLARE @UsuarioActual NVARCHAR(255) = SYSTEM_USER
                    INSERT INTO auditoria (TablaAfectada, FechaHora, UsuarioActual, DetalleAccion)
                    SELECT 'PROVINCIA', GETDATE(), @UsuarioActual, 'UPDATE'
                    FROM INSERTED
                END
GO

                CREATE TRIGGER PROVINCIA_Delete_Audit
                ON PROVINCIA
                AFTER DELETE
                AS
                BEGIN
                    DECLARE @UsuarioActual NVARCHAR(255) = SYSTEM_USER
                    INSERT INTO auditoria (TablaAfectada, FechaHora, UsuarioActual, DetalleAccion)
                    SELECT 'PROVINCIA', GETDATE(), @UsuarioActual, 'DELETE'
                    FROM DELETED
                END
GO

                CREATE TRIGGER SUCURSAL_Insert_Audit
                ON SUCURSAL
                AFTER INSERT
                AS
                BEGIN
                    DECLARE @UsuarioActual NVARCHAR(255) = SYSTEM_USER
                    INSERT INTO auditoria (TablaAfectada, FechaHora, UsuarioActual, DetalleAccion)
                    SELECT 'SUCURSAL', GETDATE(), @UsuarioActual, 'INSERT'
                    FROM INSERTED
                END
GO

                CREATE TRIGGER SUCURSAL_Update_Audit
                ON SUCURSAL
                AFTER UPDATE
                AS
                BEGIN
                    DECLARE @UsuarioActual NVARCHAR(255) = SYSTEM_USER
                    INSERT INTO auditoria (TablaAfectada, FechaHora, UsuarioActual, DetalleAccion)
                    SELECT 'SUCURSAL', GETDATE(), @UsuarioActual, 'UPDATE'
                    FROM INSERTED
                END
GO

                CREATE TRIGGER SUCURSAL_Delete_Audit
                ON SUCURSAL
                AFTER DELETE
                AS
                BEGIN
                    DECLARE @UsuarioActual NVARCHAR(255) = SYSTEM_USER
                    INSERT INTO auditoria (TablaAfectada, FechaHora, UsuarioActual, DetalleAccion)
                    SELECT 'SUCURSAL', GETDATE(), @UsuarioActual, 'DELETE'
                    FROM DELETED
                END
GO

                CREATE TRIGGER TIPO_EMPLEADO_Insert_Audit
                ON TIPO_EMPLEADO
                AFTER INSERT
                AS
                BEGIN
                    DECLARE @UsuarioActual NVARCHAR(255) = SYSTEM_USER
                    INSERT INTO auditoria (TablaAfectada, FechaHora, UsuarioActual, DetalleAccion)
                    SELECT 'TIPO_EMPLEADO', GETDATE(), @UsuarioActual, 'INSERT'
                    FROM INSERTED
                END
GO

                CREATE TRIGGER TIPO_EMPLEADO_Update_Audit
                ON TIPO_EMPLEADO
                AFTER UPDATE
                AS
                BEGIN
                    DECLARE @UsuarioActual NVARCHAR(255) = SYSTEM_USER
                    INSERT INTO auditoria (TablaAfectada, FechaHora, UsuarioActual, DetalleAccion)
                    SELECT 'TIPO_EMPLEADO', GETDATE(), @UsuarioActual, 'UPDATE'
                    FROM INSERTED
                END
GO

                CREATE TRIGGER TIPO_EMPLEADO_Delete_Audit
                ON TIPO_EMPLEADO
                AFTER DELETE
                AS
                BEGIN
                    DECLARE @UsuarioActual NVARCHAR(255) = SYSTEM_USER
                    INSERT INTO auditoria (TablaAfectada, FechaHora, UsuarioActual, DetalleAccion)
                    SELECT 'TIPO_EMPLEADO', GETDATE(), @UsuarioActual, 'DELETE'
                    FROM DELETED
                END
GO

                CREATE TRIGGER TIPO_SUCURSAL_Insert_Audit
                ON TIPO_SUCURSAL
                AFTER INSERT
                AS
                BEGIN
                    DECLARE @UsuarioActual NVARCHAR(255) = SYSTEM_USER
                    INSERT INTO auditoria (TablaAfectada, FechaHora, UsuarioActual, DetalleAccion)
                    SELECT 'TIPO_SUCURSAL', GETDATE(), @UsuarioActual, 'INSERT'
                    FROM INSERTED
                END
GO

                CREATE TRIGGER TIPO_SUCURSAL_Update_Audit
                ON TIPO_SUCURSAL
                AFTER UPDATE
                AS
                BEGIN
                    DECLARE @UsuarioActual NVARCHAR(255) = SYSTEM_USER
                    INSERT INTO auditoria (TablaAfectada, FechaHora, UsuarioActual, DetalleAccion)
                    SELECT 'TIPO_SUCURSAL', GETDATE(), @UsuarioActual, 'UPDATE'
                    FROM INSERTED
                END
GO

                CREATE TRIGGER TIPO_SUCURSAL_Delete_Audit
                ON TIPO_SUCURSAL
                AFTER DELETE
                AS
                BEGIN
                    DECLARE @UsuarioActual NVARCHAR(255) = SYSTEM_USER
                    INSERT INTO auditoria (TablaAfectada, FechaHora, UsuarioActual, DetalleAccion)
                    SELECT 'TIPO_SUCURSAL', GETDATE(), @UsuarioActual, 'DELETE'
                    FROM DELETED
                END
GO

                CREATE TRIGGER VEHICULO_Insert_Audit
                ON VEHICULO
                AFTER INSERT
                AS
                BEGIN
                    DECLARE @UsuarioActual NVARCHAR(255) = SYSTEM_USER
                    INSERT INTO auditoria (TablaAfectada, FechaHora, UsuarioActual, DetalleAccion)
                    SELECT 'VEHICULO', GETDATE(), @UsuarioActual, 'INSERT'
                    FROM INSERTED
                END
GO

                CREATE TRIGGER VEHICULO_Update_Audit
                ON VEHICULO
                AFTER UPDATE
                AS
                BEGIN
                    DECLARE @UsuarioActual NVARCHAR(255) = SYSTEM_USER
                    INSERT INTO auditoria (TablaAfectada, FechaHora, UsuarioActual, DetalleAccion)
                    SELECT 'VEHICULO', GETDATE(), @UsuarioActual, 'UPDATE'
                    FROM INSERTED
                END
GO

                CREATE TRIGGER VEHICULO_Delete_Audit
                ON VEHICULO
                AFTER DELETE
                AS
                BEGIN
                    DECLARE @UsuarioActual NVARCHAR(255) = SYSTEM_USER
                    INSERT INTO auditoria (TablaAfectada, FechaHora, UsuarioActual, DetalleAccion)
                    SELECT 'VEHICULO', GETDATE(), @UsuarioActual, 'DELETE'
                    FROM DELETED
                END
GO

                CREATE TRIGGER auditoria_Insert_Audit
                ON auditoria
                AFTER INSERT
                AS
                BEGIN
                    DECLARE @UsuarioActual NVARCHAR(255) = SYSTEM_USER
                    INSERT INTO auditoria (TablaAfectada, FechaHora, UsuarioActual, DetalleAccion)
                    SELECT 'auditoria', GETDATE(), @UsuarioActual, 'INSERT'
                    FROM INSERTED
                END
GO

                CREATE TRIGGER auditoria_Update_Audit
                ON auditoria
                AFTER UPDATE
                AS
                BEGIN
                    DECLARE @UsuarioActual NVARCHAR(255) = SYSTEM_USER
                    INSERT INTO auditoria (TablaAfectada, FechaHora, UsuarioActual, DetalleAccion)
                    SELECT 'auditoria', GETDATE(), @UsuarioActual, 'UPDATE'
                    FROM INSERTED
                END
GO

                CREATE TRIGGER auditoria_Delete_Audit
                ON auditoria
                AFTER DELETE
                AS
                BEGIN
                    DECLARE @UsuarioActual NVARCHAR(255) = SYSTEM_USER
                    INSERT INTO auditoria (TablaAfectada, FechaHora, UsuarioActual, DetalleAccion)
                    SELECT 'auditoria', GETDATE(), @UsuarioActual, 'DELETE'
                    FROM DELETED
                END
GO

                CREATE TRIGGER PAGO_Insert_Audit
                ON PAGO
                AFTER INSERT
                AS
                BEGIN
                    DECLARE @UsuarioActual NVARCHAR(255) = SYSTEM_USER
                    INSERT INTO auditoria (TablaAfectada, FechaHora, UsuarioActual, DetalleAccion)
                    SELECT 'PAGO', GETDATE(), @UsuarioActual, 'INSERT'
                    FROM INSERTED
                END
GO

                CREATE TRIGGER PAGO_Update_Audit
                ON PAGO
                AFTER UPDATE
                AS
                BEGIN
                    DECLARE @UsuarioActual NVARCHAR(255) = SYSTEM_USER
                    INSERT INTO auditoria (TablaAfectada, FechaHora, UsuarioActual, DetalleAccion)
                    SELECT 'PAGO', GETDATE(), @UsuarioActual, 'UPDATE'
                    FROM INSERTED
                END
GO

                CREATE TRIGGER PAGO_Delete_Audit
                ON PAGO
                AFTER DELETE
                AS
                BEGIN
                    DECLARE @UsuarioActual NVARCHAR(255) = SYSTEM_USER
                    INSERT INTO auditoria (TablaAfectada, FechaHora, UsuarioActual, DetalleAccion)
                    SELECT 'PAGO', GETDATE(), @UsuarioActual, 'DELETE'
                    FROM DELETED
                END
GO
