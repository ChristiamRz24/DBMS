GET_TABLES = "SELECT table_name FROM information_schema.tables WHERE table_schema = 'mudanzas'"

GET_TABLE_ATTRIBUTES = "DESCRIBE %s"

LOG_FILE_PATH = f'C:\\Program Files\\MariaDB 11.3\\data'
LOG_FILE_NAME = "general.log"

GET_LOG_FILE_CONTENT = ""

GET_AUDIT_LOGS = "SELECT * FROM auditoria ORDER BY id ASC LIMIT 10000"


def generate_insert_trigger(table_name, attributes):
  return base_trigger("INSERT", table_name, attributes)


def generate_update_trigger(table_name, attributes):
  return base_trigger("UPDATE", table_name, attributes)


def generate_delete_trigger(table_name, attributes):
  return base_trigger("DELETE", table_name, attributes)


def base_trigger(type, table_name, attributes):
  trigger_name = f"before_{type.lower()}_on_{table_name.lower()}"

  data_to_insert = "tabla, fecha, hora, usuario, operacion"
  other_values = "CURRENT_DATE, CURRENT_TIME, USER()"
  operation_datails = get_operation_details(type, table_name, attributes)

  script_sql = f"DELIMITER //\n\n" + \
      f"CREATE TRIGGER {trigger_name}\n" + \
      f"BEFORE {type} ON mudanzas.{table_name}\n" + \
      "FOR EACH ROW\n" + \
      "BEGIN\n" + \
      f"INSERT INTO mudanzas.auditoria ({data_to_insert})\n" + \
      f"VALUES ('{table_name.lower()}', {other_values}, {operation_datails});\n" + \
      "END //\n\n" + \
      f"DELIMITER ;\n\n"

  # print(script_sql)
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


def get_operation_details(type, table_name, attributes):
  table_name = table_name.lower()
  new_values = concat_values("NEW", attributes)
  old_values = concat_values("OLD", attributes)
  operation_datails = ""

  if type == "INSERT":
    operation_datails = f"CONCAT('{type} ON {table_name} " + \
        f"VALUES (', {new_values}, ')')"

  if type == "UPDATE":
    operation_datails = f"CONCAT('{type} ON {table_name} " + \
        f"VALUES (', {old_values}, ') TO (', {new_values}, ')')"

  if type == "DELETE":
    operation_datails = f"CONCAT('{type} ON {table_name} " + \
        f"VALUES (', {old_values}, ')')"

  return operation_datails


def concat_values(type, values):
  # types of captured data: NEW, OLD
  return ", ', ', ".join([f"{type}.{value[0]}" for value in values[1:]])
