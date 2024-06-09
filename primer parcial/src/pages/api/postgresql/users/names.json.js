import { client } from "../../../../databases/postgresql/client";

export const GET = async () => {
  const query = `
    SELECT u.usename, g.groname AS role
    FROM pg_user u
    JOIN pg_group g ON u.usesysid = ANY(g.grolist);
  `;

  try {
    const rows = await client.query(query);
    return new Response(JSON.stringify(rows));
  } catch (err) {
    return new Response(JSON.stringify(err.message));
  }
};
