import { client } from "../../../../databases/postgresql/client";

export const GET = async () => {
  const query = `
    SELECT * FROM pg_roles
    WHERE rolname NOT SIMILAR TO 'pg_%|postgres';
  `;

  try {
    const rows = await client.query(query);
    return new Response(JSON.stringify(rows));
  } catch (err) {
    return new Response(JSON.stringify(err.message));
  }
};
