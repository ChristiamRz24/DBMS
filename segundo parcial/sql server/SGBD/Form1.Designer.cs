using System.Windows.Forms;
using System;

namespace SGBD_Automation
{
    partial class Form1
    {
        private System.ComponentModel.IContainer components = null;
        private System.Windows.Forms.DataGridView dataGridView1;
        private System.Windows.Forms.Button btnListarTablas;
        private System.Windows.Forms.Button btnAgregarUsuario;
        private System.Windows.Forms.TextBox txtNombreUsuario;
        private System.Windows.Forms.Button btnModificarUsuario;
        private System.Windows.Forms.Button btnEliminarUsuario;
        private System.Windows.Forms.TextBox txtNombreRol;
        private System.Windows.Forms.Button btnCrearRol;
        private System.Windows.Forms.TextBox txtUsuarioRol;
        private System.Windows.Forms.TextBox txtRolAsignar;
        private System.Windows.Forms.Button btnAsignarRol;
        private System.Windows.Forms.Button btnConsultarUsuarios;
        private System.Windows.Forms.Button btnConsultarRoles;
        private System.Windows.Forms.Button btnListarAtributos;
        private System.Windows.Forms.TextBox txtNombreEntidad;

        // Agrega estos campos como variables de clase en la clase parcial Form1

        private System.Windows.Forms.TextBox txtNombresEntidad;
        private System.Windows.Forms.Label lblNombresEntidad;
        private System.Windows.Forms.TextBox txtAtributo1;
        private System.Windows.Forms.ComboBox cmbTipo1;
        private System.Windows.Forms.Label lblAtributo1;
        private System.Windows.Forms.Label lblTipo1;
        private System.Windows.Forms.TextBox txtAtributo2;
        private System.Windows.Forms.ComboBox cmbTipo2;
        private System.Windows.Forms.Label lblAtributo2;
        private System.Windows.Forms.Label lblTipo2;
        private System.Windows.Forms.TextBox txtAtributo3;
        private System.Windows.Forms.ComboBox cmbTipo3;
        private System.Windows.Forms.Label lblAtributo3;
        private System.Windows.Forms.Label lblTipo3;
        private System.Windows.Forms.Button btnAgregarEntidad;

        protected override void Dispose(bool disposing)
        {
            if (disposing && (components != null))
            {
                components.Dispose();
            }
            base.Dispose(disposing);
        }

