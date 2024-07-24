CREATE TABLE IF NOT EXISTS auditoria (id SERIAL PRIMARY KEY, tabla VARCHAR(50), fecha DATE, hora TIME, usuario VARCHAR(50), operacion VARCHAR(250));

DELIMITER //

CREATE TRIGGER before_insert_on_articulos
BEFORE INSERT ON mudanzas.articulos
FOR EACH ROW
BEGIN
INSERT INTO mudanzas.auditoria (tabla, fecha, hora, usuario, operacion)
VALUES ('articulos', CURRENT_DATE, CURRENT_TIME, USER(), CONCAT('INSERT ON articulos VALUES (', NEW.NOMBRE_ARTICULO, ', ', NEW.DESCRIPCION_ARTICULO, ', ', NEW.MARCA_ARTICULO, ')'));
END //

DELIMITER ;

DELIMITER //

CREATE TRIGGER before_update_on_articulos
BEFORE UPDATE ON mudanzas.articulos
FOR EACH ROW
BEGIN
INSERT INTO mudanzas.auditoria (tabla, fecha, hora, usuario, operacion)
VALUES ('articulos', CURRENT_DATE, CURRENT_TIME, USER(), CONCAT('UPDATE ON articulos VALUES (', OLD.NOMBRE_ARTICULO, ', ', OLD.DESCRIPCION_ARTICULO, ', ', OLD.MARCA_ARTICULO, ') TO (', NEW.NOMBRE_ARTICULO, ', ', NEW.DESCRIPCION_ARTICULO, ', ', NEW.MARCA_ARTICULO, ')'));
END //

DELIMITER ;

DELIMITER //

CREATE TRIGGER before_delete_on_articulos
BEFORE DELETE ON mudanzas.articulos
FOR EACH ROW
BEGIN
INSERT INTO mudanzas.auditoria (tabla, fecha, hora, usuario, operacion)
VALUES ('articulos', CURRENT_DATE, CURRENT_TIME, USER(), CONCAT('DELETE ON articulos VALUES (', OLD.NOMBRE_ARTICULO, ', ', OLD.DESCRIPCION_ARTICULO, ', ', OLD.MARCA_ARTICULO, ')'));
END //

DELIMITER ;

DELIMITER //

CREATE TRIGGER before_insert_on_ciudad
BEFORE INSERT ON mudanzas.ciudad
FOR EACH ROW
BEGIN
INSERT INTO mudanzas.auditoria (tabla, fecha, hora, usuario, operacion)
VALUES ('ciudad', CURRENT_DATE, CURRENT_TIME, USER(), CONCAT('INSERT ON ciudad VALUES (', NEW.ID_PROVINCIA, ', ', NEW.NOMBRE_CIUDAD, ')'));
END //

DELIMITER ;

DELIMITER //

CREATE TRIGGER before_update_on_ciudad
BEFORE UPDATE ON mudanzas.ciudad
FOR EACH ROW
BEGIN
INSERT INTO mudanzas.auditoria (tabla, fecha, hora, usuario, operacion)
VALUES ('ciudad', CURRENT_DATE, CURRENT_TIME, USER(), CONCAT('UPDATE ON ciudad VALUES (', OLD.ID_PROVINCIA, ', ', OLD.NOMBRE_CIUDAD, ') TO (', NEW.ID_PROVINCIA, ', ', NEW.NOMBRE_CIUDAD, ')'));
END //

DELIMITER ;

DELIMITER //

CREATE TRIGGER before_delete_on_ciudad
BEFORE DELETE ON mudanzas.ciudad
FOR EACH ROW
BEGIN
INSERT INTO mudanzas.auditoria (tabla, fecha, hora, usuario, operacion)
VALUES ('ciudad', CURRENT_DATE, CURRENT_TIME, USER(), CONCAT('DELETE ON ciudad VALUES (', OLD.ID_PROVINCIA, ', ', OLD.NOMBRE_CIUDAD, ')'));
END //

DELIMITER ;

DELIMITER //

CREATE TRIGGER before_insert_on_cliente
BEFORE INSERT ON mudanzas.cliente
FOR EACH ROW
BEGIN
INSERT INTO mudanzas.auditoria (tabla, fecha, hora, usuario, operacion)
VALUES ('cliente', CURRENT_DATE, CURRENT_TIME, USER(), CONCAT('INSERT ON cliente VALUES (', NEW.ID_CIUDAD, ', ', NEW.NOMBRE_CLIENTE, ', ', NEW.APELLIDO_CLIENTE, ', ', NEW.TELEFONO_CLIENTE, ', ', NEW.DIRECCION_CLIENTE, ', ', NEW.FECHA_NACIMIENTO_CLIENTE, ')'));
END //

