def attributes_parser(raw_attributes):
  attributes = []

  for attribute in raw_attributes:
    column_name = attribute[0].lower()
    data_type = attribute[1].split("(")[0]  # int(11) --> int
    is_nullable = True if attribute[2] == "YES" else False

    attributes.append({
      "column_name": column_name,
      "data_type": data_type,
      "is_nullable": is_nullable
    })

  return attributes
