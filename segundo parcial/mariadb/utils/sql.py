import os
from os.path import join


def create_sql_script(script_sql, file_name="script.sql"):
  current_directory = os.getcwd()

  # Verificar si existe la carpeta scripts
  if not os.path.exists(join(current_directory, "scripts")):
    os.makedirs(join(current_directory, "scripts"))

  # Verificar si el nombre del archivo tiene la extensión .sql
  if not file_name.endswith(".sql"):
    file_name += ".sql"

  script_directory = join(current_directory, "scripts")
  full_path = join(script_directory, file_name)

  # Verificar si el archivo script.sql ya existe y eliminarlo
  if os.path.exists(full_path):
    os.remove(full_path)

  # Generar el archivo SQL
  with open(full_path, "w") as file:
    file.write(script_sql)

  # Si el archivo se generó correctamente y tiene contenido
  if os.path.exists(full_path) and os.path.getsize(full_path) > 0:
    print("¡Script generado correctamente!")
  else:
    print("¡Error al generar el script!")
