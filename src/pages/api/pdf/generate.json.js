import { PDFDocument, rgb, StandardFonts } from "pdf-lib";
import fs from "fs/promises";
import path from "path";

const fileDir = path.join(process.cwd(), "public", "files");

export const POST = async ({ request }) => {
  try {
    const data = await request.formData();
    const html = data.get("html");
    const query = data.get("query");

    if (!html || !query) {
      return new Response(
        JSON.stringify({ error: "No HTML content or query provided" }),
        {
          status: 400,
          headers: { "Content-Type": "application/json" },
        },
      );
    }

    // Extraer datos de la tabla HTML y generar el PDF
    const tableData = extractTableData(html);
    const fileName = await createPdf(tableData, query);

    return new Response(JSON.stringify({ fileName }), {
      headers: { "Content-Type": "application/json" },
    });
  } catch (error) {
    console.error("Error processing request:", error);
    return new Response(JSON.stringify({ error: "Failed to generate PDF" }), {
      status: 500,
      headers: { "Content-Type": "application/json" },
    });
  }
};

// Función para extraer contenido de la tabla HTML
function extractTableData(html) {
  const rows = html.match(/<tr>(.*?)<\/tr>/g) || [];
  return rows.map((row) => {
    const cells = row.match(/<t[hd]>(.*?)<\/t[hd]>/g) || [];
    return cells.map((cell) => cell.replace(/<\/?t[hd]>/g, ""));
  });
}

// Función para crear un PDF a partir de los datos de la tabla
async function createPdf(tableData, query) {
  const pdfDoc = await PDFDocument.create();
  const page = pdfDoc.addPage([600, 800]);
  const { width, height } = page.getSize();
  const fontSize = 12;
  const cellPadding = 5;
  const margin = 50;
  const titleFontSize = 18;
  const queryFontSize = 10;
  const dateFontSize = 10;
  const pageNumberFontSize = 10;
  const yPosStart = height - margin;

  const timesRomanFont = await pdfDoc.embedFont(StandardFonts.TimesRoman);
  const timesRomanBoldFont = await pdfDoc.embedFont(
    StandardFonts.TimesRomanBold,
  );

  // Título
  page.drawText("REPORTE DE CONSULTA", {
    x: margin,
    y: yPosStart,
    size: titleFontSize,
    font: timesRomanBoldFont,
    color: rgb(0, 0, 0),
  });

  // Consulta SQL
  const queryYPos = yPosStart - titleFontSize - 10;
  page.drawText(`Consulta: ${query}`, {
    x: margin,
    y: queryYPos,
    size: queryFontSize,
    font: timesRomanFont,
    color: rgb(0, 0, 0),
  });

  // Hora de generación
  const dateYPos = queryYPos - queryFontSize - 10;
  const generationDate = new Date().toLocaleString();
  page.drawText(`Generado el: ${generationDate}`, {
    x: margin,
    y: dateYPos,
    size: dateFontSize,
    font: timesRomanFont,
    color: rgb(0, 0, 0),
  });

  // Posición inicial para la tabla
  let yPos = dateYPos - dateFontSize - 20;

  // Dibujar los datos de la tabla en el PDF
  tableData.forEach((row, rowIndex) => {
    let xPos = margin;
    row.forEach((cell, cellIndex) => {
      page.drawText(cell, {
        x: xPos,
        y: yPos,
        size: fontSize,
        font: rowIndex === 0 ? timesRomanBoldFont : timesRomanFont, // Negritas para la primera fila (encabezado)
        color: rgb(0, 0, 0),
      });
      xPos += 150; // Ajustar el ancho de las columnas según sea necesario
    });
    yPos -= fontSize + cellPadding;
    if (yPos < margin) {
      // Añadir nueva página si se ha alcanzado el final de la página actual
      page = pdfDoc.addPage([600, 800]);
      yPos = height - margin;
    }
  });

  // Número de página
  const pages = pdfDoc.getPages();
  pages.forEach((page, idx) => {
    page.drawText(`Página ${idx + 1} de ${pages.length}`, {
      x: width - margin - 50,
      y: margin / 2,
      size: pageNumberFontSize,
      font: timesRomanFont,
      color: rgb(0, 0, 0),
    });
  });

  // Guardar el PDF en la carpeta public/files
  const pdfBytes = await pdfDoc.save();
  const fileName = `reporte_${Date.now()}.pdf`;
  const filePath = path.join(fileDir, fileName);

  try {
    await fs.writeFile(filePath, pdfBytes);
    console.log("¡Reporte PDF generado correctamente!");
    return fileName;
  } catch (err) {
    console.error("Error al generar el PDF:", err);
    throw new Error("Failed to save PDF");
  }
}
