/*==============================================================*/
/* DBMS name:      PostgreSQL 8                                 */
/* Created on:     26/4/2024 1:57:28                            */
/*==============================================================*/

/*==============================================================*/
/* Table: ARTICULOS                                             */
/*==============================================================*/
create table ARTICULOS (
   ID_ARTICULO          SERIAL               not null,
   NOMBRE_ARTICULO      VARCHAR(75)          not null,
   DESCRIPCION_ARTICULO VARCHAR(250)         not null,
   MARCA_ARTICULO       VARCHAR(25)          null,
   constraint PK_ARTICULOS primary key (ID_ARTICULO)
);

/*==============================================================*/
/* Index: ARTICULOS_PK                                          */
/*==============================================================*/
create unique index ARTICULOS_PK on ARTICULOS (
ID_ARTICULO
);

/*==============================================================*/
/* Table: CIUDAD                                                */
/*==============================================================*/
create table CIUDAD (
   ID_CIUDAD            SERIAL               not null,
   ID_PROVINCIA         INT4                 not null,
   NOMBRE_CIUDAD        VARCHAR(50)          not null,
   constraint PK_CIUDAD primary key (ID_CIUDAD)
);

/*==============================================================*/
/* Index: CIUDAD_PK                                             */
/*==============================================================*/
create unique index CIUDAD_PK on CIUDAD (
ID_CIUDAD
);

/*==============================================================*/
/* Index: RELATIONSHIP_17_FK                                    */
/*==============================================================*/
create  index RELATIONSHIP_17_FK on CIUDAD (
ID_PROVINCIA
);

/*==============================================================*/
/* Table: CLIENTE                                               */
/*==============================================================*/
create table CLIENTE (
   ID_CLIENTE           SERIAL               not null,
   ID_CIUDAD            INT4                 not null,
   NOMBRE_CLIENTE       VARCHAR(30)          not null,
   APELLIDO_CLIENTE     VARCHAR(15)          not null,
   TELEFONO_CLIENTE     VARCHAR(10)          not null,
   DIRECCION_CLIENTE    VARCHAR(250)         not null,
   FECHA_NACIMIENTO_CLIENTE DATE                 not null,
   constraint PK_CLIENTE primary key (ID_CLIENTE)
);

/*==============================================================*/
/* Index: CLIENTE_PK                                            */
/*==============================================================*/
create unique index CLIENTE_PK on CLIENTE (
ID_CLIENTE
);

/*==============================================================*/
/* Index: UBICADO_FK                                            */
/*==============================================================*/
create  index UBICADO_FK on CLIENTE (
ID_CIUDAD
);

/*==============================================================*/
/* Table: DETALLE_ARTICULOS                                     */
/*==============================================================*/
create table DETALLE_ARTICULOS (
   ID_ARTICULO          INT4                 not null,
   ID_MUDANZA           INT4                 not null,
   CANTIDAD_ARTICULO    NUMERIC(3)           not null,
   PESO_ARTICULO        DECIMAL(3,2)         not null,
   constraint PK_DETALLE_ARTICULOS primary key (ID_ARTICULO, ID_MUDANZA)
);

/*==============================================================*/
/* Index: DETALLE_ARTICULOS_PK                                  */
/*==============================================================*/
create unique index DETALLE_ARTICULOS_PK on DETALLE_ARTICULOS (
ID_ARTICULO,
ID_MUDANZA
);

/*==============================================================*/
/* Index: INCLUYE_MD_FK                                         */
/*==============================================================*/
create  index INCLUYE_MD_FK on DETALLE_ARTICULOS (
ID_MUDANZA
);

/*==============================================================*/
/* Index: INCLUYE_DM_FK                                         */
/*==============================================================*/
create  index INCLUYE_DM_FK on DETALLE_ARTICULOS (
ID_ARTICULO
);

