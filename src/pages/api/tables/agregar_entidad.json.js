import { client } from "../../../../databases/sqlserver/client";

export const GET = async () => {
  const get_table_names = `
  CREATE TABLE  PAGO(
    IDPAGO INT PRIMARY KEY,
    IDMUDANZA VARCHAR(50),
    METODO_PAGO VARCHAR(50),
    MONTO_PAGO VARCHAR(100),
    FECHA_PAGO VARCHAR(20)
);
  `;

  try {
    const rows = await client.query(get_table_names);
    return new Response(JSON.stringify(rows));
  } catch (err) {
    return new Response(JSON.stringify(err.message));
  }
};
