import { client } from "../../../../databases/sqlserver/client";

export const GET = async () => {
  const get_table_names = `
  REVOKE ALL PRIVILEGES ON DATABASE::mudanzas FROM nuevo_usuario5;
  DROP USER nuevo_usuario5;
  `;

  try {
    const rows = await client.query(get_table_names);
    return new Response(JSON.stringify(rows));
  } catch (err) {
    return new Response(JSON.stringify(err.message));
  }
};