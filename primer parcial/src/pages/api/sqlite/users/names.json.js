import { client } from "../../../../databases/sqlite/client";

export const GET = async () => {
  const query = "SELECT * FROM user_roles";

  try {
    const rows = await client.query(query);
    return new Response(JSON.stringify(rows));
  } catch (err) {
    return new Response(JSON.stringify(err.message));
  }
};
