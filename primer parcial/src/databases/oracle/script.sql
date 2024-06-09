/*==============================================================*/
/* DBMS name:      ORACLE Version 11g                           */
/* Created on:     3/5/2024 1:17:30                             */
/*==============================================================*/

-- Type package declaration
create or replace package PDTypes  
as
    TYPE ref_cursor IS REF CURSOR;
end;

-- Integrity package declaration
create or replace package IntegrityPackage AS
 procedure InitNestLevel;
 function GetNestLevel return number;
 procedure NextNestLevel;
 procedure PreviousNestLevel;
 end IntegrityPackage;
/

-- Integrity package definition
create or replace package body IntegrityPackage AS
 NestLevel number;

-- Procedure to initialize the trigger nest level
 procedure InitNestLevel is
 begin
 NestLevel := 0;
 end;


-- Function to return the trigger nest level
 function GetNestLevel return number is
 begin
 if NestLevel is null then
     NestLevel := 0;
 end if;
 return(NestLevel);
 end;

-- Procedure to increase the trigger nest level
 procedure NextNestLevel is
 begin
 if NestLevel is null then
     NestLevel := 0;
 end if;
 NestLevel := NestLevel + 1;
 end;

-- Procedure to decrease the trigger nest level
 procedure PreviousNestLevel is
 begin
 NestLevel := NestLevel - 1;
 end;

 end IntegrityPackage;
/


drop trigger COMPOUNDDELETETRIGGER_ARTICULO
/

drop trigger COMPOUNDINSERTTRIGGER_ARTICULO
/

drop trigger COMPOUNDUPDATETRIGGER_ARTICULO
/

drop trigger TIB_ARTICULOS
/

drop trigger COMPOUNDDELETETRIGGER_CIUDAD
/

drop trigger COMPOUNDINSERTTRIGGER_CIUDAD
/

drop trigger COMPOUNDUPDATETRIGGER_CIUDAD
/

drop trigger TIB_CIUDAD
/

drop trigger COMPOUNDDELETETRIGGER_CLIENTE
/

drop trigger COMPOUNDINSERTTRIGGER_CLIENTE
/

drop trigger COMPOUNDUPDATETRIGGER_CLIENTE
/

drop trigger TIB_CLIENTE
/

drop trigger COMPOUNDDELETETRIGGER_EMPLEADO
/

drop trigger COMPOUNDINSERTTRIGGER_EMPLEADO
/

drop trigger COMPOUNDUPDATETRIGGER_EMPLEADO
/

drop trigger TIB_EMPLEADO
/

drop trigger COMPOUNDDELETETRIGGER_EMPRESA
/

drop trigger COMPOUNDINSERTTRIGGER_EMPRESA
/

drop trigger COMPOUNDUPDATETRIGGER_EMPRESA
/

drop trigger TIB_EMPRESA
/

drop trigger COMPOUNDDELETETRIGGER_ESTADO_M
/

drop trigger COMPOUNDINSERTTRIGGER_ESTADO_M
/

drop trigger COMPOUNDUPDATETRIGGER_ESTADO_M
/

drop trigger TIB_ESTADO_MUDANZA
/

drop trigger COMPOUNDDELETETRIGGER_ESTADO_V
/

drop trigger COMPOUNDINSERTTRIGGER_ESTADO_V
/

drop trigger COMPOUNDUPDATETRIGGER_ESTADO_V
/

drop trigger TIB_ESTADO_VEHICULO
/

drop trigger COMPOUNDDELETETRIGGER_MATENIMI
/

drop trigger COMPOUNDINSERTTRIGGER_MATENIMI
/

drop trigger COMPOUNDUPDATETRIGGER_MATENIMI
/

drop trigger TIB_MATENIMIENTO
/

drop trigger COMPOUNDDELETETRIGGER_MUDANZA
/

drop trigger COMPOUNDINSERTTRIGGER_MUDANZA
/

drop trigger COMPOUNDUPDATETRIGGER_MUDANZA
/

drop trigger TIB_MUDANZA
/

drop trigger COMPOUNDDELETETRIGGER_PROVINCI
/

drop trigger COMPOUNDINSERTTRIGGER_PROVINCI
/

drop trigger COMPOUNDUPDATETRIGGER_PROVINCI
/

drop trigger TIB_PROVINCIA
/

drop trigger COMPOUNDDELETETRIGGER_SUCURSAL
/

drop trigger COMPOUNDINSERTTRIGGER_SUCURSAL
/

drop trigger COMPOUNDUPDATETRIGGER_SUCURSAL
/

drop trigger TIB_SUCURSAL
/

drop trigger COMPOUNDDELETETRIGGER_TIPO_EMP
/

drop trigger COMPOUNDINSERTTRIGGER_TIPO_EMP
/

drop trigger COMPOUNDUPDATETRIGGER_TIPO_EMP
/

drop trigger TIB_TIPO_EMPLEADO
/

drop trigger COMPOUNDDELETETRIGGER_TIPO_SUC
/

drop trigger COMPOUNDINSERTTRIGGER_TIPO_SUC
/

drop trigger COMPOUNDUPDATETRIGGER_TIPO_SUC
/

drop trigger TIB_TIPO_SUCURSAL
/

drop trigger COMPOUNDDELETETRIGGER_VEHICULO
/

drop trigger COMPOUNDINSERTTRIGGER_VEHICULO
/

drop trigger COMPOUNDUPDATETRIGGER_VEHICULO
/

drop trigger TIB_VEHICULO
/

alter table CIUDAD
   drop constraint FK_CIUDAD_INCLUYE_PROVINCIA
/

alter table CLIENTE
   drop constraint FK_CLIENTE_UBICADO_CIUDAD
/

