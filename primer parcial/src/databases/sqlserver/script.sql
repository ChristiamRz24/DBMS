/*==============================================================*/
/* DBMS name:      Microsoft SQL Server 2008                    */
/* Created on:     3/5/2024 1:12:04                             */
/*==============================================================*/

/*==============================================================*/
/* Table: ARTICULOS                                             */
/*==============================================================*/
create table ARTICULOS (
   ID_ARTICULO          int                  identity,
   NOMBRE_ARTICULO      varchar(75)          not null,
   DESCRIPCION_ARTICULO varchar(250)         not null,
   MARCA_ARTICULO       varchar(25)          null,
   constraint PK_ARTICULOS primary key nonclustered (ID_ARTICULO)
)
go

/*==============================================================*/
/* Table: CIUDAD                                                */
/*==============================================================*/
create table CIUDAD (
   ID_CIUDAD            int                  identity,
   ID_PROVINCIA         int                  not null,
   NOMBRE_CIUDAD        varchar(50)          not null,
   constraint PK_CIUDAD primary key nonclustered (ID_CIUDAD)
)
go

/*==============================================================*/
/* Table: CLIENTE                                               */
/*==============================================================*/
create table CLIENTE (
   ID_CLIENTE           int                  identity,
   ID_CIUDAD            int                  not null,
   NOMBRE_CLIENTE       varchar(30)          not null,
   APELLIDO_CLIENTE     varchar(15)          not null,
   TELEFONO_CLIENTE     varchar(10)          not null,
   DIRECCION_CLIENTE    varchar(250)         not null,
   FECHA_NACIMIENTO_CLIENTE datetime             not null,
   constraint PK_CLIENTE primary key nonclustered (ID_CLIENTE)
)
go

/*==============================================================*/
/* Table: DETALLE_ARTICULOS                                     */
/*==============================================================*/
create table DETALLE_ARTICULOS (
   ID_ARTICULO          int                  not null,
   ID_MUDANZA           int                  not null,
   CANTIDAD_ARTICULO    numeric(3,0)         not null,
   PESO_ARTICULO        decimal(3,2)         not null,
   constraint PK_DETALLE_ARTICULOS primary key nonclustered (ID_ARTICULO, ID_MUDANZA)
)
go

/*==============================================================*/
/* Table: DETALLE_MANTENIMIENTO                                 */
/*==============================================================*/
create table DETALLE_MANTENIMIENTO (
   ID_MATENIMIENTO      int                  not null,
   ID_VEHICULO          int                  not null,
   FECHA_INICIO_MANTENIMIENTO datetime             not null,
   FECHA_FIN_MANTENIMIENTO datetime             not null,
   constraint PK_DETALLE_MANTENIMIENTO primary key nonclustered (ID_MATENIMIENTO, ID_VEHICULO)
)
go

/*==============================================================*/
/* Table: DETALLE_MUDANZA                                       */
/*==============================================================*/
create table DETALLE_MUDANZA (
   ID_MUDANZA           int                  not null,
   ID_SUCURSAL          int                  not null,
   ID_CLIENTE           int                  not null,
   ID_ESTADO_MUDANZA    int                  not null,
   constraint PK_DETALLE_MUDANZA primary key nonclustered (ID_MUDANZA, ID_SUCURSAL)
)
go

/*==============================================================*/
/* Table: EMPLEADO                                              */
/*==============================================================*/
create table EMPLEADO (
   ID_EMPLEADO          int                  identity,
   ID_SUCURSAL          int                  null,
   ID_TIPO_SUCURSAL2    int                  not null,
   ID_VEHICULO          int                  not null,
   NOMBRE_EMPLEADO      varchar(30)          not null,
   APELLIDO_EMPLEADO    varchar(15)          not null,
   TELEFONO_EMPLEADO    varchar(10)          not null,
   DIRECCION_EMPLEADO   varchar(250)         not null,
   FECHA_NACIMIENTO_EMPLEADO datetime             not null,
   FECHA_INGRESO_EMPLEADO datetime             not null,
   constraint PK_EMPLEADO primary key nonclustered (ID_EMPLEADO)
)
go

