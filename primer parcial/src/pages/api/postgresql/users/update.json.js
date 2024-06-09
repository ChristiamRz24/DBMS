import { client } from "../../../../databases/postgresql/client";

export const PUT = async ({ request }) => {
  const data = await request.formData();

  const oldName = data.get("oldName");
  const newName = data.get("newName");
  const oldRole = data.get("oldRole");
  const newRole = data.get("newRole");
  const password = data.get("passwd");

  // si newRole es diferente a null y oldRole es diferente a null
  if (oldRole !== null) {
    const revoke = `REVOKE ${oldRole} FROM ${oldName};`;
    await client.query(revoke);
  }

  if (newRole !== null) {
    const grant = `GRANT ${newRole} TO ${oldName};`;
    await client.query(grant);
  }

  // verificar si newName es diferente a oldName o si newName es diferente a null
  if (newName !== oldName && newName !== null) {
    // ALTER USER oldName RENAME TO newName;
    const rename = `ALTER USER ${oldName} RENAME TO ${newName};`;
    await client.query(rename);
  }

  // actualizar la contraseña del usuario
  if (password !== null) {
    // ALTER USER newName WITH PASSWORD 'password';
    const passwd = `ALTER USER ${newName} WITH PASSWORD '${password}';`;
    await client.query(passwd);
  }

  // verificar si existe un usuario con el nombre newName y que pertenezca al grupo/rol newRole
  if (newRole !== null) {
    const user = await client.query(`
      SELECT usename
      FROM pg_user WHERE usename = '${newName}'
      AND usesysid
      IN (
        SELECT usesysid
        FROM pg_authid
        WHERE rolname = '${newRole}'
      );
    `);

    if (user.length === 0) {
      return new Response(JSON.stringify({ message: "error" }));
    } else {
      return new Response(JSON.stringify({ message: "updated" }));
    }
  }
};