/*==============================================================*/
/* Table: DETALLE_MANTENIMIENTO                                 */
/*==============================================================*/
create table DETALLE_MANTENIMIENTO (
   ID_MATENIMIENTO      INT4                 not null,
   ID_VEHICULO          INT4                 not null,
   FECHA_INICIO_MANTENIMIENTO DATE                 not null,
   FECHA_FIN_MANTENIMIENTO DATE                 not null,
   constraint PK_DETALLE_MANTENIMIENTO primary key (ID_MATENIMIENTO, ID_VEHICULO)
);

/*==============================================================*/
/* Index: DETALLE_MANTENIMIENTO_PK                              */
/*==============================================================*/
create unique index DETALLE_MANTENIMIENTO_PK on DETALLE_MANTENIMIENTO (
ID_MATENIMIENTO,
ID_VEHICULO
);

/*==============================================================*/
/* Index: NECESITA_VD_FK                                        */
/*==============================================================*/
create  index NECESITA_VD_FK on DETALLE_MANTENIMIENTO (
ID_VEHICULO
);

/*==============================================================*/
/* Index: NECESITA_DV_FK                                        */
/*==============================================================*/
create  index NECESITA_DV_FK on DETALLE_MANTENIMIENTO (
ID_MATENIMIENTO
);

/*==============================================================*/
/* Table: DETALLE_MUDANZA                                       */
/*==============================================================*/
create table DETALLE_MUDANZA (
   ID_MUDANZA           INT4                 not null,
   ID_SUCURSAL          INT4                 not null,
   ID_CLIENTE           INT4                 not null,
   ID_ESTADO_MUDANZA    INT4                 not null,
   constraint PK_DETALLE_MUDANZA primary key (ID_MUDANZA, ID_SUCURSAL)
);

/*==============================================================*/
/* Index: DETALLE_MUDANZA_PK                                    */
/*==============================================================*/
create unique index DETALLE_MUDANZA_PK on DETALLE_MUDANZA (
ID_MUDANZA,
ID_SUCURSAL
);

/*==============================================================*/
/* Index: REALIZAN_SD_FK                                        */
/*==============================================================*/
create  index REALIZAN_SD_FK on DETALLE_MUDANZA (
ID_SUCURSAL
);

/*==============================================================*/
/* Index: REALIZAN_DM_FK                                        */
/*==============================================================*/
create  index REALIZAN_DM_FK on DETALLE_MUDANZA (
ID_MUDANZA
);

/*==============================================================*/
/* Index: SOLICITA_FK                                           */
/*==============================================================*/
create  index SOLICITA_FK on DETALLE_MUDANZA (
ID_CLIENTE
);

/*==============================================================*/
/* Index: TIENE_ESTADO_MUDANZA_FK                               */
/*==============================================================*/
create  index TIENE_ESTADO_MUDANZA_FK on DETALLE_MUDANZA (
ID_ESTADO_MUDANZA
);

/*==============================================================*/
/* Table: EMPLEADO                                              */
/*==============================================================*/
create table EMPLEADO (
   ID_EMPLEADO          SERIAL               not null,
   ID_SUCURSAL          INT4                 null,
   ID_TIPO_SUCURSAL2    INT4                 not null,
   ID_VEHICULO          INT4                 not null,
   NOMBRE_EMPLEADO      VARCHAR(30)          not null,
   APELLIDO_EMPLEADO    VARCHAR(15)          not null,
   TELEFONO_EMPLEADO    VARCHAR(10)          not null,
   DIRECCION_EMPLEADO   VARCHAR(250)         not null,
   FECHA_NACIMIENTO_EMPLEADO DATE                 not null,
   FECHA_INGRESO_EMPLEADO DATE                 not null,
   constraint PK_EMPLEADO primary key (ID_EMPLEADO)
);

/*==============================================================*/
/* Index: EMPLEADO_PK                                           */
/*==============================================================*/
create unique index EMPLEADO_PK on EMPLEADO (
ID_EMPLEADO
);

/*==============================================================*/
/* Index: CONTRATA_FK                                           */
/*==============================================================*/
create  index CONTRATA_FK on EMPLEADO (
ID_SUCURSAL
);