/*==============================================================*/
/* Table: EMPRESA                                               */
/*==============================================================*/
create table EMPRESA (
   ID_EMPRESA           int                  identity,
   NOMBRE_EMPRESA       varchar(75)          not null,
   RUC_EMPRESA          varchar(15)          not null,
   constraint PK_EMPRESA primary key nonclustered (ID_EMPRESA)
)
go

/*==============================================================*/
/* Table: ESTADO_MUDANZA                                        */
/*==============================================================*/
create table ESTADO_MUDANZA (
   ID_ESTADO_MUDANZA    int                  identity,
   NOMBRE_ESTADO_MUDANZA varchar(15)          not null,
   DETALLE_ESTADO_MUDANZA varchar(150)         not null,
   constraint PK_ESTADO_MUDANZA primary key nonclustered (ID_ESTADO_MUDANZA)
)
go

/*==============================================================*/
/* Table: ESTADO_VEHICULO                                       */
/*==============================================================*/
create table ESTADO_VEHICULO (
   ID_ESTADO_VEHICULO   int                  identity,
   NOMBRE_ESTADO_VEHICULO varchar(15)          not null,
   DETALLE_ESTADO_VEHICULO varchar(75)          not null,
   constraint PK_ESTADO_VEHICULO primary key nonclustered (ID_ESTADO_VEHICULO)
)
go

/*==============================================================*/
/* Table: MATENIMIENTO                                          */
/*==============================================================*/
create table MATENIMIENTO (
   ID_MATENIMIENTO      int                  identity,
   EMPRESA_MATENIMIENTO varchar(50)          not null,
   COSTO_MATENIMIENTO   decimal(3,2)         not null,
   DESCUENTO_MANTENIMIENTO numeric(2,0)         not null,
   constraint PK_MATENIMIENTO primary key nonclustered (ID_MATENIMIENTO)
)
go

/*==============================================================*/
/* Table: MUDANZA                                               */
/*==============================================================*/
create table MUDANZA (
   ID_MUDANZA           int                  identity,
   COSTO_MUDANZA        float(8)             not null,
   DESCUEMTO_MUDANZA    numeric(2,0)         not null,
   constraint PK_MUDANZA primary key nonclustered (ID_MUDANZA)
)
go

/*==============================================================*/
/* Table: PROVINCIA                                             */
/*==============================================================*/
create table PROVINCIA (
   ID_PROVINCIA         int                  identity,
   NOMBRE_PROVINCIA     varchar(50)          not null,
   constraint PK_PROVINCIA primary key nonclustered (ID_PROVINCIA)
)
go

/*==============================================================*/
/* Table: SUCURSAL                                              */
/*==============================================================*/
create table SUCURSAL (
   ID_SUCURSAL          int                  identity,
   ID_TIPO_SUCURSAL     int                  not null,
   ID_CIUDAD            int                  not null,
   ID_EMPRESA           int                  not null,
   TELEFONO_SUCURSAL    varchar(10)          not null,
   DIRECCION_SUCURSAL   varchar(250)         not null,
   constraint PK_SUCURSAL primary key nonclustered (ID_SUCURSAL)
)
go

/*==============================================================*/
/* Table: TIPO_EMPLEADO                                         */
/*==============================================================*/
create table TIPO_EMPLEADO (
   ID_TIPO_SUCURSAL2    int                  identity,
   NOMBRE_TIPO_EMPLEADO varchar(25)          not null,
   DETALLE_TIPO_EMPLEADO varchar(150)         not null,
   constraint PK_TIPO_EMPLEADO primary key nonclustered (ID_TIPO_SUCURSAL2)
)
go

/*==============================================================*/
/* Table: TIPO_SUCURSAL                                         */
/*==============================================================*/
create table TIPO_SUCURSAL (
   ID_TIPO_SUCURSAL     int                  identity,
   NOMBRE_TIPO_EMPLEADO varchar(25)          not null,
   DETALLE_TIPO_EMPLEADO varchar(150)         not null,
   constraint PK_TIPO_SUCURSAL primary key nonclustered (ID_TIPO_SUCURSAL)
)
go

