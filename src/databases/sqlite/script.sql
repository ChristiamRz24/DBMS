--==============================================================
-- DBMS name:      ANSI Level 2
-- Created on:     3/5/2024 18:14:53
--==============================================================

--==============================================================
-- Table: ARTICULOS
--==============================================================
create table ARTICULOS (
ID_ARTICULO          NUMERIC(6)           not null,
NOMBRE_ARTICULO      VARCHAR(75)          not null,
DESCRIPCION_ARTICULO VARCHAR(250)         not null,
MARCA_ARTICULO       VARCHAR(25),
primary key (ID_ARTICULO)
);

--==============================================================
-- Table: PROVINCIA
--==============================================================
create table PROVINCIA (
ID_PROVINCIA         NUMERIC(6)           not null,
NOMBRE_PROVINCIA     VARCHAR(50)          not null,
primary key (ID_PROVINCIA)
);

--==============================================================
-- Table: CIUDAD
--==============================================================
create table CIUDAD (
ID_CIUDAD            NUMERIC(6)           not null,
ID_PROVINCIA         INTEGER              not null,
NOMBRE_CIUDAD        VARCHAR(50)          not null,
primary key (ID_CIUDAD),
foreign key (ID_PROVINCIA)
      references PROVINCIA (ID_PROVINCIA)
);

--==============================================================
-- Table: CLIENTE
--==============================================================
create table CLIENTE (
ID_CLIENTE           NUMERIC(6)           not null,
ID_CIUDAD            INTEGER              not null,
NOMBRE_CLIENTE       VARCHAR(30)          not null,
APELLIDO_CLIENTE     VARCHAR(15)          not null,
TELEFONO_CLIENTE     VARCHAR(10)          not null,
DIRECCION_CLIENTE    VARCHAR(250)         not null,
FECHA_NACIMIENTO_CLIENTE DATE                 not null,
primary key (ID_CLIENTE),
foreign key (ID_CIUDAD)
      references CIUDAD (ID_CIUDAD)
);

--==============================================================
-- Table: MUDANZA
--==============================================================
create table MUDANZA (
ID_MUDANZA           NUMERIC(6)           not null,
COSTO_MUDANZA        FLOAT(8)             not null,
DESCUEMTO_MUDANZA    NUMERIC(2,0)         not null,
primary key (ID_MUDANZA)
);

--==============================================================
-- Table: DETALLE_ARTICULOS
--==============================================================
create table DETALLE_ARTICULOS (
ID_ARTICULO          INTEGER              not null,
ID_MUDANZA           INTEGER              not null,
CANTIDAD_ARTICULO    NUMERIC(3,0)         not null,
PESO_ARTICULO        NUMERIC(3,2)         not null,
primary key (ID_ARTICULO, ID_MUDANZA),
foreign key (ID_MUDANZA)
      references MUDANZA (ID_MUDANZA),
foreign key (ID_ARTICULO)
      references ARTICULOS (ID_ARTICULO)
);

--==============================================================
-- Table: ESTADO_VEHICULO
--==============================================================
create table ESTADO_VEHICULO (
ID_ESTADO_VEHICULO   NUMERIC(6)           not null,
NOMBRE_ESTADO_VEHICULO VARCHAR(15)          not null,
DETALLE_ESTADO_VEHICULO VARCHAR(75)          not null,
primary key (ID_ESTADO_VEHICULO)
);

--==============================================================
-- Table: VEHICULO
--==============================================================
create table VEHICULO (
ID_VEHICULO          NUMERIC(6)           not null,
ID_ESTADO_VEHICULO   INTEGER              not null,
MATRICULA_VEHICULO   VARCHAR(10)          not null,
MARCA_VEHICULO       VARCHAR(10)          not null,
CAPACIDAD            NUMERIC(3,0)         not null,
primary key (ID_VEHICULO),
foreign key (ID_ESTADO_VEHICULO)
      references ESTADO_VEHICULO (ID_ESTADO_VEHICULO)
);

--==============================================================
-- Table: MATENIMIENTO
--==============================================================
create table MATENIMIENTO (
ID_MATENIMIENTO      NUMERIC(6)           not null,
EMPRESA_MATENIMIENTO VARCHAR(50)          not null,
COSTO_MATENIMIENTO   NUMERIC(3,2)         not null,
DESCUENTO_MANTENIMIENTO NUMERIC(2,0)         not null,
primary key (ID_MATENIMIENTO)
);

