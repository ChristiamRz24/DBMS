CREATE TABLE IF NOT EXISTS auditoria (id SERIAL PRIMARY KEY, tabla VARCHAR(50), fecha DATE, hora TIME, usuario VARCHAR(50), operacion VARCHAR(250));

CREATE OR REPLACE FUNCTION function_insert_on_provincia() RETURNS TRIGGER AS $$
BEGIN
INSERT INTO auditoria (tabla, fecha, hora, usuario, operacion) VALUES ('provincia', CURRENT_DATE, CURRENT_TIME, SESSION_USER, 'INSERT ' || NEW);
RETURN NEW;
END;
$$ LANGUAGE plpgsql;

CREATE OR REPLACE TRIGGER before_insert_on_provincia
BEFORE INSERT ON provincia
FOR EACH ROW
EXECUTE FUNCTION function_insert_on_provincia();

CREATE OR REPLACE FUNCTION function_update_on_provincia() RETURNS TRIGGER AS $$
BEGIN
INSERT INTO auditoria (tabla, fecha, hora, usuario, operacion) VALUES ('provincia', CURRENT_DATE, CURRENT_TIME, SESSION_USER, 'UPDATE ' || OLD || ' TO ' || NEW);
RETURN NEW;
END;
$$ LANGUAGE plpgsql;

CREATE OR REPLACE TRIGGER before_update_on_provincia
BEFORE UPDATE ON provincia
FOR EACH ROW
EXECUTE FUNCTION function_update_on_provincia();

CREATE OR REPLACE FUNCTION function_delete_on_provincia() RETURNS TRIGGER AS $$
BEGIN
INSERT INTO auditoria (tabla, fecha, hora, usuario, operacion) VALUES ('provincia', CURRENT_DATE, CURRENT_TIME, SESSION_USER, 'DELETE ' || OLD);
RETURN OLD;
END;
$$ LANGUAGE plpgsql;

CREATE OR REPLACE TRIGGER before_delete_on_provincia
BEFORE DELETE ON provincia
FOR EACH ROW
EXECUTE FUNCTION function_delete_on_provincia();

CREATE OR REPLACE FUNCTION function_insert_on_ciudad() RETURNS TRIGGER AS $$
BEGIN
INSERT INTO auditoria (tabla, fecha, hora, usuario, operacion) VALUES ('ciudad', CURRENT_DATE, CURRENT_TIME, SESSION_USER, 'INSERT ' || NEW);
RETURN NEW;
END;
$$ LANGUAGE plpgsql;

CREATE OR REPLACE TRIGGER before_insert_on_ciudad
BEFORE INSERT ON ciudad
FOR EACH ROW
EXECUTE FUNCTION function_insert_on_ciudad();

CREATE OR REPLACE FUNCTION function_update_on_ciudad() RETURNS TRIGGER AS $$
BEGIN
INSERT INTO auditoria (tabla, fecha, hora, usuario, operacion) VALUES ('ciudad', CURRENT_DATE, CURRENT_TIME, SESSION_USER, 'UPDATE ' || OLD || ' TO ' || NEW);
RETURN NEW;
END;
$$ LANGUAGE plpgsql;

CREATE OR REPLACE TRIGGER before_update_on_ciudad
BEFORE UPDATE ON ciudad
FOR EACH ROW
EXECUTE FUNCTION function_update_on_ciudad();

CREATE OR REPLACE FUNCTION function_delete_on_ciudad() RETURNS TRIGGER AS $$
BEGIN
INSERT INTO auditoria (tabla, fecha, hora, usuario, operacion) VALUES ('ciudad', CURRENT_DATE, CURRENT_TIME, SESSION_USER, 'DELETE ' || OLD);
RETURN OLD;
END;
$$ LANGUAGE plpgsql;

CREATE OR REPLACE TRIGGER before_delete_on_ciudad
BEFORE DELETE ON ciudad
FOR EACH ROW
EXECUTE FUNCTION function_delete_on_ciudad();