DELIMITER ;

DELIMITER //

CREATE TRIGGER before_update_on_cliente
BEFORE UPDATE ON mudanzas.cliente
FOR EACH ROW
BEGIN
INSERT INTO mudanzas.auditoria (tabla, fecha, hora, usuario, operacion)
VALUES ('cliente', CURRENT_DATE, CURRENT_TIME, USER(), CONCAT('UPDATE ON cliente VALUES (', OLD.ID_CIUDAD, ', ', OLD.NOMBRE_CLIENTE, ', ', OLD.APELLIDO_CLIENTE, ', ', OLD.TELEFONO_CLIENTE, ', ', OLD.DIRECCION_CLIENTE, ', ', OLD.FECHA_NACIMIENTO_CLIENTE, ') TO (', NEW.ID_CIUDAD, ', ', NEW.NOMBRE_CLIENTE, ', ', NEW.APELLIDO_CLIENTE, ', ', NEW.TELEFONO_CLIENTE, ', ', NEW.DIRECCION_CLIENTE, ', ', NEW.FECHA_NACIMIENTO_CLIENTE, ')'));
END //

DELIMITER ;

DELIMITER //

CREATE TRIGGER before_delete_on_cliente
BEFORE DELETE ON mudanzas.cliente
FOR EACH ROW
BEGIN
INSERT INTO mudanzas.auditoria (tabla, fecha, hora, usuario, operacion)
VALUES ('cliente', CURRENT_DATE, CURRENT_TIME, USER(), CONCAT('DELETE ON cliente VALUES (', OLD.ID_CIUDAD, ', ', OLD.NOMBRE_CLIENTE, ', ', OLD.APELLIDO_CLIENTE, ', ', OLD.TELEFONO_CLIENTE, ', ', OLD.DIRECCION_CLIENTE, ', ', OLD.FECHA_NACIMIENTO_CLIENTE, ')'));
END //

DELIMITER ;

DELIMITER //

CREATE TRIGGER before_insert_on_detalle_articulos
BEFORE INSERT ON mudanzas.detalle_articulos
FOR EACH ROW
BEGIN
INSERT INTO mudanzas.auditoria (tabla, fecha, hora, usuario, operacion)
VALUES ('detalle_articulos', CURRENT_DATE, CURRENT_TIME, USER(), CONCAT('INSERT ON detalle_articulos VALUES (', NEW.ID_MUDANZA, ', ', NEW.CANTIDAD_ARTICULO, ', ', NEW.PESO_ARTICULO, ')'));
END //

DELIMITER ;

DELIMITER //

CREATE TRIGGER before_update_on_detalle_articulos
BEFORE UPDATE ON mudanzas.detalle_articulos
FOR EACH ROW
BEGIN
INSERT INTO mudanzas.auditoria (tabla, fecha, hora, usuario, operacion)
VALUES ('detalle_articulos', CURRENT_DATE, CURRENT_TIME, USER(), CONCAT('UPDATE ON detalle_articulos VALUES (', OLD.ID_MUDANZA, ', ', OLD.CANTIDAD_ARTICULO, ', ', OLD.PESO_ARTICULO, ') TO (', NEW.ID_MUDANZA, ', ', NEW.CANTIDAD_ARTICULO, ', ', NEW.PESO_ARTICULO, ')'));
END //

DELIMITER ;

DELIMITER //

CREATE TRIGGER before_delete_on_detalle_articulos
BEFORE DELETE ON mudanzas.detalle_articulos
FOR EACH ROW
BEGIN
INSERT INTO mudanzas.auditoria (tabla, fecha, hora, usuario, operacion)
VALUES ('detalle_articulos', CURRENT_DATE, CURRENT_TIME, USER(), CONCAT('DELETE ON detalle_articulos VALUES (', OLD.ID_MUDANZA, ', ', OLD.CANTIDAD_ARTICULO, ', ', OLD.PESO_ARTICULO, ')'));
END //

DELIMITER ;

DELIMITER //

CREATE TRIGGER before_insert_on_detalle_mantenimiento
BEFORE INSERT ON mudanzas.detalle_mantenimiento
FOR EACH ROW
BEGIN
INSERT INTO mudanzas.auditoria (tabla, fecha, hora, usuario, operacion)
VALUES ('detalle_mantenimiento', CURRENT_DATE, CURRENT_TIME, USER(), CONCAT('INSERT ON detalle_mantenimiento VALUES (', NEW.ID_VEHICULO, ', ', NEW.FECHA_INICIO_MANTENIMIENTO, ', ', NEW.FECHA_FIN_MANTENIMIENTO, ')'));
END //

