# pip install mysql-connector-python tabulate questionary reportlab
# ALTER DATABASE mudanzas CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

import os

from parsers.audit import audit_parser
from parsers.tables import tables_parser

from utils.execute import execute_query
from utils.sql import create_sql_script
from utils.prints import print_table_names, print_table_attributes
from utils.file.generate import generate_PDF_file

from utils.queries import (
  GET_TABLES,
  GET_TABLE_ATTRIBUTES,
  LOG_FILE_PATH,
  LOG_FILE_NAME,
  GET_AUDIT_LOGS,
  create_audit_table,
  generate_insert_trigger,
  generate_update_trigger,
  generate_delete_trigger,
)

from menus.main import main_menu
from menus.PDF import select_log_types_menu, select_audit_logs_menu

from filters.audit import filter_audit_data

def main():
  while True:
    opcion = main_menu()

    if opcion == "Obtener todas las entidades":
      get_tables()
    elif opcion == "Obtener los atributos de una tabla":
      get_attributes()
    elif opcion == "Generar disparadores de auditoría":
      generate_audit_triggers()
    elif opcion == "Generar PDF auditoría y logs":
      generar_pdf_auditoria_logs()
    else:  # Salir
      print("¡Hasta luego!")
      break

# Obtener los nombre de todas las tablas de la base de datos


def get_tables(print_result=True):
  tables = execute_query(GET_TABLES)

  if print_result:
    print_table_names(tables)

  tables = tables_parser(tables)

  return tables

# Obtener los atributos (nombre, tipo de dato, si es nulo o no) de una tabla


def get_attributes(table_name=None, print_result=True):
  if table_name is None:
    table_name = input("Ingrese el nombre de la tabla: ")

  query = GET_TABLE_ATTRIBUTES % table_name
  attributes = execute_query(query)

  # attributes_parsed = attributes_parser(attributes)
  # print(attributes_parsed)

  if print_result:
    print_table_attributes(attributes)

  return attributes


# Generar un script para crear disparadores de auditoria (create, update y delete)
# para todas las tablas de la base de datos que se ejecuten antes de cada operación

# Variable global para almacenar el script SQL
script_sql = ""


def generate_audit_triggers():
  script_sql = create_audit_table()

  # Obtener todas las tablas de la base de datos
  tables = get_tables(print_result=False)

  # Recorrer cada tabla y generar los triggers
  for table in tables:
    table_name = table["name"]
    attributes = get_attributes(table_name, print_result=False)

    # No se generan triggers para la tabla de auditoria
    if table_name == "auditoria":
      continue

    script_sql += generate_insert_trigger(table_name, attributes)
    script_sql += generate_update_trigger(table_name, attributes)
    script_sql += generate_delete_trigger(table_name, attributes)

  # Crear el archivo SQL con el script generado
  create_sql_script(script_sql, file_name="triggers.sql")


def generar_pdf_auditoria_logs():
  db_logs_selected_filters = False
  audit_selected_filters = []

  selected_logs_types = select_log_types_menu()

  db_logs_items = []
  audit_logs_items = []

  for log_type in selected_logs_types:
    if log_type == "Logs de la base de datos":
      db_logs_selected_filters = True

      # LOG_FILE_PATH = f'C:\Program Files\MariaDB 11.3\data'
      full_log_file_path = os.path.join(LOG_FILE_PATH, LOG_FILE_NAME)

      log_file_content = []

      # Verificar si el archivo de logs existe en la ruta especificada
      if not os.path.exists(full_log_file_path):
        print("El archivo de logs no existe en la ruta especificada")
        return

      # Leer el contenido del archivo de logs
      with open(full_log_file_path, "r") as file:
        log_file_content = file.readlines()

      # Obtener los últimos 10 logs del archivo
      db_logs_items = log_file_content[-20:]

      if len(db_logs_items) == 0:
        print("No se encontraron logs con los filtros seleccionados")

    # .........................................................

    if log_type == "Logs de auditoría":
      audit = execute_query(GET_AUDIT_LOGS)
      audit = audit_parser(audit)

      audit_selected_filters = select_audit_logs_menu()

      # Variables para almacenar los logs filtrados de las auditorías
      audit_logs_items = filter_audit_data(audit, audit_selected_filters)

      if len(audit_logs_items) == 0:
        print("No se encontraron registros de auditoría con los filtros seleccionados")

  # Para generar el PDF se necesitan los filtros seleccionados para cada tipo de log
  # además de los logs de la base de datos y los logs de auditoría que se obtuvieron
  # en los pasos anteriores

  generate_PDF_file(
    db_logs_selected_filters,
    db_logs_items,
    audit_selected_filters,
    audit_logs_items
  )


main()
