import { createPool } from "mysql2";

const pool = createPool({
  host: import.meta.env.MYSQL_HOST,
  port: import.meta.env.MYSQL_PORT,
  user: import.meta.env.MYSQL_USER,
  password: import.meta.env.MYSQL_PASSWORD,
  database: import.meta.env.MYSQL_DATABASE,
});

export { pool };
