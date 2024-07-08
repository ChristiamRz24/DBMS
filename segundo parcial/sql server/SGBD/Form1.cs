using System;
using System.Data;
using System.Data.SqlClient;
using System.Windows.Forms;
using iTextSharp.text;
using iTextSharp.text.pdf;
using System.IO;
using System.Text;
using System.Collections.Generic;
namespace SGBD_Automation
{
    public partial class Form1 : Form
    {
        private string connectionString = "Server=LENOVO-FAUBLA\\FAUBLA2022;Database=mudanzas;User Id=sa;Password=123456;";

        public Form1()
        {
            InitializeComponent();
            InsertTestData();
        }

        private void btnListarTablas_Click(object sender, EventArgs e)
        {
            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                try
                {
                    connection.Open();
                    SqlCommand command = new SqlCommand("SELECT TABLE_NAME FROM INFORMATION_SCHEMA.TABLES", connection);
                    SqlDataAdapter adapter = new SqlDataAdapter(command);
                    DataTable dataTable = new DataTable();
                    adapter.Fill(dataTable);
                    dataGridView1.DataSource = dataTable;
                }
                catch (Exception ex)
                {
                    MessageBox.Show("Error: " + ex.Message);
                }
            }
        }

        private void btnAgregarUsuario_Click(object sender, EventArgs e)
        {
            string nombreUsuario = txtNombreUsuario.Text;
            if (string.IsNullOrEmpty(nombreUsuario))
            {
                MessageBox.Show("Ingrese un nombre de usuario.");
                return;
            }

            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                try
                {
                    connection.Open();

                    // Crear el inicio de sesión en el servidor
                    SqlCommand createLoginCommand = new SqlCommand($"CREATE LOGIN {nombreUsuario} WITH PASSWORD = 'tu_contraseña_aquí';", connection);
                    createLoginCommand.ExecuteNonQuery();

                    // Crear el usuario en la base de datos
                    SqlCommand createUserCommand = new SqlCommand($"CREATE USER {nombreUsuario} FOR LOGIN {nombreUsuario};", connection);
                    createUserCommand.ExecuteNonQuery();

                    MessageBox.Show("Usuario agregado exitosamente.");
                }
                catch (Exception ex)
                {
                    MessageBox.Show("Error: " + ex.Message);
                }
            }
        }

        private void btnModificarUsuario_Click(object sender, EventArgs e)
        {
            string nombreUsuario = txtNombreUsuario.Text;
            string nuevoUsuario = txtNuevoUsuario.Text;
            //string nuevaContraseña = txtNuevaContraseña.Text;
           // if (string.IsNullOrEmpty(nombreUsuario) || string.IsNullOrEmpty(nuevaContraseña))
                if (string.IsNullOrEmpty(nombreUsuario))
            {
                MessageBox.Show("Ingrese un nombre de usuario y una nueva contraseña.");
                return;
            }

            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                try
                {
                    connection.Open();
                    SqlCommand command = new SqlCommand($"ALTER USER {nombreUsuario} WITH NAME = {nuevoUsuario};", connection);
                    command.ExecuteNonQuery();
                   /* SqlCommand change = new SqlCommand($"ALTER LOGIN {nuevoUsuario} WITH PASSWORD = '{nuevaContraseña}';", connection);
                    change.ExecuteNonQuery();*/
                    MessageBox.Show("Usuario modificado exitosamente.");
                }
                catch (Exception ex)
                {
                    MessageBox.Show("Error: " + ex.Message);
                }
            }
        }

        private void btnEliminarUsuario_Click(object sender, EventArgs e)
        {
            string nombreUsuario = txtNombreUsuario.Text;
            if (string.IsNullOrEmpty(nombreUsuario))
            {
                MessageBox.Show("Ingrese un nombre de usuario.");
                return;
            }

            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                try
                {
                    connection.Open();
                    SqlCommand deleteUserCommand = new SqlCommand($"DROP USER {nombreUsuario};", connection);
                    deleteUserCommand.ExecuteNonQuery();

                    SqlCommand deleteLoginCommand = new SqlCommand($"DROP LOGIN {nombreUsuario};", connection);
                    deleteLoginCommand.ExecuteNonQuery();

                    MessageBox.Show("Usuario eliminado exitosamente.");
                }
                catch (Exception ex)
                {
                    MessageBox.Show("Error: " + ex.Message);
                }
            }
        }

        private void btnCrearRol_Click(object sender, EventArgs e)
        {
            string nombreRol = txtNombreRol.Text;
            if (string.IsNullOrEmpty(nombreRol))
            {
                MessageBox.Show("Ingrese un nombre de rol.");
                return;
            }

            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                try
                {
                    connection.Open();
                    SqlCommand command = new SqlCommand($"CREATE ROLE {nombreRol};", connection);
                    command.ExecuteNonQuery();
                    MessageBox.Show("Rol creado exitosamente.");
                }
                catch (Exception ex)
                {
                    MessageBox.Show("Error: " + ex.Message);
                }
            }
        }

        private void btnAsignarRol_Click(object sender, EventArgs e)
        {
            string nombreUsuario = txtUsuarioRol.Text;
            string nombreRol = txtRolAsignar.Text;
            if (string.IsNullOrEmpty(nombreUsuario) || string.IsNullOrEmpty(nombreRol))
            {
                MessageBox.Show("Ingrese un nombre de usuario y un nombre de rol.");
                return;
            }

            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                try
                {
                    connection.Open();
                    SqlCommand command = new SqlCommand($"ALTER ROLE {nombreRol} ADD MEMBER {nombreUsuario};", connection);
                    command.ExecuteNonQuery();
                    MessageBox.Show("Rol asignado al usuario exitosamente.");
                }
                catch (Exception ex)
                {
                    MessageBox.Show("Error: " + ex.Message);
                }
            }
        }

        private void btnConsultarUsuarios_Click(object sender, EventArgs e)
        {
            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                try
                {
                    connection.Open();
                    string query = @"
                SELECT 
                    dp.name AS Usuario,
                    r.name AS Rol
                FROM 
                    sys.database_principals dp
                LEFT JOIN 
                    sys.database_role_members drm ON dp.principal_id = drm.member_principal_id
                LEFT JOIN 
                    sys.database_principals r ON drm.role_principal_id = r.principal_id
                WHERE 
                    dp.type = 'S' AND dp.principal_id > 4;";

                    SqlCommand command = new SqlCommand(query, connection);
                    SqlDataAdapter adapter = new SqlDataAdapter(command);
                    DataTable dataTable = new DataTable();
                    adapter.Fill(dataTable);
                    dataGridView1.DataSource = dataTable;
                }
                catch (Exception ex)
                {
                    MessageBox.Show("Error: " + ex.Message);
                }
            }
        }


        private void btnConsultarRoles_Click(object sender, EventArgs e)
        {
            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                try
                {
                    connection.Open();
                    SqlCommand command = new SqlCommand("SELECT name FROM sys.database_principals WHERE type = 'R';", connection);
                    SqlDataAdapter adapter = new SqlDataAdapter(command);
                    DataTable dataTable = new DataTable();
                    adapter.Fill(dataTable);
                    dataGridView1.DataSource = dataTable;
                }
                catch (Exception ex)
                {
                    MessageBox.Show("Error: " + ex.Message);
                }
            }
        }
        private void btnRespaldar_Click(object sender, EventArgs e)
        {
            RespaldarBaseDatos();
        }

        private void btnRestaurar_Click(object sender, EventArgs e)
        {
            RestaurarBaseDatos();
        }

        private void RespaldarBaseDatos()
        {
            SaveFileDialog saveFileDialog1 = new SaveFileDialog();
            saveFileDialog1.Filter = "Archivos de respaldo de base de datos (*.bak)|*.bak";
            saveFileDialog1.Title = "Guardar respaldo de base de datos";

            if (saveFileDialog1.ShowDialog() == DialogResult.OK)
            {
                try
                {
                    using (SqlConnection connection = new SqlConnection(connectionString))
                    {
                        connection.Open();
                        string query = $"BACKUP DATABASE mudanzas TO DISK = '{saveFileDialog1.FileName}'";
                        SqlCommand command = new SqlCommand(query, connection);
                        command.ExecuteNonQuery();
                        MessageBox.Show("Base de datos respaldada correctamente.");
                    }
                }
                catch (Exception ex)
                {
                    MessageBox.Show("Error al respaldar la base de datos: " + ex.Message);
                }
            }
        }

        private void RestaurarBaseDatos()
        {
            OpenFileDialog openFileDialog1 = new OpenFileDialog
            {
                Filter = "Archivos de respaldo de base de datos (*.bak)|*.bak",
                Title = "Seleccionar archivo de respaldo de base de datos"
            };

            if (openFileDialog1.ShowDialog() == DialogResult.OK)
            {
                string backupPath = openFileDialog1.FileName;
                string databaseName = "mudanzas"; // Puedes cambiar esto o hacerlo dinámico

                // Conexión a la base de datos master
                string connectionStringMaster = "Server=LENOVO-FAUBLA\\FAUBLA2022;Database=master;User Id=sa;Password=123456;";

                try
                {
                    using (SqlConnection connection = new SqlConnection(connectionStringMaster))
                    {
                        connection.Open();

                        // Verificar si la base de datos existe
                        string checkDbExistsQuery = $"SELECT database_id FROM sys.databases WHERE Name = '{databaseName}';";
                        SqlCommand checkDbExistsCommand = new SqlCommand(checkDbExistsQuery, connection);
                        object result = checkDbExistsCommand.ExecuteScalar();

                        if (result != null) // La base de datos existe
                        {
                            // Comando para poner la base de datos en modo SINGLE_USER
                            string setSingleUserQuery = $"ALTER DATABASE {databaseName} SET SINGLE_USER WITH ROLLBACK IMMEDIATE;";
                            SqlCommand setSingleUserCommand = new SqlCommand(setSingleUserQuery, connection);
                            setSingleUserCommand.ExecuteNonQuery();
                        }

                        // Comando para restaurar la base de datos desde el archivo de respaldo
                        string restoreQuery = $"RESTORE DATABASE {databaseName} FROM DISK = '{backupPath}' WITH REPLACE;";
                        SqlCommand restoreCommand = new SqlCommand(restoreQuery, connection);
                        restoreCommand.ExecuteNonQuery();

                        // Comando para volver a establecer la base de datos en modo MULTI_USER
                        string setMultiUserQuery = $"ALTER DATABASE {databaseName} SET MULTI_USER;";
                        SqlCommand setMultiUserCommand = new SqlCommand(setMultiUserQuery, connection);
                        setMultiUserCommand.ExecuteNonQuery();

                        MessageBox.Show("Base de datos restaurada correctamente.");
                    }
                }
                catch (Exception ex)
                {
                    MessageBox.Show("Error al restaurar la base de datos: " + ex.Message);
                }
            }
        }

        private void btnListarAtributos_Click(object sender, EventArgs e)
        {
            string nombreEntidad = txtDetalleEntidad.Text; // Obtener el nombre de la entidad desde el control TextBox
            ListarAtributosPorEntidad(nombreEntidad);
        }

        private void ListarAtributosPorEntidad(string nombreEntidad)
        {
            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                try
                {
                    connection.Open();

                    // Paso 1: Obtener los nombres de las columnas
                    string queryColumnNames = @"SELECT COLUMN_NAME
                                        FROM INFORMATION_SCHEMA.COLUMNS
                                        WHERE TABLE_NAME = @TableName AND TABLE_CATALOG = 'mudanzas';";

                    SqlCommand commandColumnNames = new SqlCommand(queryColumnNames, connection);
                    commandColumnNames.Parameters.AddWithValue("@TableName", nombreEntidad);
                    SqlDataAdapter adapterColumnNames = new SqlDataAdapter(commandColumnNames);
                    DataTable columnNamesTable = new DataTable();
                    adapterColumnNames.Fill(columnNamesTable);

                    // Construir la lista de nombres de columnas
                    List<string> columnNames = new List<string>();
                    foreach (DataRow row in columnNamesTable.Rows)
                    {
                        columnNames.Add(row["COLUMN_NAME"].ToString());
                    }

                    // Unir los nombres de las columnas con comas
                    string columnList = string.Join(", ", columnNames);

                    // Paso 2: Generar y ejecutar la consulta dinámica para seleccionar los datos
                    string querySelectData = $"SELECT {columnList} FROM {nombreEntidad};";

                    SqlCommand commandSelectData = new SqlCommand(querySelectData, connection);
                    SqlDataAdapter adapterSelectData = new SqlDataAdapter(commandSelectData);
                    DataTable dataTable = new DataTable();
                    adapterSelectData.Fill(dataTable);
                    dataGridView1.DataSource = dataTable;
                }
                catch (Exception ex)
                {
                    MessageBox.Show("Error al listar atributos: " + ex.Message);
                }
            }
        }




        private void btnGenerarReporte_Click(object sender, EventArgs e)
        {
            try
            {
                DataTable dataTable = (DataTable)dataGridView1.DataSource;

                if (dataTable == null || dataTable.Rows.Count == 0)
                {
                    MessageBox.Show("No hay datos para generar el reporte.");
                    return;
                }

                SaveFileDialog saveFileDialog = new SaveFileDialog();
                saveFileDialog.Filter = "PDF Files|*.pdf";
                saveFileDialog.Title = "Guardar reporte como PDF";
                saveFileDialog.ShowDialog();

                if (saveFileDialog.FileName != "")
                {
                    using (FileStream fs = new FileStream(saveFileDialog.FileName, FileMode.Create))
                    {
                        Document document = new Document(PageSize.A4);
                        PdfWriter writer = PdfWriter.GetInstance(document, fs);
                        document.Open();

                        // Agregar título al documento
                        document.Add(new Paragraph("Reporte de Información"));
                        document.Add(new Paragraph(" ")); // Espacio en blanco

                        // Crear tabla para el PDF
                        PdfPTable pdfTable = new PdfPTable(dataTable.Columns.Count);
                        pdfTable.WidthPercentage = 100;

                        // Agregar encabezados de columna
                        foreach (DataColumn column in dataTable.Columns)
                        {
                            PdfPCell cell = new PdfPCell(new Phrase(column.ColumnName));
                            cell.BackgroundColor = BaseColor.LIGHT_GRAY;
                            pdfTable.AddCell(cell);
                        }

                        // Agregar filas con datos
                        foreach (DataRow row in dataTable.Rows)
                        {
                            foreach (var cell in row.ItemArray)
                            {
                                pdfTable.AddCell(new Phrase(cell.ToString()));
                            }
                        }

                        // Agregar nombres de los atributos de los datos
                        document.Add(new Paragraph(" "));
                        document.Add(new Paragraph("Nombres de los Atributos:"));
                        document.Add(new Paragraph(" ")); // Espacio en blanco

                        PdfPTable attributesTable = new PdfPTable(2);
                        attributesTable.WidthPercentage = 100;
                        

                        document.Add(pdfTable);
                        document.Add(attributesTable);
                        document.Close();
                    }

                    MessageBox.Show("Reporte generado exitosamente.");
                }
            }
            catch (Exception ex)
            {
                MessageBox.Show("Error al generar el reporte: " + ex.Message);
            }
        }

        //TABLAS Y COLUMNAS PARA EL CRUD
        private DataTable ObtenerTablas()
        {
            DataTable dataTable = new DataTable();
            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                connection.Open();
                SqlCommand command = new SqlCommand("SELECT TABLE_NAME FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_TYPE = 'BASE TABLE'", connection);
                SqlDataAdapter adapter = new SqlDataAdapter(command);
                adapter.Fill(dataTable);
            }
            return dataTable;
        }

        private DataTable ObtenerColumnas(string tableName)
        {
            DataTable dataTable = new DataTable();
            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                connection.Open();
                SqlCommand command = new SqlCommand($"SELECT COLUMN_NAME, DATA_TYPE FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_NAME = '{tableName}'", connection);
                SqlDataAdapter adapter = new SqlDataAdapter(command);
                adapter.Fill(dataTable);
            }
            return dataTable;
        }
        //CRUD
        private string GenerarScriptCRUD()
        {
            DataTable tablas = ObtenerTablas();
            StringBuilder script = new StringBuilder();

            foreach (DataRow row in tablas.Rows)
            {
                string tableName = row["TABLE_NAME"].ToString();
                DataTable columnas = ObtenerColumnas(tableName);

                // Generar script para el procedimiento almacenado INSERT
                script.AppendLine(GenerarInsertProcedure(tableName, columnas));

                // Generar script para el procedimiento almacenado SELECT
                script.AppendLine(GenerarSelectProcedure(tableName));

                // Generar script para el procedimiento almacenado UPDATE
                script.AppendLine(GenerarUpdateProcedure(tableName, columnas));

                // Generar script para el procedimiento almacenado DELETE
                script.AppendLine(GenerarDeleteProcedure(tableName));
            }

            return script.ToString();
        }


        private string ConvertirTipoDato(string dataType)
        {
            switch (dataType.ToLower())
            {
                case "int": return "INT";
                case "varchar": return "VARCHAR(MAX)";
                case "datetime": return "DATETIME";
                // Agrega más conversiones según sea necesario
                default: return dataType.ToUpper();
            }
        }

        private string GenerarInsertProcedure(string tableName, DataTable columnas)
        {
            StringBuilder script = new StringBuilder();
            script.AppendLine($"CREATE PROCEDURE sp_Insert_{tableName}");
            script.AppendLine("(");

            foreach (DataRow row in columnas.Rows)
            {
                string columnName = row["COLUMN_NAME"].ToString();
                string dataType = row["DATA_TYPE"].ToString();
                script.AppendLine($"    @{columnName} {ConvertirTipoDato(dataType)},");
            }
            script.Length -= 3; // Eliminar la última coma y los espacios
            script.AppendLine();
            script.AppendLine(")");
            script.AppendLine("AS");
            script.AppendLine("BEGIN");
            script.AppendLine($"    INSERT INTO {tableName} (");

            foreach (DataRow row in columnas.Rows)
            {
                string columnName = row["COLUMN_NAME"].ToString();
                script.AppendLine($"        {columnName},");
            }
            script.Length -= 3; // Eliminar la última coma y los espacios
            script.AppendLine();
            script.AppendLine("    ) VALUES (");

            foreach (DataRow row in columnas.Rows)
            {
                string columnName = row["COLUMN_NAME"].ToString();
                script.AppendLine($"        @{columnName},");
            }
            script.Length -= 3; // Eliminar la última coma y los espacios
            script.AppendLine();
            script.AppendLine("    );");
            script.AppendLine("END");
            script.AppendLine("GO");
            return script.ToString();
        }
        private string GenerarSelectProcedure(string tableName)
        {
            StringBuilder script = new StringBuilder();
            script.AppendLine($"CREATE PROCEDURE sp_Select_{tableName}");
            script.AppendLine("AS");
            script.AppendLine("BEGIN");
            script.AppendLine($"    SELECT * FROM {tableName};");
            script.AppendLine("END");
            script.AppendLine("GO");
            return script.ToString();
        }

        private string GenerarUpdateProcedure(string tableName, DataTable columnas)
        {
            StringBuilder script = new StringBuilder();
            script.AppendLine($"CREATE PROCEDURE sp_Update_{tableName}");
            script.AppendLine("(");

            foreach (DataRow row in columnas.Rows)
            {
                string columnName = row["COLUMN_NAME"].ToString();
                string dataType = row["DATA_TYPE"].ToString();
                script.AppendLine($"    @{columnName} {ConvertirTipoDato(dataType)},");
            }
            script.AppendLine("    @Id INT");
            script.AppendLine(")");
            script.AppendLine("AS");
            script.AppendLine("BEGIN");
            script.AppendLine($"    UPDATE {tableName} SET");

            foreach (DataRow row in columnas.Rows)
            {
                string columnName = row["COLUMN_NAME"].ToString();
                if (columnName != "Id")
                {
                    script.AppendLine($"        {columnName} = @{columnName},");
                }
            }
            script.Length -= 3; // Eliminar la última coma y los espacios
            script.AppendLine();
            script.AppendLine($"    WHERE Id = @Id;");
            script.AppendLine("END");
            script.AppendLine("GO");
            return script.ToString();
        }

        private string GenerarDeleteProcedure(string tableName)
        {
            StringBuilder script = new StringBuilder();
            script.AppendLine($"CREATE PROCEDURE sp_Delete_{tableName}");
            script.AppendLine("(");
            script.AppendLine("    @Id INT");
            script.AppendLine(")");
            script.AppendLine("AS");
            script.AppendLine("BEGIN");
            script.AppendLine($"    DELETE FROM {tableName} WHERE Id = @Id;"); // Condición para la eliminación
            script.AppendLine("END");
            script.AppendLine("GO");
            return script.ToString();
        }



        // Guardar en un archivo SQL
        private void GuardarScriptSQL(string script)
        {
            SaveFileDialog saveFileDialog = new SaveFileDialog();
            saveFileDialog.Filter = "SQL Files|*.sql";
            saveFileDialog.Title = "Guardar script SQL";
            saveFileDialog.ShowDialog();

            if (saveFileDialog.FileName != "")
            {
                File.WriteAllText(saveFileDialog.FileName, script);
                MessageBox.Show("Script SQL guardado exitosamente.");
            }
        }

        private void btnGenerarProcedimientos_Click(object sender, EventArgs e)
        {
            string script = GenerarScriptCRUD();
            GuardarScriptSQL(script);
        }



        private void btnAgregarEntidad_Click(object sender, EventArgs e)
        {
            string nombresEntidad = txtNombresEntidad.Text.Trim(); // Obtener el nombre de la entidad desde el control TextBox
            string atributo1 = txtAtributo1.Text.Trim();
            string tipo1 = cmbTipo1.SelectedItem.ToString();
            string atributo2 = txtAtributo2.Text.Trim();
            string tipo2 = cmbTipo2.SelectedItem.ToString();
            string atributo3 = txtAtributo3.Text.Trim();
            string tipo3 = cmbTipo3.SelectedItem.ToString();

            if (string.IsNullOrEmpty(nombresEntidad) || string.IsNullOrEmpty(atributo1) || string.IsNullOrEmpty(tipo1))
            {
                MessageBox.Show("Por favor, ingrese al menos el nombre de la entidad, el primer atributo y su tipo de datos.");
                return;
            }

            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                try
                {
                    connection.Open();
                    string query = $"CREATE TABLE {nombresEntidad} ({atributo1} {tipo1}";

                    if (!string.IsNullOrEmpty(atributo2) && !string.IsNullOrEmpty(tipo2))
                    {
                        query += $", {atributo2} {tipo2}";
                    }

                    if (!string.IsNullOrEmpty(atributo3) && !string.IsNullOrEmpty(tipo3))
                    {
                        query += $", {atributo3} {tipo3}";
                    }

                    query += ");";

                    SqlCommand command = new SqlCommand(query, connection);
                    command.ExecuteNonQuery();
                    MessageBox.Show("Entidad agregada exitosamente.");
                }
                catch (Exception ex)
                {
                    MessageBox.Show("Error al agregar la entidad: " + ex.Message);
                }
            }
        }



        private void dataGridView1_CellContentClick(object sender, DataGridViewCellEventArgs e)
        {

        }

        private void textBox1_TextChanged(object sender, EventArgs e)
        {

        }

        private void button1_Click(object sender, EventArgs e)
        {

        }

        private void button3_Click(object sender, EventArgs e)
        {

        }

        private void button2_Click(object sender, EventArgs e)
        {

        }

        private void Form1_Load(object sender, EventArgs e)
        {

        }

        private void button1_Click_1(object sender, EventArgs e)
        {

        }

        private void textBox1_TextChanged_1(object sender, EventArgs e)
        {

        }

        private void txtNombreEntidad_TextChanged(object sender, EventArgs e)
        {

        }

        private void lblAtributo1_Click(object sender, EventArgs e)
        {

        }

        private void lblAtributo2_Click(object sender, EventArgs e)
        {

        }

        private void txtAtributo1_TextChanged(object sender, EventArgs e)
        {

        }

        private void lblTipo2_Click(object sender, EventArgs e)
        {

        }

        private void lblTipo1_Click(object sender, EventArgs e)
        {

        }

        private void lblTipo3_Click(object sender, EventArgs e)
        {

        }

        private void lblAtributo3_Click(object sender, EventArgs e)
        {

        }

        private void txtNuevaContraseña_TextChanged(object sender, EventArgs e)
        {

        }

        private void cmbTipo3_SelectedIndexChanged(object sender, EventArgs e)
        {

        }

        private void richTextBox1_TextChanged(object sender, EventArgs e)
        {

        }

        private void textBox1_TextChanged_2(object sender, EventArgs e)
        {

        }
        private void btnEjecutarConsulta_Click(object sender, EventArgs e)
        {
            string query = richTextBox1.Text;

            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                try
                {
                    connection.Open();

                    SqlCommand command = new SqlCommand(query, connection);
                    SqlDataAdapter adapter = new SqlDataAdapter(command);
                    DataTable dataTable = new DataTable();
                    adapter.Fill(dataTable);
                    dataGridView1.DataSource = dataTable;
                }
                catch (Exception ex)
                {
                    MessageBox.Show("Error al listar atributos: " + ex.Message);
                }

            }
        }

        private void btnGenerateTriggers_Click(object sender, EventArgs e)
        {
            //string connectionString = "Server=your_server;Database=your_database;User Id=your_username;Password=your_password;";

            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                try
                {
                    connection.Open();

                    // Crear la tabla de auditoria
                    string createTableQuery = @"
                    IF NOT EXISTS (
                        SELECT * FROM INFORMATION_SCHEMA.TABLES 
                        WHERE TABLE_NAME = 'auditoria'
                    )
                    BEGIN
                        CREATE TABLE auditoria (
                            ID INT IDENTITY(1,1) PRIMARY KEY,
                            TablaAfectada NVARCHAR(255),
                            FechaHora DATETIME,
                            UsuarioActual NVARCHAR(255),
                            DetalleAccion NVARCHAR(MAX)
                        )
                    END";
                    ExecuteNonQuery(connection, createTableQuery);
                    MessageBox.Show("Tabla de auditoría creada exitosamente", "Éxito", MessageBoxButtons.OK, MessageBoxIcon.Information);

                    // Listar las entidades con atributos
                    List<string> tablas = ListarEntidades(connection);
                    StringBuilder sb = new StringBuilder();
                    sb.AppendLine(createTableQuery);
                    sb.AppendLine();

                    foreach (var tabla in tablas)
                    {
                        // Generar los disparadores
                        string triggerInsert = GenerarTriggerInsert(tabla);
                        string triggerUpdate = GenerarTriggerUpdate(tabla);
                        string triggerDelete = GenerarTriggerDelete(tabla);

                        sb.AppendLine(triggerInsert);
                        sb.AppendLine("GO");
                        sb.AppendLine(triggerUpdate);
                        sb.AppendLine("GO");
                        sb.AppendLine(triggerDelete);
                        sb.AppendLine("GO");

                        // Guardar los disparadores en archivos SQL
                        /*SaveTriggerToFile($"{tabla}_InsertTrigger.sql", triggerInsert);
                        SaveTriggerToFile($"{tabla}_UpdateTrigger.sql", triggerUpdate);
                        SaveTriggerToFile($"{tabla}_DeleteTrigger.sql", triggerDelete);*/
                    }
                    // Guardar todos los disparadores en un solo archivo SQL
                    SaveTriggerToFile("Triggers_Auditoria.sql", sb.ToString());

                    MessageBox.Show("Disparadores generados y guardados exitosamente", "Éxito", MessageBoxButtons.OK, MessageBoxIcon.Information);
                }
                catch (Exception ex)
                {
                    MessageBox.Show($"Ocurrió un error: {ex.Message}", "Error", MessageBoxButtons.OK, MessageBoxIcon.Error);
                }
                finally
                {
                    connection.Close();
                }
            }
        }

        private void ExecuteNonQuery(SqlConnection connection, string query)
        {
            using (SqlCommand command = new SqlCommand(query, connection))
            {
                command.ExecuteNonQuery();
            }
        }

        private List<string> ListarEntidades(SqlConnection connection)
        {
            List<string> tablas = new List<string>();
            string query = "SELECT TABLE_NAME FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_TYPE = 'BASE TABLE'";

            using (SqlCommand command = new SqlCommand(query, connection))
            using (SqlDataReader reader = command.ExecuteReader())
            {
                while (reader.Read())
                {
                    tablas.Add(reader.GetString(0));
                }
            }

            return tablas;
        }

        private string GenerarTriggerInsert(string tabla)
        {
            return $@"
                CREATE TRIGGER {tabla}_Insert_Audit
                ON {tabla}
                AFTER INSERT
                AS
                BEGIN
                    DECLARE @UsuarioActual NVARCHAR(255) = SYSTEM_USER
                    INSERT INTO auditoria (TablaAfectada, FechaHora, UsuarioActual, DetalleAccion)
                    SELECT '{tabla}', GETDATE(), @UsuarioActual, 'INSERT'
                    FROM INSERTED
                END";
        }

        private string GenerarTriggerUpdate(string tabla)
        {
            return $@"
                CREATE TRIGGER {tabla}_Update_Audit
                ON {tabla}
                AFTER UPDATE
                AS
                BEGIN
                    DECLARE @UsuarioActual NVARCHAR(255) = SYSTEM_USER
                    INSERT INTO auditoria (TablaAfectada, FechaHora, UsuarioActual, DetalleAccion)
                    SELECT '{tabla}', GETDATE(), @UsuarioActual, 'UPDATE'
                    FROM INSERTED
                END";
        }

        private string GenerarTriggerDelete(string tabla)
        {
            return $@"
                CREATE TRIGGER {tabla}_Delete_Audit
                ON {tabla}
                AFTER DELETE
                AS
                BEGIN
                    DECLARE @UsuarioActual NVARCHAR(255) = SYSTEM_USER
                    INSERT INTO auditoria (TablaAfectada, FechaHora, UsuarioActual, DetalleAccion)
                    SELECT '{tabla}', GETDATE(), @UsuarioActual, 'DELETE'
                    FROM DELETED
                END";
        }

        private void SaveTriggerToFile(string fileName, string triggerContent)
        {
            using (SaveFileDialog saveFileDialog = new SaveFileDialog())
            {
                saveFileDialog.FileName = fileName;
                saveFileDialog.Filter = "SQL files (*.sql)|*.sql|All files (*.*)|*.*";
                if (saveFileDialog.ShowDialog() == DialogResult.OK)
                {
                    File.WriteAllText(saveFileDialog.FileName, triggerContent);
                }
            }
        }
        private void btnFetchLogs_Click(object sender, EventArgs e)
        {
            string tableName = txtTableName.Text;
            DateTime? startDate = dtpStartDate.Value;
            DateTime? endDate = dtpEndDate.Value;

            List<LogEntry> logs = FetchLogs(tableName, startDate, endDate);
            dataGridView1.DataSource = logs;
        }

        private List<LogEntry> FetchLogs(string tableName, DateTime? startDate, DateTime? endDate)
        {
            List<LogEntry> logs = new List<LogEntry>();

            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                connection.Open();
                string query = "SELECT * FROM auditoria WHERE 1=1";
                if (!string.IsNullOrEmpty(tableName))
                {
                    query += " AND TablaAfectada = @TableName";
                }
                if (startDate.HasValue)
                {
                    query += " AND FechaHora >= @StartDate";
                }
                if (endDate.HasValue)
                {
                    query += " AND FechaHora <= @EndDate";
                }

                using (SqlCommand command = new SqlCommand(query, connection))
                {
                    if (!string.IsNullOrEmpty(tableName))
                    {
                        command.Parameters.AddWithValue("@TableName", tableName);
                    }
                    if (startDate.HasValue)
                    {
                        command.Parameters.AddWithValue("@StartDate", startDate.Value);
                    }
                    if (endDate.HasValue)
                    {
                        command.Parameters.AddWithValue("@EndDate", endDate.Value);
                    }

                    using (SqlDataReader reader = command.ExecuteReader())
                    {
                        while (reader.Read())
                        {
                            logs.Add(new LogEntry
                            {
                                ID = reader.GetInt32(0),
                                TablaAfectada = reader.GetString(1),
                                FechaHora = reader.GetDateTime(2),
                                UsuarioActual = reader.GetString(3),
                                DetalleAccion = reader.GetString(4)
                            });
                        }
                    }
                }
            }

            return logs;
        }

        private void btnGeneratePDF_Click(object sender, EventArgs e)
        {
            List<LogEntry> logs = (List<LogEntry>)dataGridView1.DataSource;
            SaveFileDialog saveFileDialog = new SaveFileDialog
            {
                Filter = "PDF files (*.pdf)|*.pdf|All files (*.*)|*.*",
                FileName = "AuditLogs.pdf"
            };

            if (saveFileDialog.ShowDialog() == DialogResult.OK)
            {
                GeneratePDF(saveFileDialog.FileName, logs);
                MessageBox.Show("PDF generado exitosamente", "Éxito", MessageBoxButtons.OK, MessageBoxIcon.Information);
            }
        }

        private void GeneratePDF(string filePath, List<LogEntry> logs)
        {
            Document document = new Document();
            PdfWriter.GetInstance(document, new FileStream(filePath, FileMode.Create));
            document.Open();

            // Añadir título
            document.Add(new Paragraph("Logs de Auditoría"));
            document.Add(new Paragraph("\n"));

            // Crear tabla con encabezados
            PdfPTable table = new PdfPTable(5);
            table.AddCell("ID");
            table.AddCell("Tabla Afectada");
            table.AddCell("Fecha y Hora");
            table.AddCell("Usuario Actual");
            table.AddCell("Detalle de Acción");

            // Añadir filas a la tabla
            foreach (var log in logs)
            {
                table.AddCell(log.ID.ToString());
                table.AddCell(log.TablaAfectada);
                table.AddCell(log.FechaHora.ToString());
                table.AddCell(log.UsuarioActual);
                table.AddCell(log.DetalleAccion);
            }

            // Añadir tabla al documento
            document.Add(table);

            document.Close();
        }

       private void InsertTestData()
        {
            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                connection.Open();
                string query = @"
                INSERT INTO auditoria (TablaAfectada, FechaHora, UsuarioActual, DetalleAccion) VALUES
                ('EMPLEADO', GETDATE(), 'usuario1', 'INSERT'),
                ('EMPLEADO', GETDATE(), 'usuario2', 'UPDATE'),
                ('ARTICULOS', GETDATE(), 'usuario3', 'DELETE'),
                ('CIUDAD', GETDATE(), 'usuario1', 'INSERT'),
                ('PAGO', GETDATE(), 'usuario2', 'UPDATE');";

                using (SqlCommand command = new SqlCommand(query, connection))
                {
                    command.ExecuteNonQuery();
                }
            }
        }
    

    public class LogEntry
    {
        public int ID { get; set; }
        public string TablaAfectada { get; set; }
        public DateTime FechaHora { get; set; }
        public string UsuarioActual { get; set; }
        public string DetalleAccion { get; set; }
    }
    /*
            private void btnFetchLogs_Click(object sender, EventArgs e)
            {
                string tableName = txtTableName.Text;
                DateTime? startDate = dtpStartDate.Value;
                DateTime? endDate = dtpEndDate.Value;

                List<LogEntry> logs = FetchLogs(tableName, startDate, endDate);
                dataGridView1.DataSource = logs;
            }

            private List<LogEntry> FetchLogs(string tableName, DateTime? startDate, DateTime? endDate)
            {
                List<LogEntry> logs = new List<LogEntry>();

                using (SqlConnection connection = new SqlConnection(connectionString))
                {
                    connection.Open();
                    string query = "SELECT * FROM auditoria WHERE 1=1";
                    if (!string.IsNullOrEmpty(tableName))
                    {
                        query += " AND TablaAfectada = @TableName";
                    }
                    if (startDate.HasValue)
                    {
                        query += " AND FechaHora >= @StartDate";
                    }
                    if (endDate.HasValue)
                    {
                        query += " AND FechaHora <= @EndDate";
                    }

                    using (SqlCommand command = new SqlCommand(query, connection))
                    {
                        if (!string.IsNullOrEmpty(tableName))
                        {
                            command.Parameters.AddWithValue("@TableName", tableName);
                        }
                        if (startDate.HasValue)
                        {
                            command.Parameters.AddWithValue("@StartDate", startDate.Value);
                        }
                        if (endDate.HasValue)
                        {
                            command.Parameters.AddWithValue("@EndDate", endDate.Value);
                        }

                        using (SqlDataReader reader = command.ExecuteReader())
                        {
                            while (reader.Read())
                            {
                                logs.Add(new LogEntry
                                {
                                    ID = reader.GetInt32(0),
                                    TablaAfectada = reader.GetString(1),
                                    FechaHora = reader.GetDateTime(2),
                                    UsuarioActual = reader.GetString(3),
                                    DetalleAccion = reader.GetString(4)
                                });
                            }
                        }
                    }
                }

                return logs;
            }

            private void btnGeneratePDF_Click(object sender, EventArgs e)
            {
                List<LogEntry> logs = (List<LogEntry>)dataGridView1.DataSource;
                SaveFileDialog saveFileDialog = new SaveFileDialog
                {
                    Filter = "PDF files (*.pdf)|*.pdf|All files (*.*)|*.*",
                    FileName = "AuditLogs.pdf"
                };

                if (saveFileDialog.ShowDialog() == DialogResult.OK)
                {
                    GeneratePDF(saveFileDialog.FileName, logs);
                    MessageBox.Show("PDF generado exitosamente", "Éxito", MessageBoxButtons.OK, MessageBoxIcon.Information);
                }
            }

            private void GeneratePDF(string filePath, List<LogEntry> logs)
            {
                Document document = new Document();
                PdfWriter.GetInstance(document, new FileStream(filePath, FileMode.Create));
                document.Open();

                // Añadir título
                document.Add(new Paragraph("Logs de Auditoría"));
                document.Add(new Paragraph("\n"));

                // Crear tabla con encabezados
                PdfPTable table = new PdfPTable(5);
                table.AddCell("ID");
                table.AddCell("Tabla Afectada");
                table.AddCell("Fecha y Hora");
                table.AddCell("Usuario Actual");
                table.AddCell("Detalle de Acción");

                // Añadir filas a la tabla
                foreach (var log in logs)
                {
                    table.AddCell(log.ID.ToString());
                    table.AddCell(log.TablaAfectada);
                    table.AddCell(log.FechaHora.ToString());
                    table.AddCell(log.UsuarioActual);
                    table.AddCell(log.DetalleAccion);
                }

                // Añadir tabla al documento
                document.Add(table);

                document.Close();
            }


        public class LogEntry
        {
            public int ID { get; set; }
            public string TablaAfectada { get; set; }
            public DateTime FechaHora { get; set; }
            public string UsuarioActual { get; set; }
            public string DetalleAccion { get; set; }
        }*/


    private void btnRunProcess_Click(object sender, EventArgs e)
        {
            RunProcess();
        }

        private void RunProcess()
        {
            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                connection.Open();

                SqlTransaction transaction = connection.BeginTransaction();

                try
                {
                    // Llamar al procedimiento almacenado RegistrarMudanzaYActualizarVehiculo
                    using (SqlCommand cmd = new SqlCommand("RegistrarMudanzaYActualizarVehiculo2", connection, transaction))
                    {
                        cmd.CommandType = CommandType.StoredProcedure;

                        // Agrega los parámetros necesarios ()
                        cmd.Parameters.AddWithValue("@ID_CLIENTE", 2);
                        cmd.Parameters.AddWithValue("@ID_SUCURSAL", 7);
                        cmd.Parameters.AddWithValue("@ID_VEHICULO", 3);
                        cmd.Parameters.AddWithValue("@COSTO_MUDANZA", 1001.0);
                        cmd.Parameters.AddWithValue("@DESCUENTO_MUDANZA", 10);
                        cmd.Parameters.AddWithValue("@ID_ESTADO_VEHICULO", 1);
                        cmd.Parameters.AddWithValue("@ID_ESTADO_MUDANZA", 1);

                        cmd.ExecuteNonQuery();
                    }

                    // Llamar al cursor o al procedimiento que utiliza el cursor
                    using (SqlCommand cmd = new SqlCommand("sp_cursorMudanza", connection, transaction))
                    {
                        cmd.CommandType = CommandType.StoredProcedure;
                        cmd.ExecuteNonQuery();
                    }

                    transaction.Commit();

                    MessageBox.Show("Proceso completado exitosamente.", "Éxito", MessageBoxButtons.OK, MessageBoxIcon.Information);
                }
                catch (Exception ex)
                {
                    transaction.Rollback();
                    MessageBox.Show("Ocurrió un error: " + ex.Message, "Error", MessageBoxButtons.OK, MessageBoxIcon.Error);
                }
            }
        }

        private void btnEjecutarCursor_Click(object sender, EventArgs e)
        {
            EjecutarCursor();
        }
        public void EjecutarCursor()
        {
            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                try
                {
                    connection.Open();

                    SqlCommand command = new SqlCommand("sp_cursorMudanza2", connection);
                    command.CommandType = CommandType.StoredProcedure;

                    command.ExecuteNonQuery();

                    MessageBox.Show("Cursor ejecutado correctamente.");
                }
                catch (Exception ex)
                {
                    MessageBox.Show("Error al ejecutar el cursor: " + ex.Message);
                }
            }
        }

    }
}   
