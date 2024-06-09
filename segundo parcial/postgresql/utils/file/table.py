from reportlab.lib import colors
from reportlab.platypus import TableStyle

from utils.file.canvas import TITLE_FONT

TABLE_STYLE = TableStyle([
  ('BACKGROUND', (0, 0), (-1, 0), colors.lightsteelblue),
  ('TEXTCOLOR', (0, 0), (-1, 0), colors.black),
  ('ALIGN', (0, 0), (-1, -1), 'CENTER'),
  ('FONTNAME', (0, 0), (-1, 0), TITLE_FONT),
  ('BOTTOMPADDING', (0, 0), (-1, 0), 12),
  ('BACKGROUND', (0, 1), (-1, -1), colors.beige),
])

AUDIT_FILTERS_TITLE = "Filtros de los logs de auditoría seleccionados"
AUDIT_LOGS_TITLE = "Logs de auditoría"

TABLE_HEADERS = ['ID', 'Tabla', 'Fecha', 'Hora', 'Usuario', 'Operación']

TABLE_SPACING = 90
