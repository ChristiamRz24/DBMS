/*==============================================================*/
/* DBMS name:      MySQL 5.0 (se usa el mismo para MariaDB)     */
/* Created on:     3/5/2024 1:09:21                             */
/*==============================================================*/

/*==============================================================*/
/* Table: ARTICULOS                                             */
/*==============================================================*/
create table ARTICULOS
(
   ID_ARTICULO          int not null auto_increment,
   NOMBRE_ARTICULO      varchar(75) not null,
   DESCRIPCION_ARTICULO varchar(250) not null,
   MARCA_ARTICULO       varchar(25),
   primary key (ID_ARTICULO)
);

/*==============================================================*/
/* Table: CIUDAD                                                */
/*==============================================================*/
create table CIUDAD
(
   ID_CIUDAD            int not null auto_increment,
   ID_PROVINCIA         int not null,
   NOMBRE_CIUDAD        varchar(50) not null,
   primary key (ID_CIUDAD)
);

/*==============================================================*/
/* Table: CLIENTE                                               */
/*==============================================================*/
create table CLIENTE
(
   ID_CLIENTE           int not null auto_increment,
   ID_CIUDAD            int not null,
   NOMBRE_CLIENTE       varchar(30) not null,
   APELLIDO_CLIENTE     varchar(15) not null,
   TELEFONO_CLIENTE     varchar(10) not null,
   DIRECCION_CLIENTE    varchar(250) not null,
   FECHA_NACIMIENTO_CLIENTE date not null,
   primary key (ID_CLIENTE)
);

/*==============================================================*/
/* Table: DETALLE_ARTICULOS                                     */
/*==============================================================*/
create table DETALLE_ARTICULOS
(
   ID_ARTICULO          int not null,
   ID_MUDANZA           int not null,
   CANTIDAD_ARTICULO    numeric(3,0) not null,
   PESO_ARTICULO        decimal(3,2) not null,
   primary key (ID_ARTICULO, ID_MUDANZA)
);

/*==============================================================*/
/* Table: DETALLE_MANTENIMIENTO                                 */
/*==============================================================*/
create table DETALLE_MANTENIMIENTO
(
   ID_MATENIMIENTO      int not null,
   ID_VEHICULO          int not null,
   FECHA_INICIO_MANTENIMIENTO date not null,
   FECHA_FIN_MANTENIMIENTO date not null,
   primary key (ID_MATENIMIENTO, ID_VEHICULO)
);

/*==============================================================*/
/* Table: DETALLE_MUDANZA                                       */
/*==============================================================*/
create table DETALLE_MUDANZA
(
   ID_MUDANZA           int not null,
   ID_SUCURSAL          int not null,
   ID_CLIENTE           int not null,
   ID_ESTADO_MUDANZA    int not null,
   primary key (ID_MUDANZA, ID_SUCURSAL)
);

/*==============================================================*/
/* Table: EMPLEADO                                              */
/*==============================================================*/
create table EMPLEADO
(
   ID_EMPLEADO          int not null auto_increment,
   ID_SUCURSAL          int,
   ID_TIPO_SUCURSAL2    int not null,
   ID_VEHICULO          int not null,
   NOMBRE_EMPLEADO      varchar(30) not null,
   APELLIDO_EMPLEADO    varchar(15) not null,
   TELEFONO_EMPLEADO    varchar(10) not null,
   DIRECCION_EMPLEADO   varchar(250) not null,
   FECHA_NACIMIENTO_EMPLEADO date not null,
   FECHA_INGRESO_EMPLEADO date not null,
   primary key (ID_EMPLEADO)
);

/*==============================================================*/
/* Table: EMPRESA                                               */
/*==============================================================*/
create table EMPRESA
(
   ID_EMPRESA           int not null auto_increment,
   NOMBRE_EMPRESA       varchar(75) not null,
   RUC_EMPRESA          varchar(15) not null,
   primary key (ID_EMPRESA)
);

/*==============================================================*/
/* Table: ESTADO_MUDANZA                                        */
/*==============================================================*/
create table ESTADO_MUDANZA
(
   ID_ESTADO_MUDANZA    int not null auto_increment,
   NOMBRE_ESTADO_MUDANZA varchar(15) not null,
   DETALLE_ESTADO_MUDANZA varchar(150) not null,
   primary key (ID_ESTADO_MUDANZA)
);

/*==============================================================*/
/* Table: ESTADO_VEHICULO                                       */
/*==============================================================*/
create table ESTADO_VEHICULO
(
   ID_ESTADO_VEHICULO   int not null auto_increment,
   NOMBRE_ESTADO_VEHICULO varchar(15) not null,
   DETALLE_ESTADO_VEHICULO varchar(75) not null,
   primary key (ID_ESTADO_VEHICULO)
);

/*==============================================================*/
/* Table: MATENIMIENTO                                          */
/*==============================================================*/
create table MATENIMIENTO
(
   ID_MATENIMIENTO      int not null auto_increment,
   EMPRESA_MATENIMIENTO varchar(50) not null,
   COSTO_MATENIMIENTO   decimal(3,2) not null,
   DESCUENTO_MANTENIMIENTO numeric(2,0) not null,
   primary key (ID_MATENIMIENTO)
);

/*==============================================================*/
/* Table: MUDANZA                                               */
/*==============================================================*/
create table MUDANZA
(
   ID_MUDANZA           int not null auto_increment,
   COSTO_MUDANZA        float(8,2) not null,
   DESCUEMTO_MUDANZA    numeric(2,0) not null,
   primary key (ID_MUDANZA)
);

/*==============================================================*/
/* Table: PROVINCIA                                             */
/*==============================================================*/
create table PROVINCIA
(
   ID_PROVINCIA         int not null auto_increment,
   NOMBRE_PROVINCIA     varchar(50) not null,
   primary key (ID_PROVINCIA)
);