/*==============================================================*/
/* Table: VEHICULO                                              */
/*==============================================================*/
create table VEHICULO (
   ID_VEHICULO          int                  identity,
   ID_ESTADO_VEHICULO   int                  not null,
   MATRICULA_VEHICULO   varchar(10)          not null,
   MARCA_VEHICULO       varchar(10)          not null,
   CAPACIDAD            numeric(3,0)         not null,
   constraint PK_VEHICULO primary key nonclustered (ID_VEHICULO)
)
go

alter table CIUDAD
   add constraint FK_CIUDAD_INCLUYE_PROVINCIA foreign key (ID_PROVINCIA)
      references PROVINCIA (ID_PROVINCIA)
go

alter table CLIENTE
   add constraint FK_CLIENTE_UBICADO_CIUDAD foreign key (ID_CIUDAD)
      references CIUDAD (ID_CIUDAD)
go

alter table DETALLE_ARTICULOS
   add constraint FK_MUDANZA_INCLUYE_ARTICULO foreign key (ID_ARTICULO)
      references ARTICULOS (ID_ARTICULO)
go

alter table DETALLE_ARTICULOS
   add constraint FK_ARTICULO_INCLUYE_MUDANZA foreign key (ID_MUDANZA)
      references MUDANZA (ID_MUDANZA)
go

alter table DETALLE_MANTENIMIENTO
   add constraint FK_VEHICULO_NECESITA_MANTENIM foreign key (ID_MATENIMIENTO)
      references MATENIMIENTO (ID_MATENIMIENTO)
go

alter table DETALLE_MANTENIMIENTO
   add constraint FK_MANTENIM_NECESITA_VEHICULO foreign key (ID_VEHICULO)
      references VEHICULO (ID_VEHICULO)
go

alter table DETALLE_MUDANZA
   add constraint FK_SUCURSAL_REALIZAN_MUDANZA foreign key (ID_MUDANZA)
      references MUDANZA (ID_MUDANZA)
go

alter table DETALLE_MUDANZA
   add constraint FK_MUDANZA_REALIZAN_SUCURSAL foreign key (ID_SUCURSAL)
      references SUCURSAL (ID_SUCURSAL)
go

alter table DETALLE_MUDANZA
   add constraint FK_MUDANZA_SOLICITA_CLIENTE foreign key (ID_CLIENTE)
      references CLIENTE (ID_CLIENTE)
go

alter table DETALLE_MUDANZA
   add constraint FK_MUDANZA_TIENE_ESTADO foreign key (ID_ESTADO_MUDANZA)
      references ESTADO_MUDANZA (ID_ESTADO_MUDANZA)
go

alter table EMPLEADO
   add constraint FK_EMPLEADO_ASIGNADO_VEHICULO foreign key (ID_VEHICULO)
      references VEHICULO (ID_VEHICULO)
go

alter table EMPLEADO
   add constraint FK_EMPLEADO_CONTRATA_SUCURSAL foreign key (ID_SUCURSAL)
      references SUCURSAL (ID_SUCURSAL)
go

alter table EMPLEADO
   add constraint FK_EMPLEADO_PERTENECE_TIPO foreign key (ID_TIPO_SUCURSAL2)
      references TIPO_EMPLEADO (ID_TIPO_SUCURSAL2)
go

alter table SUCURSAL
   add constraint FK_SUCURSAL_PERTENECE_TIPO foreign key (ID_TIPO_SUCURSAL)
      references TIPO_SUCURSAL (ID_TIPO_SUCURSAL)
go

alter table SUCURSAL
   add constraint FK_SUCURSAL_TIENE_EMPRESA foreign key (ID_EMPRESA)
      references EMPRESA (ID_EMPRESA)
go

alter table SUCURSAL
   add constraint FK_SUCURSAL_UBICADAS_CIUDAD foreign key (ID_CIUDAD)
      references CIUDAD (ID_CIUDAD)
go

alter table VEHICULO
   add constraint FK_VEHICULO_TIENE_ESTADO foreign key (ID_ESTADO_VEHICULO)
      references ESTADO_VEHICULO (ID_ESTADO_VEHICULO)
go

