def filter_db_logs_data(db_logs, selected_filters):
  # Al principio, todos los registros están incluidos
  # Luego se van filtrando en base a los filtros seleccionados
  filtered_items = db_logs

  for db_log_filter in selected_filters:
    # type --> se usa para verificar el tipo de filtro seleccionado
    # value --> se usa para comparar el valores entre el filtro y el registro
    type = db_log_filter['type']
    value = db_log_filter['value']

    if type == "date":
      filtered_items = [log for log in filtered_items if value in log["fecha"]]

    if type == "time":
      # Se separa la hora en los segmentos: 00:00:00
      # 00 --> solo compara la hora
      # 00:00 --> compara la hora y los minutos
      # 00:00:00 --> compara la hora, los minutos y los segundos
      segments = value.split(":")

      if len(segments) == 1:  # Solo compara la hora
        filtered_items = [
          log for log in filtered_items if value in log["hora"].split(":")[0]
        ]
      # Comparar 00:00 o 00:00:00
      elif len(segments) >= 2 and len(segments) <= 3:
        filtered_items = [
          log for log in filtered_items if value in log["hora"]
        ]

    if type == "id":
      filtered_items = [
        log for log in filtered_items if value in log["id_proceso"]
      ]

  return filtered_items
