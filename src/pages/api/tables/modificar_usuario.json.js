import { client } from "../../../../databases/sqlserver/client";

export const GET = async () => {
  const get_table_names = `
  ALTER USER nuevo_usuario5 
  WITH NAME = bryan;
  `;

  try {
    const rows = await client.query(get_table_names);
    return new Response(JSON.stringify(rows));
  } catch (err) {
    return new Response(JSON.stringify(err.message));
  }
};