/**
 * Procesa un array y convierte las claves y los valores a minúsculas.
 * @param {Array} rows - El array a procesar.
 * @returns {Array} - El array procesadas con claves y valores en minúsculas.
 */
export function processRows(rows) {
  return rows.map((row) => {
    const key = Object.keys(row)[0];
    const newKey = key.toLowerCase();
    const newValue = row[key].toLowerCase();
    return { [newKey]: newValue };
  });
}
