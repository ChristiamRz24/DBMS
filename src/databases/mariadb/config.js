import { createPool } from "mariadb";

const pool = createPool({
  host: import.meta.env.MARIADB_HOST,
  port: import.meta.env.MARIADB_PORT,
  user: import.meta.env.MARIADB_USER,
  password: import.meta.env.MARIADB_PASSWORD,
  database: import.meta.env.MARIADB_DATABASE,
});

export { pool };