alter table DETALLE_ARTICULOS
   drop constraint FK_MUDANZA_INCLUYE_ARTICULO
/

alter table DETALLE_ARTICULOS
   drop constraint FK_ARTICULO_INCLUYE_MUDANZA
/

alter table DETALLE_MANTENIMIENTO
   drop constraint FK_VEHICULO_NECESITA_MANTENIM
/

alter table DETALLE_MANTENIMIENTO
   drop constraint FK_MANTENIM_NECESITA_VEHICULO
/

alter table DETALLE_MUDANZA
   drop constraint FK_SUCURSAL_REALIZAN_MUDANZA
/

alter table DETALLE_MUDANZA
   drop constraint FK_MUDANZA_REALIZAN_SUCURSAL
/

alter table DETALLE_MUDANZA
   drop constraint FK_MUDANZA_SOLICITA_CLIENTE
/

alter table DETALLE_MUDANZA
   drop constraint FK_MUDANZA_TIENE_ESTADO
/

alter table EMPLEADO
   drop constraint FK_EMPLEADO_ASIGNADO_VEHICULO
/

alter table EMPLEADO
   drop constraint FK_EMPLEADO_CONTRATA_SUCURSAL
/

alter table EMPLEADO
   drop constraint FK_EMPLEADO_PERTENECE_TIPO
/

alter table SUCURSAL
   drop constraint FK_SUCURSAL_PERTENECE_TIPO
/

alter table SUCURSAL
   drop constraint FK_SUCURSAL_TIENE_EMPRESA
/

alter table SUCURSAL
   drop constraint FK_SUCURSAL_UBICADAS_CIUDAD
/

alter table VEHICULO
   drop constraint FK_VEHICULO_TIENE_ESTADO
/

drop table ARTICULOS cascade constraints
/

drop table CIUDAD cascade constraints
/

drop table CLIENTE cascade constraints
/

drop table DETALLE_ARTICULOS cascade constraints
/

drop table DETALLE_MANTENIMIENTO cascade constraints
/

drop table DETALLE_MUDANZA cascade constraints
/

drop table EMPLEADO cascade constraints
/

drop table EMPRESA cascade constraints
/

drop table ESTADO_MUDANZA cascade constraints
/

drop table ESTADO_VEHICULO cascade constraints
/

drop table MATENIMIENTO cascade constraints
/

drop table MUDANZA cascade constraints
/

drop table PROVINCIA cascade constraints
/

drop table SUCURSAL cascade constraints
/

drop table TIPO_EMPLEADO cascade constraints
/

drop table TIPO_SUCURSAL cascade constraints
/

drop table VEHICULO cascade constraints
/

drop sequence S_ARTICULOS
/

drop sequence S_CIUDAD
/

drop sequence S_CLIENTE
/

drop sequence S_EMPLEADO
/

drop sequence S_EMPRESA
/

drop sequence S_ESTADO_MUDANZA
/

drop sequence S_ESTADO_VEHICULO
/

drop sequence S_MATENIMIENTO
/

drop sequence S_MUDANZA
/

drop sequence S_PROVINCIA
/

drop sequence S_SUCURSAL
/

drop sequence S_TIPO_EMPLEADO
/

drop sequence S_TIPO_SUCURSAL
/

drop sequence S_VEHICULO
/

create sequence S_ARTICULOS
/

create sequence S_CIUDAD
/

create sequence S_CLIENTE
/

create sequence S_EMPLEADO
/

create sequence S_EMPRESA
/

create sequence S_ESTADO_MUDANZA
/

create sequence S_ESTADO_VEHICULO
/

create sequence S_MATENIMIENTO
/

create sequence S_MUDANZA
/

create sequence S_PROVINCIA
/

create sequence S_SUCURSAL
/

create sequence S_TIPO_EMPLEADO
/

create sequence S_TIPO_SUCURSAL
/

create sequence S_VEHICULO
/

/*==============================================================*/
/* Table: ARTICULOS                                             */
/*==============================================================*/
create table ARTICULOS 
(
   ID_ARTICULO          NUMBER(6)            not null,
   NOMBRE_ARTICULO      VARCHAR2(75)         not null,
   DESCRIPCION_ARTICULO VARCHAR2(250)        not null,
   MARCA_ARTICULO       VARCHAR2(25),
   constraint PK_ARTICULOS primary key (ID_ARTICULO)
)
/

/*==============================================================*/
/* Table: CIUDAD                                                */
/*==============================================================*/
create table CIUDAD 
(
   ID_CIUDAD            NUMBER(6)            not null,
   ID_PROVINCIA         INTEGER              not null,
   NOMBRE_CIUDAD        VARCHAR2(50)         not null,
   constraint PK_CIUDAD primary key (ID_CIUDAD)
)
/

/*==============================================================*/
/* Table: CLIENTE                                               */
/*==============================================================*/
create table CLIENTE 
(
   ID_CLIENTE           NUMBER(6)            not null,
   ID_CIUDAD            INTEGER              not null,
   NOMBRE_CLIENTE       VARCHAR2(30)         not null,
   APELLIDO_CLIENTE     VARCHAR2(15)         not null,
   TELEFONO_CLIENTE     VARCHAR2(10)         not null,
   DIRECCION_CLIENTE    VARCHAR2(250)        not null,
   FECHA_NACIMIENTO_CLIENTE DATE                 not null,
   constraint PK_CLIENTE primary key (ID_CLIENTE)
)
/

/*==============================================================*/
/* Table: DETALLE_ARTICULOS                                     */
/*==============================================================*/
create table DETALLE_ARTICULOS 
(
   ID_ARTICULO          INTEGER              not null,
   ID_MUDANZA           INTEGER              not null,
   CANTIDAD_ARTICULO    NUMBER(3,0)          not null,
   PESO_ARTICULO        NUMBER(3,2)          not null,
   constraint PK_DETALLE_ARTICULOS primary key (ID_ARTICULO, ID_MUDANZA)
)
/

