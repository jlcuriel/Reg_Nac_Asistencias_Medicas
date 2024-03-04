--------------------------------------------------------
--  DDL for Package PKG_LISTAR_NOMBRES_RIPS
--------------------------------------------------------

create or replace PACKAGE           "PKG_ASISTENCIA_MEDICAS" as

    PROCEDURE RNAM_SP_INSERTA_USUARIO (
	  p_CV_USUARIO           in RNAM_CAT_USUARIOS_TOKEN.CV_USUARIO%type
	, p_CLAVE                in RNAM_CAT_USUARIOS_TOKEN.CLAVE%type
	, p_ID_RNAM_INSTITUCION  in RNAM_CAT_USUARIOS_TOKEN.ID_RNAM_INSTITUCION%type
	, p_resultado            out INT);

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

 PROCEDURE  RNAM_SP_INSERTA_USUARIO (
  p_CV_USUARIO           in RNAM_CAT_USUARIOS_TOKEN.CV_USUARIO%type
, p_CLAVE                in RNAM_CAT_USUARIOS_TOKEN.CLAVE%type
, p_ID_RNAM_INSTITUCION  in RNAM_CAT_USUARIOS_TOKEN.ID_RNAM_INSTITUCION%type
, p_resultado            out INT
)
/******************************************************************************
         NOMBRE:       PKG_ASISTENCIA_MEDICAS
         DESCRIPCION: Procedimiento inserta usuarios para el RNAM

         REVISION:
         Ver        Fecha        Autor           Descripcion
         ---------  ----------  ---------------  ------------------------------------
         1.0        06/01/2024  JLCR             1.

 ******************************************************************************/
    IS
    vacio        EXCEPTION;
    Sql_err      NUMBER(10);
    Isam_err     NUMBER(10);
    error_info   VARCHAR2(300);

    BEGIN

      IF (ltrim(rtrim(p_CV_USUARIO)) is null OR ltrim(rtrim(p_CLAVE)) is null OR p_ID_RNAM_INSTITUCION = 0) THEN
        RAISE vacio;
      END IF;

      SELECT COUNT(1) 
      INTO p_resultado
      FROM RNAM_CAT_USUARIOS_TOKEN 
      WHERE CV_USUARIO = p_CV_USUARIO 
      AND CLAVE = p_CLAVE 
      AND ID_RNAM_INSTITUCION = p_ID_RNAM_INSTITUCION;

      IF p_resultado = 0 THEN
        INSERT INTO RNAM_CAT_USUARIOS_TOKEN(
          CV_USUARIO
        , CLAVE
        , ID_RNAM_INSTITUCION
        ) values (
          p_CV_USUARIO
        , p_CLAVE
        , p_ID_RNAM_INSTITUCION
        );

        SELECT RNAM_SEQ_USUARIOS_TOK.CURRVAL 
        INTO p_resultado 
        FROM dual;

         COMMIT;
     ELSE
        p_resultado := 0;
    END IF;

    EXCEPTION
        WHEN vacio THEN
             DBMS_OUTPUT.PUT_LINE ('no se pueden dejar criterios en blanco o esta fuera de rango');
        WHEN OTHERS THEN
            sql_err := SQLCODE;
            isam_err := SQLCODE;
            error_info := SQLERRM;
            error_info := error_info || ' ERROR_STACK: ' || DBMS_UTILITY.FORMAT_ERROR_STACK;
            error_info := error_info || ' ERROR_BACKTRACE: ' || DBMS_UTILITY.FORMAT_ERROR_BACKTRACE;

    END RNAM_SP_INSERTA_USUARIO;

PROCEDURE RNAM_SP_VALIDA_PACIENTE (
      p_NOMBRE         in RNAM_PACIENTES.NOMBRE%type
    , p_PATERNO        in RNAM_PACIENTES.PATERNO%type
    , p_MATERNO        in RNAM_PACIENTES.mATERNO%type
    , p_resultado      out INT)

/******************************************************************************
         NOMBRE:       RNAM_FN_VALIDA_PACIENTE
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

       p_resultado  := 0;

       SELECT TRUNC(DBMS_RANDOM.value(1, 10)) INTO p_resultado FROM dual;

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