DELIMITER ;

DELIMITER //

CREATE TRIGGER before_update_on_detalle_mantenimiento
BEFORE UPDATE ON mudanzas.detalle_mantenimiento
FOR EACH ROW
BEGIN
INSERT INTO mudanzas.auditoria (tabla, fecha, hora, usuario, operacion)
VALUES ('detalle_mantenimiento', CURRENT_DATE, CURRENT_TIME, USER(), CONCAT('UPDATE ON detalle_mantenimiento VALUES (', OLD.ID_VEHICULO, ', ', OLD.FECHA_INICIO_MANTENIMIENTO, ', ', OLD.FECHA_FIN_MANTENIMIENTO, ') TO (', NEW.ID_VEHICULO, ', ', NEW.FECHA_INICIO_MANTENIMIENTO, ', ', NEW.FECHA_FIN_MANTENIMIENTO, ')'));
END //

DELIMITER ;

DELIMITER //

CREATE TRIGGER before_delete_on_detalle_mantenimiento
BEFORE DELETE ON mudanzas.detalle_mantenimiento
FOR EACH ROW
BEGIN
INSERT INTO mudanzas.auditoria (tabla, fecha, hora, usuario, operacion)
VALUES ('detalle_mantenimiento', CURRENT_DATE, CURRENT_TIME, USER(), CONCAT('DELETE ON detalle_mantenimiento VALUES (', OLD.ID_VEHICULO, ', ', OLD.FECHA_INICIO_MANTENIMIENTO, ', ', OLD.FECHA_FIN_MANTENIMIENTO, ')'));
END //

DELIMITER ;

DELIMITER //

CREATE TRIGGER before_insert_on_detalle_mudanza
BEFORE INSERT ON mudanzas.detalle_mudanza
FOR EACH ROW
BEGIN
INSERT INTO mudanzas.auditoria (tabla, fecha, hora, usuario, operacion)
VALUES ('detalle_mudanza', CURRENT_DATE, CURRENT_TIME, USER(), CONCAT('INSERT ON detalle_mudanza VALUES (', NEW.ID_SUCURSAL, ', ', NEW.ID_CLIENTE, ', ', NEW.ID_ESTADO_MUDANZA, ')'));
END //

DELIMITER ;

DELIMITER //

CREATE TRIGGER before_update_on_detalle_mudanza
BEFORE UPDATE ON mudanzas.detalle_mudanza
FOR EACH ROW
BEGIN
INSERT INTO mudanzas.auditoria (tabla, fecha, hora, usuario, operacion)
VALUES ('detalle_mudanza', CURRENT_DATE, CURRENT_TIME, USER(), CONCAT('UPDATE ON detalle_mudanza VALUES (', OLD.ID_SUCURSAL, ', ', OLD.ID_CLIENTE, ', ', OLD.ID_ESTADO_MUDANZA, ') TO (', NEW.ID_SUCURSAL, ', ', NEW.ID_CLIENTE, ', ', NEW.ID_ESTADO_MUDANZA, ')'));
END //

DELIMITER ;

DELIMITER //

CREATE TRIGGER before_delete_on_detalle_mudanza
BEFORE DELETE ON mudanzas.detalle_mudanza
FOR EACH ROW
BEGIN
INSERT INTO mudanzas.auditoria (tabla, fecha, hora, usuario, operacion)
VALUES ('detalle_mudanza', CURRENT_DATE, CURRENT_TIME, USER(), CONCAT('DELETE ON detalle_mudanza VALUES (', OLD.ID_SUCURSAL, ', ', OLD.ID_CLIENTE, ', ', OLD.ID_ESTADO_MUDANZA, ')'));
END //

DELIMITER ;

DELIMITER //

CREATE TRIGGER before_insert_on_empleado
BEFORE INSERT ON mudanzas.empleado
FOR EACH ROW
BEGIN
INSERT INTO mudanzas.auditoria (tabla, fecha, hora, usuario, operacion)
VALUES ('empleado', CURRENT_DATE, CURRENT_TIME, USER(), CONCAT('INSERT ON empleado VALUES (', NEW.ID_SUCURSAL, ', ', NEW.ID_TIPO_SUCURSAL2, ', ', NEW.ID_VEHICULO, ', ', NEW.NOMBRE_EMPLEADO, ', ', NEW.APELLIDO_EMPLEADO, ', ', NEW.TELEFONO_EMPLEADO, ', ', NEW.DIRECCION_EMPLEADO, ', ', NEW.FECHA_NACIMIENTO_EMPLEADO, ', ', NEW.FECHA_INGRESO_EMPLEADO, ')'));
END //

