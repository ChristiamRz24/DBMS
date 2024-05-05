import { client } from "../../../../databases/postgresql/client";

export const GET = async ({ params: { table_name } }) => {
  const get_table_column_details = `
    SELECT column_name, data_type, is_nullable
    FROM information_schema.columns
    WHERE table_name = '${table_name}'
  `;

  try {
    const rows = await client.query(get_table_column_details);
    return new Response(JSON.stringify(rows));
  } catch (err) {
    new Response(JSON.stringify(err.message));
  }
};
