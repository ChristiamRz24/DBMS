import { client } from "../../../../databases/mariadb/client";

export const POST = async ({ request }) => {
  const data = await request.formData();
  const query = data.get("query");

  try {
    const rows = await client.query(query);
    return new Response(JSON.stringify(rows));
  } catch (err) {
    return new Response(JSON.stringify({ error: err, message: err.message }), {
      status: 500,
    });
  }
};
