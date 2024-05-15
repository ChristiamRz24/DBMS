import { client } from "../../../../databases/sqlserver/client";

export const GET = async () => {
  const get_table_names = `
  SELECT COLUMN_NAME
  FROM INFORMATION_SCHEMA.COLUMNS
  WHERE TABLE_NAME = 'ARTICULOS' AND TABLE_CATALOG = 'mudanzas';
  `;

  try {
    const rows = await client.query(get_table_names);
    return new Response(JSON.stringify(rows));
  } catch (err) {
    return new Response(JSON.stringify(err.message));
  }
};
