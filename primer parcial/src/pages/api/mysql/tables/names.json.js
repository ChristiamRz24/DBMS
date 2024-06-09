import { client } from "../../../../databases/mysql/client";

export const GET = async () => {
  const query = `
    SELECT table_name as table_name
    FROM information_schema.tables 
    WHERE table_schema = 'mudanza'
  `;

  try {
    const rows = await client.query(query);
    return new Response(JSON.stringify(rows));
  } catch (err) {
    return new Response(JSON.stringify(err.message));
  }
};