CREATE OR REPLACE FUNCTION function_insert_on_cliente() RETURNS TRIGGER AS $$
BEGIN
INSERT INTO auditoria (tabla, fecha, hora, usuario, operacion) VALUES ('cliente', CURRENT_DATE, CURRENT_TIME, SESSION_USER, 'INSERT ' || NEW);
RETURN NEW;
END;
$$ LANGUAGE plpgsql;

CREATE OR REPLACE TRIGGER before_insert_on_cliente
BEFORE INSERT ON cliente
FOR EACH ROW
EXECUTE FUNCTION function_insert_on_cliente();

CREATE OR REPLACE FUNCTION function_update_on_cliente() RETURNS TRIGGER AS $$
BEGIN
INSERT INTO auditoria (tabla, fecha, hora, usuario, operacion) VALUES ('cliente', CURRENT_DATE, CURRENT_TIME, SESSION_USER, 'UPDATE ' || OLD || ' TO ' || NEW);
RETURN NEW;
END;
$$ LANGUAGE plpgsql;

CREATE OR REPLACE TRIGGER before_update_on_cliente
BEFORE UPDATE ON cliente
FOR EACH ROW
EXECUTE FUNCTION function_update_on_cliente();

CREATE OR REPLACE FUNCTION function_delete_on_cliente() RETURNS TRIGGER AS $$
BEGIN
INSERT INTO auditoria (tabla, fecha, hora, usuario, operacion) VALUES ('cliente', CURRENT_DATE, CURRENT_TIME, SESSION_USER, 'DELETE ' || OLD);
RETURN OLD;
END;
$$ LANGUAGE plpgsql;

CREATE OR REPLACE TRIGGER before_delete_on_cliente
BEFORE DELETE ON cliente
FOR EACH ROW
EXECUTE FUNCTION function_delete_on_cliente();

CREATE OR REPLACE FUNCTION function_insert_on_articulos() RETURNS TRIGGER AS $$
BEGIN
INSERT INTO auditoria (tabla, fecha, hora, usuario, operacion) VALUES ('articulos', CURRENT_DATE, CURRENT_TIME, SESSION_USER, 'INSERT ' || NEW);
RETURN NEW;
END;
$$ LANGUAGE plpgsql;

CREATE OR REPLACE TRIGGER before_insert_on_articulos
BEFORE INSERT ON articulos
FOR EACH ROW
EXECUTE FUNCTION function_insert_on_articulos();

CREATE OR REPLACE FUNCTION function_update_on_articulos() RETURNS TRIGGER AS $$
BEGIN
INSERT INTO auditoria (tabla, fecha, hora, usuario, operacion) VALUES ('articulos', CURRENT_DATE, CURRENT_TIME, SESSION_USER, 'UPDATE ' || OLD || ' TO ' || NEW);
RETURN NEW;
END;
$$ LANGUAGE plpgsql;

CREATE OR REPLACE TRIGGER before_update_on_articulos
BEFORE UPDATE ON articulos
FOR EACH ROW
EXECUTE FUNCTION function_update_on_articulos();

CREATE OR REPLACE FUNCTION function_delete_on_articulos() RETURNS TRIGGER AS $$
BEGIN
INSERT INTO auditoria (tabla, fecha, hora, usuario, operacion) VALUES ('articulos', CURRENT_DATE, CURRENT_TIME, SESSION_USER, 'DELETE ' || OLD);
RETURN OLD;
END;
$$ LANGUAGE plpgsql;

CREATE OR REPLACE TRIGGER before_delete_on_articulos
BEFORE DELETE ON articulos
FOR EACH ROW
EXECUTE FUNCTION function_delete_on_articulos();

CREATE OR REPLACE FUNCTION function_insert_on_detalle_articulos() RETURNS TRIGGER AS $$
BEGIN
INSERT INTO auditoria (tabla, fecha, hora, usuario, operacion) VALUES ('detalle_articulos', CURRENT_DATE, CURRENT_TIME, SESSION_USER, 'INSERT ' || NEW);
RETURN NEW;
END;
$$ LANGUAGE plpgsql;

CREATE OR REPLACE TRIGGER before_insert_on_detalle_articulos
BEFORE INSERT ON detalle_articulos
FOR EACH ROW
EXECUTE FUNCTION function_insert_on_detalle_articulos();