/*==============================================================*/
/* Table: DETALLE_MANTENIMIENTO                                 */
/*==============================================================*/
create table DETALLE_MANTENIMIENTO 
(
   ID_MATENIMIENTO      INTEGER              not null,
   ID_VEHICULO          INTEGER              not null,
   FECHA_INICIO_MANTENIMIENTO DATE                 not null,
   FECHA_FIN_MANTENIMIENTO DATE                 not null,
   constraint PK_DETALLE_MANTENIMIENTO primary key (ID_MATENIMIENTO, ID_VEHICULO)
)
/

/*==============================================================*/
/* Table: DETALLE_MUDANZA                                       */
/*==============================================================*/
create table DETALLE_MUDANZA 
(
   ID_MUDANZA           INTEGER              not null,
   ID_SUCURSAL          INTEGER              not null,
   ID_CLIENTE           INTEGER              not null,
   ID_ESTADO_MUDANZA    INTEGER              not null,
   constraint PK_DETALLE_MUDANZA primary key (ID_MUDANZA, ID_SUCURSAL)
)
/

/*==============================================================*/
/* Table: EMPLEADO                                              */
/*==============================================================*/
create table EMPLEADO 
(
   ID_EMPLEADO          NUMBER(6)            not null,
   ID_SUCURSAL          INTEGER,
   ID_TIPO_SUCURSAL2    INTEGER              not null,
   ID_VEHICULO          INTEGER              not null,
   NOMBRE_EMPLEADO      VARCHAR2(30)         not null,
   APELLIDO_EMPLEADO    VARCHAR2(15)         not null,
   TELEFONO_EMPLEADO    VARCHAR2(10)         not null,
   DIRECCION_EMPLEADO   VARCHAR2(250)        not null,
   FECHA_NACIMIENTO_EMPLEADO DATE                 not null,
   FECHA_INGRESO_EMPLEADO DATE                 not null,
   constraint PK_EMPLEADO primary key (ID_EMPLEADO)
)
/

/*==============================================================*/
/* Table: EMPRESA                                               */
/*==============================================================*/
create table EMPRESA 
(
   ID_EMPRESA           NUMBER(6)            not null,
   NOMBRE_EMPRESA       VARCHAR2(75)         not null,
   RUC_EMPRESA          VARCHAR2(15)         not null,
   constraint PK_EMPRESA primary key (ID_EMPRESA)
)
/

/*==============================================================*/
/* Table: ESTADO_MUDANZA                                        */
/*==============================================================*/
create table ESTADO_MUDANZA 
(
   ID_ESTADO_MUDANZA    NUMBER(6)            not null,
   NOMBRE_ESTADO_MUDANZA VARCHAR2(15)         not null,
   DETALLE_ESTADO_MUDANZA VARCHAR2(150)        not null,
   constraint PK_ESTADO_MUDANZA primary key (ID_ESTADO_MUDANZA)
)
/

/*==============================================================*/
/* Table: ESTADO_VEHICULO                                       */
/*==============================================================*/
create table ESTADO_VEHICULO 
(
   ID_ESTADO_VEHICULO   NUMBER(6)            not null,
   NOMBRE_ESTADO_VEHICULO VARCHAR2(15)         not null,
   DETALLE_ESTADO_VEHICULO VARCHAR2(75)         not null,
   constraint PK_ESTADO_VEHICULO primary key (ID_ESTADO_VEHICULO)
)
/

/*==============================================================*/
/* Table: MATENIMIENTO                                          */
/*==============================================================*/
create table MATENIMIENTO 
(
   ID_MATENIMIENTO      NUMBER(6)            not null,
   EMPRESA_MATENIMIENTO VARCHAR2(50)         not null,
   COSTO_MATENIMIENTO   NUMBER(3,2)          not null,
   DESCUENTO_MANTENIMIENTO NUMBER(2,0)          not null,
   constraint PK_MATENIMIENTO primary key (ID_MATENIMIENTO)
)
/

/*==============================================================*/
/* Table: MUDANZA                                               */
/*==============================================================*/
create table MUDANZA 
(
   ID_MUDANZA           NUMBER(6)            not null,
   COSTO_MUDANZA        FLOAT(8)             not null,
   DESCUEMTO_MUDANZA    NUMBER(2,0)          not null,
   constraint PK_MUDANZA primary key (ID_MUDANZA)
)
/

/*==============================================================*/
/* Table: PROVINCIA                                             */
/*==============================================================*/
create table PROVINCIA 
(
   ID_PROVINCIA         NUMBER(6)            not null,
   NOMBRE_PROVINCIA     VARCHAR2(50)         not null,
   constraint PK_PROVINCIA primary key (ID_PROVINCIA)
)
/

/*==============================================================*/
/* Table: SUCURSAL                                              */
/*==============================================================*/
create table SUCURSAL 
(
   ID_SUCURSAL          NUMBER(6)            not null,
   ID_TIPO_SUCURSAL     INTEGER              not null,
   ID_CIUDAD            INTEGER              not null,
   ID_EMPRESA           INTEGER              not null,
   TELEFONO_SUCURSAL    VARCHAR2(10)         not null,
   DIRECCION_SUCURSAL   VARCHAR2(250)        not null,
   constraint PK_SUCURSAL primary key (ID_SUCURSAL)
)
/

