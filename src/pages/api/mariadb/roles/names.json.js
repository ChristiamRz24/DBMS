import { client } from "../../../../databases/mariadb/client";

export const GET = async () => {
  const query = `
  SELECT COLUMN_NAME as rolname, IS_NULLABLE 
  FROM information_schema.COLUMNS 
  WHERE TABLE_SCHEMA = 'mysql' 
  AND TABLE_NAME = 'user';`;

  try {
    const rows = await client.query(query);
    const newrows = procesarfilas(rows)
    return new Response(JSON.stringify(newrows));
  } catch (err) {
    return new Response(JSON.stringify(err.message));
  }
};

function procesarfilas(rows) {
  // Filtrar los objetos que contienen '_priv' en el rolname
  const rolesPriv = rows.filter(row => row.rolname.includes('_priv')).slice(0, 10);

  // Eliminar '_priv' de cada rolname
  const nuevosRoles = rolesPriv.map(row => ({ rolname: row.rolname.replace('_priv', '').toUpperCase(), IS_NULLABLE: row.IS_NULLABLE }));

  // Retornar los nuevos roles
  return nuevosRoles;
}