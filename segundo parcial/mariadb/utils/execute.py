from database.config import get_connection


def execute_query(query):
  connection = get_connection()

  cursor = connection.cursor()
  cursor.execute(query)

  result = cursor.fetchall()
  cursor.close()

  return result
