import { client } from "../../../../databases/mariadb/client";

export const GET = async () => {
  const get_table_names = `
    SELECT table_name
    FROM information_schema.tables
    WHERE table_schema = '${import.meta.env.MARIADB_DATABASE}';
  `; // otra forma de hacerlo: "show tables"

  try {
    const rows = await client.query(get_table_names);
    return new Response(JSON.stringify(rows));
  } catch (err) {
    new Response(JSON.stringify(err.message));
  } finally {
    if (client) await client.release();
  }
};