CREATE OR REPLACE FUNCTION function_update_on_detalle_articulos() RETURNS TRIGGER AS $$
BEGIN
INSERT INTO auditoria (tabla, fecha, hora, usuario, operacion) VALUES ('detalle_articulos', CURRENT_DATE, CURRENT_TIME, SESSION_USER, 'UPDATE ' || OLD || ' TO ' || NEW);
RETURN NEW;
END;
$$ LANGUAGE plpgsql;

CREATE OR REPLACE TRIGGER before_update_on_detalle_articulos
BEFORE UPDATE ON detalle_articulos
FOR EACH ROW
EXECUTE FUNCTION function_update_on_detalle_articulos();

CREATE OR REPLACE FUNCTION function_delete_on_detalle_articulos() RETURNS TRIGGER AS $$
BEGIN
INSERT INTO auditoria (tabla, fecha, hora, usuario, operacion) VALUES ('detalle_articulos', CURRENT_DATE, CURRENT_TIME, SESSION_USER, 'DELETE ' || OLD);
RETURN OLD;
END;
$$ LANGUAGE plpgsql;

CREATE OR REPLACE TRIGGER before_delete_on_detalle_articulos
BEFORE DELETE ON detalle_articulos
FOR EACH ROW
EXECUTE FUNCTION function_delete_on_detalle_articulos();

CREATE OR REPLACE FUNCTION function_insert_on_mudanza() RETURNS TRIGGER AS $$
BEGIN
INSERT INTO auditoria (tabla, fecha, hora, usuario, operacion) VALUES ('mudanza', CURRENT_DATE, CURRENT_TIME, SESSION_USER, 'INSERT ' || NEW);
RETURN NEW;
END;
$$ LANGUAGE plpgsql;

CREATE OR REPLACE TRIGGER before_insert_on_mudanza
BEFORE INSERT ON mudanza
FOR EACH ROW
EXECUTE FUNCTION function_insert_on_mudanza();

CREATE OR REPLACE FUNCTION function_update_on_mudanza() RETURNS TRIGGER AS $$
BEGIN
INSERT INTO auditoria (tabla, fecha, hora, usuario, operacion) VALUES ('mudanza', CURRENT_DATE, CURRENT_TIME, SESSION_USER, 'UPDATE ' || OLD || ' TO ' || NEW);
RETURN NEW;
END;
$$ LANGUAGE plpgsql;

CREATE OR REPLACE TRIGGER before_update_on_mudanza
BEFORE UPDATE ON mudanza
FOR EACH ROW
EXECUTE FUNCTION function_update_on_mudanza();

CREATE OR REPLACE FUNCTION function_delete_on_mudanza() RETURNS TRIGGER AS $$
BEGIN
INSERT INTO auditoria (tabla, fecha, hora, usuario, operacion) VALUES ('mudanza', CURRENT_DATE, CURRENT_TIME, SESSION_USER, 'DELETE ' || OLD);
RETURN OLD;
END;
$$ LANGUAGE plpgsql;

CREATE OR REPLACE TRIGGER before_delete_on_mudanza
BEFORE DELETE ON mudanza
FOR EACH ROW
EXECUTE FUNCTION function_delete_on_mudanza();

CREATE OR REPLACE FUNCTION function_insert_on_matenimiento() RETURNS TRIGGER AS $$
BEGIN
INSERT INTO auditoria (tabla, fecha, hora, usuario, operacion) VALUES ('matenimiento', CURRENT_DATE, CURRENT_TIME, SESSION_USER, 'INSERT ' || NEW);
RETURN NEW;
END;
$$ LANGUAGE plpgsql;

CREATE OR REPLACE TRIGGER before_insert_on_matenimiento
BEFORE INSERT ON matenimiento
FOR EACH ROW
EXECUTE FUNCTION function_insert_on_matenimiento();

CREATE OR REPLACE FUNCTION function_update_on_matenimiento() RETURNS TRIGGER AS $$
BEGIN
INSERT INTO auditoria (tabla, fecha, hora, usuario, operacion) VALUES ('matenimiento', CURRENT_DATE, CURRENT_TIME, SESSION_USER, 'UPDATE ' || OLD || ' TO ' || NEW);
RETURN NEW;
END;
$$ LANGUAGE plpgsql;

