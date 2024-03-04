create or replace PROCEDURE RNAM_SP_VALIDA_PACIENTE (
      p_NOMBRE         in RNAM_PACIENTES.NOMBRE%type
    , p_PATERNO        in RNAM_PACIENTES.PATERNO%type
    , p_MATERNO        in RNAM_PACIENTES.mATERNO%type
    , VCSEMAFORO       out VARCHAR2)

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
    Sql_err           NUMBER(10);
    Isam_err          NUMBER(10);
    error_info        VARCHAR2(300);
    sql_stmt          VARCHAR2(8000);
    nombrecompleto    VARCHAR2(100) := '';
    p_resultado       INT := 0;

BEGIN

       nombrecompleto := '%' ||p_NOMBRE || ' ' || nvl(p_PATERNO,'%') || ' ' || p_MATERNO || '%';

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

       EXECUTE IMMEDIATE sql_stmt INTO p_resultado USING nombrecompleto;
       
       CASE p_resultado
        WHEN  0 THEN VCSEMAFORO := 'VERDE';
        WHEN  1 THEN VCSEMAFORO := 'AMARILLO';
        ELSE VCSEMAFORO := 'ROJO';
       END CASE;

    EXCEPTION
        WHEN OTHERS THEN
            p_resultado := 0;
            sql_err := SQLCODE;
            isam_err := SQLCODE;
            error_info := SQLERRM;
            error_info := error_info || ' ERROR_STACK: ' || DBMS_UTILITY.FORMAT_ERROR_STACK;
            error_info := error_info || ' ERROR_BACKTRACE: ' || DBMS_UTILITY.FORMAT_ERROR_BACKTRACE;

END RNAM_SP_VALIDA_PACIENTE;