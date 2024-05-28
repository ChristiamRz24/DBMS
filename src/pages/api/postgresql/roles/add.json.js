import { client } from "../../../../databases/postgresql/client";

export const POST = async ({ request }) => {
  const data = await request.formData();

  const name = data.get("name");
  const permissions = data.get("permissions");
  // permissions --> read | crud

  // Verificar si el rol ya fue creado en la base de datos
  const roleExists = `SELECT 1 FROM pg_roles WHERE rolname = '${name}';`;
  const rows = await client.query(roleExists);

  if (rows.length > 0) {
    return new Response(JSON.stringify({ message: "Role already exists" }), {
      status: 400,
    });
  }

  const createRole = `CREATE ROLE ${name};`;

  const setReadOnly = `
    GRANT CONNECT ON DATABASE mudanzas TO ${name};
    GRANT USAGE ON SCHEMA public TO ${name};
    GRANT SELECT ON ALL TABLES IN SCHEMA public TO ${name}; 
  `;

  const setBasicPermissions = `
    GRANT CONNECT ON DATABASE mudanzas TO ${name};
    GRANT USAGE ON SCHEMA public TO ${name};
    GRANT ALL PRIVILEGES ON ALL TABLES IN SCHEMA public TO ${name};  
  `;

  let query = createRole;
  if (permissions === "read") query += setReadOnly;
  if (permissions === "crud") query += setBasicPermissions;

  try {
    await client.query(query);
    return new Response(JSON.stringify({ message: "Role created" }));
  } catch (err) {
    return new Response(JSON.stringify(err.message));
  }
};