        private void InitializeComponent()
        {
            this.dataGridView1 = new System.Windows.Forms.DataGridView();
            this.btnListarTablas = new System.Windows.Forms.Button();
            this.btnAgregarUsuario = new System.Windows.Forms.Button();
            this.txtNombreUsuario = new System.Windows.Forms.TextBox();
            this.btnModificarUsuario = new System.Windows.Forms.Button();
            this.btnEliminarUsuario = new System.Windows.Forms.Button();
            this.txtNombreRol = new System.Windows.Forms.TextBox();
            this.btnCrearRol = new System.Windows.Forms.Button();
            this.txtUsuarioRol = new System.Windows.Forms.TextBox();
            this.txtRolAsignar = new System.Windows.Forms.TextBox();
            this.btnAsignarRol = new System.Windows.Forms.Button();
            this.btnConsultarUsuarios = new System.Windows.Forms.Button();
            this.btnConsultarRoles = new System.Windows.Forms.Button();
            this.Respaldo = new System.Windows.Forms.Button();
            this.button2 = new System.Windows.Forms.Button();
            this.button1 = new System.Windows.Forms.Button();
            this.txtDetalleEntidad = new System.Windows.Forms.TextBox();
            this.button3 = new System.Windows.Forms.Button();
            this.button4 = new System.Windows.Forms.Button();
            this.txtNombreEntidad = new System.Windows.Forms.TextBox();
            this.btnListarAtributos = new System.Windows.Forms.Button();
            this.btnGenerarProcedimientos = new System.Windows.Forms.Button();
            this.btnGenerarReporte = new System.Windows.Forms.Button();
            this.txtNombresEntidad = new System.Windows.Forms.TextBox();
            this.txtAtributo1 = new System.Windows.Forms.TextBox();
            this.txtAtributo2 = new System.Windows.Forms.TextBox();
            this.txtAtributo3 = new System.Windows.Forms.TextBox();
            this.cmbTipo1 = new System.Windows.Forms.ComboBox();
            this.cmbTipo2 = new System.Windows.Forms.ComboBox();
            this.cmbTipo3 = new System.Windows.Forms.ComboBox();
            this.lblNombresEntidad = new System.Windows.Forms.Label();
            this.lblAtributo1 = new System.Windows.Forms.Label();
            this.lblTipo1 = new System.Windows.Forms.Label();
            this.lblAtributo2 = new System.Windows.Forms.Label();
            this.lblTipo2 = new System.Windows.Forms.Label();
            this.lblAtributo3 = new System.Windows.Forms.Label();
            this.lblTipo3 = new System.Windows.Forms.Label();
            this.btnAgregarEntidad = new System.Windows.Forms.Button();
            this.txtNuevoUsuario = new System.Windows.Forms.TextBox();
            this.richTextBox1 = new System.Windows.Forms.RichTextBox();
            this.btnEjecutarConsulta = new System.Windows.Forms.Button();
            this.button5 = new System.Windows.Forms.Button();
            this.txtTableName = new System.Windows.Forms.TextBox();
            this.dtpStartDate = new System.Windows.Forms.DateTimePicker();
            this.dtpEndDate = new System.Windows.Forms.DateTimePicker();
            this.button6 = new System.Windows.Forms.Button();
            this.button7 = new System.Windows.Forms.Button();
            this.button8 = new System.Windows.Forms.Button();
            this.button9 = new System.Windows.Forms.Button();
            ((System.ComponentModel.ISupportInitialize)(this.dataGridView1)).BeginInit();
            this.SuspendLayout();
            // 
            // dataGridView1
            // 
            this.dataGridView1.ColumnHeadersHeightSizeMode = System.Windows.Forms.DataGridViewColumnHeadersHeightSizeMode.AutoSize;
            this.dataGridView1.Location = new System.Drawing.Point(12, 12);
            this.dataGridView1.Name = "dataGridView1";
            this.dataGridView1.Size = new System.Drawing.Size(441, 150);
            this.dataGridView1.TabIndex = 0;
            this.dataGridView1.CellContentClick += new System.Windows.Forms.DataGridViewCellEventHandler(this.dataGridView1_CellContentClick);
            // 
            // btnListarTablas
            // 
            this.btnListarTablas.Location = new System.Drawing.Point(12, 168);
            this.btnListarTablas.Name = "btnListarTablas";
            this.btnListarTablas.Size = new System.Drawing.Size(100, 23);
            this.btnListarTablas.TabIndex = 1;
            this.btnListarTablas.Text = "Listar Tablas";
            this.btnListarTablas.UseVisualStyleBackColor = true;
            this.btnListarTablas.Click += new System.EventHandler(this.btnListarTablas_Click);
            // 
            // btnAgregarUsuario
            // 
            this.btnAgregarUsuario.Location = new System.Drawing.Point(12, 260);
            this.btnAgregarUsuario.Name = "btnAgregarUsuario";
            this.btnAgregarUsuario.Size = new System.Drawing.Size(100, 23);
            this.btnAgregarUsuario.TabIndex = 2;
            this.btnAgregarUsuario.Text = "Agregar Usuario";
            this.btnAgregarUsuario.UseVisualStyleBackColor = true;
            this.btnAgregarUsuario.Click += new System.EventHandler(this.btnAgregarUsuario_Click);
            // 
            // txtNombreUsuario
            // 
            this.txtNombreUsuario.Location = new System.Drawing.Point(118, 262);
            this.txtNombreUsuario.Name = "txtNombreUsuario";
            this.txtNombreUsuario.Size = new System.Drawing.Size(100, 20);
            this.txtNombreUsuario.TabIndex = 3;
            // 
            // btnModificarUsuario
            // 
            this.btnModificarUsuario.Location = new System.Drawing.Point(12, 289);
            this.btnModificarUsuario.Name = "btnModificarUsuario";
            this.btnModificarUsuario.Size = new System.Drawing.Size(100, 23);
            this.btnModificarUsuario.TabIndex = 5;
            this.btnModificarUsuario.Text = "Modificar Usuario";
            this.btnModificarUsuario.UseVisualStyleBackColor = true;
            this.btnModificarUsuario.Click += new System.EventHandler(this.btnModificarUsuario_Click);
            // 
            // btnEliminarUsuario
            // 
            this.btnEliminarUsuario.Location = new System.Drawing.Point(12, 318);
            this.btnEliminarUsuario.Name = "btnEliminarUsuario";
            this.btnEliminarUsuario.Size = new System.Drawing.Size(100, 23);
            this.btnEliminarUsuario.TabIndex = 6;
            this.btnEliminarUsuario.Text = "Eliminar Usuario";
            this.btnEliminarUsuario.UseVisualStyleBackColor = true;
            this.btnEliminarUsuario.Click += new System.EventHandler(this.btnEliminarUsuario_Click);
            // 
            // txtNombreRol
            // 
            this.txtNombreRol.Location = new System.Drawing.Point(118, 347);
            this.txtNombreRol.Name = "txtNombreRol";
            this.txtNombreRol.Size = new System.Drawing.Size(100, 20);
            this.txtNombreRol.TabIndex = 7;
            // 
            // btnCrearRol
            // 
            this.btnCrearRol.Location = new System.Drawing.Point(12, 345);
            this.btnCrearRol.Name = "btnCrearRol";
            this.btnCrearRol.Size = new System.Drawing.Size(100, 23);
            this.btnCrearRol.TabIndex = 8;
            this.btnCrearRol.Text = "Crear Rol";
            this.btnCrearRol.UseVisualStyleBackColor = true;
            this.btnCrearRol.Click += new System.EventHandler(this.btnCrearRol_Click);
            // 
            // txtUsuarioRol
            // 
            this.txtUsuarioRol.Location = new System.Drawing.Point(118, 376);
            this.txtUsuarioRol.Name = "txtUsuarioRol";
            this.txtUsuarioRol.Size = new System.Drawing.Size(100, 20);
            this.txtUsuarioRol.TabIndex = 9;
            // 
            // txtRolAsignar
            // 
            this.txtRolAsignar.Location = new System.Drawing.Point(118, 405);
            this.txtRolAsignar.Name = "txtRolAsignar";
            this.txtRolAsignar.Size = new System.Drawing.Size(100, 20);
            this.txtRolAsignar.TabIndex = 10;
            // 
            // btnAsignarRol
            // 
            this.btnAsignarRol.Location = new System.Drawing.Point(12, 374);
            this.btnAsignarRol.Name = "btnAsignarRol";
            this.btnAsignarRol.Size = new System.Drawing.Size(100, 23);
            this.btnAsignarRol.TabIndex = 11;
            this.btnAsignarRol.Text = "Asignar Rol";
            this.btnAsignarRol.UseVisualStyleBackColor = true;
            this.btnAsignarRol.Click += new System.EventHandler(this.btnAsignarRol_Click);
            // 
            // btnConsultarUsuarios
            // 
            this.btnConsultarUsuarios.Location = new System.Drawing.Point(224, 260);
            this.btnConsultarUsuarios.Name = "btnConsultarUsuarios";
            this.btnConsultarUsuarios.Size = new System.Drawing.Size(100, 23);
            this.btnConsultarUsuarios.TabIndex = 12;
            this.btnConsultarUsuarios.Text = "Consultar Usuarios";
            this.btnConsultarUsuarios.UseVisualStyleBackColor = true;
            this.btnConsultarUsuarios.Click += new System.EventHandler(this.btnConsultarUsuarios_Click);
            // 
            // btnConsultarRoles
            // 
            this.btnConsultarRoles.Location = new System.Drawing.Point(224, 344);
            this.btnConsultarRoles.Name = "btnConsultarRoles";
            this.btnConsultarRoles.Size = new System.Drawing.Size(100, 23);
            this.btnConsultarRoles.TabIndex = 13;
            this.btnConsultarRoles.Text = "Consultar Roles";
            this.btnConsultarRoles.UseVisualStyleBackColor = true;
            this.btnConsultarRoles.Click += new System.EventHandler(this.btnConsultarRoles_Click);
            // 
            // Respaldo
            // 
            this.Respaldo.Location = new System.Drawing.Point(378, 218);
            this.Respaldo.Name = "Respaldo";
            this.Respaldo.Size = new System.Drawing.Size(75, 23);
            this.Respaldo.TabIndex = 14;
            this.Respaldo.Text = "Respaldo\r\n";
            this.Respaldo.UseVisualStyleBackColor = true;
            this.Respaldo.Click += new System.EventHandler(this.btnRespaldar_Click);
            // 
            // button2
            // 
            this.button2.Location = new System.Drawing.Point(378, 247);
            this.button2.Name = "button2";
            this.button2.Size = new System.Drawing.Size(75, 23);
            this.button2.TabIndex = 15;
            this.button2.Text = "Restaurar";
            this.button2.UseVisualStyleBackColor = true;
            this.button2.Click += new System.EventHandler(this.btnRestaurar_Click);
            // 
            // button1
            // 
            this.button1.Location = new System.Drawing.Point(234, 168);
            this.button1.Name = "button1";
            this.button1.Size = new System.Drawing.Size(113, 23);
            this.button1.TabIndex = 16;
            this.button1.Text = "Listar Atributos\r\n";
            this.button1.UseVisualStyleBackColor = true;
            this.button1.Click += new System.EventHandler(this.btnListarAtributos_Click);
            // 
            // txtDetalleEntidad
            // 
            this.txtDetalleEntidad.Location = new System.Drawing.Point(353, 168);
            this.txtDetalleEntidad.Name = "txtDetalleEntidad";
            this.txtDetalleEntidad.Size = new System.Drawing.Size(100, 20);
            this.txtDetalleEntidad.TabIndex = 17;
            this.txtDetalleEntidad.TextChanged += new System.EventHandler(this.textBox1_TextChanged_1);
            // 
            // button3
            // 
            this.button3.Location = new System.Drawing.Point(378, 276);
            this.button3.Name = "button3";
            this.button3.Size = new System.Drawing.Size(75, 23);
            this.button3.TabIndex = 18;
            this.button3.Text = "pdf\r\n";
            this.button3.UseVisualStyleBackColor = true;
            this.button3.Click += new System.EventHandler(this.btnGenerarReporte_Click);
            // 
            // button4
            // 
            this.button4.Location = new System.Drawing.Point(378, 305);
            this.button4.Name = "button4";
            this.button4.Size = new System.Drawing.Size(75, 23);
            this.button4.TabIndex = 19;
            this.button4.Text = "CRUD";
            this.button4.UseVisualStyleBackColor = true;
            this.button4.Click += new System.EventHandler(this.btnGenerarProcedimientos_Click);
            // 
            // txtNombreEntidad
            // 
            this.txtNombreEntidad.Location = new System.Drawing.Point(160, 77);
            this.txtNombreEntidad.Name = "txtNombreEntidad";
            this.txtNombreEntidad.Size = new System.Drawing.Size(150, 20);
            this.txtNombreEntidad.TabIndex = 1;
            this.txtNombreEntidad.TextChanged += new System.EventHandler(this.txtNombreEntidad_TextChanged);
            // 
            // btnListarAtributos
            // 
            this.btnListarAtributos.Location = new System.Drawing.Point(105, 55);
            this.btnListarAtributos.Name = "btnListarAtributos";
            this.btnListarAtributos.Size = new System.Drawing.Size(150, 30);
            this.btnListarAtributos.TabIndex = 0;
            this.btnListarAtributos.Text = "Listar Atributos";
            this.btnListarAtributos.UseVisualStyleBackColor = true;
            this.btnListarAtributos.Click += new System.EventHandler(this.btnListarAtributos_Click);
            // 
            // btnGenerarProcedimientos
            // 
            this.btnGenerarProcedimientos.Location = new System.Drawing.Point(34, 91);
            this.btnGenerarProcedimientos.Name = "btnGenerarProcedimientos";
            this.btnGenerarProcedimientos.Size = new System.Drawing.Size(160, 23);
            this.btnGenerarProcedimientos.TabIndex = 5;
            this.btnGenerarProcedimientos.Text = "Generar Procedimientos CRUD";
            this.btnGenerarProcedimientos.UseVisualStyleBackColor = true;
            this.btnGenerarProcedimientos.Click += new System.EventHandler(this.btnGenerarProcedimientos_Click);
            // 
            // btnGenerarReporte
            // 
            this.btnGenerarReporte.Location = new System.Drawing.Point(52, 44);
            this.btnGenerarReporte.Name = "btnGenerarReporte";
            this.btnGenerarReporte.Size = new System.Drawing.Size(120, 23);
            this.btnGenerarReporte.TabIndex = 4;
            this.btnGenerarReporte.Text = "Generar Reporte";
            this.btnGenerarReporte.UseVisualStyleBackColor = true;
            this.btnGenerarReporte.Click += new System.EventHandler(this.btnGenerarReporte_Click);
            // 
            // txtNombresEntidad
            // 
            this.txtNombresEntidad.Location = new System.Drawing.Point(638, 26);
            this.txtNombresEntidad.Name = "txtNombresEntidad";
            this.txtNombresEntidad.Size = new System.Drawing.Size(150, 20);
            this.txtNombresEntidad.TabIndex = 34;
            // 
            // txtAtributo1
            // 
            this.txtAtributo1.Location = new System.Drawing.Point(532, 72);
            this.txtAtributo1.Name = "txtAtributo1";
            this.txtAtributo1.Size = new System.Drawing.Size(150, 20);
            this.txtAtributo1.TabIndex = 22;
            this.txtAtributo1.TextChanged += new System.EventHandler(this.txtAtributo1_TextChanged);
            // 
            // txtAtributo2
            // 
            this.txtAtributo2.Location = new System.Drawing.Point(532, 156);
            this.txtAtributo2.Name = "txtAtributo2";
            this.txtAtributo2.Size = new System.Drawing.Size(150, 20);
            this.txtAtributo2.TabIndex = 23;
            // 
            // txtAtributo3
            // 
            this.txtAtributo3.Location = new System.Drawing.Point(532, 116);
            this.txtAtributo3.Name = "txtAtributo3";
            this.txtAtributo3.Size = new System.Drawing.Size(150, 20);
            this.txtAtributo3.TabIndex = 24;
            // 
            // cmbTipo1
            // 
            this.cmbTipo1.Items.AddRange(new object[] {
            "int",
            "varchar",
            "decimal",
            "datetime"});
            this.cmbTipo1.Location = new System.Drawing.Point(691, 71);
            this.cmbTipo1.Name = "cmbTipo1";
            this.cmbTipo1.Size = new System.Drawing.Size(100, 21);
            this.cmbTipo1.TabIndex = 25;
            // 
            // cmbTipo2
            // 
            this.cmbTipo2.Items.AddRange(new object[] {
            "int",
            "varchar",
            "decimal",
            "datetime"});
            this.cmbTipo2.Location = new System.Drawing.Point(691, 115);
            this.cmbTipo2.Name = "cmbTipo2";
            this.cmbTipo2.Size = new System.Drawing.Size(100, 21);
            this.cmbTipo2.TabIndex = 26;
            // 
            // cmbTipo3
            // 
            this.cmbTipo3.Items.AddRange(new object[] {
            "int",
            "varchar",
            "decimal",
            "datetime"});
            this.cmbTipo3.Location = new System.Drawing.Point(691, 156);
            this.cmbTipo3.Name = "cmbTipo3";
            this.cmbTipo3.Size = new System.Drawing.Size(100, 21);
            this.cmbTipo3.TabIndex = 27;
            this.cmbTipo3.SelectedIndexChanged += new System.EventHandler(this.cmbTipo3_SelectedIndexChanged);
            // 
            // lblNombresEntidad
            // 
            this.lblNombresEntidad.Location = new System.Drawing.Point(635, 12);
            this.lblNombresEntidad.Name = "lblNombresEntidad";
            this.lblNombresEntidad.Size = new System.Drawing.Size(120, 22);
            this.lblNombresEntidad.TabIndex = 35;
            this.lblNombresEntidad.Text = "Nombre de la Entidad:";
            // 
            // lblAtributo1
            // 
            this.lblAtributo1.Location = new System.Drawing.Point(529, 54);
            this.lblAtributo1.Name = "lblAtributo1";
            this.lblAtributo1.Size = new System.Drawing.Size(120, 20);
            this.lblAtributo1.TabIndex = 28;
            this.lblAtributo1.Text = "Atributo 1:";
            this.lblAtributo1.Click += new System.EventHandler(this.lblAtributo1_Click);
            // 
            // lblTipo1
            // 
            this.lblTipo1.Location = new System.Drawing.Point(690, 139);
            this.lblTipo1.Name = "lblTipo1";
            this.lblTipo1.Size = new System.Drawing.Size(40, 20);
            this.lblTipo1.TabIndex = 31;
            this.lblTipo1.Text = "Tipo de Dato 2:";
            this.lblTipo1.Click += new System.EventHandler(this.lblTipo1_Click);
            // 
            // lblAtributo2
            // 
            this.lblAtributo2.Location = new System.Drawing.Point(529, 96);
            this.lblAtributo2.Name = "lblAtributo2";
            this.lblAtributo2.Size = new System.Drawing.Size(120, 20);
            this.lblAtributo2.TabIndex = 29;
            this.lblAtributo2.Text = "Atributo 2:";
            this.lblAtributo2.Click += new System.EventHandler(this.lblAtributo2_Click);
            // 
            // lblTipo2
            // 
            this.lblTipo2.Location = new System.Drawing.Point(688, 96);
            this.lblTipo2.Name = "lblTipo2";
            this.lblTipo2.Size = new System.Drawing.Size(40, 20);
            this.lblTipo2.TabIndex = 32;
            this.lblTipo2.Text = "Tipo de Dato 2:";
            this.lblTipo2.Click += new System.EventHandler(this.lblTipo2_Click);
            // 
            // lblAtributo3
            // 
            this.lblAtributo3.Location = new System.Drawing.Point(529, 142);
            this.lblAtributo3.Name = "lblAtributo3";
            this.lblAtributo3.Size = new System.Drawing.Size(120, 20);
            this.lblAtributo3.TabIndex = 30;
            this.lblAtributo3.Text = "Atributo 3:";
            this.lblAtributo3.Click += new System.EventHandler(this.lblAtributo3_Click);
            // 
            // lblTipo3
            // 
            this.lblTipo3.Location = new System.Drawing.Point(690, 49);
            this.lblTipo3.Name = "lblTipo3";
            this.lblTipo3.Size = new System.Drawing.Size(40, 20);
            this.lblTipo3.TabIndex = 33;
            this.lblTipo3.Text = "Tipo de Dato 3:";
            this.lblTipo3.Click += new System.EventHandler(this.lblTipo3_Click);
            // 
            // btnAgregarEntidad
            // 
            this.btnAgregarEntidad.Location = new System.Drawing.Point(509, 16);
            this.btnAgregarEntidad.Name = "btnAgregarEntidad";
            this.btnAgregarEntidad.Size = new System.Drawing.Size(120, 30);
            this.btnAgregarEntidad.TabIndex = 21;
            this.btnAgregarEntidad.Text = "Agregar Entidad";
            this.btnAgregarEntidad.Click += new System.EventHandler(this.btnAgregarEntidad_Click);
            // 
            // txtNuevoUsuario
            // 
            this.txtNuevoUsuario.Location = new System.Drawing.Point(118, 292);
            this.txtNuevoUsuario.Name = "txtNuevoUsuario";
            this.txtNuevoUsuario.Size = new System.Drawing.Size(100, 20);
            this.txtNuevoUsuario.TabIndex = 36;
            // 
            // richTextBox1
            // 
            this.richTextBox1.Location = new System.Drawing.Point(486, 246);
            this.richTextBox1.Name = "richTextBox1";
            this.richTextBox1.Size = new System.Drawing.Size(293, 167);
            this.richTextBox1.TabIndex = 37;
            this.richTextBox1.Text = "";
            this.richTextBox1.TextChanged += new System.EventHandler(this.richTextBox1_TextChanged);
            // 
            // btnEjecutarConsulta
            // 
            this.btnEjecutarConsulta.Location = new System.Drawing.Point(486, 218);
            this.btnEjecutarConsulta.Name = "btnEjecutarConsulta";
            this.btnEjecutarConsulta.Size = new System.Drawing.Size(293, 23);
            this.btnEjecutarConsulta.TabIndex = 38;
            this.btnEjecutarConsulta.Text = "Ejecutar consulta SQL\r\n";
            this.btnEjecutarConsulta.UseVisualStyleBackColor = true;
            this.btnEjecutarConsulta.Click += new System.EventHandler(this.btnEjecutarConsulta_Click);
            // 
            // button5
            // 
            this.button5.Location = new System.Drawing.Point(350, 368);
            this.button5.Name = "button5";
            this.button5.Size = new System.Drawing.Size(120, 23);
            this.button5.TabIndex = 39;
            this.button5.Text = "Generar Disparadores\r\n";
            this.button5.UseVisualStyleBackColor = true;
            this.button5.Click += new System.EventHandler(this.btnGenerateTriggers_Click);
            // 
            // txtTableName
            // 
            this.txtTableName.Location = new System.Drawing.Point(350, 397);
            this.txtTableName.Name = "txtTableName";
            this.txtTableName.Size = new System.Drawing.Size(120, 20);
            this.txtTableName.TabIndex = 40;
            this.txtTableName.Click += new System.EventHandler(this.btnFetchLogs_Click);
            // 
            // dtpStartDate
            // 
            this.dtpStartDate.Location = new System.Drawing.Point(270, 423);
            this.dtpStartDate.Name = "dtpStartDate";
            this.dtpStartDate.Size = new System.Drawing.Size(200, 20);
            this.dtpStartDate.TabIndex = 41;
            // 
            // dtpEndDate
            // 
            this.dtpEndDate.Location = new System.Drawing.Point(270, 449);
            this.dtpEndDate.Name = "dtpEndDate";
            this.dtpEndDate.Size = new System.Drawing.Size(200, 20);
            this.dtpEndDate.TabIndex = 42;
            // 
            // button6
            // 
            this.button6.Location = new System.Drawing.Point(234, 496);
            this.button6.Name = "button6";
            this.button6.Size = new System.Drawing.Size(116, 23);
            this.button6.TabIndex = 43;
            this.button6.Text = "Generar Logs";
            this.button6.UseVisualStyleBackColor = true;
            this.button6.Click += new System.EventHandler(this.btnFetchLogs_Click);
            // 
            // button7
            // 
            this.button7.Location = new System.Drawing.Point(379, 496);
            this.button7.Name = "button7";
            this.button7.Size = new System.Drawing.Size(91, 23);
            this.button7.TabIndex = 44;
            this.button7.Text = "Generar PDF";
            this.button7.UseVisualStyleBackColor = true;
            this.button7.Click += new System.EventHandler(this.btnGeneratePDF_Click);
            // 
            // button8
            // 
            this.button8.Location = new System.Drawing.Point(499, 496);
            this.button8.Name = "button8";
            this.button8.Size = new System.Drawing.Size(75, 23);
            this.button8.TabIndex = 45;
            this.button8.Text = "Cursores\r\n";
            this.button8.UseVisualStyleBackColor = true;
            this.button8.Click += new System.EventHandler(this.btnRunProcess_Click);
            // 
            // button9
            // 
            this.button9.Location = new System.Drawing.Point(598, 496);
            this.button9.Name = "button9";
            this.button9.Size = new System.Drawing.Size(75, 23);
            this.button9.TabIndex = 46;
            this.button9.Text = "Cursores2\r\n";
            this.button9.UseVisualStyleBackColor = true;
            this.button9.Click += new System.EventHandler(this.btnEjecutarCursor_Click);
            // 
            // Form1
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(6F, 13F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.ClientSize = new System.Drawing.Size(800, 544);
            this.Controls.Add(this.button9);
            this.Controls.Add(this.button8);
            this.Controls.Add(this.button7);
            this.Controls.Add(this.button6);
            this.Controls.Add(this.dtpEndDate);
            this.Controls.Add(this.dtpStartDate);
            this.Controls.Add(this.txtTableName);
            this.Controls.Add(this.button5);
            this.Controls.Add(this.btnEjecutarConsulta);
            this.Controls.Add(this.richTextBox1);
            this.Controls.Add(this.txtNuevoUsuario);
            this.Controls.Add(this.button4);
            this.Controls.Add(this.button3);
            this.Controls.Add(this.txtDetalleEntidad);
            this.Controls.Add(this.button1);
            this.Controls.Add(this.button2);
            this.Controls.Add(this.Respaldo);
            this.Controls.Add(this.btnConsultarRoles);
            this.Controls.Add(this.btnConsultarUsuarios);
            this.Controls.Add(this.btnAsignarRol);
            this.Controls.Add(this.txtRolAsignar);
            this.Controls.Add(this.txtUsuarioRol);
            this.Controls.Add(this.btnCrearRol);
            this.Controls.Add(this.txtNombreRol);
            this.Controls.Add(this.btnEliminarUsuario);
            this.Controls.Add(this.btnModificarUsuario);
            this.Controls.Add(this.txtNombreUsuario);
            this.Controls.Add(this.btnAgregarUsuario);
            this.Controls.Add(this.btnListarTablas);
            this.Controls.Add(this.dataGridView1);
            this.Controls.Add(this.txtNombreEntidad);
            this.Controls.Add(this.btnListarAtributos);
            this.Controls.Add(this.btnGenerarReporte);
            this.Controls.Add(this.btnGenerarProcedimientos);
            this.Controls.Add(this.btnAgregarEntidad);
            this.Controls.Add(this.txtAtributo1);
            this.Controls.Add(this.txtAtributo2);
            this.Controls.Add(this.txtAtributo3);
            this.Controls.Add(this.cmbTipo1);
            this.Controls.Add(this.cmbTipo2);
            this.Controls.Add(this.cmbTipo3);
            this.Controls.Add(this.lblAtributo1);
            this.Controls.Add(this.lblAtributo2);
            this.Controls.Add(this.lblAtributo3);
            this.Controls.Add(this.lblTipo1);
            this.Controls.Add(this.lblTipo2);
            this.Controls.Add(this.lblTipo3);
            this.Controls.Add(this.txtNombresEntidad);
            this.Controls.Add(this.lblNombresEntidad);
            this.Name = "Form1";
            this.Text = " ";
            this.Load += new System.EventHandler(this.Form1_Load);
            ((System.ComponentModel.ISupportInitialize)(this.dataGridView1)).EndInit();
            this.ResumeLayout(false);
            this.PerformLayout();

        }

        private Button Respaldo;
        private Button button2;
        private Button button1;
        private TextBox txtDetalleEntidad;
        private Button button3;
        private Button button4;
        private Button btnGenerarProcedimientos;
        private Button btnGenerarReporte;
        private TextBox textBox2;
        private TextBox textBox3;
        private TextBox textBox4;
        private ComboBox comboBox1;
        private ComboBox comboBox2;
        private ComboBox comboBox3;
        private TextBox textBox5;
        private Label label1;
        private Label label2;
        private Label label3;
        private Label label4;
        private Label label5;
        private Label label6;
        private Label label7;
        private TextBox txtNuevoUsuario;
        private RichTextBox richTextBox1;
        private Button btnEjecutarConsulta;
        private Button button5;
        private TextBox txtTableName;
        private DateTimePicker dtpStartDate;
        private DateTimePicker dtpEndDate;
        private Button button6;
        private Button button7;
        private Button button8;
        private Button button9;
    }
}