/*==============================================================*/
/* Table: SUCURSAL                                              */
/*==============================================================*/
create table SUCURSAL
(
   ID_SUCURSAL          int not null auto_increment,
   ID_TIPO_SUCURSAL     int not null,
   ID_CIUDAD            int not null,
   ID_EMPRESA           int not null,
   TELEFONO_SUCURSAL    varchar(10) not null,
   DIRECCION_SUCURSAL   varchar(250) not null,
   primary key (ID_SUCURSAL)
);

/*==============================================================*/
/* Table: TIPO_EMPLEADO                                         */
/*==============================================================*/
create table TIPO_EMPLEADO
(
   ID_TIPO_SUCURSAL2    int not null auto_increment,
   NOMBRE_TIPO_EMPLEADO varchar(25) not null,
   DETALLE_TIPO_EMPLEADO varchar(150) not null,
   primary key (ID_TIPO_SUCURSAL2)
);

/*==============================================================*/
/* Table: TIPO_SUCURSAL                                         */
/*==============================================================*/
create table TIPO_SUCURSAL
(
   ID_TIPO_SUCURSAL     int not null auto_increment,
   NOMBRE_TIPO_EMPLEADO varchar(25) not null,
   DETALLE_TIPO_EMPLEADO varchar(150) not null,
   primary key (ID_TIPO_SUCURSAL)
);

/*==============================================================*/
/* Table: VEHICULO                                              */
/*==============================================================*/
create table VEHICULO
(
   ID_VEHICULO          int not null auto_increment,
   ID_ESTADO_VEHICULO   int not null,
   MATRICULA_VEHICULO   varchar(10) not null,
   MARCA_VEHICULO       varchar(10) not null,
   CAPACIDAD            numeric(3,0) not null,
   primary key (ID_VEHICULO)
);

alter table CIUDAD add constraint FK_CIUDAD_INCLUYE_PROVINCIA foreign key (ID_PROVINCIA)
      references PROVINCIA (ID_PROVINCIA) on delete restrict on update restrict;

alter table CLIENTE add constraint FK_UBICADO foreign key (ID_CIUDAD)
      references CIUDAD (ID_CIUDAD) on delete restrict on update restrict;

alter table DETALLE_ARTICULOS add constraint FK_MUDANZA_INCLUYE_ARTICULO foreign key (ID_ARTICULO)
      references ARTICULOS (ID_ARTICULO) on delete restrict on update restrict;

alter table DETALLE_ARTICULOS add constraint FK_ARTICULO_INCLUYE_MUDANZA foreign key (ID_MUDANZA)
      references MUDANZA (ID_MUDANZA) on delete restrict on update restrict;

alter table DETALLE_MANTENIMIENTO add constraint FK_VEHICULO_NECESITA_MANTENIM foreign key (ID_MATENIMIENTO)
      references MATENIMIENTO (ID_MATENIMIENTO) on delete restrict on update restrict;

alter table DETALLE_MANTENIMIENTO add constraint FK_MANTENIM_NECESITA_VEHICULO foreign key (ID_VEHICULO)
      references VEHICULO (ID_VEHICULO) on delete restrict on update restrict;

alter table DETALLE_MUDANZA add constraint FK_SUCURSAL_REALIZAN_MUDANZA foreign key (ID_MUDANZA)
      references MUDANZA (ID_MUDANZA) on delete restrict on update restrict;

alter table DETALLE_MUDANZA add constraint FK_MUDANZA_REALIZAN_SUCURSAL foreign key (ID_SUCURSAL)
      references SUCURSAL (ID_SUCURSAL) on delete restrict on update restrict;

alter table DETALLE_MUDANZA add constraint FK_MUDANZA_SOLICITA_CLIENTE foreign key (ID_CLIENTE)
      references CLIENTE (ID_CLIENTE) on delete restrict on update restrict;

alter table DETALLE_MUDANZA add constraint FK_MUDANZA_TIENE_ESTADO foreign key (ID_ESTADO_MUDANZA)
      references ESTADO_MUDANZA (ID_ESTADO_MUDANZA) on delete restrict on update restrict;

alter table EMPLEADO add constraint FK_ASIGNADO foreign key (ID_VEHICULO)
      references VEHICULO (ID_VEHICULO) on delete restrict on update restrict;

alter table EMPLEADO add constraint FK_CONTRATA foreign key (ID_SUCURSAL)
      references SUCURSAL (ID_SUCURSAL) on delete restrict on update restrict;

alter table EMPLEADO add constraint FK_EMPLEADO_PERTENECE_TIPO foreign key (ID_TIPO_SUCURSAL2)
      references TIPO_EMPLEADO (ID_TIPO_SUCURSAL2) on delete restrict on update restrict;

alter table SUCURSAL add constraint FK_SUCURSAL_PERTENECE_TIPO foreign key (ID_TIPO_SUCURSAL)
      references TIPO_SUCURSAL (ID_TIPO_SUCURSAL) on delete restrict on update restrict;

alter table SUCURSAL add constraint FK_TIENE foreign key (ID_EMPRESA)
      references EMPRESA (ID_EMPRESA) on delete restrict on update restrict;

alter table SUCURSAL add constraint FK_UBICADAS foreign key (ID_CIUDAD)
      references CIUDAD (ID_CIUDAD) on delete restrict on update restrict;

alter table VEHICULO add constraint FK_VEHICULO_TIENE_ESTADO foreign key (ID_ESTADO_VEHICULO)
      references ESTADO_VEHICULO (ID_ESTADO_VEHICULO) on delete restrict on update restrict;

