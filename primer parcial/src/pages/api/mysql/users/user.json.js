import { client } from "../../../../databases/mysql/client";

export const GET = async () => {
  const get_table_names = `
  CREATE USER 'nuevo_usuario'@'mudanza' IDENTIFIED BY 'admin';
  `;

  try {
    const rows = await client.query(get_table_names);
    return new Response(JSON.stringify(rows));
  } catch (err) {
    return new Response(JSON.stringify(err.message));
  }
};