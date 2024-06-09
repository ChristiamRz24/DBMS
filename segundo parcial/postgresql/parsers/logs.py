import re


def log_parser(raw_logs):
  log_entries = raw_logs[0].split('\n')
  logs = []

  for entry in log_entries:
    if not entry:
      continue

    date = re.search(r'^(\d{4}-\d{2}-\d{2})', entry).group()
    time = re.search(r'(\d{2}:\d{2}:\d{2}\.\d+)', entry).group()
    time = time.split('.')[0]

    parts = entry.split()
    process_id = parts[3][1:-1]
    message = ' '.join(parts[5:])

    logs.append({
      "fecha": date,
      "hora": time,
      "id_proceso": process_id,
      "mensaje": message
    })

  return logs