/*==============================================================*/
/* Table: TIPO_EMPLEADO                                         */
/*==============================================================*/
create table TIPO_EMPLEADO 
(
   ID_TIPO_SUCURSAL2    NUMBER(6)            not null,
   NOMBRE_TIPO_EMPLEADO VARCHAR2(25)         not null,
   DETALLE_TIPO_EMPLEADO VARCHAR2(150)        not null,
   constraint PK_TIPO_EMPLEADO primary key (ID_TIPO_SUCURSAL2)
)
/

/*==============================================================*/
/* Table: TIPO_SUCURSAL                                         */
/*==============================================================*/
create table TIPO_SUCURSAL 
(
   ID_TIPO_SUCURSAL     NUMBER(6)            not null,
   NOMBRE_TIPO_EMPLEADO VARCHAR2(25)         not null,
   DETALLE_TIPO_EMPLEADO VARCHAR2(150)        not null,
   constraint PK_TIPO_SUCURSAL primary key (ID_TIPO_SUCURSAL)
)
/

/*==============================================================*/
/* Table: VEHICULO                                              */
/*==============================================================*/
create table VEHICULO 
(
   ID_VEHICULO          NUMBER(6)            not null,
   ID_ESTADO_VEHICULO   INTEGER              not null,
   MATRICULA_VEHICULO   VARCHAR2(10)         not null,
   MARCA_VEHICULO       VARCHAR2(10)         not null,
   CAPACIDAD            NUMBER(3,0)          not null,
   constraint PK_VEHICULO primary key (ID_VEHICULO)
)
/

alter table CIUDAD
   add constraint FK_CIUDAD_INCLUYE_PROVINCIA foreign key (ID_PROVINCIA)
      references PROVINCIA (ID_PROVINCIA)
/

alter table CLIENTE
   add constraint FK_CLIENTE_UBICADO_CIUDAD foreign key (ID_CIUDAD)
      references CIUDAD (ID_CIUDAD)
/

alter table DETALLE_ARTICULOS
   add constraint FK_MUDANZA_INCLUYE_ARTICULO foreign key (ID_ARTICULO)
      references ARTICULOS (ID_ARTICULO)
/

alter table DETALLE_ARTICULOS
   add constraint FK_ARTICULO_INCLUYE_MUDANZA foreign key (ID_MUDANZA)
      references MUDANZA (ID_MUDANZA)
/

alter table DETALLE_MANTENIMIENTO
   add constraint FK_VEHICULO_NECESITA_MANTENIM foreign key (ID_MATENIMIENTO)
      references MATENIMIENTO (ID_MATENIMIENTO)
/

alter table DETALLE_MANTENIMIENTO
   add constraint FK_MANTENIM_NECESITA_VEHICULO foreign key (ID_VEHICULO)
      references VEHICULO (ID_VEHICULO)
/

alter table DETALLE_MUDANZA
   add constraint FK_SUCURSAL_REALIZAN_MUDANZA foreign key (ID_MUDANZA)
      references MUDANZA (ID_MUDANZA)
/

alter table DETALLE_MUDANZA
   add constraint FK_MUDANZA_REALIZAN_SUCURSAL foreign key (ID_SUCURSAL)
      references SUCURSAL (ID_SUCURSAL)
/

alter table DETALLE_MUDANZA
   add constraint FK_MUDANZA_SOLICITA_CLIENTE foreign key (ID_CLIENTE)
      references CLIENTE (ID_CLIENTE)
/

alter table DETALLE_MUDANZA
   add constraint FK_MUDANZA_TIENE_ESTADO foreign key (ID_ESTADO_MUDANZA)
      references ESTADO_MUDANZA (ID_ESTADO_MUDANZA)
/

alter table EMPLEADO
   add constraint FK_EMPLEADO_ASIGNADO_VEHICULO foreign key (ID_VEHICULO)
      references VEHICULO (ID_VEHICULO)
/

alter table EMPLEADO
   add constraint FK_EMPLEADO_CONTRATA_SUCURSAL foreign key (ID_SUCURSAL)
      references SUCURSAL (ID_SUCURSAL)
/

alter table EMPLEADO
   add constraint FK_EMPLEADO_PERTENECE_TIPO foreign key (ID_TIPO_SUCURSAL2)
      references TIPO_EMPLEADO (ID_TIPO_SUCURSAL2)
/

alter table SUCURSAL
   add constraint FK_SUCURSAL_PERTENECE_TIPO foreign key (ID_TIPO_SUCURSAL)
      references TIPO_SUCURSAL (ID_TIPO_SUCURSAL)
/

alter table SUCURSAL
   add constraint FK_SUCURSAL_TIENE_EMPRESA foreign key (ID_EMPRESA)
      references EMPRESA (ID_EMPRESA)
/

alter table SUCURSAL
   add constraint FK_SUCURSAL_UBICADAS_CIUDAD foreign key (ID_CIUDAD)
      references CIUDAD (ID_CIUDAD)
/

alter table VEHICULO
   add constraint FK_VEHICULO_TIENE_ESTADO foreign key (ID_ESTADO_VEHICULO)
      references ESTADO_VEHICULO (ID_ESTADO_VEHICULO)
/


create or replace trigger COMPOUNDDELETETRIGGER_ARTICULO
for delete on ARTICULOS compound trigger
// Declaration
// Body
  before statement is
  begin
     NULL;
  end before statement;

  before each row is
  begin
     NULL;
  end before each row;

  after each row is
  begin
     NULL;
  end after each row;

  after statement is
  begin
     NULL;
  end after statement;

END
/


create or replace trigger COMPOUNDINSERTTRIGGER_ARTICULO
for insert on ARTICULOS compound trigger
// Declaration
// Body
  before statement is
  begin
     NULL;
  end before statement;

  before each row is
  begin
     NULL;
  end before each row;

  after each row is
  begin
     NULL;
  end after each row;

  after statement is
  begin
     NULL;
  end after statement;