DELIMITER ;

DELIMITER //

CREATE TRIGGER before_update_on_empleado
BEFORE UPDATE ON mudanzas.empleado
FOR EACH ROW
BEGIN
INSERT INTO mudanzas.auditoria (tabla, fecha, hora, usuario, operacion)
VALUES ('empleado', CURRENT_DATE, CURRENT_TIME, USER(), CONCAT('UPDATE ON empleado VALUES (', OLD.ID_SUCURSAL, ', ', OLD.ID_TIPO_SUCURSAL2, ', ', OLD.ID_VEHICULO, ', ', OLD.NOMBRE_EMPLEADO, ', ', OLD.APELLIDO_EMPLEADO, ', ', OLD.TELEFONO_EMPLEADO, ', ', OLD.DIRECCION_EMPLEADO, ', ', OLD.FECHA_NACIMIENTO_EMPLEADO, ', ', OLD.FECHA_INGRESO_EMPLEADO, ') TO (', NEW.ID_SUCURSAL, ', ', NEW.ID_TIPO_SUCURSAL2, ', ', NEW.ID_VEHICULO, ', ', NEW.NOMBRE_EMPLEADO, ', ', NEW.APELLIDO_EMPLEADO, ', ', NEW.TELEFONO_EMPLEADO, ', ', NEW.DIRECCION_EMPLEADO, ', ', NEW.FECHA_NACIMIENTO_EMPLEADO, ', ', NEW.FECHA_INGRESO_EMPLEADO, ')'));
END //

DELIMITER ;

DELIMITER //

CREATE TRIGGER before_delete_on_empleado
BEFORE DELETE ON mudanzas.empleado
FOR EACH ROW
BEGIN
INSERT INTO mudanzas.auditoria (tabla, fecha, hora, usuario, operacion)
VALUES ('empleado', CURRENT_DATE, CURRENT_TIME, USER(), CONCAT('DELETE ON empleado VALUES (', OLD.ID_SUCURSAL, ', ', OLD.ID_TIPO_SUCURSAL2, ', ', OLD.ID_VEHICULO, ', ', OLD.NOMBRE_EMPLEADO, ', ', OLD.APELLIDO_EMPLEADO, ', ', OLD.TELEFONO_EMPLEADO, ', ', OLD.DIRECCION_EMPLEADO, ', ', OLD.FECHA_NACIMIENTO_EMPLEADO, ', ', OLD.FECHA_INGRESO_EMPLEADO, ')'));
END //

DELIMITER ;

DELIMITER //

CREATE TRIGGER before_insert_on_empresa
BEFORE INSERT ON mudanzas.empresa
FOR EACH ROW
BEGIN
INSERT INTO mudanzas.auditoria (tabla, fecha, hora, usuario, operacion)
VALUES ('empresa', CURRENT_DATE, CURRENT_TIME, USER(), CONCAT('INSERT ON empresa VALUES (', NEW.NOMBRE_EMPRESA, ', ', NEW.RUC_EMPRESA, ')'));
END //

DELIMITER ;

DELIMITER //

CREATE TRIGGER before_update_on_empresa
BEFORE UPDATE ON mudanzas.empresa
FOR EACH ROW
BEGIN
INSERT INTO mudanzas.auditoria (tabla, fecha, hora, usuario, operacion)
VALUES ('empresa', CURRENT_DATE, CURRENT_TIME, USER(), CONCAT('UPDATE ON empresa VALUES (', OLD.NOMBRE_EMPRESA, ', ', OLD.RUC_EMPRESA, ') TO (', NEW.NOMBRE_EMPRESA, ', ', NEW.RUC_EMPRESA, ')'));
END //

DELIMITER ;

DELIMITER //

CREATE TRIGGER before_delete_on_empresa
BEFORE DELETE ON mudanzas.empresa
FOR EACH ROW
BEGIN
INSERT INTO mudanzas.auditoria (tabla, fecha, hora, usuario, operacion)
VALUES ('empresa', CURRENT_DATE, CURRENT_TIME, USER(), CONCAT('DELETE ON empresa VALUES (', OLD.NOMBRE_EMPRESA, ', ', OLD.RUC_EMPRESA, ')'));
END //

