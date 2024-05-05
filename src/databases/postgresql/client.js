import { pool } from "./config";

const client = {
  query: async (query) => {
    const conn = await pool.connect();

    try {
      const { rows } = await conn.query(query);
      return rows;
    } catch (error) {
      console.error(error);
    } finally {
      conn.release();
    }
  },
};

export { client };
