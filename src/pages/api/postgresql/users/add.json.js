import { client } from "../../../../databases/postgresql/client";

export const POST = async ({ request }) => {
  const data = await request.formData();

  const name = data.get("name");
  const password = data.get("passwd");
  const role = data.get("role");

  // Verificar si el usuario ya fue creado en la base de datos
  const userExists = `SELECT * FROM pg_user WHERE usename = '${name}';`;
  const rows = await client.query(userExists);

  if (rows.length > 0) {
    return new Response(JSON.stringify({ message: "already exists" }), {
      status: 400,
    });
  }

  const createUser = `CREATE USER ${name} WITH PASSWORD '${password}';`;

  let query = createUser;
  if (role) query += `GRANT ${role} TO ${name};`;

  try {
    await client.query(query);
    return new Response(JSON.stringify({ message: "created" }));
  } catch (err) {
    return new Response(JSON.stringify(err.message));
  }
};