DELIMITER ;

DELIMITER //

CREATE TRIGGER before_insert_on_estado_mudanza
BEFORE INSERT ON mudanzas.estado_mudanza
FOR EACH ROW
BEGIN
INSERT INTO mudanzas.auditoria (tabla, fecha, hora, usuario, operacion)
VALUES ('estado_mudanza', CURRENT_DATE, CURRENT_TIME, USER(), CONCAT('INSERT ON estado_mudanza VALUES (', NEW.NOMBRE_ESTADO_MUDANZA, ', ', NEW.DETALLE_ESTADO_MUDANZA, ')'));
END //

DELIMITER ;

DELIMITER //

CREATE TRIGGER before_update_on_estado_mudanza
BEFORE UPDATE ON mudanzas.estado_mudanza
FOR EACH ROW
BEGIN
INSERT INTO mudanzas.auditoria (tabla, fecha, hora, usuario, operacion)
VALUES ('estado_mudanza', CURRENT_DATE, CURRENT_TIME, USER(), CONCAT('UPDATE ON estado_mudanza VALUES (', OLD.NOMBRE_ESTADO_MUDANZA, ', ', OLD.DETALLE_ESTADO_MUDANZA, ') TO (', NEW.NOMBRE_ESTADO_MUDANZA, ', ', NEW.DETALLE_ESTADO_MUDANZA, ')'));
END //

DELIMITER ;

DELIMITER //

CREATE TRIGGER before_delete_on_estado_mudanza
BEFORE DELETE ON mudanzas.estado_mudanza
FOR EACH ROW
BEGIN
INSERT INTO mudanzas.auditoria (tabla, fecha, hora, usuario, operacion)
VALUES ('estado_mudanza', CURRENT_DATE, CURRENT_TIME, USER(), CONCAT('DELETE ON estado_mudanza VALUES (', OLD.NOMBRE_ESTADO_MUDANZA, ', ', OLD.DETALLE_ESTADO_MUDANZA, ')'));
END //

DELIMITER ;

DELIMITER //

CREATE TRIGGER before_insert_on_estado_vehiculo
BEFORE INSERT ON mudanzas.estado_vehiculo
FOR EACH ROW
BEGIN
INSERT INTO mudanzas.auditoria (tabla, fecha, hora, usuario, operacion)
VALUES ('estado_vehiculo', CURRENT_DATE, CURRENT_TIME, USER(), CONCAT('INSERT ON estado_vehiculo VALUES (', NEW.NOMBRE_ESTADO_VEHICULO, ', ', NEW.DETALLE_ESTADO_VEHICULO, ')'));
END //

DELIMITER ;

DELIMITER //

CREATE TRIGGER before_update_on_estado_vehiculo
BEFORE UPDATE ON mudanzas.estado_vehiculo
FOR EACH ROW
BEGIN
INSERT INTO mudanzas.auditoria (tabla, fecha, hora, usuario, operacion)
VALUES ('estado_vehiculo', CURRENT_DATE, CURRENT_TIME, USER(), CONCAT('UPDATE ON estado_vehiculo VALUES (', OLD.NOMBRE_ESTADO_VEHICULO, ', ', OLD.DETALLE_ESTADO_VEHICULO, ') TO (', NEW.NOMBRE_ESTADO_VEHICULO, ', ', NEW.DETALLE_ESTADO_VEHICULO, ')'));
END //

DELIMITER ;

DELIMITER //

CREATE TRIGGER before_delete_on_estado_vehiculo
BEFORE DELETE ON mudanzas.estado_vehiculo
FOR EACH ROW
BEGIN
INSERT INTO mudanzas.auditoria (tabla, fecha, hora, usuario, operacion)
VALUES ('estado_vehiculo', CURRENT_DATE, CURRENT_TIME, USER(), CONCAT('DELETE ON estado_vehiculo VALUES (', OLD.NOMBRE_ESTADO_VEHICULO, ', ', OLD.DETALLE_ESTADO_VEHICULO, ')'));
END //

DELIMITER ;

DELIMITER //

CREATE TRIGGER before_insert_on_matenimiento
BEFORE INSERT ON mudanzas.matenimiento
FOR EACH ROW
BEGIN
INSERT INTO mudanzas.auditoria (tabla, fecha, hora, usuario, operacion)
VALUES ('matenimiento', CURRENT_DATE, CURRENT_TIME, USER(), CONCAT('INSERT ON matenimiento VALUES (', NEW.EMPRESA_MATENIMIENTO, ', ', NEW.COSTO_MATENIMIENTO, ', ', NEW.DESCUENTO_MANTENIMIENTO, ')'));
END //

