import { pool } from "./config";
import { processRows } from "../utils/processRows";

const getConnection = () => {
  return new Promise((resolve, reject) => {
    pool.getConnection((err, connection) => {
      if (err) reject(err);
      resolve(connection);
    });
  });
};

const client = {
  query: (sql, values) => {
    return new Promise(async (resolve, reject) => {
      const connection = await getConnection();
      connection.query(sql, values, (err, rows) => {
        connection.release();
        if (err) reject(err);
        resolve(processRows(rows));
      });
    });
  },
};

export { client };
