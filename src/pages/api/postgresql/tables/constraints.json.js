import { client } from "../../../../databases/postgresql/client";

export const GET = async ({ params: { table_name } }) => {
  const get_table_constraint_details = `
    SELECT constraint_name, constraint_type
    FROM information_schema.table_constraints
    WHERE table_name = '${table_name}' AND constraint_type <> 'CHECK'
  `;

  try {
    const rows = await client.query(get_table_constraint_details);
    return new Response(JSON.stringify(rows));
  } catch (err) {
    new Response(JSON.stringify(err.message));
  }
};
