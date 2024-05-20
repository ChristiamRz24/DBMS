import { client } from "../../../../databases/postgresql/client";

export const GET = async () => {
  const query = `
    SELECT usename, usesysid, usecreatedb, usesuper, passwd
    FROM pg_user;
  `;

  try {
    const rows = await client.query(query);
    return new Response(JSON.stringify(rows));
  } catch (err) {
    return new Response(JSON.stringify(err.message));
  }
};
