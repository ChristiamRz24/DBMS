import { client } from "../../../../../databases/mariadb/client";

export const GET = async ({ params }) => {
  const table = params.table;

  const query = `DESCRIBE ${table};`;
  try {
    const rows = await client.query(query);
    const newRows = processRow(rows);
    return new Response(JSON.stringify(newRows));
  } catch (err) {
    new Response(JSON.stringify(err.message));
  }
};

/**
 * Processes the rows and converts the "optional" field from "NO" to false and "YES" to true.
 * @param {Array} rows - The rows to be processed.
 * @returns {Array} - The processed rows with the "optional" field converted.
 */
function processRow(rows) {
  return rows.map((row) => {
    return {
      name : row.Field,
      type : row.Type,
      optional: row.Null === "SI"
    };
  });
}
