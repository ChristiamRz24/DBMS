def filter_audit_data(audit, selected_filters):
  # Al principio, todos los registros están incluidos
  # Luego se van filtrando en base a los filtros seleccionados
  filtered_items = audit

  for audit_filter in selected_filters:
    # type --> se usa para verificar el tipo de filtro seleccionado
    # value --> se usa para comparar el valores entre el filtro y el registro
    type = audit_filter['type']
    value = audit_filter['value']

    if type == "table":
      filtered_items = [
        audit for audit in filtered_items if value in audit["tabla"]
      ]

    if type == "date":
      filtered_items = [
        audit for audit in filtered_items if value in str(audit["fecha"])
      ]

    if type == "time":
      # Se separa la hora en los segmentos: 00:00:00
      # 00 --> solo compara la hora
      # 00:00 --> compara la hora y los minutos
      # 00:00:00 --> compara la hora, los minutos y los segundos
      segments = value.split(":")

      if len(segments) == 1:  # Solo compara la hora
        filtered_items = [
          audit for audit in filtered_items if value in audit["hora"].split(":")[0]
        ]
      # Comparar 00:00 o 00:00:00
      elif len(segments) >= 2 and len(segments) <= 3:
        filtered_items = [
          audit for audit in filtered_items if value in audit["hora"]]

    if type == "user":
      filtered_items = [
        audit for audit in filtered_items if value in audit["usuario"].split("@")[0]
      ]

    if type == "operation":
      filtered_items = [
        audit for audit in filtered_items if value in audit["operacion"]
      ]

  return filtered_items
