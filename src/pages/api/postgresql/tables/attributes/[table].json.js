import { client } from "../../../../../databases/postgresql/client";

export const GET = async ({ params }) => {
  const table = params.table;

  const query = `
    SELECT column_name as name, data_type as type, is_nullable as optional
    FROM information_schema.columns
    WHERE table_name = '${table}'
  `;

  try {
    const rows = await client.query(query);
    return new Response(JSON.stringify(rows));
  } catch (err) {
    new Response(JSON.stringify(err.message));
  }
};
