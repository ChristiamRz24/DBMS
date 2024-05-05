function getConnectionString({ database, server, trustedConnection, driver }) {
  return `
    Server=${server};
    Database=${database};
    Trusted_Connection=${trustedConnection};
    Driver=${driver}
  `;
}

const connectionString = getConnectionString({
  server: "PC\\SQLEXPRESS",
  database: "mudanzas",
  trustedConnection: "yes",
  driver: "{ODBC Driver 17 for SQL Server}",
});

export { connectionString };
