--------------------------------------------------------
--  DDL for Package PKG_LISTAR_NOMBRES_RIPS
--------------------------------------------------------

create or replace PACKAGE "PKG_ASISTENCIA_MEDICAS" as

    PROCEDURE RNAM_SP_VALIDA_PACIENTE (
	  p_NOMBRE        in RNAM_PACIENTES.NOMBRE%type
	, p_PATERNO       in RNAM_PACIENTES.PATERNO%type
	, p_MATERNO       in RNAM_PACIENTES.MATERNO%type
	, p_resultado     out INT);

    PROCEDURE RNAM_SP_EXISTE_USUARIO (
      p_CV_USUARIO           in RNAM_CAT_USUARIOS_TOKEN.CV_USUARIO%type
    , p_CLAVE                in RNAM_CAT_USUARIOS_TOKEN.CLAVE%type
    , p_ID_RNAM_INSTITUCION  in RNAM_CAT_USUARIOS_TOKEN.ID_RNAM_INSTITUCION%type
    , p_resultado            out INT);


END PKG_ASISTENCIA_MEDICAS;

/
--------------------------------------------------------
--  DDL for Package Body PKG_ASISTENCIA_MEDICAS
--------------------------------------------------------

create or replace PACKAGE BODY PKG_ASISTENCIA_MEDICAS AS

PROCEDURE RNAM_SP_VALIDA_PACIENTE (
      p_NOMBRE         in RNAM_PACIENTES.NOMBRE%type
    , p_PATERNO        in RNAM_PACIENTES.PATERNO%type
    , p_MATERNO        in RNAM_PACIENTES.mATERNO%type
    , p_resultado      out INT)

/******************************************************************************
         NOMBRE:      RNAM_SP_VALIDA_PACIENTE
         DESCRIPCION: Función verifica si existe el paciente en las bases de datos 
                      RNDetenciones y RNDetenciones_fa

         REVISION:
         Ver        Fecha        Autor           Descripcion
         ---------  ----------  ---------------  ------------------------------------
         1.0        06/01/2024  JLCR             1.

 ******************************************************************************/    
IS

    Sql_err      NUMBER(10);
    Isam_err     NUMBER(10);
    error_info   VARCHAR2(300);

BEGIN

       sql_stmt    VARCHAR2(8000);
       NOMBRECOMPLETO    VARCHAR2(100) := '';
       p_resultado  := 0;

       NOMBRECOMPLETO := '%' ||p_NOMBRE || ' ' || nvl(p_PATERNO,'%') || ' ' || p_MATERNO || '%';

       sql_stmt := 'Select count(1)
            FROM detenciones@DB_RNDETEN D
            inner JOIN detenidos@DB_RNDETEN dt
                ON D."id_detencion" = dt."id_detencion"
                AND dt."es_borrado" = 0
            LEFT JOIN puesta_disposiciones@DB_RNDETEN pd
                ON dt."id_detenido" = pd."id_detenido"
                AND pd."es_borrado" = 0
            LEFT JOIN detenidos_datoscomplementarios@DB_RNDETEN ddc
                ON pd."id_puesta_disposicion" = ddc."id_puesta_disposicion"
            LEFT JOIN traslados@DB_RNDETEN tr
                ON ddc."id_detenido_complemento" = tr."id_detenido_complemento"
                AND tr."es_activo" = 1
           WHERE (case when ddc."nombre_detenido" || '' '' || ddc."apellido_paterno" || '' '' || ddc."apellido_materno" is null 
                            then dt."nombre" || '' '' || dt."apellido_paterno" || '' '' || dt."apellido_materno" 
                        when dt."nombre" || '' '' || dt."apellido_paterno" || '' '' || dt."apellido_materno" is null 
                            then ddc."nombre_detenido" || '' '' || ddc."apellido_paterno" || '' '' || ddc."apellido_materno" 
                        else ddc."nombre_detenido" || '' '' || ddc."apellido_paterno" || '' '' || ddc."apellido_materno" end) LIKE :NOMBRE';

       EXECUTE IMMEDIATE sql_stmt INTO p_resultado USING NOMBRECOMPLETO;

    EXCEPTION
        WHEN OTHERS THEN
            p_resultado := 0;
            sql_err := SQLCODE;
            isam_err := SQLCODE;
            error_info := SQLERRM;
            error_info := error_info || ' ERROR_STACK: ' || DBMS_UTILITY.FORMAT_ERROR_STACK;
            error_info := error_info || ' ERROR_BACKTRACE: ' || DBMS_UTILITY.FORMAT_ERROR_BACKTRACE;
END RNAM_SP_VALIDA_PACIENTE;

PROCEDURE RNAM_SP_EXISTE_USUARIO (
      p_CV_USUARIO           in RNAM_CAT_USUARIOS_TOKEN.CV_USUARIO%type
    , p_CLAVE                in RNAM_CAT_USUARIOS_TOKEN.CLAVE%type
    , p_ID_RNAM_INSTITUCION  in RNAM_CAT_USUARIOS_TOKEN.ID_RNAM_INSTITUCION%type
    , p_resultado            out INT)

/******************************************************************************
         NOMBRE:       RNAM_FN_EXISTE_USUARIO
         DESCRIPCION: Función verifica si existe el usuario

         REVISION:
         Ver        Fecha        Autor           Descripcion
         ---------  ----------  ---------------  ------------------------------------
         1.0        06/01/2024  JLCR             1.

 ******************************************************************************/    
is
    Sql_err      NUMBER(10);
    Isam_err     NUMBER(10);
    error_info   VARCHAR2(300);
begin

        p_resultado := 0;

        SELECT 1 
          into p_resultado
          FROM RNAM_CAT_USUARIOS_TOKEN 
          WHERE CV_USUARIO = p_CV_USUARIO 
          and CLAVE = p_CLAVE 
          and ID_RNAM_INSTITUCION = p_ID_RNAM_INSTITUCION;

    EXCEPTION
        WHEN NO_DATA_FOUND THEN
             p_resultado :=0;
        WHEN OTHERS THEN
            sql_err    := SQLCODE;
            isam_err   := SQLCODE;
            error_info := SQLERRM;
            error_info := error_info || ' ERROR_STACK: ' || DBMS_UTILITY.FORMAT_ERROR_STACK;
            error_info := error_info || ' ERROR_BACKTRACE: ' || DBMS_UTILITY.FORMAT_ERROR_BACKTRACE;

end RNAM_SP_EXISTE_USUARIO;

END PKG_ASISTENCIA_MEDICAS;

/