END
/


create or replace trigger COMPOUNDUPDATETRIGGER_ARTICULO
for update on ARTICULOS compound trigger
// Declaration
// Body
  before statement is
  begin
     NULL;
  end before statement;

  before each row is
  begin
     NULL;
  end before each row;

  after each row is
  begin
     NULL;
  end after each row;

  after statement is
  begin
     NULL;
  end after statement;

END
/


create trigger TIB_ARTICULOS before insert
on ARTICULOS for each row
declare
    integrity_error  exception;
    errno            integer;
    errmsg           char(200);
    dummy            integer;
    found            boolean;

begin
    --  Column "ID_ARTICULO" uses sequence S_ARTICULOS
    select S_ARTICULOS.NEXTVAL INTO :new.ID_ARTICULO from dual;

--  Errors handling
exception
    when integrity_error then
       raise_application_error(errno, errmsg);
end;
/


create or replace trigger COMPOUNDDELETETRIGGER_CIUDAD
for delete on CIUDAD compound trigger
// Declaration
// Body
  before statement is
  begin
     NULL;
  end before statement;

  before each row is
  begin
     NULL;
  end before each row;

  after each row is
  begin
     NULL;
  end after each row;

  after statement is
  begin
     NULL;
  end after statement;

END
/


create or replace trigger COMPOUNDINSERTTRIGGER_CIUDAD
for insert on CIUDAD compound trigger
// Declaration
// Body
  before statement is
  begin
     NULL;
  end before statement;

  before each row is
  begin
     NULL;
  end before each row;

  after each row is
  begin
     NULL;
  end after each row;

  after statement is
  begin
     NULL;
  end after statement;

END
/


create or replace trigger COMPOUNDUPDATETRIGGER_CIUDAD
for update on CIUDAD compound trigger
// Declaration
// Body
  before statement is
  begin
     NULL;
  end before statement;

  before each row is
  begin
     NULL;
  end before each row;

  after each row is
  begin
     NULL;
  end after each row;

  after statement is
  begin
     NULL;
  end after statement;

END
/


create trigger TIB_CIUDAD before insert
on CIUDAD for each row
declare
    integrity_error  exception;
    errno            integer;
    errmsg           char(200);
    dummy            integer;
    found            boolean;

begin
    --  Column "ID_CIUDAD" uses sequence S_CIUDAD
    select S_CIUDAD.NEXTVAL INTO :new.ID_CIUDAD from dual;

--  Errors handling
exception
    when integrity_error then
       raise_application_error(errno, errmsg);
end;
/


create or replace trigger COMPOUNDDELETETRIGGER_CLIENTE
for delete on CLIENTE compound trigger
// Declaration
// Body
  before statement is
  begin
     NULL;
  end before statement;

  before each row is
  begin
     NULL;
  end before each row;

  after each row is
  begin
     NULL;
  end after each row;

  after statement is
  begin
     NULL;
  end after statement;

END
/


create or replace trigger COMPOUNDINSERTTRIGGER_CLIENTE
for insert on CLIENTE compound trigger
// Declaration
// Body
  before statement is
  begin
     NULL;
  end before statement;

  before each row is
  begin
     NULL;
  end before each row;

  after each row is
  begin
     NULL;
  end after each row;

  after statement is
  begin
     NULL;
  end after statement;

END
/


create or replace trigger COMPOUNDUPDATETRIGGER_CLIENTE
for update on CLIENTE compound trigger
// Declaration
// Body
  before statement is
  begin
     NULL;
  end before statement;

  before each row is
  begin
     NULL;
  end before each row;

  after each row is
  begin
     NULL;
  end after each row;

  after statement is
  begin
     NULL;
  end after statement;

END
/


create trigger TIB_CLIENTE before insert
on CLIENTE for each row
declare
    integrity_error  exception;
    errno            integer;
    errmsg           char(200);
    dummy            integer;
    found            boolean;

begin
    --  Column "ID_CLIENTE" uses sequence S_CLIENTE
    select S_CLIENTE.NEXTVAL INTO :new.ID_CLIENTE from dual;

--  Errors handling
exception
    when integrity_error then
       raise_application_error(errno, errmsg);
end;
/


create or replace trigger COMPOUNDDELETETRIGGER_EMPLEADO
for delete on EMPLEADO compound trigger
// Declaration
// Body
  before statement is
  begin
     NULL;
  end before statement;

  before each row is
  begin
     NULL;
  end before each row;

  after each row is
  begin
     NULL;
  end after each row;

  after statement is
  begin
     NULL;
  end after statement;

END
/


create or replace trigger COMPOUNDINSERTTRIGGER_EMPLEADO
for insert on EMPLEADO compound trigger
// Declaration
// Body
  before statement is
  begin
     NULL;
  end before statement;

  before each row is
  begin
     NULL;
  end before each row;

  after each row is
  begin
     NULL;
  end after each row;

  after statement is
  begin
     NULL;
  end after statement;

END
/


create or replace trigger COMPOUNDUPDATETRIGGER_EMPLEADO
for update on EMPLEADO compound trigger
// Declaration
// Body
  before statement is
  begin
     NULL;
  end before statement;

  before each row is
  begin
     NULL;
  end before each row;

  after each row is
  begin
     NULL;
  end after each row;

  after statement is
  begin
     NULL;
  end after statement;

END
/


create trigger TIB_EMPLEADO before insert
on EMPLEADO for each row
declare
    integrity_error  exception;
    errno            integer;
    errmsg           char(200);
    dummy            integer;
    found            boolean;

begin
    --  Column "ID_EMPLEADO" uses sequence S_EMPLEADO
    select S_EMPLEADO.NEXTVAL INTO :new.ID_EMPLEADO from dual;