CREATE OR REPLACE TRIGGER before_update_on_matenimiento
BEFORE UPDATE ON matenimiento
FOR EACH ROW
EXECUTE FUNCTION function_update_on_matenimiento();

CREATE OR REPLACE FUNCTION function_delete_on_matenimiento() RETURNS TRIGGER AS $$
BEGIN
INSERT INTO auditoria (tabla, fecha, hora, usuario, operacion) VALUES ('matenimiento', CURRENT_DATE, CURRENT_TIME, SESSION_USER, 'DELETE ' || OLD);
RETURN OLD;
END;
$$ LANGUAGE plpgsql;

CREATE OR REPLACE TRIGGER before_delete_on_matenimiento
BEFORE DELETE ON matenimiento
FOR EACH ROW
EXECUTE FUNCTION function_delete_on_matenimiento();

CREATE OR REPLACE FUNCTION function_insert_on_detalle_mantenimiento() RETURNS TRIGGER AS $$
BEGIN
INSERT INTO auditoria (tabla, fecha, hora, usuario, operacion) VALUES ('detalle_mantenimiento', CURRENT_DATE, CURRENT_TIME, SESSION_USER, 'INSERT ' || NEW);
RETURN NEW;
END;
$$ LANGUAGE plpgsql;

CREATE OR REPLACE TRIGGER before_insert_on_detalle_mantenimiento
BEFORE INSERT ON detalle_mantenimiento
FOR EACH ROW
EXECUTE FUNCTION function_insert_on_detalle_mantenimiento();

CREATE OR REPLACE FUNCTION function_update_on_detalle_mantenimiento() RETURNS TRIGGER AS $$
BEGIN
INSERT INTO auditoria (tabla, fecha, hora, usuario, operacion) VALUES ('detalle_mantenimiento', CURRENT_DATE, CURRENT_TIME, SESSION_USER, 'UPDATE ' || OLD || ' TO ' || NEW);
RETURN NEW;
END;
$$ LANGUAGE plpgsql;

CREATE OR REPLACE TRIGGER before_update_on_detalle_mantenimiento
BEFORE UPDATE ON detalle_mantenimiento
FOR EACH ROW
EXECUTE FUNCTION function_update_on_detalle_mantenimiento();

CREATE OR REPLACE FUNCTION function_delete_on_detalle_mantenimiento() RETURNS TRIGGER AS $$
BEGIN
INSERT INTO auditoria (tabla, fecha, hora, usuario, operacion) VALUES ('detalle_mantenimiento', CURRENT_DATE, CURRENT_TIME, SESSION_USER, 'DELETE ' || OLD);
RETURN OLD;
END;
$$ LANGUAGE plpgsql;

CREATE OR REPLACE TRIGGER before_delete_on_detalle_mantenimiento
BEFORE DELETE ON detalle_mantenimiento
FOR EACH ROW
EXECUTE FUNCTION function_delete_on_detalle_mantenimiento();

CREATE OR REPLACE FUNCTION function_insert_on_vehiculo() RETURNS TRIGGER AS $$
BEGIN
INSERT INTO auditoria (tabla, fecha, hora, usuario, operacion) VALUES ('vehiculo', CURRENT_DATE, CURRENT_TIME, SESSION_USER, 'INSERT ' || NEW);
RETURN NEW;
END;
$$ LANGUAGE plpgsql;

CREATE OR REPLACE TRIGGER before_insert_on_vehiculo
BEFORE INSERT ON vehiculo
FOR EACH ROW
EXECUTE FUNCTION function_insert_on_vehiculo();

CREATE OR REPLACE FUNCTION function_update_on_vehiculo() RETURNS TRIGGER AS $$
BEGIN
INSERT INTO auditoria (tabla, fecha, hora, usuario, operacion) VALUES ('vehiculo', CURRENT_DATE, CURRENT_TIME, SESSION_USER, 'UPDATE ' || OLD || ' TO ' || NEW);
RETURN NEW;
END;
$$ LANGUAGE plpgsql;

