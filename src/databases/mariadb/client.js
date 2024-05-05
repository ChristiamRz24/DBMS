import { pool } from "./config";

const getConnection = async () => {
  try {
    return await pool.getConnection();
  } catch (err) {
    console.error(err);
  }
};

const client = await getConnection();

export { client };