DELIMITER ;

DELIMITER //

CREATE TRIGGER before_update_on_matenimiento
BEFORE UPDATE ON mudanzas.matenimiento
FOR EACH ROW
BEGIN
INSERT INTO mudanzas.auditoria (tabla, fecha, hora, usuario, operacion)
VALUES ('matenimiento', CURRENT_DATE, CURRENT_TIME, USER(), CONCAT('UPDATE ON matenimiento VALUES (', OLD.EMPRESA_MATENIMIENTO, ', ', OLD.COSTO_MATENIMIENTO, ', ', OLD.DESCUENTO_MANTENIMIENTO, ') TO (', NEW.EMPRESA_MATENIMIENTO, ', ', NEW.COSTO_MATENIMIENTO, ', ', NEW.DESCUENTO_MANTENIMIENTO, ')'));
END //

DELIMITER ;

DELIMITER //

CREATE TRIGGER before_delete_on_matenimiento
BEFORE DELETE ON mudanzas.matenimiento
FOR EACH ROW
BEGIN
INSERT INTO mudanzas.auditoria (tabla, fecha, hora, usuario, operacion)
VALUES ('matenimiento', CURRENT_DATE, CURRENT_TIME, USER(), CONCAT('DELETE ON matenimiento VALUES (', OLD.EMPRESA_MATENIMIENTO, ', ', OLD.COSTO_MATENIMIENTO, ', ', OLD.DESCUENTO_MANTENIMIENTO, ')'));
END //

DELIMITER ;

DELIMITER //

CREATE TRIGGER before_insert_on_mudanza
BEFORE INSERT ON mudanzas.mudanza
FOR EACH ROW
BEGIN
INSERT INTO mudanzas.auditoria (tabla, fecha, hora, usuario, operacion)
VALUES ('mudanza', CURRENT_DATE, CURRENT_TIME, USER(), CONCAT('INSERT ON mudanza VALUES (', NEW.COSTO_MUDANZA, ', ', NEW.DESCUEMTO_MUDANZA, ')'));
END //

DELIMITER ;

DELIMITER //

CREATE TRIGGER before_update_on_mudanza
BEFORE UPDATE ON mudanzas.mudanza
FOR EACH ROW
BEGIN
INSERT INTO mudanzas.auditoria (tabla, fecha, hora, usuario, operacion)
VALUES ('mudanza', CURRENT_DATE, CURRENT_TIME, USER(), CONCAT('UPDATE ON mudanza VALUES (', OLD.COSTO_MUDANZA, ', ', OLD.DESCUEMTO_MUDANZA, ') TO (', NEW.COSTO_MUDANZA, ', ', NEW.DESCUEMTO_MUDANZA, ')'));
END //

DELIMITER ;

DELIMITER //

CREATE TRIGGER before_delete_on_mudanza
BEFORE DELETE ON mudanzas.mudanza
FOR EACH ROW
BEGIN
INSERT INTO mudanzas.auditoria (tabla, fecha, hora, usuario, operacion)
VALUES ('mudanza', CURRENT_DATE, CURRENT_TIME, USER(), CONCAT('DELETE ON mudanza VALUES (', OLD.COSTO_MUDANZA, ', ', OLD.DESCUEMTO_MUDANZA, ')'));
END //

DELIMITER ;

DELIMITER //

CREATE TRIGGER before_insert_on_provincia
BEFORE INSERT ON mudanzas.provincia
FOR EACH ROW
BEGIN
INSERT INTO mudanzas.auditoria (tabla, fecha, hora, usuario, operacion)
VALUES ('provincia', CURRENT_DATE, CURRENT_TIME, USER(), CONCAT('INSERT ON provincia VALUES (', NEW.NOMBRE_PROVINCIA, ')'));
END //

DELIMITER ;

DELIMITER //

CREATE TRIGGER before_update_on_provincia
BEFORE UPDATE ON mudanzas.provincia
FOR EACH ROW
BEGIN
INSERT INTO mudanzas.auditoria (tabla, fecha, hora, usuario, operacion)
VALUES ('provincia', CURRENT_DATE, CURRENT_TIME, USER(), CONCAT('UPDATE ON provincia VALUES (', OLD.NOMBRE_PROVINCIA, ') TO (', NEW.NOMBRE_PROVINCIA, ')'));
END //

DELIMITER ;

DELIMITER //

