import path from "path";
import fs from "fs/promises";

import { exec } from "child_process";

// Definir el directorio de respaldo
const backupDir = path.join(process.cwd(), "public", "files");

// Variables de entorno para la conexión a PostgreSQL
const user = import.meta.env.MARIADB_USER;
const host = import.meta.env.MARIADB_HOST;
const database = import.meta.env.MARIADB_DATABASE;
const password = import.meta.env.MARIADB_PASSWORD;

// Función para generar el respaldo de la base de datos
const generateBackup = (fullFilePath) => {
  return new Promise((resolve, reject) => {
    const DumpCmd = `mysqldump -u ${user} -p${password} ${database} > ${fullFilePath}`;

    exec(
      DumpCmd,
      { env: { MARIADB_PASSWORD: password } },
      (error, stdout, stderr) => {
        if (error) {
          console.error("Error:", error);
          reject(error);
        } else {
          if (stdout) console.log("stdout:", stdout);
          if (stderr) console.log("stderr:", stderr);
          resolve(fullFilePath);
        }
      },
    );
  });
};

// Ruta para generar y descargar el respaldo
export const GET = async () => {
  try {
    const date = new Date().toISOString().slice(0, 10);
    const fileName = `${database}-backup-${date}.sql`;
    const fullFilePath = path.join(backupDir, fileName);

    await generateBackup(fullFilePath); // Generar el respaldo

    // Devolver solo el nombre del archivo de respaldo
    return new Response(JSON.stringify({ fileName }), {
      headers: { "Content-Type": "application/json" },
    });
  } catch (error) {
    console.error("Error:", error);
    return new Response(JSON.stringify({ error: error.message }), {
      status: 500,
      headers: { "Content-Type": "application/json" },
    });
  }
};