--  Errors handling
exception
    when integrity_error then
       raise_application_error(errno, errmsg);
end;
/


create or replace trigger COMPOUNDDELETETRIGGER_EMPRESA
for delete on EMPRESA compound trigger
// Declaration
// Body
  before statement is
  begin
     NULL;
  end before statement;

  before each row is
  begin
     NULL;
  end before each row;

  after each row is
  begin
     NULL;
  end after each row;

  after statement is
  begin
     NULL;
  end after statement;

END
/


create or replace trigger COMPOUNDINSERTTRIGGER_EMPRESA
for insert on EMPRESA compound trigger
// Declaration
// Body
  before statement is
  begin
     NULL;
  end before statement;

  before each row is
  begin
     NULL;
  end before each row;

  after each row is
  begin
     NULL;
  end after each row;

  after statement is
  begin
     NULL;
  end after statement;

END
/


create or replace trigger COMPOUNDUPDATETRIGGER_EMPRESA
for update on EMPRESA compound trigger
// Declaration
// Body
  before statement is
  begin
     NULL;
  end before statement;

  before each row is
  begin
     NULL;
  end before each row;

  after each row is
  begin
     NULL;
  end after each row;

  after statement is
  begin
     NULL;
  end after statement;

END
/


create trigger TIB_EMPRESA before insert
on EMPRESA for each row
declare
    integrity_error  exception;
    errno            integer;
    errmsg           char(200);
    dummy            integer;
    found            boolean;

begin
    --  Column "ID_EMPRESA" uses sequence S_EMPRESA
    select S_EMPRESA.NEXTVAL INTO :new.ID_EMPRESA from dual;

--  Errors handling
exception
    when integrity_error then
       raise_application_error(errno, errmsg);
end;
/


create or replace trigger COMPOUNDDELETETRIGGER_ESTADO_M
for delete on ESTADO_MUDANZA compound trigger
// Declaration
// Body
  before statement is
  begin
     NULL;
  end before statement;

  before each row is
  begin
     NULL;
  end before each row;

  after each row is
  begin
     NULL;
  end after each row;

  after statement is
  begin
     NULL;
  end after statement;

END
/


create or replace trigger COMPOUNDINSERTTRIGGER_ESTADO_M
for insert on ESTADO_MUDANZA compound trigger
// Declaration
// Body
  before statement is
  begin
     NULL;
  end before statement;

  before each row is
  begin
     NULL;
  end before each row;

  after each row is
  begin
     NULL;
  end after each row;

  after statement is
  begin
     NULL;
  end after statement;

END
/


create or replace trigger COMPOUNDUPDATETRIGGER_ESTADO_M
for update on ESTADO_MUDANZA compound trigger
// Declaration
// Body
  before statement is
  begin
     NULL;
  end before statement;

  before each row is
  begin
     NULL;
  end before each row;

  after each row is
  begin
     NULL;
  end after each row;

  after statement is
  begin
     NULL;
  end after statement;

END
/


create trigger TIB_ESTADO_MUDANZA before insert
on ESTADO_MUDANZA for each row
declare
    integrity_error  exception;
    errno            integer;
    errmsg           char(200);
    dummy            integer;
    found            boolean;

begin
    --  Column "ID_ESTADO_MUDANZA" uses sequence S_ESTADO_MUDANZA
    select S_ESTADO_MUDANZA.NEXTVAL INTO :new.ID_ESTADO_MUDANZA from dual;

--  Errors handling
exception
    when integrity_error then
       raise_application_error(errno, errmsg);
end;
/


create or replace trigger COMPOUNDDELETETRIGGER_ESTADO_V
for delete on ESTADO_VEHICULO compound trigger
// Declaration
// Body
  before statement is
  begin
     NULL;
  end before statement;

  before each row is
  begin
     NULL;
  end before each row;

  after each row is
  begin
     NULL;
  end after each row;

  after statement is
  begin
     NULL;
  end after statement;

END
/


create or replace trigger COMPOUNDINSERTTRIGGER_ESTADO_V
for insert on ESTADO_VEHICULO compound trigger
// Declaration
// Body
  before statement is
  begin
     NULL;
  end before statement;

  before each row is
  begin
     NULL;
  end before each row;

  after each row is
  begin
     NULL;
  end after each row;

  after statement is
  begin
     NULL;
  end after statement;

END
/


create or replace trigger COMPOUNDUPDATETRIGGER_ESTADO_V
for update on ESTADO_VEHICULO compound trigger
// Declaration
// Body
  before statement is
  begin
     NULL;
  end before statement;

  before each row is
  begin
     NULL;
  end before each row;

  after each row is
  begin
     NULL;
  end after each row;

  after statement is
  begin
     NULL;
  end after statement;

END
/


create trigger TIB_ESTADO_VEHICULO before insert
on ESTADO_VEHICULO for each row
declare
    integrity_error  exception;
    errno            integer;
    errmsg           char(200);
    dummy            integer;
    found            boolean;

begin
    --  Column "ID_ESTADO_VEHICULO" uses sequence S_ESTADO_VEHICULO
    select S_ESTADO_VEHICULO.NEXTVAL INTO :new.ID_ESTADO_VEHICULO from dual;

--  Errors handling
exception
    when integrity_error then
       raise_application_error(errno, errmsg);
end;
/


create or replace trigger COMPOUNDDELETETRIGGER_MATENIMI
for delete on MATENIMIENTO compound trigger
// Declaration
// Body
  before statement is
  begin
     NULL;
  end before statement;

  before each row is
  begin
     NULL;
  end before each row;

  after each row is
  begin
     NULL;
  end after each row;

  after statement is
  begin
     NULL;
  end after statement;

END
/