CREATE OR REPLACE TRIGGER before_update_on_vehiculo
BEFORE UPDATE ON vehiculo
FOR EACH ROW
EXECUTE FUNCTION function_update_on_vehiculo();

CREATE OR REPLACE FUNCTION function_delete_on_vehiculo() RETURNS TRIGGER AS $$
BEGIN
INSERT INTO auditoria (tabla, fecha, hora, usuario, operacion) VALUES ('vehiculo', CURRENT_DATE, CURRENT_TIME, SESSION_USER, 'DELETE ' || OLD);
RETURN OLD;
END;
$$ LANGUAGE plpgsql;

CREATE OR REPLACE TRIGGER before_delete_on_vehiculo
BEFORE DELETE ON vehiculo
FOR EACH ROW
EXECUTE FUNCTION function_delete_on_vehiculo();

CREATE OR REPLACE FUNCTION function_insert_on_detalle_mudanza() RETURNS TRIGGER AS $$
BEGIN
INSERT INTO auditoria (tabla, fecha, hora, usuario, operacion) VALUES ('detalle_mudanza', CURRENT_DATE, CURRENT_TIME, SESSION_USER, 'INSERT ' || NEW);
RETURN NEW;
END;
$$ LANGUAGE plpgsql;

CREATE OR REPLACE TRIGGER before_insert_on_detalle_mudanza
BEFORE INSERT ON detalle_mudanza
FOR EACH ROW
EXECUTE FUNCTION function_insert_on_detalle_mudanza();

CREATE OR REPLACE FUNCTION function_update_on_detalle_mudanza() RETURNS TRIGGER AS $$
BEGIN
INSERT INTO auditoria (tabla, fecha, hora, usuario, operacion) VALUES ('detalle_mudanza', CURRENT_DATE, CURRENT_TIME, SESSION_USER, 'UPDATE ' || OLD || ' TO ' || NEW);
RETURN NEW;
END;
$$ LANGUAGE plpgsql;

CREATE OR REPLACE TRIGGER before_update_on_detalle_mudanza
BEFORE UPDATE ON detalle_mudanza
FOR EACH ROW
EXECUTE FUNCTION function_update_on_detalle_mudanza();

CREATE OR REPLACE FUNCTION function_delete_on_detalle_mudanza() RETURNS TRIGGER AS $$
BEGIN
INSERT INTO auditoria (tabla, fecha, hora, usuario, operacion) VALUES ('detalle_mudanza', CURRENT_DATE, CURRENT_TIME, SESSION_USER, 'DELETE ' || OLD);
RETURN OLD;
END;
$$ LANGUAGE plpgsql;

CREATE OR REPLACE TRIGGER before_delete_on_detalle_mudanza
BEFORE DELETE ON detalle_mudanza
FOR EACH ROW
EXECUTE FUNCTION function_delete_on_detalle_mudanza();

CREATE OR REPLACE FUNCTION function_insert_on_sucursal() RETURNS TRIGGER AS $$
BEGIN
INSERT INTO auditoria (tabla, fecha, hora, usuario, operacion) VALUES ('sucursal', CURRENT_DATE, CURRENT_TIME, SESSION_USER, 'INSERT ' || NEW);
RETURN NEW;
END;
$$ LANGUAGE plpgsql;

CREATE OR REPLACE TRIGGER before_insert_on_sucursal
BEFORE INSERT ON sucursal
FOR EACH ROW
EXECUTE FUNCTION function_insert_on_sucursal();

CREATE OR REPLACE FUNCTION function_update_on_sucursal() RETURNS TRIGGER AS $$
BEGIN
INSERT INTO auditoria (tabla, fecha, hora, usuario, operacion) VALUES ('sucursal', CURRENT_DATE, CURRENT_TIME, SESSION_USER, 'UPDATE ' || OLD || ' TO ' || NEW);
RETURN NEW;
END;
$$ LANGUAGE plpgsql;

CREATE OR REPLACE TRIGGER before_update_on_sucursal
BEFORE UPDATE ON sucursal
FOR EACH ROW
EXECUTE FUNCTION function_update_on_sucursal();

