import sql from "msnodesqlv8";
import { connectionString } from "./config";
import { processRows } from "../utils/processRows";

const client = {
  query: async (query) => {
    try {
      const data = await new Promise((resolve, reject) => {
        sql.query(connectionString, query, (err, rows) => {
          if (err) reject(err);
          else resolve(processRows(rows));
        });
      });
      return data;
    } catch (error) {
      console.error(error);
    }
  },
};

export { client };
