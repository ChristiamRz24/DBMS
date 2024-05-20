import { client } from "../../../../databases/mysql/client";

export const GET = async () => {
  const query = `
    SELECT User as usename
    FROM mysql.user
    WHERE   host = 'mudanza'
  `;

  try {
    const rows = await client.query(query);
    return new Response(JSON.stringify(rows));
  } catch (err) {
    return new Response(JSON.stringify(err.message));
  }
};