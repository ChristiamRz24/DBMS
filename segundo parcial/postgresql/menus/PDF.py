import questionary


def select_log_types_menu():
  options = questionary.checkbox(
    'Seleccione los logs que desea incluir:',
    choices=[
      "Logs de la base de datos",
      "Logs de auditoría"
    ]).ask()

  return options

# En caso de seleccionar "Logs de la base de datos"
# Se despliega el siguiente menú


def select_db_logs_menu():
  print("Logs de la base de datos")

  selected_filters = []

  options = questionary.checkbox(
    'Seleccione los filtros que desea aplicar:',
    choices=[
      "Fecha",
      "Hora",
      "ID",
    ]).ask()

  if "Fecha" in options:
    date = questionary.text("Ingrese la fecha:").ask()
    selected_filters.append({"type": "date", "value": date})

  if "Hora" in options:
    time = questionary.text("Ingrese la hora:").ask()
    selected_filters.append({"type": "time", "value": time})

  if "ID" in options:
    id = questionary.text("Ingrese el ID:").ask()
    selected_filters.append({"type": "id", "value": id})

  return selected_filters

# En caso de seleccionar "Logs de aditoría"
# Se despliega el siguiente menú


def select_audit_logs_menu():
  print("Logs de aditoría")

  selected_filters = []

  options = questionary.checkbox(
    'Seleccione los filtros que desea aplicar:',
    choices=[
      "Tabla",
      "Fecha",
      "Hora",
      "Usuario",
      "Operación",
    ]).ask()

  if "Tabla" in options:
    table = questionary.text("Ingrese el nombre de la tabla:").ask()
    selected_filters.append({"type": "table", "value": table})

  if "Fecha" in options:
    date = questionary.text("Ingrese la fecha:").ask()
    selected_filters.append({"type": "date", "value": date})

  if "Hora" in options:
    time = questionary.text("Ingrese la hora:").ask()
    selected_filters.append({"type": "time", "value": time})

  if "Usuario" in options:
    user = questionary.text("Ingrese el nombre del usuario:").ask()
    selected_filters.append({"type": "user", "value": user})

  if "Operación" in options:
    operation = questionary.select(
      "Seleccione el tipo de operación:",
      choices=[
        "INSERT",
        "UPDATE",
        "DELETE"
      ]).ask()
    selected_filters.append({"type": "operation", "value": operation})

  return selected_filters
