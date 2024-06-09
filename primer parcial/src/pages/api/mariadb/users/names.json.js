import { client } from "../../../../databases/mariadb/client";

export const GET = async () => {
  const query = `
    SELECT *
    FROM mysql.db
    WHERE Db = 'mariadb';
  `;

  try {
    const rows = await client.query(query);
    const processedRows = procesarFilas(rows);
    return new Response(JSON.stringify(processedRows));
  } catch (err) {
    return new Response(JSON.stringify(err.message));
  }
};

function procesarFilas(rows) {
  return rows.map(row => ({
    usename: row.User,
    role: Object.keys(row).filter(key => key.endsWith('_priv') && row[key] === 'Y')[0].slice(0, -5).toUpperCase()
  }));
}
