import { client } from "../../../../databases/sqlite/client";

export const GET = async () => {
  const query = "SELECT name FROM sqlite_master WHERE type='table';";

  try {
    const rows = await client.query(query);
    const newRows = processRows(rows);
    return new Response(JSON.stringify(newRows));
  } catch (err) {
    return new Response(JSON.stringify(err.message));
  }
};

/**
 * Esta función se encarga de transformar la respuesta de SQLite, que tiene el formato
 * [{ name: 'X_TABLE' }], a un formato consistente con las respuestas de otras bases de datos
 * soportadas en esta aplicación, que es [{ table_name: 'x_table' }].
 *
 * @param {*} rows - Las filas de la respuesta de SQLite.
 * @returns {rows: { table_name: string }[]} - Las filas transformadas.
 */
function processRows(rows) {
  rows.forEach((row) => {
    row.table_name = row.name.toLowerCase();
    delete row.name;
  });
  return rows;
}
