import { client } from "../../../../databases/sqlite/client";

export const GET = async () => {
  const get_table_names = `
  CREATE TABLE IF NOT EXISTS prueba (
    id INTEGER PRIMARY KEY,
    nombre TEXT,
    email TEXT
);

CREATE TRIGGER IF NOT EXISTS insertar_prueba_trigger
AFTER INSERT ON prueba
BEGIN
   
    SELECT 'prueba insertado: ' || new.nombre || ' - ' || new.email;
END;

INSERT INTO prueba (nombre, email) VALUES ('Ejemplo', 'ejemplo@example.com');
  `;

  try {
    const rows = await client.query(get_table_names);
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
