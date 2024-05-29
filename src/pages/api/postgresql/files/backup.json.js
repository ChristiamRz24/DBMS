import { exec } from "child_process";
import path from "path";
import fs from "fs/promises";

// Definir el directorio de respaldo
const backupDir = path.join(process.cwd(), "public", "files");

// Variables de entorno para la conexión a PostgreSQL
const user = import.meta.env.PG_USER;
const host = import.meta.env.PG_HOST;
const database = import.meta.env.PG_DATABASE;
const password = import.meta.env.PG_PASSWORD;

// Función para generar el respaldo de la base de datos
const generateBackup = (fullFilePath) => {
  return new Promise((resolve, reject) => {
    const pgDumpCmd = `pg_dump -U ${user} -h ${host} -F c -b -v -f "${fullFilePath}" ${database}`;

    exec(
      pgDumpCmd,
      { env: { PGPASSWORD: password } },
      (error, stdout, stderr) => {
        if (error) {
          console.error("Error:", error);
          reject(error);
        } else {
          console.log("stdout:", stdout);
          console.error("stderr:", stderr);
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

    const backupFile = await generateBackup(fullFilePath);
    const stats = await fs.stat(backupFile);

    return new Response(await fs.readFile(backupFile), {
      headers: {
        "Content-Disposition": `attachment; filename="${fileName}"`,
        "Content-Length": stats.size,
        "Content-Type": "application/octet-stream",
      },
    });
  } catch (error) {
    console.error("Error:", error);
    return new Response(JSON.stringify({ error: error.message }), {
      status: 500,
    });
  }
};
