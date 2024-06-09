import psycopg2

# Conéctate a la base de datos
conn = psycopg2.connect(
  host="localhost",
  user="postgres",
  password="pgadmin",
  dbname="mudanzas",
)

# Crea un cursor para ejecutar consultas
cur = conn.cursor()

# Generar un script para crear procedimientos almacenados de CRUD para cada tabla
# Variable global para almacenar el script SQL
script_crud = ""


def obtener_todas_las_tablas(conexion):
  cursor = conexion.cursor()
  cursor.execute("SELECT tables.table_name FROM information_schema.tables * WHERE table_schema = 'public'")
  tablas = cursor.fetchall()
  cursor.close()
  return tablas

def obtener_atributos_tabla(conexion, tabla):
  cursor = conexion.cursor()
  cursor.execute(
    f"SELECT column_name, data_type, is_nullable FROM information_schema.columns WHERE table_name = '{tabla}'")
  atributos = cursor.fetchall()
  cursor.close()
  return atributos

def generar_sql_crud_file():
  global script_crud
  with open("crud.sql", "w") as file:
    file.write(script_crud)

def generar_procedimientos_crud(conexion):
  global script_crud
  tablas = obtener_todas_las_tablas(conexion)

  for tabla in tablas:
    nombre_tabla = tabla[0]
    atributos = obtener_atributos_tabla(conexion, nombre_tabla)

    # Generar procedimiento de inserción
    script_crud += f"CREATE OR REPLACE PROCEDURE insertar_{nombre_tabla} ("
    for atributo in atributos:
      script_crud += f"{atributo[0]} {atributo[1]}, "
    script_crud = script_crud[:-2]
    script_crud += ") AS $$\n"
    script_crud += f"BEGIN\n"
    script_crud += f"INSERT INTO {nombre_tabla} ("
    for atributo in atributos:
      script_crud += f"{atributo[0]}, "
    script_crud = script_crud[:-2]
    script_crud += ") VALUES ("
    for atributo in atributos:
      script_crud += f"{atributo[0]}, "
    script_crud = script_crud[:-2]
    script_crud += ");\n"
    script_crud += f"END;\n"
    script_crud += f"$$ LANGUAGE plpgsql;\n\n"

    # Generar procedimiento de actualización
    script_crud += f"CREATE OR REPLACE PROCEDURE actualizar_{nombre_tabla} ("
    for atributo in atributos:
      script_crud += f"{atributo[0]} {atributo[1]}, "
    script_crud = script_crud[:-2]
    script_crud += ") AS $$\n"
    script_crud += f"BEGIN\n"
    script_crud += f"UPDATE {nombre_tabla} SET "
    for atributo in atributos:
      script_crud += f"{atributo[0]} = {atributo[0]}, "
    script_crud = script_crud[:-2]
    script_crud += ";\n"
    script_crud += f"END;\n"
    script_crud += f"$$ LANGUAGE plpgsql;\n\n"

    # Generar procedimiento de eliminación
    script_crud += f"CREATE OR REPLACE PROCEDURE eliminar_{nombre_tabla} ("
    for atributo in atributos:
      script_crud += f"{atributo[0]} {atributo[1]}, "
    script_crud = script_crud[:-2]
    script_crud += ") AS $$\n"
    script_crud += f"BEGIN\n"
    script_crud += f"DELETE FROM {nombre_tabla} WHERE "
    for atributo in atributos:
      script_crud += f"{atributo[0]} = {atributo[0]} AND "
    script_crud = script_crud[:-5]
    script_crud += ";\n"
    script_crud += f"END;\n"
    script_crud += f"$$ LANGUAGE plpgsql;\n\n"
  
  generar_sql_crud_file()

# Generar procedimientos CRUD
generar_procedimientos_crud(conn)

# Cierra el cursor y la conexión
cur.close()
conn.close()
