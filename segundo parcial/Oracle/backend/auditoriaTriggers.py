import cx_Oracle
from tkinter import messagebox

def get_connection():
    try:
        dsn = cx_Oracle.makedsn("localhost", 1521, service_name="orcldb")
        connection = cx_Oracle.connect(user="system", password="20Hanstic24", dsn=dsn)
        return connection
    except cx_Oracle.DatabaseError as e:
        print(f"Error al conectar a la base de datos: {e}")
        return None

def listar_entidades():
    connection = None
    cursor = None
    entities = {}
    try:
        connection = get_connection()
        if connection is None:
            return entities
        cursor = connection.cursor()
        cursor.execute("SELECT table_name FROM user_tables")
        tables = [row[0] for row in cursor.fetchall()]
        for table in tables:
            cursor.execute(f"SELECT column_name FROM user_tab_columns WHERE table_name = '{table}'")
            columns = [row[0] for row in cursor.fetchall()]
            entities[table] = columns
    except cx_Oracle.DatabaseError as e:
        print(f"Error al listar entidades y atributos: {e}")
    finally:
        if cursor:
            cursor.close()
        if connection:
            connection.close()
    return entities

def tabla_existe(table_name):
    connection = None
    cursor = None
    exists = False
    try:
        connection = get_connection()
        if connection is None:
            return exists
        cursor = connection.cursor()
        cursor.execute(f"SELECT table_name FROM user_tables WHERE table_name = '{table_name.upper()}'")
        exists = cursor.fetchone() is not None
    except cx_Oracle.DatabaseError as e:
        print(f"Error al verificar la existencia de la tabla: {e}")
    finally:
        if cursor:
            cursor.close()
        if connection:
            connection.close()
    return exists

def crear_tabla_auditoria():
    connection = None
    cursor = None
    try:
        connection = get_connection()
        if connection is None:
            return
        cursor = connection.cursor()

        if tabla_existe("AUDITORIA"):
            confirm = messagebox.askyesno("Confirmación", "La tabla 'Auditoria' ya existe. ¿Desea reemplazarla?")
            if not confirm:
                return

            # Eliminar la tabla si ya existe
            cursor.execute("""
            BEGIN
                EXECUTE IMMEDIATE 'DROP TABLE AUDITORIA CASCADE CONSTRAINTS';
            EXCEPTION
                WHEN OTHERS THEN
                    IF SQLCODE != -942 THEN
                        RAISE;
                    END IF;
            END;
            """)

        # Crear la tabla de auditoría
        cursor.execute("""
        CREATE TABLE AUDITORIA (
            AUDITORIA_ID INTEGER PRIMARY KEY,
            AUDITORIA_TABLAAFECTADA VARCHAR2(100),
            AUDITORIA_FECHA TIMESTAMP,
            AUDITORIA_USUARIO VARCHAR2(50),
            AUDITORIA_DETALLE VARCHAR2(200)
        )
        """)
        connection.commit()
        messagebox.showinfo("Éxito", "Tabla de auditoría creada correctamente.")
    except cx_Oracle.DatabaseError as e:
        messagebox.showerror("Error", f"Error al crear la tabla de auditoría: {e}")
    finally:
        if cursor:
            cursor.close()
        if connection:
            connection.close()

def generar_triggers(entities):
    try:
        for entity in entities:
            triggers = {
                "INSERT": f"""
                CREATE OR REPLACE TRIGGER trg_audit_{entity}_ins
                AFTER INSERT ON {entity}
                FOR EACH ROW
                BEGIN
                    INSERT INTO AUDITORIA (AUDITORIA_ID, AUDITORIA_TABLAAFECTADA, AUDITORIA_FECHA, AUDITORIA_USUARIO, AUDITORIA_DETALLE)
                    VALUES (AUDITORIA_SEQ.NEXTVAL, '{entity}', SYSDATE, USER, 'INSERT');
                END;""",
                "UPDATE": f"""
                CREATE OR REPLACE TRIGGER trg_audit_{entity}_upd
                AFTER UPDATE ON {entity}
                FOR EACH ROW
                BEGIN
                    INSERT INTO AUDITORIA (AUDITORIA_ID, AUDITORIA_TABLAAFECTADA, AUDITORIA_FECHA, AUDITORIA_USUARIO, AUDITORIA_DETALLE)
                    VALUES (AUDITORIA_SEQ.NEXTVAL, '{entity}', SYSDATE, USER, 'UPDATE');
                END;""",
                "DELETE": f"""
                CREATE OR REPLACE TRIGGER trg_audit_{entity}_del
                AFTER DELETE ON {entity}
                FOR EACH ROW
                BEGIN
                    INSERT INTO AUDITORIA (AUDITORIA_ID, AUDITORIA_TABLAAFECTADA, AUDITORIA_FECHA, AUDITORIA_USUARIO, AUDITORIA_DETALLE)
                    VALUES (AUDITORIA_SEQ.NEXTVAL, '{entity}', SYSDATE, USER, 'DELETE');
                END;"""
            }

            # Generar el contenido del archivo SQL
            sql_content = "\n\n".join(triggers.values())

            # Escribir el contenido en un archivo .sql
            with open(f"{entity}_auditoria_triggers.sql", "w") as file:
                file.write(sql_content)
                print(f"Archivo SQL para {entity} creado.")

        messagebox.showinfo("Éxito", "Disparadores de auditoría generados y guardados en archivos SQL correctamente.")
    except cx_Oracle.DatabaseError as e:
        messagebox.showerror("Error", f"No se pudieron generar los disparadores: {e}")