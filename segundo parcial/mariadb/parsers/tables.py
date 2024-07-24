def tables_parser(raw_tables):
  tables = []

  for table in raw_tables:
    tables.append({"name": table[0]})

  return tables