/*==============================================================*/
/* Index: PERTENECE_TIPO_EMPLEADO_FK                            */
/*==============================================================*/
create  index PERTENECE_TIPO_EMPLEADO_FK on EMPLEADO (
ID_TIPO_SUCURSAL2
);

/*==============================================================*/
/* Index: ASIGNADO_FK                                           */
/*==============================================================*/
create  index ASIGNADO_FK on EMPLEADO (
ID_VEHICULO
);

/*==============================================================*/
/* Table: EMPRESA                                               */
/*==============================================================*/
create table EMPRESA (
   ID_EMPRESA           SERIAL               not null,
   NOMBRE_EMPRESA       VARCHAR(75)          not null,
   RUC_EMPRESA          VARCHAR(15)          not null,
   constraint PK_EMPRESA primary key (ID_EMPRESA)
);

/*==============================================================*/
/* Index: EMPRESA_PK                                            */
/*==============================================================*/
create unique index EMPRESA_PK on EMPRESA (
ID_EMPRESA
);

/*==============================================================*/
/* Table: ESTADO_MUDANZA                                        */
/*==============================================================*/
create table ESTADO_MUDANZA (
   ID_ESTADO_MUDANZA    SERIAL               not null,
   NOMBRE_ESTADO_MUDANZA VARCHAR(15)          not null,
   DETALLE_ESTADO_MUDANZA VARCHAR(150)         not null,
   constraint PK_ESTADO_MUDANZA primary key (ID_ESTADO_MUDANZA)
);

/*==============================================================*/
/* Index: ESTADO_MUDANZA_PK                                     */
/*==============================================================*/
create unique index ESTADO_MUDANZA_PK on ESTADO_MUDANZA (
ID_ESTADO_MUDANZA
);

/*==============================================================*/
/* Table: ESTADO_VEHICULO                                       */
/*==============================================================*/
create table ESTADO_VEHICULO (
   ID_ESTADO_VEHICULO   SERIAL               not null,
   NOMBRE_ESTADO_VEHICULO VARCHAR(15)          not null,
   DETALLE_ESTADO_VEHICULO VARCHAR(75)          not null,
   constraint PK_ESTADO_VEHICULO primary key (ID_ESTADO_VEHICULO)
);

/*==============================================================*/
/* Index: ESTADO_VEHICULO_PK                                    */
/*==============================================================*/
create unique index ESTADO_VEHICULO_PK on ESTADO_VEHICULO (
ID_ESTADO_VEHICULO
);

/*==============================================================*/
/* Table: MATENIMIENTO                                          */
/*==============================================================*/
create table MATENIMIENTO (
   ID_MATENIMIENTO      SERIAL               not null,
   EMPRESA_MATENIMIENTO VARCHAR(50)          not null,
   COSTO_MATENIMIENTO   DECIMAL(3,2)         not null,
   DESCUENTO_MANTENIMIENTO NUMERIC(2)           not null,
   constraint PK_MATENIMIENTO primary key (ID_MATENIMIENTO)
);

/*==============================================================*/
/* Index: MATENIMIENTO_PK                                       */
/*==============================================================*/
create unique index MATENIMIENTO_PK on MATENIMIENTO (
ID_MATENIMIENTO
);

/*==============================================================*/
/* Table: MUDANZA                                               */
/*==============================================================*/
create table MUDANZA (
   ID_MUDANZA           SERIAL               not null,
   COSTO_MUDANZA        MONEY                not null,
   DESCUEMTO_MUDANZA    NUMERIC(2,0)         not null,
   constraint PK_MUDANZA primary key (ID_MUDANZA)
);

/*==============================================================*/
/* Index: MUDANZA_PK                                            */
/*==============================================================*/
create unique index MUDANZA_PK on MUDANZA (
ID_MUDANZA
);

/*==============================================================*/
/* Table: PROVINCIA                                             */
/*==============================================================*/
create table PROVINCIA (
   ID_PROVINCIA         SERIAL               not null,
   NOMBRE_PROVINCIA     VARCHAR(50)          not null,
   constraint PK_PROVINCIA primary key (ID_PROVINCIA)
);

