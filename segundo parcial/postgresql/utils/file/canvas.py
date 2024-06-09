TITLE_FONT = "Helvetica-Bold"
TITLE_SIZE = 12

SUBTITLE_FONT = "Helvetica-Bold"
SUBTITLE_SIZE = 9

TEXT_FONT = "Helvetica"
TEXT_SIZE = 10

SPACING = 15

INITIAL_X = 50
INITIAL_Y = 50

DB_FILTERS_TITLE = "Filtros de los logs de la base de datos seleccionados"
DB_LOGS_TITLE = "Logs de la base de datos"


# Función que separa un texto en varias líneas con un máximo de caracteres
# siendo 85 el máximo de caracteres por línea
# y retorna una lista con las líneas

def split_text(text, length=85):
  lines = []

  while len(text) > length:
    lines.append(text[:length])
    text = text[length:]
  lines.append(text)

  return lines
