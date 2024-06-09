GET_TABLES = "SELECT table_name FROM information_schema.tables WHERE table_schema = 'public'"

GET_TABLE_ATTRIBUTES = "SELECT column_name, data_type, is_nullable " + \
  "FROM information_schema.columns WHERE table_name = '%s'"

GET_LOG_FILE_NAME = "SELECT pg_current_logfile()"

GET_LOG_FILE_CONTENT = "SELECT pg_read_file('%s', 0, 10000)"

GET_AUDIT_LOGS = "SELECT * FROM auditoria ORDER BY id ASC LIMIT 10000"


def generate_insert_trigger(table_name):
  captured_data = "NEW"
  operation_datails = "'INSERT ' || NEW"

  data = {
    "type": "insert",
    "captured_data": captured_data,
    "operation_datails": operation_datails,
  }

  script_sql = base_trigger(data, table_name)

  return script_sql


def generate_update_trigger(table_name):
  captured_data = "NEW"
  operation_datails = "'UPDATE ' || OLD || ' TO ' || NEW"

  data = {
    "type": "update",
    "captured_data": captured_data,
    "operation_datails": operation_datails,
  }

  script_sql = base_trigger(data, table_name)

  return script_sql


def generate_delete_trigger(table_name):
  captured_data = "OLD"
  operation_datails = "'DELETE ' || OLD"

  data = {
    "type": "delete",
    "captured_data": captured_data,
    "operation_datails": operation_datails,
  }

  script_sql = base_trigger(data, table_name)

  return script_sql


def base_trigger(data, table_name):
  type = data["type"]
  captured_data = data["captured_data"]
  operation_datails = data["operation_datails"]

  function_name = f"function_{type}_on_{table_name}"
  trigger_name = f"before_{type}_on_{table_name}"

  type = type.upper()

  data_to_insert = "tabla, fecha, hora, usuario, operacion"
  other_values = "CURRENT_DATE, CURRENT_TIME, SESSION_USER"

  script_sql = f"CREATE OR REPLACE FUNCTION {function_name}() " + \
      "RETURNS TRIGGER AS $$\n" + \
      "BEGIN\n" + \
      f"INSERT INTO auditoria ({data_to_insert}) " + \
      f"VALUES ('{table_name}', {other_values}, {operation_datails});\n" + \
      f"RETURN {captured_data};\n" + \
      "END;\n" + \
      "$$ LANGUAGE plpgsql;\n\n" + \
      f"CREATE OR REPLACE TRIGGER {trigger_name}\n" + \
      f"BEFORE {type.upper()} ON {table_name}\n" + \
      "FOR EACH ROW\n" + \
      f"EXECUTE FUNCTION {function_name}();\n\n"

  return script_sql


def create_audit_table():
  # Crear la tabla de auditoría si no existe
  script_sql = f"CREATE TABLE IF NOT EXISTS auditoria (" + \
    "id SERIAL PRIMARY KEY, " + \
    "tabla VARCHAR(50), " + \
    "fecha DATE, " + \
    "hora TIME, " + \
    "usuario VARCHAR(50), " + \
    "operacion VARCHAR(250)" + \
    ");\n\n"

  return script_sql