/*==============================================================*/
/* Index: PROVINCIA_PK                                          */
/*==============================================================*/
create unique index PROVINCIA_PK on PROVINCIA (
ID_PROVINCIA
);

/*==============================================================*/
/* Table: SUCURSAL                                              */
/*==============================================================*/
create table SUCURSAL (
   ID_SUCURSAL          SERIAL               not null,
   ID_TIPO_SUCURSAL     INT4                 not null,
   ID_CIUDAD            INT4                 not null,
   ID_EMPRESA           INT4                 not null,
   TELEFONO_SUCURSAL    VARCHAR(10)          not null,
   DIRECCION_SUCURSAL   VARCHAR(250)         not null,
   constraint PK_SUCURSAL primary key (ID_SUCURSAL)
);

/*==============================================================*/
/* Index: SUCURSAL_PK                                           */
/*==============================================================*/
create unique index SUCURSAL_PK on SUCURSAL (
ID_SUCURSAL
);

/*==============================================================*/
/* Index: TIENE_FK                                              */
/*==============================================================*/
create  index TIENE_FK on SUCURSAL (
ID_EMPRESA
);

/*==============================================================*/
/* Index: PERTENECE_TIPO_SUCURSAL_FK                            */
/*==============================================================*/
create  index PERTENECE_TIPO_SUCURSAL_FK on SUCURSAL (
ID_TIPO_SUCURSAL
);

/*==============================================================*/
/* Index: UBICADAS_FK                                           */
/*==============================================================*/
create  index UBICADAS_FK on SUCURSAL (
ID_CIUDAD
);

/*==============================================================*/
/* Table: TIPO_EMPLEADO                                         */
/*==============================================================*/
create table TIPO_EMPLEADO (
   ID_TIPO_SUCURSAL2    SERIAL               not null,
   NOMBRE_TIPO_EMPLEADO VARCHAR(25)          not null,
   DETALLE_TIPO_EMPLEADO VARCHAR(150)         not null,
   constraint PK_TIPO_EMPLEADO primary key (ID_TIPO_SUCURSAL2)
);

/*==============================================================*/
/* Index: TIPO_EMPLEADO_PK                                      */
/*==============================================================*/
create unique index TIPO_EMPLEADO_PK on TIPO_EMPLEADO (
ID_TIPO_SUCURSAL2
);

/*==============================================================*/
/* Table: TIPO_SUCURSAL                                         */
/*==============================================================*/
create table TIPO_SUCURSAL (
   ID_TIPO_SUCURSAL     SERIAL               not null,
   NOMBRE_TIPO_EMPLEADO VARCHAR(25)          not null,
   DETALLE_TIPO_EMPLEADO VARCHAR(150)         not null,
   constraint PK_TIPO_SUCURSAL primary key (ID_TIPO_SUCURSAL)
);

/*==============================================================*/
/* Index: TIPO_SUCURSAL_PK                                      */
/*==============================================================*/
create unique index TIPO_SUCURSAL_PK on TIPO_SUCURSAL (
ID_TIPO_SUCURSAL
);

/*==============================================================*/
/* Table: VEHICULO                                              */
/*==============================================================*/
create table VEHICULO (
   ID_VEHICULO          SERIAL               not null,
   ID_ESTADO_VEHICULO   INT4                 not null,
   MATRICULA_VEHICULO   VARCHAR(10)          not null,
   MARCA_VEHICULO       VARCHAR(10)          not null,
   CAPACIDAD            NUMERIC(3)           not null,
   constraint PK_VEHICULO primary key (ID_VEHICULO)
);

/*==============================================================*/
/* Index: VEHICULO_PK                                           */
/*==============================================================*/
create unique index VEHICULO_PK on VEHICULO (
ID_VEHICULO
);

/*==============================================================*/
/* Index: TIENE_ESTASO_VEHICULO_FK                              */
/*==============================================================*/
create  index TIENE_ESTASO_VEHICULO_FK on VEHICULO (
ID_ESTADO_VEHICULO
);

