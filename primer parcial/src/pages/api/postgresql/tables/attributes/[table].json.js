import { client } from "../../../../../databases/postgresql/client";

export const GET = async ({ params }) => {
  const table = params.table;

  const query = `
    SELECT column_name as name, data_type as type, is_nullable as optional
    FROM information_schema.columns
    WHERE table_name = '${table}'
  `;

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
      ...row,
      optional: row.optional === "YES",
    };
  });
}
