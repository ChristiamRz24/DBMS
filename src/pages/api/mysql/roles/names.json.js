import { client } from "../../../../databases/mysql/client";

export const GET = async () => {
  const query = 'SELECT FROM_USER As rolname FROM mysql.role_edges';

  try {
    const rows = await client.query(query);
    return new Response(JSON.stringify(rows));
  } catch (err) {
    return new Response(JSON.stringify(err.message));
  }
};