alter table CIUDAD
   add constraint FK_CIUDAD_INCLUYE_PROVINCIA foreign key (ID_PROVINCIA)
      references PROVINCIA (ID_PROVINCIA)
      on delete restrict on update restrict;

alter table CLIENTE
   add constraint FK_CLIENTE_UBICADO_CIUDAD foreign key (ID_CIUDAD)
      references CIUDAD (ID_CIUDAD)
      on delete restrict on update restrict;

alter table DETALLE_ARTICULOS
   add constraint FK_MUDANZA_INCLUYE_ARTICULO foreign key (ID_ARTICULO)
      references ARTICULOS (ID_ARTICULO)
      on delete restrict on update restrict;

alter table DETALLE_ARTICULOS
   add constraint FK_ARTICULO_INCLUYE_MUDANZA foreign key (ID_MUDANZA)
      references MUDANZA (ID_MUDANZA)
      on delete restrict on update restrict;

alter table DETALLE_MANTENIMIENTO
   add constraint FK_VEHICULO_NECESITA_MANTENIM foreign key (ID_MATENIMIENTO)
      references MATENIMIENTO (ID_MATENIMIENTO)
      on delete restrict on update restrict;

alter table DETALLE_MANTENIMIENTO
   add constraint FK_MANTENIM_NECESITA_VEHICULO foreign key (ID_VEHICULO)
      references VEHICULO (ID_VEHICULO)
      on delete restrict on update restrict;

alter table DETALLE_MUDANZA
   add constraint FK_SUCURSAL_REALIZAN_MUDANZA foreign key (ID_MUDANZA)
      references MUDANZA (ID_MUDANZA)
      on delete restrict on update restrict;

alter table DETALLE_MUDANZA
   add constraint FK_MUDANZA_REALIZAN_SUCURSAL foreign key (ID_SUCURSAL)
      references SUCURSAL (ID_SUCURSAL)
      on delete restrict on update restrict;

alter table DETALLE_MUDANZA
   add constraint FK_MUDANZA_SOLICITA_CLIENTE foreign key (ID_CLIENTE)
      references CLIENTE (ID_CLIENTE)
      on delete restrict on update restrict;

alter table DETALLE_MUDANZA
   add constraint FK_MUDANZA_TIENE_ESTADO foreign key (ID_ESTADO_MUDANZA)
      references ESTADO_MUDANZA (ID_ESTADO_MUDANZA)
      on delete restrict on update restrict;

alter table EMPLEADO
   add constraint FK_EMPLEADO_ASIGNADO_VEHICULO foreign key (ID_VEHICULO)
      references VEHICULO (ID_VEHICULO)
      on delete restrict on update restrict;

alter table EMPLEADO
   add constraint FK_EMPLEADO_CONTRATA_SUCURSAL foreign key (ID_SUCURSAL)
      references SUCURSAL (ID_SUCURSAL)
      on delete restrict on update restrict;

alter table EMPLEADO
   add constraint FK_EMPLEADO_PERTENECE_TIPO foreign key (ID_TIPO_SUCURSAL2)
      references TIPO_EMPLEADO (ID_TIPO_SUCURSAL2)
      on delete restrict on update restrict;

alter table SUCURSAL
   add constraint FK_SUCURSAL_PERTENECE_TIPO foreign key (ID_TIPO_SUCURSAL)
      references TIPO_SUCURSAL (ID_TIPO_SUCURSAL)
      on delete restrict on update restrict;

alter table SUCURSAL
   add constraint FK_SUCURSAL_TIENE_EMPRESA foreign key (ID_EMPRESA)
      references EMPRESA (ID_EMPRESA)
      on delete restrict on update restrict;

alter table SUCURSAL
   add constraint FK_SUCURSAL_UBICADAS_CIUDAD foreign key (ID_CIUDAD)
      references CIUDAD (ID_CIUDAD)
      on delete restrict on update restrict;

alter table VEHICULO
   add constraint FK_VEHICULO_TIENE_ESTADO foreign key (ID_ESTADO_VEHICULO)
      references ESTADO_VEHICULO (ID_ESTADO_VEHICULO)
      on delete restrict on update restrict;

