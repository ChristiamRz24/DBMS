import { client } from "../../../../databases/mariadb/client";

export const POST = async ({ request }) => {
  const data = await request.formData();

  const name = data.get("name");
  const password = data.get("passwd");
  const role = data.get("role");

  // Verificar si el usuario ya fue creado en la base de datos
  const userExists = `SELECT * FROM mysql.user WHERE User = '${name}';`;
  const rows = await client.query(userExists);

  if (rows.length > 0) {
    return new Response(JSON.stringify({ message: "already exists" }), {
      status: 400,
    });
  }


  const createUser = `CREATE USER '${name}'@'localhost' IDENTIFIED BY '${password}';`;
  const grantPrivileges = `GRANT ${role} ON mariadb.* TO '${name}'@'localhost';`;
  const flushPrivileges = `FLUSH PRIVILEGES;`;
  
  try {
    await client.query(createUser);
    await client.query(grantPrivileges);
    await client.query(flushPrivileges);
    return new Response(JSON.stringify({ message: "created" }));
  } catch (err) {
    return new Response(JSON.stringify(err.message));
  }

};