create or replace trigger COMPOUNDINSERTTRIGGER_MATENIMI
for insert on MATENIMIENTO compound trigger
// Declaration
// Body
  before statement is
  begin
     NULL;
  end before statement;

  before each row is
  begin
     NULL;
  end before each row;

  after each row is
  begin
     NULL;
  end after each row;

  after statement is
  begin
     NULL;
  end after statement;

END
/


create or replace trigger COMPOUNDUPDATETRIGGER_MATENIMI
for update on MATENIMIENTO compound trigger
// Declaration
// Body
  before statement is
  begin
     NULL;
  end before statement;

  before each row is
  begin
     NULL;
  end before each row;

  after each row is
  begin
     NULL;
  end after each row;

  after statement is
  begin
     NULL;
  end after statement;

END
/


create trigger TIB_MATENIMIENTO before insert
on MATENIMIENTO for each row
declare
    integrity_error  exception;
    errno            integer;
    errmsg           char(200);
    dummy            integer;
    found            boolean;

begin
    --  Column "ID_MATENIMIENTO" uses sequence S_MATENIMIENTO
    select S_MATENIMIENTO.NEXTVAL INTO :new.ID_MATENIMIENTO from dual;

--  Errors handling
exception
    when integrity_error then
       raise_application_error(errno, errmsg);
end;
/


create or replace trigger COMPOUNDDELETETRIGGER_MUDANZA
for delete on MUDANZA compound trigger
// Declaration
// Body
  before statement is
  begin
     NULL;
  end before statement;

  before each row is
  begin
     NULL;
  end before each row;

  after each row is
  begin
     NULL;
  end after each row;

  after statement is
  begin
     NULL;
  end after statement;

END
/


create or replace trigger COMPOUNDINSERTTRIGGER_MUDANZA
for insert on MUDANZA compound trigger
// Declaration
// Body
  before statement is
  begin
     NULL;
  end before statement;

  before each row is
  begin
     NULL;
  end before each row;

  after each row is
  begin
     NULL;
  end after each row;

  after statement is
  begin
     NULL;
  end after statement;

END
/


create or replace trigger COMPOUNDUPDATETRIGGER_MUDANZA
for update on MUDANZA compound trigger
// Declaration
// Body
  before statement is
  begin
     NULL;
  end before statement;

  before each row is
  begin
     NULL;
  end before each row;

  after each row is
  begin
     NULL;
  end after each row;

  after statement is
  begin
     NULL;
  end after statement;

END
/


create trigger TIB_MUDANZA before insert
on MUDANZA for each row
declare
    integrity_error  exception;
    errno            integer;
    errmsg           char(200);
    dummy            integer;
    found            boolean;

begin
    --  Column "ID_MUDANZA" uses sequence S_MUDANZA
    select S_MUDANZA.NEXTVAL INTO :new.ID_MUDANZA from dual;

--  Errors handling
exception
    when integrity_error then
       raise_application_error(errno, errmsg);
end;
/


create or replace trigger COMPOUNDDELETETRIGGER_PROVINCI
for delete on PROVINCIA compound trigger
// Declaration
// Body
  before statement is
  begin
     NULL;
  end before statement;

  before each row is
  begin
     NULL;
  end before each row;

  after each row is
  begin
     NULL;
  end after each row;

  after statement is
  begin
     NULL;
  end after statement;

END
/


create or replace trigger COMPOUNDINSERTTRIGGER_PROVINCI
for insert on PROVINCIA compound trigger
// Declaration
// Body
  before statement is
  begin
     NULL;
  end before statement;

  before each row is
  begin
     NULL;
  end before each row;

  after each row is
  begin
     NULL;
  end after each row;

  after statement is
  begin
     NULL;
  end after statement;

END
/


create or replace trigger COMPOUNDUPDATETRIGGER_PROVINCI
for update on PROVINCIA compound trigger
// Declaration
// Body
  before statement is
  begin
     NULL;
  end before statement;

  before each row is
  begin
     NULL;
  end before each row;

  after each row is
  begin
     NULL;
  end after each row;

  after statement is
  begin
     NULL;
  end after statement;

END
/


create trigger TIB_PROVINCIA before insert
on PROVINCIA for each row
declare
    integrity_error  exception;
    errno            integer;
    errmsg           char(200);
    dummy            integer;
    found            boolean;

begin
    --  Column "ID_PROVINCIA" uses sequence S_PROVINCIA
    select S_PROVINCIA.NEXTVAL INTO :new.ID_PROVINCIA from dual;

--  Errors handling
exception
    when integrity_error then
       raise_application_error(errno, errmsg);
end;
/


create or replace trigger COMPOUNDDELETETRIGGER_SUCURSAL
for delete on SUCURSAL compound trigger
// Declaration
// Body
  before statement is
  begin
     NULL;
  end before statement;

  before each row is
  begin
     NULL;
  end before each row;

  after each row is
  begin
     NULL;
  end after each row;

  after statement is
  begin
     NULL;
  end after statement;

END
/


create or replace trigger COMPOUNDINSERTTRIGGER_SUCURSAL
for insert on SUCURSAL compound trigger
// Declaration
// Body
  before statement is
  begin
     NULL;
  end before statement;

  before each row is
  begin
     NULL;
  end before each row;

  after each row is
  begin
     NULL;
  end after each row;

  after statement is
  begin
     NULL;
  end after statement;

END
/


create or replace trigger COMPOUNDUPDATETRIGGER_SUCURSAL
for update on SUCURSAL compound trigger
// Declaration
// Body
  before statement is
  begin
     NULL;
  end before statement;

  before each row is
  begin
     NULL;
  end before each row;

  after each row is
  begin
     NULL;
  end after each row;

  after statement is
  begin
     NULL;
  end after statement;

