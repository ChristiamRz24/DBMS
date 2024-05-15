import { client } from "../../../../databases/sqlserver/client";

export const GET = async () => {
  const get_table_names = `
  USE master;
  ALTER DATABASE [mudanza] SET SINGLE_USER WITH ROLLBACK IMMEDIATE;
  RESTORE DATABASE [mudanza] FROM DISK = 'D:\Gestion db' WITH REPLACE;
  ALTER DATABASE [mudanza] SET MULTI_USER;
  `;

  try {
    const rows = await client.query(get_table_names);
    return new Response(JSON.stringify(rows));
  } catch (err) {
    return new Response(JSON.stringify(err.message));
  }
};