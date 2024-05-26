import { client } from "../../../../../databases/sqlite/client";

export const GET = async ({ params }) => {
  const table = params.table;
  const query = `PRAGMA table_info(${table});`;

  try {
    const rows = await client.query(query);
    const newRows = processRows(rows);
    return new Response(JSON.stringify(newRows));
  } catch (err) {
    return new Response(JSON.stringify(err.message));
  }
};

/**
 * Procesa las filas consultadas al siguiente formato: { name: string, type: string, optional: boolean }
 *
 * @param {Array} rows - Las filas retornadas por la consulta
 * @returns {Array} - Un array con el formato [{ name, type, optional }, { ... }]
 */
const processRows = (rows) => {
  return rows.map((row) => {
    return {
      name: row.name.toLowerCase(),
      type: row.type.toLowerCase().replace(/\(.*\)/, ""),
      optional: row.notnull === 0,
    };
  });
};
