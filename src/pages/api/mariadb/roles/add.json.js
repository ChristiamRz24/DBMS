import { client } from "../../../../databases/mariadb/client";

export const POST = async ({ request }) => {
  const data = await request.formData();

  const name = data.get("name");
  const permissions = data.get("permissions");
  // permissions --> read | crud

  // Verificar si el rol ya fue creado en la base de datos
  const roleExists = `SELECT * 
  FROM mysql.user 
  WHERE user = '${name}';`;

  const rows = await client.query(roleExists);

  if (rows.length > 0) {
    return new Response(JSON.stringify({ message: "already exists" }), {
      status: 400,
    });
  }

  const createRole = `
  GRANT SELECT ON mariadb.* TO 'chepita'@'localhost';
  FLUSH PRIVILEGES;

  CREATE ROLE ${name};`;

  try {
    await client.query(createRole);
    return new Response(JSON.stringify({ message: "created" }));
  } catch (err) {
    return new Response(JSON.stringify(err.message));
  }
};
