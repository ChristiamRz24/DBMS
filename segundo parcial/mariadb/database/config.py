import mysql.connector

def get_connection():
  try:
    conn = mysql.connector.connect(
      host="127.0.0.1",
      user="root",
      password="Bmejia309",
      database="mudanzas",
      charset='utf8mb4',
      collation='utf8mb4_unicode_ci'
    )
    cursor = conn.cursor()
    cursor.close()
    return conn
  except mysql.connector.Error as err:
    print(f"ERROR: {err}")
    return None