CREATE OR REPLACE FUNCTION function_delete_on_sucursal() RETURNS TRIGGER AS $$
BEGIN
INSERT INTO auditoria (tabla, fecha, hora, usuario, operacion) VALUES ('sucursal', CURRENT_DATE, CURRENT_TIME, SESSION_USER, 'DELETE ' || OLD);
RETURN OLD;
END;
$$ LANGUAGE plpgsql;

CREATE OR REPLACE TRIGGER before_delete_on_sucursal
BEFORE DELETE ON sucursal
FOR EACH ROW
EXECUTE FUNCTION function_delete_on_sucursal();

CREATE OR REPLACE FUNCTION function_insert_on_estado_mudanza() RETURNS TRIGGER AS $$
BEGIN
INSERT INTO auditoria (tabla, fecha, hora, usuario, operacion) VALUES ('estado_mudanza', CURRENT_DATE, CURRENT_TIME, SESSION_USER, 'INSERT ' || NEW);
RETURN NEW;
END;
$$ LANGUAGE plpgsql;

CREATE OR REPLACE TRIGGER before_insert_on_estado_mudanza
BEFORE INSERT ON estado_mudanza
FOR EACH ROW
EXECUTE FUNCTION function_insert_on_estado_mudanza();

CREATE OR REPLACE FUNCTION function_update_on_estado_mudanza() RETURNS TRIGGER AS $$
BEGIN
INSERT INTO auditoria (tabla, fecha, hora, usuario, operacion) VALUES ('estado_mudanza', CURRENT_DATE, CURRENT_TIME, SESSION_USER, 'UPDATE ' || OLD || ' TO ' || NEW);
RETURN NEW;
END;
$$ LANGUAGE plpgsql;

CREATE OR REPLACE TRIGGER before_update_on_estado_mudanza
BEFORE UPDATE ON estado_mudanza
FOR EACH ROW
EXECUTE FUNCTION function_update_on_estado_mudanza();

CREATE OR REPLACE FUNCTION function_delete_on_estado_mudanza() RETURNS TRIGGER AS $$
BEGIN
INSERT INTO auditoria (tabla, fecha, hora, usuario, operacion) VALUES ('estado_mudanza', CURRENT_DATE, CURRENT_TIME, SESSION_USER, 'DELETE ' || OLD);
RETURN OLD;
END;
$$ LANGUAGE plpgsql;

CREATE OR REPLACE TRIGGER before_delete_on_estado_mudanza
BEFORE DELETE ON estado_mudanza
FOR EACH ROW
EXECUTE FUNCTION function_delete_on_estado_mudanza();

CREATE OR REPLACE FUNCTION function_insert_on_empleado() RETURNS TRIGGER AS $$
BEGIN
INSERT INTO auditoria (tabla, fecha, hora, usuario, operacion) VALUES ('empleado', CURRENT_DATE, CURRENT_TIME, SESSION_USER, 'INSERT ' || NEW);
RETURN NEW;
END;
$$ LANGUAGE plpgsql;

CREATE OR REPLACE TRIGGER before_insert_on_empleado
BEFORE INSERT ON empleado
FOR EACH ROW
EXECUTE FUNCTION function_insert_on_empleado();

CREATE OR REPLACE FUNCTION function_update_on_empleado() RETURNS TRIGGER AS $$
BEGIN
INSERT INTO auditoria (tabla, fecha, hora, usuario, operacion) VALUES ('empleado', CURRENT_DATE, CURRENT_TIME, SESSION_USER, 'UPDATE ' || OLD || ' TO ' || NEW);
RETURN NEW;
END;
$$ LANGUAGE plpgsql;

CREATE OR REPLACE TRIGGER before_update_on_empleado
BEFORE UPDATE ON empleado
FOR EACH ROW
EXECUTE FUNCTION function_update_on_empleado();

CREATE OR REPLACE FUNCTION function_delete_on_empleado() RETURNS TRIGGER AS $$
BEGIN
INSERT INTO auditoria (tabla, fecha, hora, usuario, operacion) VALUES ('empleado', CURRENT_DATE, CURRENT_TIME, SESSION_USER, 'DELETE ' || OLD);
RETURN OLD;
END;
$$ LANGUAGE plpgsql;

