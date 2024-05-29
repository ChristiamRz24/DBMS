import { pool } from "./config";

const client = {
  query: async (query) => {
    const conn = await pool.connect();

    try {
      const { rows } = await conn.query(query);
      return rows;
    } catch (error) {
      console.error(error);
      throw error; // Throw the error to be caught by the caller
    } finally {
      conn.release();
    }
  },
};

export { client };
