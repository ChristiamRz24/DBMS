import psycopg2


def get_connection():
  try:
    conn = psycopg2.connect(
      host="localhost",
      user="postgres",
      password="pgadmin",
      dbname="mudanzas",
    )
    return conn
  except Exception as e:
    print(f"ERROR: {e}")
    return None