CREATE TRIGGER before_delete_on_provincia
BEFORE DELETE ON mudanzas.provincia
FOR EACH ROW
BEGIN
INSERT INTO mudanzas.auditoria (tabla, fecha, hora, usuario, operacion)
VALUES ('provincia', CURRENT_DATE, CURRENT_TIME, USER(), CONCAT('DELETE ON provincia VALUES (', OLD.NOMBRE_PROVINCIA, ')'));
END //

DELIMITER ;

DELIMITER //

CREATE TRIGGER before_insert_on_sucursal
BEFORE INSERT ON mudanzas.sucursal
FOR EACH ROW
BEGIN
INSERT INTO mudanzas.auditoria (tabla, fecha, hora, usuario, operacion)
VALUES ('sucursal', CURRENT_DATE, CURRENT_TIME, USER(), CONCAT('INSERT ON sucursal VALUES (', NEW.ID_TIPO_SUCURSAL, ', ', NEW.ID_CIUDAD, ', ', NEW.ID_EMPRESA, ', ', NEW.TELEFONO_SUCURSAL, ', ', NEW.DIRECCION_SUCURSAL, ')'));
END //

DELIMITER ;

DELIMITER //

CREATE TRIGGER before_update_on_sucursal
BEFORE UPDATE ON mudanzas.sucursal
FOR EACH ROW
BEGIN
INSERT INTO mudanzas.auditoria (tabla, fecha, hora, usuario, operacion)
VALUES ('sucursal', CURRENT_DATE, CURRENT_TIME, USER(), CONCAT('UPDATE ON sucursal VALUES (', OLD.ID_TIPO_SUCURSAL, ', ', OLD.ID_CIUDAD, ', ', OLD.ID_EMPRESA, ', ', OLD.TELEFONO_SUCURSAL, ', ', OLD.DIRECCION_SUCURSAL, ') TO (', NEW.ID_TIPO_SUCURSAL, ', ', NEW.ID_CIUDAD, ', ', NEW.ID_EMPRESA, ', ', NEW.TELEFONO_SUCURSAL, ', ', NEW.DIRECCION_SUCURSAL, ')'));
END //

DELIMITER ;

DELIMITER //

CREATE TRIGGER before_delete_on_sucursal
BEFORE DELETE ON mudanzas.sucursal
FOR EACH ROW
BEGIN
INSERT INTO mudanzas.auditoria (tabla, fecha, hora, usuario, operacion)
VALUES ('sucursal', CURRENT_DATE, CURRENT_TIME, USER(), CONCAT('DELETE ON sucursal VALUES (', OLD.ID_TIPO_SUCURSAL, ', ', OLD.ID_CIUDAD, ', ', OLD.ID_EMPRESA, ', ', OLD.TELEFONO_SUCURSAL, ', ', OLD.DIRECCION_SUCURSAL, ')'));
END //

DELIMITER ;

DELIMITER //

CREATE TRIGGER before_insert_on_tipo_empleado
BEFORE INSERT ON mudanzas.tipo_empleado
FOR EACH ROW
BEGIN
INSERT INTO mudanzas.auditoria (tabla, fecha, hora, usuario, operacion)
VALUES ('tipo_empleado', CURRENT_DATE, CURRENT_TIME, USER(), CONCAT('INSERT ON tipo_empleado VALUES (', NEW.NOMBRE_TIPO_EMPLEADO, ', ', NEW.DETALLE_TIPO_EMPLEADO, ')'));
END //

DELIMITER ;

DELIMITER //

CREATE TRIGGER before_update_on_tipo_empleado
BEFORE UPDATE ON mudanzas.tipo_empleado
FOR EACH ROW
BEGIN
INSERT INTO mudanzas.auditoria (tabla, fecha, hora, usuario, operacion)
VALUES ('tipo_empleado', CURRENT_DATE, CURRENT_TIME, USER(), CONCAT('UPDATE ON tipo_empleado VALUES (', OLD.NOMBRE_TIPO_EMPLEADO, ', ', OLD.DETALLE_TIPO_EMPLEADO, ') TO (', NEW.NOMBRE_TIPO_EMPLEADO, ', ', NEW.DETALLE_TIPO_EMPLEADO, ')'));
END //

DELIMITER ;

DELIMITER //

