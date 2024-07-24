from datetime import datetime


def audit_parser(raw_audits):
  audits = []

  for entry in raw_audits:
    audits.append({
      "id": entry[0],
      "tabla": entry[1],
      "fecha": datetime.strftime(entry[2], "%Y-%m-%d"),
      "hora": str(entry[3]).split(".")[0],
      "usuario": entry[4],
      "operacion": entry[5].split()[0],
      "detalles": entry[5]
    })

  return audits
