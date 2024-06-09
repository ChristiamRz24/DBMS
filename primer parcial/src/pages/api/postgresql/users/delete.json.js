import { client } from "../../../../databases/postgresql/client";

export const DELETE = async ({ request }) => {
  const data = await request.formData();
  const username = data.get("username");

  const query = `DROP USER ${username};`;

  try {
    const result = await client.query(query);
    console.log(result);
    return new Response(JSON.stringify({ message: "deleted" }));
  } catch (err) {
    return new Response(JSON.stringify(err.message));
  }
};
