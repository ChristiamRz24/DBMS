from tabulate import tabulate


def print_table_names(table_names):
  headers = ["Tables"]
  print(tabulate(table_names, headers=headers, tablefmt='grid'))


def print_table_attributes(table_attributes):
  headers = ["Name", "Type", "Optional"]
  print(tabulate(table_attributes, headers=headers, tablefmt='grid'))
