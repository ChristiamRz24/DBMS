import { client } from "../../../../databases/mysql/client";

export const GET = async () => {
  const get_table_names = `
    SELECT table_name
    FROM information_schema.tables
    WHERE table_schema = 'mudanzas';
  `;

  try {
    const rows = await client.query(get_table_names);
    return new Response(JSON.stringify(rows));
  } catch (err) {
    return new Response(JSON.stringify(err.message));
  }
};