END
/


create trigger TIB_SUCURSAL before insert
on SUCURSAL for each row
declare
    integrity_error  exception;
    errno            integer;
    errmsg           char(200);
    dummy            integer;
    found            boolean;

begin
    --  Column "ID_SUCURSAL" uses sequence S_SUCURSAL
    select S_SUCURSAL.NEXTVAL INTO :new.ID_SUCURSAL from dual;

--  Errors handling
exception
    when integrity_error then
       raise_application_error(errno, errmsg);
end;
/


create or replace trigger COMPOUNDDELETETRIGGER_TIPO_EMP
for delete on TIPO_EMPLEADO compound trigger
// Declaration
// Body
  before statement is
  begin
     NULL;
  end before statement;

  before each row is
  begin
     NULL;
  end before each row;

  after each row is
  begin
     NULL;
  end after each row;

  after statement is
  begin
     NULL;
  end after statement;

END
/


create or replace trigger COMPOUNDINSERTTRIGGER_TIPO_EMP
for insert on TIPO_EMPLEADO compound trigger
// Declaration
// Body
  before statement is
  begin
     NULL;
  end before statement;

  before each row is
  begin
     NULL;
  end before each row;

  after each row is
  begin
     NULL;
  end after each row;

  after statement is
  begin
     NULL;
  end after statement;

END
/


create or replace trigger COMPOUNDUPDATETRIGGER_TIPO_EMP
for update on TIPO_EMPLEADO compound trigger
// Declaration
// Body
  before statement is
  begin
     NULL;
  end before statement;

  before each row is
  begin
     NULL;
  end before each row;

  after each row is
  begin
     NULL;
  end after each row;

  after statement is
  begin
     NULL;
  end after statement;

END
/


create trigger TIB_TIPO_EMPLEADO before insert
on TIPO_EMPLEADO for each row
declare
    integrity_error  exception;
    errno            integer;
    errmsg           char(200);
    dummy            integer;
    found            boolean;

begin
    --  Column "ID_TIPO_SUCURSAL2" uses sequence S_TIPO_EMPLEADO
    select S_TIPO_EMPLEADO.NEXTVAL INTO :new.ID_TIPO_SUCURSAL2 from dual;

--  Errors handling
exception
    when integrity_error then
       raise_application_error(errno, errmsg);
end;
/


create or replace trigger COMPOUNDDELETETRIGGER_TIPO_SUC
for delete on TIPO_SUCURSAL compound trigger
// Declaration
// Body
  before statement is
  begin
     NULL;
  end before statement;

  before each row is
  begin
     NULL;
  end before each row;

  after each row is
  begin
     NULL;
  end after each row;

  after statement is
  begin
     NULL;
  end after statement;

END
/


create or replace trigger COMPOUNDINSERTTRIGGER_TIPO_SUC
for insert on TIPO_SUCURSAL compound trigger
// Declaration
// Body
  before statement is
  begin
     NULL;
  end before statement;

  before each row is
  begin
     NULL;
  end before each row;

  after each row is
  begin
     NULL;
  end after each row;

  after statement is
  begin
     NULL;
  end after statement;

END
/


create or replace trigger COMPOUNDUPDATETRIGGER_TIPO_SUC
for update on TIPO_SUCURSAL compound trigger
// Declaration
// Body
  before statement is
  begin
     NULL;
  end before statement;

  before each row is
  begin
     NULL;
  end before each row;

  after each row is
  begin
     NULL;
  end after each row;

  after statement is
  begin
     NULL;
  end after statement;

END
/


create trigger TIB_TIPO_SUCURSAL before insert
on TIPO_SUCURSAL for each row
declare
    integrity_error  exception;
    errno            integer;
    errmsg           char(200);
    dummy            integer;
    found            boolean;

begin
    --  Column "ID_TIPO_SUCURSAL" uses sequence S_TIPO_SUCURSAL
    select S_TIPO_SUCURSAL.NEXTVAL INTO :new.ID_TIPO_SUCURSAL from dual;

--  Errors handling
exception
    when integrity_error then
       raise_application_error(errno, errmsg);
end;
/


create or replace trigger COMPOUNDDELETETRIGGER_VEHICULO
for delete on VEHICULO compound trigger
// Declaration
// Body
  before statement is
  begin
     NULL;
  end before statement;

  before each row is
  begin
     NULL;
  end before each row;

  after each row is
  begin
     NULL;
  end after each row;

  after statement is
  begin
     NULL;
  end after statement;

END
/


create or replace trigger COMPOUNDINSERTTRIGGER_VEHICULO
for insert on VEHICULO compound trigger
// Declaration
// Body
  before statement is
  begin
     NULL;
  end before statement;

  before each row is
  begin
     NULL;
  end before each row;

  after each row is
  begin
     NULL;
  end after each row;

  after statement is
  begin
     NULL;
  end after statement;

END
/


create or replace trigger COMPOUNDUPDATETRIGGER_VEHICULO
for update on VEHICULO compound trigger
// Declaration
// Body
  before statement is
  begin
     NULL;
  end before statement;

  before each row is
  begin
     NULL;
  end before each row;

  after each row is
  begin
     NULL;
  end after each row;

  after statement is
  begin
     NULL;
  end after statement;

END
/


create trigger TIB_VEHICULO before insert
on VEHICULO for each row
declare
    integrity_error  exception;
    errno            integer;
    errmsg           char(200);
    dummy            integer;
    found            boolean;

begin
    --  Column "ID_VEHICULO" uses sequence S_VEHICULO
    select S_VEHICULO.NEXTVAL INTO :new.ID_VEHICULO from dual;

--  Errors handling
exception
    when integrity_error then
       raise_application_error(errno, errmsg);
end;
/

