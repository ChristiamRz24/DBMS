import { client } from "../../../../databases/sqlite/client";

export const GET = async () => {
  const query = "SELECT roles_id, role_name as rolname FROM roles";

  try {
    const rows = await client.query(query);
    return new Response(JSON.stringify(rows));
  } catch (err) {
    return new Response(JSON.stringify(err.message));
  }
};