CREATE OR REPLACE TRIGGER before_delete_on_empleado
BEFORE DELETE ON empleado
FOR EACH ROW
EXECUTE FUNCTION function_delete_on_empleado();

CREATE OR REPLACE FUNCTION function_insert_on_tipo_empleado() RETURNS TRIGGER AS $$
BEGIN
INSERT INTO auditoria (tabla, fecha, hora, usuario, operacion) VALUES ('tipo_empleado', CURRENT_DATE, CURRENT_TIME, SESSION_USER, 'INSERT ' || NEW);
RETURN NEW;
END;
$$ LANGUAGE plpgsql;

CREATE OR REPLACE TRIGGER before_insert_on_tipo_empleado
BEFORE INSERT ON tipo_empleado
FOR EACH ROW
EXECUTE FUNCTION function_insert_on_tipo_empleado();

CREATE OR REPLACE FUNCTION function_update_on_tipo_empleado() RETURNS TRIGGER AS $$
BEGIN
INSERT INTO auditoria (tabla, fecha, hora, usuario, operacion) VALUES ('tipo_empleado', CURRENT_DATE, CURRENT_TIME, SESSION_USER, 'UPDATE ' || OLD || ' TO ' || NEW);
RETURN NEW;
END;
$$ LANGUAGE plpgsql;

CREATE OR REPLACE TRIGGER before_update_on_tipo_empleado
BEFORE UPDATE ON tipo_empleado
FOR EACH ROW
EXECUTE FUNCTION function_update_on_tipo_empleado();

CREATE OR REPLACE FUNCTION function_delete_on_tipo_empleado() RETURNS TRIGGER AS $$
BEGIN
INSERT INTO auditoria (tabla, fecha, hora, usuario, operacion) VALUES ('tipo_empleado', CURRENT_DATE, CURRENT_TIME, SESSION_USER, 'DELETE ' || OLD);
RETURN OLD;
END;
$$ LANGUAGE plpgsql;

CREATE OR REPLACE TRIGGER before_delete_on_tipo_empleado
BEFORE DELETE ON tipo_empleado
FOR EACH ROW
EXECUTE FUNCTION function_delete_on_tipo_empleado();

CREATE OR REPLACE FUNCTION function_insert_on_tipo_sucursal() RETURNS TRIGGER AS $$
BEGIN
INSERT INTO auditoria (tabla, fecha, hora, usuario, operacion) VALUES ('tipo_sucursal', CURRENT_DATE, CURRENT_TIME, SESSION_USER, 'INSERT ' || NEW);
RETURN NEW;
END;
$$ LANGUAGE plpgsql;

CREATE OR REPLACE TRIGGER before_insert_on_tipo_sucursal
BEFORE INSERT ON tipo_sucursal
FOR EACH ROW
EXECUTE FUNCTION function_insert_on_tipo_sucursal();

CREATE OR REPLACE FUNCTION function_update_on_tipo_sucursal() RETURNS TRIGGER AS $$
BEGIN
INSERT INTO auditoria (tabla, fecha, hora, usuario, operacion) VALUES ('tipo_sucursal', CURRENT_DATE, CURRENT_TIME, SESSION_USER, 'UPDATE ' || OLD || ' TO ' || NEW);
RETURN NEW;
END;
$$ LANGUAGE plpgsql;

CREATE OR REPLACE TRIGGER before_update_on_tipo_sucursal
BEFORE UPDATE ON tipo_sucursal
FOR EACH ROW
EXECUTE FUNCTION function_update_on_tipo_sucursal();

CREATE OR REPLACE FUNCTION function_delete_on_tipo_sucursal() RETURNS TRIGGER AS $$
BEGIN
INSERT INTO auditoria (tabla, fecha, hora, usuario, operacion) VALUES ('tipo_sucursal', CURRENT_DATE, CURRENT_TIME, SESSION_USER, 'DELETE ' || OLD);
RETURN OLD;
END;
$$ LANGUAGE plpgsql;

