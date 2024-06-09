import os from "os";
import path from "path";
import fs from "fs/promises";

import { exec } from "child_process";

// Variables de entorno para la conexión a PostgreSQL
const user = import.meta.env.PG_USER;
const host = import.meta.env.PG_HOST;
const database = import.meta.env.PG_DATABASE;
const password = import.meta.env.PG_PASSWORD;

// Función para restaurar la base de datos desde un archivo de respaldo
const restoreDatabase = async (backupFile) => {
  // Convertir el Blob a ArrayBuffer
  const arrayBuffer = await backupFile.arrayBuffer();
  // Crear un Buffer a partir del ArrayBuffer
  const buffer = Buffer.from(arrayBuffer);

  // Escribir el contenido del archivo en un archivo temporal
  const tempFilePath = path.join(os.tmpdir(), "backup.sql");
  await fs.writeFile(tempFilePath, buffer);

  // Comando psql para restaurar la base de datos desde el archivo temporal
  const psqlCmd = `pg_restore -U ${user} -h ${host} -d ${database} "${tempFilePath}"`;

  return new Promise((resolve, reject) => {
    exec(
      psqlCmd,
      { env: { PGPASSWORD: password } },
      (error, stdout, stderr) => {
        if (error) {
          console.error("Error:", error);
          reject(error);
        } else {
          if (stdout) console.log("stdout:", stdout);
          if (stderr) console.log("stderr:", stderr);
          resolve();
        }
      },
    );
  });
};

// Ruta para restaurar la base de datos desde un respaldo
export const POST = async ({ request }) => {
  try {
    const backupFile = await request.blob();
    console.log("backupFile:", backupFile);

    // Restaurar la base de datos desde el archivo de respaldo
    await restoreDatabase(backupFile);

    return new Response(JSON.stringify({ success: true }), {
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