--==============================================================
-- Table: DETALLE_MANTENIMIENTO
--==============================================================
create table DETALLE_MANTENIMIENTO (
ID_MATENIMIENTO      INTEGER              not null,
ID_VEHICULO          INTEGER              not null,
FECHA_INICIO_MANTENIMIENTO DATE                 not null,
FECHA_FIN_MANTENIMIENTO DATE                 not null,
primary key (ID_MATENIMIENTO, ID_VEHICULO),
foreign key (ID_VEHICULO)
      references VEHICULO (ID_VEHICULO),
foreign key (ID_MATENIMIENTO)
      references MATENIMIENTO (ID_MATENIMIENTO)
);

--==============================================================
-- Table: EMPRESA
--==============================================================
create table EMPRESA (
ID_EMPRESA           NUMERIC(6)           not null,
NOMBRE_EMPRESA       VARCHAR(75)          not null,
RUC_EMPRESA          VARCHAR(15)          not null,
primary key (ID_EMPRESA)
);

--==============================================================
-- Table: TIPO_SUCURSAL
--==============================================================
create table TIPO_SUCURSAL (
ID_TIPO_SUCURSAL     NUMERIC(6)           not null,
NOMBRE_TIPO_EMPLEADO VARCHAR(25)          not null,
DETALLE_TIPO_EMPLEADO VARCHAR(150)         not null,
primary key (ID_TIPO_SUCURSAL)
);

--==============================================================
-- Table: SUCURSAL
--==============================================================
create table SUCURSAL (
ID_SUCURSAL          NUMERIC(6)           not null,
ID_TIPO_SUCURSAL     INTEGER              not null,
ID_CIUDAD            INTEGER              not null,
ID_EMPRESA           INTEGER              not null,
TELEFONO_SUCURSAL    VARCHAR(10)          not null,
DIRECCION_SUCURSAL   VARCHAR(250)         not null,
primary key (ID_SUCURSAL),
foreign key (ID_EMPRESA)
      references EMPRESA (ID_EMPRESA),
foreign key (ID_TIPO_SUCURSAL)
      references TIPO_SUCURSAL (ID_TIPO_SUCURSAL),
foreign key (ID_CIUDAD)
      references CIUDAD (ID_CIUDAD)
);

--==============================================================
-- Table: ESTADO_MUDANZA
--==============================================================
create table ESTADO_MUDANZA (
ID_ESTADO_MUDANZA    NUMERIC(6)           not null,
NOMBRE_ESTADO_MUDANZA VARCHAR(15)          not null,
DETALLE_ESTADO_MUDANZA VARCHAR(150)         not null,
primary key (ID_ESTADO_MUDANZA)
);

--==============================================================
-- Table: DETALLE_MUDANZA
--==============================================================
create table DETALLE_MUDANZA (
ID_MUDANZA           INTEGER              not null,
ID_SUCURSAL          INTEGER              not null,
ID_CLIENTE           INTEGER              not null,
ID_ESTADO_MUDANZA    INTEGER              not null,
primary key (ID_MUDANZA, ID_SUCURSAL),
foreign key (ID_SUCURSAL)
      references SUCURSAL (ID_SUCURSAL),
foreign key (ID_MUDANZA)
      references MUDANZA (ID_MUDANZA),
foreign key (ID_CLIENTE)
      references CLIENTE (ID_CLIENTE),
foreign key (ID_ESTADO_MUDANZA)
      references ESTADO_MUDANZA (ID_ESTADO_MUDANZA)
);

--==============================================================
-- Table: TIPO_EMPLEADO
--==============================================================
create table TIPO_EMPLEADO (
ID_TIPO_SUCURSAL2    NUMERIC(6)           not null,
NOMBRE_TIPO_EMPLEADO VARCHAR(25)          not null,
DETALLE_TIPO_EMPLEADO VARCHAR(150)         not null,
primary key (ID_TIPO_SUCURSAL2)
);

--==============================================================
-- Table: EMPLEADO
--==============================================================
create table EMPLEADO (
ID_EMPLEADO          NUMERIC(6)           not null,
ID_SUCURSAL          INTEGER,
ID_TIPO_SUCURSAL2    INTEGER              not null,
ID_VEHICULO          INTEGER              not null,
NOMBRE_EMPLEADO      VARCHAR(30)          not null,
APELLIDO_EMPLEADO    VARCHAR(15)          not null,
TELEFONO_EMPLEADO    VARCHAR(10)          not null,
DIRECCION_EMPLEADO   VARCHAR(250)         not null,
FECHA_NACIMIENTO_EMPLEADO DATE                 not null,
FECHA_INGRESO_EMPLEADO DATE                 not null,
primary key (ID_EMPLEADO),
foreign key (ID_SUCURSAL)
      references SUCURSAL (ID_SUCURSAL),
foreign key (ID_TIPO_SUCURSAL2)
      references TIPO_EMPLEADO (ID_TIPO_SUCURSAL2),
foreign key (ID_VEHICULO)
      references VEHICULO (ID_VEHICULO)
);

