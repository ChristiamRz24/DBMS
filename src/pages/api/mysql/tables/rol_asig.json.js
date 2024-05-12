import { client } from "../../../../databases/mysql/client";

export const GET = async () => {
  const get_table_names = `
  GRANT rol_creado TO 'nuevo_usuario'@'mudanza';
  `;

  try {
    const rows = await client.query(get_table_names);
    return new Response(JSON.stringify(rows));
  } catch (err) {
    return new Response(JSON.stringify(err.message));
  }
};