CREATE TRIGGER before_delete_on_tipo_empleado
BEFORE DELETE ON mudanzas.tipo_empleado
FOR EACH ROW
BEGIN
INSERT INTO mudanzas.auditoria (tabla, fecha, hora, usuario, operacion)
VALUES ('tipo_empleado', CURRENT_DATE, CURRENT_TIME, USER(), CONCAT('DELETE ON tipo_empleado VALUES (', OLD.NOMBRE_TIPO_EMPLEADO, ', ', OLD.DETALLE_TIPO_EMPLEADO, ')'));
END //

DELIMITER ;

DELIMITER //

CREATE TRIGGER before_insert_on_tipo_sucursal
BEFORE INSERT ON mudanzas.tipo_sucursal
FOR EACH ROW
BEGIN
INSERT INTO mudanzas.auditoria (tabla, fecha, hora, usuario, operacion)
VALUES ('tipo_sucursal', CURRENT_DATE, CURRENT_TIME, USER(), CONCAT('INSERT ON tipo_sucursal VALUES (', NEW.NOMBRE_TIPO_EMPLEADO, ', ', NEW.DETALLE_TIPO_EMPLEADO, ')'));
END //

DELIMITER ;

DELIMITER //

CREATE TRIGGER before_update_on_tipo_sucursal
BEFORE UPDATE ON mudanzas.tipo_sucursal
FOR EACH ROW
BEGIN
INSERT INTO mudanzas.auditoria (tabla, fecha, hora, usuario, operacion)
VALUES ('tipo_sucursal', CURRENT_DATE, CURRENT_TIME, USER(), CONCAT('UPDATE ON tipo_sucursal VALUES (', OLD.NOMBRE_TIPO_EMPLEADO, ', ', OLD.DETALLE_TIPO_EMPLEADO, ') TO (', NEW.NOMBRE_TIPO_EMPLEADO, ', ', NEW.DETALLE_TIPO_EMPLEADO, ')'));
END //

DELIMITER ;

DELIMITER //

CREATE TRIGGER before_delete_on_tipo_sucursal
BEFORE DELETE ON mudanzas.tipo_sucursal
FOR EACH ROW
BEGIN
INSERT INTO mudanzas.auditoria (tabla, fecha, hora, usuario, operacion)
VALUES ('tipo_sucursal', CURRENT_DATE, CURRENT_TIME, USER(), CONCAT('DELETE ON tipo_sucursal VALUES (', OLD.NOMBRE_TIPO_EMPLEADO, ', ', OLD.DETALLE_TIPO_EMPLEADO, ')'));
END //

DELIMITER ;

DELIMITER //

CREATE TRIGGER before_insert_on_vehiculo
BEFORE INSERT ON mudanzas.vehiculo
FOR EACH ROW
BEGIN
INSERT INTO mudanzas.auditoria (tabla, fecha, hora, usuario, operacion)
VALUES ('vehiculo', CURRENT_DATE, CURRENT_TIME, USER(), CONCAT('INSERT ON vehiculo VALUES (', NEW.ID_ESTADO_VEHICULO, ', ', NEW.MATRICULA_VEHICULO, ', ', NEW.MARCA_VEHICULO, ', ', NEW.CAPACIDAD, ')'));
END //

DELIMITER ;

DELIMITER //

CREATE TRIGGER before_update_on_vehiculo
BEFORE UPDATE ON mudanzas.vehiculo
FOR EACH ROW
BEGIN
INSERT INTO mudanzas.auditoria (tabla, fecha, hora, usuario, operacion)
VALUES ('vehiculo', CURRENT_DATE, CURRENT_TIME, USER(), CONCAT('UPDATE ON vehiculo VALUES (', OLD.ID_ESTADO_VEHICULO, ', ', OLD.MATRICULA_VEHICULO, ', ', OLD.MARCA_VEHICULO, ', ', OLD.CAPACIDAD, ') TO (', NEW.ID_ESTADO_VEHICULO, ', ', NEW.MATRICULA_VEHICULO, ', ', NEW.MARCA_VEHICULO, ', ', NEW.CAPACIDAD, ')'));
END //

DELIMITER ;

DELIMITER //

CREATE TRIGGER before_delete_on_vehiculo
BEFORE DELETE ON mudanzas.vehiculo
FOR EACH ROW
BEGIN
INSERT INTO mudanzas.auditoria (tabla, fecha, hora, usuario, operacion)
VALUES ('vehiculo', CURRENT_DATE, CURRENT_TIME, USER(), CONCAT('DELETE ON vehiculo VALUES (', OLD.ID_ESTADO_VEHICULO, ', ', OLD.MATRICULA_VEHICULO, ', ', OLD.MARCA_VEHICULO, ', ', OLD.CAPACIDAD, ')'));
END //

DELIMITER ;