CREATE OR REPLACE TRIGGER before_delete_on_tipo_sucursal
BEFORE DELETE ON tipo_sucursal
FOR EACH ROW
EXECUTE FUNCTION function_delete_on_tipo_sucursal();

CREATE OR REPLACE FUNCTION function_insert_on_empresa() RETURNS TRIGGER AS $$
BEGIN
INSERT INTO auditoria (tabla, fecha, hora, usuario, operacion) VALUES ('empresa', CURRENT_DATE, CURRENT_TIME, SESSION_USER, 'INSERT ' || NEW);
RETURN NEW;
END;
$$ LANGUAGE plpgsql;

CREATE OR REPLACE TRIGGER before_insert_on_empresa
BEFORE INSERT ON empresa
FOR EACH ROW
EXECUTE FUNCTION function_insert_on_empresa();

CREATE OR REPLACE FUNCTION function_update_on_empresa() RETURNS TRIGGER AS $$
BEGIN
INSERT INTO auditoria (tabla, fecha, hora, usuario, operacion) VALUES ('empresa', CURRENT_DATE, CURRENT_TIME, SESSION_USER, 'UPDATE ' || OLD || ' TO ' || NEW);
RETURN NEW;
END;
$$ LANGUAGE plpgsql;

CREATE OR REPLACE TRIGGER before_update_on_empresa
BEFORE UPDATE ON empresa
FOR EACH ROW
EXECUTE FUNCTION function_update_on_empresa();

CREATE OR REPLACE FUNCTION function_delete_on_empresa() RETURNS TRIGGER AS $$
BEGIN
INSERT INTO auditoria (tabla, fecha, hora, usuario, operacion) VALUES ('empresa', CURRENT_DATE, CURRENT_TIME, SESSION_USER, 'DELETE ' || OLD);
RETURN OLD;
END;
$$ LANGUAGE plpgsql;

CREATE OR REPLACE TRIGGER before_delete_on_empresa
BEFORE DELETE ON empresa
FOR EACH ROW
EXECUTE FUNCTION function_delete_on_empresa();

CREATE OR REPLACE FUNCTION function_insert_on_estado_vehiculo() RETURNS TRIGGER AS $$
BEGIN
INSERT INTO auditoria (tabla, fecha, hora, usuario, operacion) VALUES ('estado_vehiculo', CURRENT_DATE, CURRENT_TIME, SESSION_USER, 'INSERT ' || NEW);
RETURN NEW;
END;
$$ LANGUAGE plpgsql;

CREATE OR REPLACE TRIGGER before_insert_on_estado_vehiculo
BEFORE INSERT ON estado_vehiculo
FOR EACH ROW
EXECUTE FUNCTION function_insert_on_estado_vehiculo();

CREATE OR REPLACE FUNCTION function_update_on_estado_vehiculo() RETURNS TRIGGER AS $$
BEGIN
INSERT INTO auditoria (tabla, fecha, hora, usuario, operacion) VALUES ('estado_vehiculo', CURRENT_DATE, CURRENT_TIME, SESSION_USER, 'UPDATE ' || OLD || ' TO ' || NEW);
RETURN NEW;
END;
$$ LANGUAGE plpgsql;

CREATE OR REPLACE TRIGGER before_update_on_estado_vehiculo
BEFORE UPDATE ON estado_vehiculo
FOR EACH ROW
EXECUTE FUNCTION function_update_on_estado_vehiculo();

CREATE OR REPLACE FUNCTION function_delete_on_estado_vehiculo() RETURNS TRIGGER AS $$
BEGIN
INSERT INTO auditoria (tabla, fecha, hora, usuario, operacion) VALUES ('estado_vehiculo', CURRENT_DATE, CURRENT_TIME, SESSION_USER, 'DELETE ' || OLD);
RETURN OLD;
END;
$$ LANGUAGE plpgsql;

CREATE OR REPLACE TRIGGER before_delete_on_estado_vehiculo
BEFORE DELETE ON estado_vehiculo
FOR EACH ROW
EXECUTE FUNCTION function_delete_on_estado_vehiculo();

