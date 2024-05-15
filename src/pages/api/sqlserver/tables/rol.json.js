import { client } from "../../../../databases/sqlserver/client";

export const GET = async () => {
  const get_table_names = `
    CREATE ROLE mi_rol2;
  `;

  try {
    const rows = await client.query(get_table_names);
    return new Response(JSON.stringify(rows));
  } catch (err) {
    return new Response(JSON.stringify(err.message));
  }
};
