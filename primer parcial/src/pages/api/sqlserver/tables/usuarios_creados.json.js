import { client } from "../../../../databases/sqlserver/client";

export const GET = async () => {
  const get_table_names = `
  SELECT name
  FROM sys.database_principals
  WHERE type_desc = 'SQL_USER';
  `;

  try {
    const rows = await client.query(get_table_names);
    return new Response(JSON.stringify(rows));
  } catch (err) {
    return new Response(JSON.stringify(err.message));
  }
};
