import { client } from "../../../../databases/sqlserver/client";

export const GET = async () => {
  const get_table_names = `
  USE mudanzas;
  GO
  
  DECLARE @TableName NVARCHAR(255)
  DECLARE @PrimaryKey NVARCHAR(255)
  
  SET @TableName = 'CIUDAD'
  SET @PrimaryKey = 'ID_CIUDAD'
  
  IF @PrimaryKey IS NOT NULL
  BEGIN
      IF OBJECT_ID('[dbo].[sp_Insert' + @TableName + ']') IS NOT NULL
      BEGIN
          DROP PROCEDURE [dbo].[sp_Insert' + @TableName + ']
      END
  
      IF OBJECT_ID('[dbo].[sp_Update' + @TableName + ']') IS NOT NULL
      BEGIN
          DROP PROCEDURE [dbo].[sp_Update' + @TableName + ']
      END
  
      IF OBJECT_ID('[dbo].[sp_Delete' + @TableName + ']') IS NOT NULL
      BEGIN
          DROP PROCEDURE [dbo].[sp_Delete' + @TableName + ']
      END
  
      IF OBJECT_ID('[dbo].[sp_Select' + @TableName + ']') IS NOT NULL
      BEGIN
          DROP PROCEDURE [dbo].[sp_Select' + @TableName + ']
      END
  
      EXEC('
      CREATE PROCEDURE [dbo].[sp_Insert' + @TableName + ']
      @ID_PROVINCIA INT,
      @NOMBRE_CIUDAD NVARCHAR(255)
      AS
      BEGIN
          SET NOCOUNT ON;
          INSERT INTO ' + @TableName + ' (ID_PROVINCIA, NOMBRE_CIUDAD) VALUES (@ID_PROVINCIA, @NOMBRE_CIUDAD);
      END')
  
      EXEC('
      CREATE PROCEDURE [dbo].[sp_Update' + @TableName + ']
      @ID_CIUDAD INT,
      @ID_PROVINCIA INT,
      @NOMBRE_CIUDAD NVARCHAR(255)
      AS
      BEGIN
          SET NOCOUNT ON;
          UPDATE ' + @TableName + ' SET ID_PROVINCIA = @ID_PROVINCIA, NOMBRE_CIUDAD = @NOMBRE_CIUDAD WHERE ' + @PrimaryKey + ' = @ID_CIUDAD;
      END')
  
      EXEC('
      CREATE PROCEDURE [dbo].[sp_Delete' + @TableName + ']
      @ID_CIUDAD INT
      AS
      BEGIN
          SET NOCOUNT ON;
          DELETE FROM ' + @TableName + ' WHERE ' + @PrimaryKey + ' = @ID_CIUDAD;
      END')
  
      EXEC('
      CREATE PROCEDURE [dbo].[sp_Select' + @TableName + ']
      AS
      BEGIN
          SET NOCOUNT ON;
          SELECT * FROM ' + @TableName + ';
      END')
  END
  ELSE
  BEGIN
      PRINT 'La tabla ' + @TableName + ' no tiene una clave primaria definida.'
  END
  
  `;

  try {
    const rows = await client.query(get_table_names);
    return new Response(JSON.stringify(rows));
  } catch (err) {
    return new Response(JSON.stringify(err.message));
  }
};