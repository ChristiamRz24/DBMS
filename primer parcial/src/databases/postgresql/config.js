import pkg from "pg";
const { Pool } = pkg;

const pool = new Pool({
  host: import.meta.env.PG_HOST,
  port: import.meta.env.PG_PORT,
  user: import.meta.env.PG_USER,
  password: import.meta.env.PG_PASSWORD,
  database: import.meta.env.PG_DATABASE,
});

export { pool };
