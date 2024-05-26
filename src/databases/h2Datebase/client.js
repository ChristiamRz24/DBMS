import { db } from "./config";

const client = db;

client.query = (sql, params) => {
  return new Promise((resolve, reject) => {
    client.all(sql, params, (err, rows) => {
      if (err) reject(err);
      resolve(rows);
    });
  });
};

export { client };
