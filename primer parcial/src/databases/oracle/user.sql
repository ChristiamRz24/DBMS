-- Ejecutar comandos como scripts de sistema Oracle
ALTER SESSION SET "_ORACLE_SCRIPT"=true;

-- Crear el usuario
CREATE USER mudanzas
IDENTIFIED BY admin
DEFAULT TABLESPACE USERS
TEMPORARY TABLESPACE TEMP
QUOTA 20M ON USERS;

-- Otorgar privilegios de sesión, exportación e importación de datos
GRANT CREATE SESSION TO mudanzas;
GRANT EXP_FULL_DATABASE TO mudanzas;
GRANT IMP_FULL_DATABASE TO mudanzas;