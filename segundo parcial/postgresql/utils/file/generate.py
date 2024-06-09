import os
from reportlab.pdfgen import canvas
from reportlab.platypus import Table
from reportlab.lib.pagesizes import letter


from utils.file.table import (
  TABLE_STYLE,
  TABLE_SPACING,
  AUDIT_FILTERS_TITLE,
  AUDIT_LOGS_TITLE,
  TABLE_HEADERS,
)

from utils.file.canvas import (
  TITLE_FONT,
  TITLE_SIZE,
  SUBTITLE_FONT,
  SUBTITLE_SIZE,
  TEXT_FONT,
  TEXT_SIZE,
  SPACING,
  INITIAL_X,
  INITIAL_Y,
  DB_FILTERS_TITLE,
  DB_LOGS_TITLE,
  split_text
)


def generate_PDF_file(
  db_logs_selected_filters,
  db_logs_items,
  audit_selected_filters,
  audit_logs_items
):
  file_name = "logs.pdf"

  # Eliminar el archivo si ya existe
  if os.path.exists(file_name):
    os.remove(file_name)

  page = canvas.Canvas(file_name, pagesize=letter)

  width, height = letter

  x = INITIAL_X
  y = height - INITIAL_Y

  # Si "db_logs_selected_filters" tiene elementos se agrega esta información al PDF

  if len(db_logs_selected_filters) > 0:
    page.setFont(TITLE_FONT, TITLE_SIZE)
    page.drawString(x, y, DB_FILTERS_TITLE)
    page.setFont(TEXT_FONT, TEXT_SIZE)
    y -= SPACING

    for filter in db_logs_selected_filters:
      page.drawString(x, y, f"{filter['type'].upper()}: {filter['value']}")
      y -= SPACING

    y -= SPACING
    page.setFont(TITLE_FONT, TITLE_SIZE)
    page.drawString(x, y, DB_LOGS_TITLE)
    y -= SPACING

    for log in db_logs_items:
      page.setFont(SUBTITLE_FONT, SUBTITLE_SIZE)
      page.drawString(x, y, f"ID DEL PROCESO")
      y -= SPACING
      page.setFont(TEXT_FONT, TEXT_SIZE)
      page.drawString(x, y, f"{log['id_proceso']}")
      y -= SPACING
      page.setFont(SUBTITLE_FONT, SUBTITLE_SIZE)
      page.drawString(x, y, f"FECHA")
      y -= SPACING
      page.setFont(TEXT_FONT, TEXT_SIZE)
      page.drawString(x, y, f"{log['fecha']} {log['hora']}")
      y -= SPACING
      page.setFont(SUBTITLE_FONT, SUBTITLE_SIZE)
      page.drawString(x, y, f"MENSAJE")
      y -= SPACING
      page.setFont(TEXT_FONT, TEXT_SIZE)

      message = log['mensaje']
      message_len = len(message)

      if message_len > 115:
        message_segments = split_text(message, length=115)
        for message in message_segments:
          page.drawString(x, y, f"{message}")
          y -= SPACING

        # Espacio adicional para empezar a escribir el siguiente log
        y -= SPACING

      else:
        page.drawString(x, y, f"{message}")
        y -= 25

      # Crear una nueva página si es necesario
      if y < 50:
        page.showPage()
        y = height - 50

  # Si "audit_selected_filters" tiene elementos se agrega esta información al PDF

  if len(audit_selected_filters) > 0:
    y -= SPACING
    page.setFont(TITLE_FONT, TITLE_SIZE)
    page.drawString(x, y, AUDIT_FILTERS_TITLE)
    y -= SPACING

    for filter in audit_selected_filters:
      page.setFont(TEXT_FONT, TEXT_SIZE)
      page.drawString(x, y, f"{filter['type']}: {filter['value']}")
      y -= SPACING

    y -= SPACING
    page.setFont(TITLE_FONT, TITLE_SIZE)
    page.drawString(x, y, AUDIT_LOGS_TITLE)

    audit_data = []
    audit_data.append(TABLE_HEADERS)

    for log in audit_logs_items:
      audit_data.append([
        log['id'],
        log['tabla'],
        log['fecha'],
        log['hora'],
        log['usuario'],
        log['detalles']
      ])

    audit_table = Table(audit_data)
    audit_table.setStyle(TABLE_STYLE)
    audit_table.wrapOn(page, width, height)

    y -= TABLE_SPACING  # Posición de la tabla
    audit_table.drawOn(page, x, y)

    # Crear una nueva página si es necesario
    if y < 50:
      page.showPage()
      y = height - 50

  page.save()
