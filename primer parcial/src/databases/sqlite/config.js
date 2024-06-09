import path from "path";
import sqlite3 from "sqlite3";

const filename = import.meta.env.SQLITE_DATABASE || "mudanzas.db";
const __dirname = path.resolve(path.dirname("")); // current directory

/**
 * Es necesario utilizar path.join() para evitar problemas de localización del archivo (mudanzas.db)
 * cuando se inicia sqlite3.Database con una ruta relativa, debido a posibles discrepancias
 * en el directorio de trabajo actual del proceso.
 */
const filepath = path.join(__dirname, "src", "databases", "sqlite", filename);

const db = new sqlite3.Database(filepath, (err) => {
  if (err) console.error(err.message);
  // console.log("Connected to the SQLite database");
});

export { db };
