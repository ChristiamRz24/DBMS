import questionary


def main_menu():
  options = [
    "Obtener todas las entidades",
    "Obtener los atributos de una tabla",
    "Generar disparadores de auditoría",
    "Generar PDF auditoría y logs",
    "Salir"
  ]

  option = questionary.select(
    "Seleccione una opción:",
    choices=options
  ).ask()

  return option
