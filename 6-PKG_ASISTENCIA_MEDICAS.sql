create or replace PACKAGE           "PKG_ASISTENCIA_MEDICAS" as

    PROCEDURE RNAM_SP_VALIDA_PACIENTE (
      p_ID_RNAM_INSTITUCION            RNAM_PACIENTES.ID_RNAM_INSTITUCION%TYPE
    , p_NOMBRE_INST                    IN RNAM_CAT_INSTITUCIONES_MEDICAS.NOMBRE%TYPE
    , p_FOLIO_REPORTE                  IN RNAM_PACIENTES.FOLIO_REPORTE%TYPE
    , p_ID_USUARIOS                    IN RNAM_PACIENTES.ID_USUARIOS%TYPE
    , p_ID_EDO_REPUBLICA_EVENTO        IN RNAM_PACIENTES.ID_EDO_REPUBLICA_EVENTO%TYPE
    , p_EDO_REPUBLICA_EVENTO           IN RNAM_PACIENTES.EDO_REPUBLICA_EVENTO%TYPE
    , p_ID_MPIO_REPUBLICA_EVENTO       IN RNAM_PACIENTES.ID_MPIO_REPUBLICA_EVENTO%TYPE
    , p_MPIO_REPUBLICA_EVENTO          IN RNAM_PACIENTES.MPIO_REPUBLICA_EVENTO%TYPE
    , p_NOMBRE                         IN RNAM_PACIENTES.NOMBRE%TYPE
    , p_PATERNO                        IN RNAM_PACIENTES.PATERNO%TYPE
    , p_MATERNO                        IN RNAM_PACIENTES.MATERNO%TYPE
    , p_FECHA_NACIMIENTO               IN RNAM_PACIENTES.FECHA_NACIMIENTO%TYPE
    , p_ID_SEXO                        IN RNAM_PACIENTES.ID_SEXO%TYPE
    , p_SEXO                           IN RNAM_CAT_SEXOS.SEXO%TYPE
    , p_ID_ESTADO_NACIMIENTO           IN RNAM_PACIENTES.ID_ESTADO_NACIMIENTO%TYPE
    , p_ESTADO_NACIMIENTO              IN RNAM_PACIENTES.ESTADO_NACIMIENTO%TYPE
    , p_CURP                           IN RNAM_PACIENTES.CURP%TYPE
    , p_PESO                           IN RNAM_PACIENTES.PESO%TYPE
    , p_ES_EXTRANJERO                  IN RNAM_PACIENTES.ES_EXTRANJERO%TYPE
    , p_ID_NACIONALIDAD                IN RNAM_PACIENTES.ID_NACIONALIDAD%TYPE
    , p_NACIONALIDAD                   IN RNAM_CAT_NACIONALIDADES.NACIONALIDAD%TYPE
    , p_FECHA_INGRESO                  IN RNAM_PACIENTES.FECHA_INGRESO%TYPE
    , p_LUGAR_OCURRENCIA               IN RNAM_PACIENTES.LUGAR_OCURRENCIA%TYPE
    , p_MOTIVO_ATENCION                IN RNAM_PACIENTES.MOTIVO_ATENCION%TYPE
    , p_FECHA_ATENCION                 IN RNAM_PACIENTES.FECHA_ATENCION%TYPE
    , p_HORA_ATENCION                  IN VARCHAR2
    , p_PACIENTE_VIVO                  IN RNAM_PACIENTES.PACIENTE_VIVO%TYPE
    , p_AUTORIDAD_ATENDIO              IN RNAM_PACIENTES.AUTORIDAD_ATENDIO%TYPE
    , p_LUGAR_TRASLADO                 IN RNAM_PACIENTES.LUGAR_TRASLADO%TYPE
    , p_ES_MENOR_EDAD                  IN RNAM_PACIENTES.ES_MENOR_EDAD%TYPE
    , p_NOMBRE_RESPONSABLE             IN RNAM_RESPONSABLES.NOMBRE_RESPONSABLE%TYPE
    , p_PATERNO_RESPONSABLE            IN RNAM_RESPONSABLES.PATERNO_RESPONSABLE%TYPE
    , p_MATERNO_RESPONSABLE            IN RNAM_RESPONSABLES.MATERNO_RESPONSABLE%TYPE
    , p_PARENTESCO_RESPONSABLE         IN RNAM_RESPONSABLES.PARENTESCO_RESPONSABLE%TYPE
    , p_ID_TIPO_TELEFONO_RESP          IN RNAM_TELEFONOS_RESPONSABLES.ID_TIPO_TELEFONO%TYPE
    , p_TIPO_TELEFONO_RESP             IN RNAM_CAT_TIPOS_TELEFONOS.TIPO_TELEFONO%TYPE
    , p_TELEFONO_RESP                  IN RNAM_TELEFONOS_RESPONSABLES.TELEFONO_RESPONSABLE%TYPE
    , p_EXTENSION_RESP                 IN RNAM_TELEFONOS_RESPONSABLES.EXTENSION%TYPE
    , p_NOMBRE_CONTACTO                IN RNAM_CONTACTOS.NOMBRE_CONTACTO%TYPE
    , p_PATERNO_CONTACTO               IN RNAM_CONTACTOS.PATERNO_CONTACTO%TYPE
    , p_MATERNO_CONTACTO               IN RNAM_CONTACTOS.MATERNO_CONTACTO%TYPE
    , p_PARENTESCO_CONTACTO            IN RNAM_CONTACTOS.PARENTESCO_CONTACTO%TYPE
    , p_ID_TIPO_TELEFONO_CONTACTO      IN RNAM_TELEFONOS_CONTACTOS.ID_TIPO_TELEFONO%TYPE
    , p_TIPO_TELEFONO_CONTACTO         IN RNAM_CAT_TIPOS_TELEFONOS.TIPO_TELEFONO%TYPE
    , p_TELEFONO_CONTACTO              IN RNAM_TELEFONOS_CONTACTOS.TELEFONO_CONTACTO%TYPE
    , p_EXTENSION_CONTACTO             IN RNAM_TELEFONOS_CONTACTOS.EXTENSION%TYPE
    , p_ID_TIPO_TELEFONO_PACIENTE      IN RNAM_TELEFONOS_PACIENTES.ID_TIPO_TELEFONO%TYPE
    , p_TIPO_TELEFONO_PACIENTE         IN RNAM_CAT_TIPOS_TELEFONOS.TIPO_TELEFONO%TYPE
    , p_TELEFONO_PACIENTE              IN RNAM_TELEFONOS_PACIENTES.TELEFONO_PACIENTE%TYPE
    , p_EXTENSION_PACIENTE             IN RNAM_TELEFONOS_PACIENTES.EXTENSION%TYPE
    , VCSEMAFORO                       OUT VARCHAR2
    , error_info                       OUT VARCHAR2);

    PROCEDURE rnam_ingresa_paciente(
    p_ID_RNAM_INSTITUCION            IN RNAM_PACIENTES.ID_RNAM_INSTITUCION%TYPE,
    p_NOMBRE_INST                    IN RNAM_CAT_INSTITUCIONES_MEDICAS.NOMBRE%TYPE,
    p_FOLIO_REPORTE                  IN RNAM_PACIENTES.FOLIO_REPORTE%TYPE,
    p_ID_USUARIOS                    IN RNAM_PACIENTES.ID_USUARIOS%TYPE,
    p_ID_EDO_REPUBLICA_EVENTO        IN RNAM_PACIENTES.ID_EDO_REPUBLICA_EVENTO%TYPE,
    p_EDO_REPUBLICA_EVENTO           IN RNAM_PACIENTES.EDO_REPUBLICA_EVENTO%TYPE,
    p_ID_MPIO_REPUBLICA_EVENTO       IN RNAM_PACIENTES.ID_MPIO_REPUBLICA_EVENTO%TYPE,
    p_MPIO_REPUBLICA_EVENTO          IN RNAM_PACIENTES.MPIO_REPUBLICA_EVENTO%TYPE,
    p_NOMBRE                         IN RNAM_PACIENTES.NOMBRE%TYPE,
    p_PATERNO                        IN RNAM_PACIENTES.PATERNO%TYPE,
    p_MATERNO                        IN RNAM_PACIENTES.MATERNO%TYPE,
    p_FECHA_NACIMIENTO               IN RNAM_PACIENTES.FECHA_NACIMIENTO%TYPE,
    p_ID_SEXO                        IN RNAM_PACIENTES.ID_SEXO%TYPE,
    p_SEXO                           IN RNAM_CAT_SEXOS.SEXO%TYPE,
    p_ID_ESTADO_NACIMIENTO           IN RNAM_PACIENTES.ID_ESTADO_NACIMIENTO%TYPE,
    p_ESTADO_NACIMIENTO              IN RNAM_PACIENTES.ESTADO_NACIMIENTO%TYPE,
    p_CURP                           IN RNAM_PACIENTES.CURP%TYPE,
    p_PESO                           IN RNAM_PACIENTES.PESO%TYPE,
    p_ES_EXTRANJERO                  IN RNAM_PACIENTES.ES_EXTRANJERO%TYPE,
    p_ID_NACIONALIDAD                IN RNAM_PACIENTES.ID_NACIONALIDAD%TYPE,
    p_NACIONALIDAD                   IN RNAM_CAT_NACIONALIDADES.NACIONALIDAD%TYPE,
    p_FECHA_INGRESO                  IN RNAM_PACIENTES.FECHA_INGRESO%TYPE,
    p_LUGAR_OCURRENCIA               IN RNAM_PACIENTES.LUGAR_OCURRENCIA%TYPE,
    p_MOTIVO_ATENCION                IN RNAM_PACIENTES.MOTIVO_ATENCION%TYPE,
    p_FECHA_ATENCION                 IN RNAM_PACIENTES.FECHA_ATENCION%TYPE,
    p_HORA_ATENCION                  IN RNAM_PACIENTES.HORA_ATENCION%TYPE,
    p_PACIENTE_VIVO                  IN RNAM_PACIENTES.PACIENTE_VIVO%TYPE,
    p_AUTORIDAD_ATENDIO              IN RNAM_PACIENTES.AUTORIDAD_ATENDIO%TYPE,
    p_LUGAR_TRASLADO                 IN RNAM_PACIENTES.LUGAR_TRASLADO%TYPE,
    p_ES_MENOR_EDAD                  IN RNAM_PACIENTES.ES_MENOR_EDAD%TYPE,
    p_NOMBRE_RESPONSABLE             IN RNAM_RESPONSABLES.NOMBRE_RESPONSABLE%TYPE,
    p_PATERNO_RESPONSABLE            IN RNAM_RESPONSABLES.PATERNO_RESPONSABLE%TYPE,
    p_MATERNO_RESPONSABLE            IN RNAM_RESPONSABLES.MATERNO_RESPONSABLE%TYPE,
    p_PARENTESCO_RESPONSABLE         IN RNAM_RESPONSABLES.PARENTESCO_RESPONSABLE%TYPE,
    p_ID_TIPO_TEL_RESPONSABLE        IN RNAM_TELEFONOS_RESPONSABLES.ID_TIPO_TELEFONO%TYPE,
    p_TIPO_TEL_RESPONSABLE           IN RNAM_CAT_TIPOS_TELEFONOS.TIPO_TELEFONO%TYPE,
    p_TEL_RESPONSABLE                IN RNAM_TELEFONOS_RESPONSABLES.TELEFONO_RESPONSABLE%TYPE,
    p_EXT_RESPONSABLE                IN RNAM_TELEFONOS_RESPONSABLES.EXTENSION%TYPE,
    p_NOMBRE_CONTACTO                IN RNAM_CONTACTOS.NOMBRE_CONTACTO%TYPE,
    p_PATERNO_CONTACTO               IN RNAM_CONTACTOS.PATERNO_CONTACTO%TYPE,
    p_MATERNO_CONTACTO               IN RNAM_CONTACTOS.MATERNO_CONTACTO%TYPE,
    p_PARENTESCO_CONTACTO            IN RNAM_CONTACTOS.PARENTESCO_CONTACTO%TYPE,
    p_ID_TIPO_TEL_CONTACTO           IN RNAM_TELEFONOS_CONTACTOS.ID_TIPO_TELEFONO%TYPE,
    p_TIPO_TEL_CONTACTO              IN RNAM_CAT_TIPOS_TELEFONOS.TIPO_TELEFONO%TYPE,
    p_TEL_CONTACTO                   IN RNAM_TELEFONOS_CONTACTOS.TELEFONO_CONTACTO%TYPE,
    p_EXT_CONTACTO                   IN RNAM_TELEFONOS_CONTACTOS.EXTENSION%TYPE,
    p_ID_TIPO_TELEFONO_PACIENTE      IN RNAM_TELEFONOS_PACIENTES.ID_TIPO_TELEFONO%TYPE,
    p_TIPO_TELEFONO_PACIENTE         IN RNAM_CAT_TIPOS_TELEFONOS.TIPO_TELEFONO%TYPE,
    p_TELEFONO_PACIENTE              IN RNAM_TELEFONOS_PACIENTES.TELEFONO_PACIENTE%TYPE,
    p_EXTENSION_PACIENTE             IN RNAM_TELEFONOS_PACIENTES.EXTENSION%TYPE,
    VCSEMAFORO                       out VARCHAR2,
    error_info                       out VARCHAR2);

    PROCEDURE sp_inserta_tipos_telefonos (
        VNIdTipoTelefono INTEGER
        , VCTipoTelefono varchar2);

    PROCEDURE RNAM_SP_EXISTE_USUARIO (
      p_CV_USUARIO           in RNAM_CAT_USUARIOS_TOKEN.CV_USUARIO%type
    , p_CLAVE                in RNAM_CAT_USUARIOS_TOKEN.CLAVE%type
    , p_ID_RNAM_INSTITUCION  in RNAM_CAT_USUARIOS_TOKEN.ID_RNAM_INSTITUCION%type
    , p_resultado            out INT);


END PKG_ASISTENCIA_MEDICAS;
/
create or replace PACKAGE           "PKG_ASISTENCIA_MEDICAS" as

    PROCEDURE RNAM_SP_VALIDA_PACIENTE (
      p_ID_RNAM_INSTITUCION            RNAM_PACIENTES.ID_RNAM_INSTITUCION%TYPE
    , p_NOMBRE_INST                    IN RNAM_CAT_INSTITUCIONES_MEDICAS.NOMBRE%TYPE
    , p_FOLIO_REPORTE                  IN RNAM_PACIENTES.FOLIO_REPORTE%TYPE
    , p_ID_USUARIOS                    IN RNAM_PACIENTES.ID_USUARIOS%TYPE
    , p_ID_EDO_REPUBLICA_EVENTO        IN RNAM_PACIENTES.ID_EDO_REPUBLICA_EVENTO%TYPE
    , p_EDO_REPUBLICA_EVENTO           IN RNAM_PACIENTES.EDO_REPUBLICA_EVENTO%TYPE
    , p_ID_MPIO_REPUBLICA_EVENTO       IN RNAM_PACIENTES.ID_MPIO_REPUBLICA_EVENTO%TYPE
    , p_MPIO_REPUBLICA_EVENTO          IN RNAM_PACIENTES.MPIO_REPUBLICA_EVENTO%TYPE
    , p_NOMBRE                         IN RNAM_PACIENTES.NOMBRE%TYPE
    , p_PATERNO                        IN RNAM_PACIENTES.PATERNO%TYPE
    , p_MATERNO                        IN RNAM_PACIENTES.MATERNO%TYPE
    , p_FECHA_NACIMIENTO               IN RNAM_PACIENTES.FECHA_NACIMIENTO%TYPE
    , p_ID_SEXO                        IN RNAM_PACIENTES.ID_SEXO%TYPE
    , p_SEXO                           IN RNAM_CAT_SEXOS.SEXO%TYPE
    , p_ID_ESTADO_NACIMIENTO           IN RNAM_PACIENTES.ID_ESTADO_NACIMIENTO%TYPE
    , p_ESTADO_NACIMIENTO              IN RNAM_PACIENTES.ESTADO_NACIMIENTO%TYPE
    , p_CURP                           IN RNAM_PACIENTES.CURP%TYPE
    , p_PESO                           IN RNAM_PACIENTES.PESO%TYPE
    , p_ES_EXTRANJERO                  IN RNAM_PACIENTES.ES_EXTRANJERO%TYPE
    , p_ID_NACIONALIDAD                IN RNAM_PACIENTES.ID_NACIONALIDAD%TYPE
    , p_NACIONALIDAD                   IN RNAM_CAT_NACIONALIDADES.NACIONALIDAD%TYPE
    , p_FECHA_INGRESO                  IN RNAM_PACIENTES.FECHA_INGRESO%TYPE
    , p_LUGAR_OCURRENCIA               IN RNAM_PACIENTES.LUGAR_OCURRENCIA%TYPE
    , p_MOTIVO_ATENCION                IN RNAM_PACIENTES.MOTIVO_ATENCION%TYPE
    , p_FECHA_ATENCION                 IN RNAM_PACIENTES.FECHA_ATENCION%TYPE
    , p_HORA_ATENCION                  IN VARCHAR2
    , p_PACIENTE_VIVO                  IN RNAM_PACIENTES.PACIENTE_VIVO%TYPE
    , p_AUTORIDAD_ATENDIO              IN RNAM_PACIENTES.AUTORIDAD_ATENDIO%TYPE
    , p_LUGAR_TRASLADO                 IN RNAM_PACIENTES.LUGAR_TRASLADO%TYPE
    , p_ES_MENOR_EDAD                  IN RNAM_PACIENTES.ES_MENOR_EDAD%TYPE
    , p_NOMBRE_RESPONSABLE             IN RNAM_RESPONSABLES.NOMBRE_RESPONSABLE%TYPE
    , p_PATERNO_RESPONSABLE            IN RNAM_RESPONSABLES.PATERNO_RESPONSABLE%TYPE
    , p_MATERNO_RESPONSABLE            IN RNAM_RESPONSABLES.MATERNO_RESPONSABLE%TYPE
    , p_PARENTESCO_RESPONSABLE         IN RNAM_RESPONSABLES.PARENTESCO_RESPONSABLE%TYPE
    , p_ID_TIPO_TELEFONO_RESP          IN RNAM_TELEFONOS_RESPONSABLES.ID_TIPO_TELEFONO%TYPE
    , p_TIPO_TELEFONO_RESP             IN RNAM_CAT_TIPOS_TELEFONOS.TIPO_TELEFONO%TYPE
    , p_TELEFONO_RESP                  IN RNAM_TELEFONOS_RESPONSABLES.TELEFONO_RESPONSABLE%TYPE
    , p_EXTENSION_RESP                 IN RNAM_TELEFONOS_RESPONSABLES.EXTENSION%TYPE
    , p_NOMBRE_CONTACTO                IN RNAM_CONTACTOS.NOMBRE_CONTACTO%TYPE
    , p_PATERNO_CONTACTO               IN RNAM_CONTACTOS.PATERNO_CONTACTO%TYPE
    , p_MATERNO_CONTACTO               IN RNAM_CONTACTOS.MATERNO_CONTACTO%TYPE
    , p_PARENTESCO_CONTACTO            IN RNAM_CONTACTOS.PARENTESCO_CONTACTO%TYPE
    , p_ID_TIPO_TELEFONO_CONTACTO      IN RNAM_TELEFONOS_CONTACTOS.ID_TIPO_TELEFONO%TYPE
    , p_TIPO_TELEFONO_CONTACTO         IN RNAM_CAT_TIPOS_TELEFONOS.TIPO_TELEFONO%TYPE
    , p_TELEFONO_CONTACTO              IN RNAM_TELEFONOS_CONTACTOS.TELEFONO_CONTACTO%TYPE
    , p_EXTENSION_CONTACTO             IN RNAM_TELEFONOS_CONTACTOS.EXTENSION%TYPE
    , p_ID_TIPO_TELEFONO_PACIENTE      IN RNAM_TELEFONOS_PACIENTES.ID_TIPO_TELEFONO%TYPE
    , p_TIPO_TELEFONO_PACIENTE         IN RNAM_CAT_TIPOS_TELEFONOS.TIPO_TELEFONO%TYPE
    , p_TELEFONO_PACIENTE              IN RNAM_TELEFONOS_PACIENTES.TELEFONO_PACIENTE%TYPE
    , p_EXTENSION_PACIENTE             IN RNAM_TELEFONOS_PACIENTES.EXTENSION%TYPE
    , VCSEMAFORO                       OUT VARCHAR2
    , error_info                       OUT VARCHAR2);

    PROCEDURE rnam_ingresa_paciente(
    p_ID_RNAM_INSTITUCION            IN RNAM_PACIENTES.ID_RNAM_INSTITUCION%TYPE,
    p_NOMBRE_INST                    IN RNAM_CAT_INSTITUCIONES_MEDICAS.NOMBRE%TYPE,
    p_FOLIO_REPORTE                  IN RNAM_PACIENTES.FOLIO_REPORTE%TYPE,
    p_ID_USUARIOS                    IN RNAM_PACIENTES.ID_USUARIOS%TYPE,
    p_ID_EDO_REPUBLICA_EVENTO        IN RNAM_PACIENTES.ID_EDO_REPUBLICA_EVENTO%TYPE,
    p_EDO_REPUBLICA_EVENTO           IN RNAM_PACIENTES.EDO_REPUBLICA_EVENTO%TYPE,
    p_ID_MPIO_REPUBLICA_EVENTO       IN RNAM_PACIENTES.ID_MPIO_REPUBLICA_EVENTO%TYPE,
    p_MPIO_REPUBLICA_EVENTO          IN RNAM_PACIENTES.MPIO_REPUBLICA_EVENTO%TYPE,
    p_NOMBRE                         IN RNAM_PACIENTES.NOMBRE%TYPE,
    p_PATERNO                        IN RNAM_PACIENTES.PATERNO%TYPE,
    p_MATERNO                        IN RNAM_PACIENTES.MATERNO%TYPE,
    p_FECHA_NACIMIENTO               IN RNAM_PACIENTES.FECHA_NACIMIENTO%TYPE,
    p_ID_SEXO                        IN RNAM_PACIENTES.ID_SEXO%TYPE,
    p_SEXO                           IN RNAM_CAT_SEXOS.SEXO%TYPE,
    p_ID_ESTADO_NACIMIENTO           IN RNAM_PACIENTES.ID_ESTADO_NACIMIENTO%TYPE,
    p_ESTADO_NACIMIENTO              IN RNAM_PACIENTES.ESTADO_NACIMIENTO%TYPE,
    p_CURP                           IN RNAM_PACIENTES.CURP%TYPE,
    p_PESO                           IN RNAM_PACIENTES.PESO%TYPE,
    p_ES_EXTRANJERO                  IN RNAM_PACIENTES.ES_EXTRANJERO%TYPE,
    p_ID_NACIONALIDAD                IN RNAM_PACIENTES.ID_NACIONALIDAD%TYPE,
    p_NACIONALIDAD                   IN RNAM_CAT_NACIONALIDADES.NACIONALIDAD%TYPE,
    p_FECHA_INGRESO                  IN RNAM_PACIENTES.FECHA_INGRESO%TYPE,
    p_LUGAR_OCURRENCIA               IN RNAM_PACIENTES.LUGAR_OCURRENCIA%TYPE,
    p_MOTIVO_ATENCION                IN RNAM_PACIENTES.MOTIVO_ATENCION%TYPE,
    p_FECHA_ATENCION                 IN RNAM_PACIENTES.FECHA_ATENCION%TYPE,
    p_HORA_ATENCION                  IN RNAM_PACIENTES.HORA_ATENCION%TYPE,
    p_PACIENTE_VIVO                  IN RNAM_PACIENTES.PACIENTE_VIVO%TYPE,
    p_AUTORIDAD_ATENDIO              IN RNAM_PACIENTES.AUTORIDAD_ATENDIO%TYPE,
    p_LUGAR_TRASLADO                 IN RNAM_PACIENTES.LUGAR_TRASLADO%TYPE,
    p_ES_MENOR_EDAD                  IN RNAM_PACIENTES.ES_MENOR_EDAD%TYPE,
    p_NOMBRE_RESPONSABLE             IN RNAM_RESPONSABLES.NOMBRE_RESPONSABLE%TYPE,
    p_PATERNO_RESPONSABLE            IN RNAM_RESPONSABLES.PATERNO_RESPONSABLE%TYPE,
    p_MATERNO_RESPONSABLE            IN RNAM_RESPONSABLES.MATERNO_RESPONSABLE%TYPE,
    p_PARENTESCO_RESPONSABLE         IN RNAM_RESPONSABLES.PARENTESCO_RESPONSABLE%TYPE,
    p_ID_TIPO_TEL_RESPONSABLE        IN RNAM_TELEFONOS_RESPONSABLES.ID_TIPO_TELEFONO%TYPE,
    p_TIPO_TEL_RESPONSABLE           IN RNAM_CAT_TIPOS_TELEFONOS.TIPO_TELEFONO%TYPE,
    p_TEL_RESPONSABLE                IN RNAM_TELEFONOS_RESPONSABLES.TELEFONO_RESPONSABLE%TYPE,
    p_EXT_RESPONSABLE                IN RNAM_TELEFONOS_RESPONSABLES.EXTENSION%TYPE,
    p_NOMBRE_CONTACTO                IN RNAM_CONTACTOS.NOMBRE_CONTACTO%TYPE,
    p_PATERNO_CONTACTO               IN RNAM_CONTACTOS.PATERNO_CONTACTO%TYPE,
    p_MATERNO_CONTACTO               IN RNAM_CONTACTOS.MATERNO_CONTACTO%TYPE,
    p_PARENTESCO_CONTACTO            IN RNAM_CONTACTOS.PARENTESCO_CONTACTO%TYPE,
    p_ID_TIPO_TEL_CONTACTO           IN RNAM_TELEFONOS_CONTACTOS.ID_TIPO_TELEFONO%TYPE,
    p_TIPO_TEL_CONTACTO              IN RNAM_CAT_TIPOS_TELEFONOS.TIPO_TELEFONO%TYPE,
    p_TEL_CONTACTO                   IN RNAM_TELEFONOS_CONTACTOS.TELEFONO_CONTACTO%TYPE,
    p_EXT_CONTACTO                   IN RNAM_TELEFONOS_CONTACTOS.EXTENSION%TYPE,
    p_ID_TIPO_TELEFONO_PACIENTE      IN RNAM_TELEFONOS_PACIENTES.ID_TIPO_TELEFONO%TYPE,
    p_TIPO_TELEFONO_PACIENTE         IN RNAM_CAT_TIPOS_TELEFONOS.TIPO_TELEFONO%TYPE,
    p_TELEFONO_PACIENTE              IN RNAM_TELEFONOS_PACIENTES.TELEFONO_PACIENTE%TYPE,
    p_EXTENSION_PACIENTE             IN RNAM_TELEFONOS_PACIENTES.EXTENSION%TYPE,
    VCSEMAFORO                       out VARCHAR2,
    error_info                       out VARCHAR2);

    PROCEDURE sp_inserta_tipos_telefonos (
        VNIdTipoTelefono INTEGER
        , VCTipoTelefono varchar2);

    PROCEDURE RNAM_SP_EXISTE_USUARIO (
      p_CV_USUARIO           in RNAM_CAT_USUARIOS_TOKEN.CV_USUARIO%type
    , p_CLAVE                in RNAM_CAT_USUARIOS_TOKEN.CLAVE%type
    , p_ID_RNAM_INSTITUCION  in RNAM_CAT_USUARIOS_TOKEN.ID_RNAM_INSTITUCION%type
    , p_resultado            out INT);


END PKG_ASISTENCIA_MEDICAS;
/

create or replace PACKAGE BODY PKG_ASISTENCIA_MEDICAS AS

PROCEDURE RNAM_SP_VALIDA_PACIENTE (
      p_ID_RNAM_INSTITUCION            RNAM_PACIENTES.ID_RNAM_INSTITUCION%TYPE
    , p_NOMBRE_INST                    IN RNAM_CAT_INSTITUCIONES_MEDICAS.NOMBRE%TYPE
    , p_FOLIO_REPORTE                  IN RNAM_PACIENTES.FOLIO_REPORTE%TYPE
    , p_ID_USUARIOS                    IN RNAM_PACIENTES.ID_USUARIOS%TYPE
    , p_ID_EDO_REPUBLICA_EVENTO        IN RNAM_PACIENTES.ID_EDO_REPUBLICA_EVENTO%TYPE
    , p_EDO_REPUBLICA_EVENTO           IN RNAM_PACIENTES.EDO_REPUBLICA_EVENTO%TYPE
    , p_ID_MPIO_REPUBLICA_EVENTO       IN RNAM_PACIENTES.ID_MPIO_REPUBLICA_EVENTO%TYPE
    , p_MPIO_REPUBLICA_EVENTO          IN RNAM_PACIENTES.MPIO_REPUBLICA_EVENTO%TYPE
    , p_NOMBRE                         IN RNAM_PACIENTES.NOMBRE%TYPE
    , p_PATERNO                        IN RNAM_PACIENTES.PATERNO%TYPE
    , p_MATERNO                        IN RNAM_PACIENTES.MATERNO%TYPE
    , p_FECHA_NACIMIENTO               IN RNAM_PACIENTES.FECHA_NACIMIENTO%TYPE
    , p_ID_SEXO                        IN RNAM_PACIENTES.ID_SEXO%TYPE
    , p_SEXO                           IN RNAM_CAT_SEXOS.SEXO%TYPE
    , p_ID_ESTADO_NACIMIENTO           IN RNAM_PACIENTES.ID_ESTADO_NACIMIENTO%TYPE
    , p_ESTADO_NACIMIENTO              IN RNAM_PACIENTES.ESTADO_NACIMIENTO%TYPE
    , p_CURP                           IN RNAM_PACIENTES.CURP%TYPE
    , p_PESO                           IN RNAM_PACIENTES.PESO%TYPE
    , p_ES_EXTRANJERO                  IN RNAM_PACIENTES.ES_EXTRANJERO%TYPE
    , p_ID_NACIONALIDAD                IN RNAM_PACIENTES.ID_NACIONALIDAD%TYPE
    , p_NACIONALIDAD                   IN RNAM_CAT_NACIONALIDADES.NACIONALIDAD%TYPE
    , p_FECHA_INGRESO                  IN RNAM_PACIENTES.FECHA_INGRESO%TYPE
    , p_LUGAR_OCURRENCIA               IN RNAM_PACIENTES.LUGAR_OCURRENCIA%TYPE
    , p_MOTIVO_ATENCION                IN RNAM_PACIENTES.MOTIVO_ATENCION%TYPE
    , p_FECHA_ATENCION                 IN RNAM_PACIENTES.FECHA_ATENCION%TYPE
    , p_HORA_ATENCION                  IN VARCHAR2
    , p_PACIENTE_VIVO                  IN RNAM_PACIENTES.PACIENTE_VIVO%TYPE
    , p_AUTORIDAD_ATENDIO              IN RNAM_PACIENTES.AUTORIDAD_ATENDIO%TYPE
    , p_LUGAR_TRASLADO                 IN RNAM_PACIENTES.LUGAR_TRASLADO%TYPE
    , p_ES_MENOR_EDAD                  IN RNAM_PACIENTES.ES_MENOR_EDAD%TYPE
    , p_NOMBRE_RESPONSABLE             IN RNAM_RESPONSABLES.NOMBRE_RESPONSABLE%TYPE
    , p_PATERNO_RESPONSABLE            IN RNAM_RESPONSABLES.PATERNO_RESPONSABLE%TYPE
    , p_MATERNO_RESPONSABLE            IN RNAM_RESPONSABLES.MATERNO_RESPONSABLE%TYPE
    , p_PARENTESCO_RESPONSABLE         IN RNAM_RESPONSABLES.PARENTESCO_RESPONSABLE%TYPE
    , p_ID_TIPO_TELEFONO_RESP          IN RNAM_TELEFONOS_RESPONSABLES.ID_TIPO_TELEFONO%TYPE
    , p_TIPO_TELEFONO_RESP             IN RNAM_CAT_TIPOS_TELEFONOS.TIPO_TELEFONO%TYPE
    , p_TELEFONO_RESP                  IN RNAM_TELEFONOS_RESPONSABLES.TELEFONO_RESPONSABLE%TYPE
    , p_EXTENSION_RESP                 IN RNAM_TELEFONOS_RESPONSABLES.EXTENSION%TYPE
    , p_NOMBRE_CONTACTO                IN RNAM_CONTACTOS.NOMBRE_CONTACTO%TYPE
    , p_PATERNO_CONTACTO               IN RNAM_CONTACTOS.PATERNO_CONTACTO%TYPE
    , p_MATERNO_CONTACTO               IN RNAM_CONTACTOS.MATERNO_CONTACTO%TYPE
    , p_PARENTESCO_CONTACTO            IN RNAM_CONTACTOS.PARENTESCO_CONTACTO%TYPE
    , p_ID_TIPO_TELEFONO_CONTACTO      IN RNAM_TELEFONOS_CONTACTOS.ID_TIPO_TELEFONO%TYPE
    , p_TIPO_TELEFONO_CONTACTO         IN RNAM_CAT_TIPOS_TELEFONOS.TIPO_TELEFONO%TYPE
    , p_TELEFONO_CONTACTO              IN RNAM_TELEFONOS_CONTACTOS.TELEFONO_CONTACTO%TYPE
    , p_EXTENSION_CONTACTO             IN RNAM_TELEFONOS_CONTACTOS.EXTENSION%TYPE
    , p_ID_TIPO_TELEFONO_PACIENTE      IN RNAM_TELEFONOS_PACIENTES.ID_TIPO_TELEFONO%TYPE
    , p_TIPO_TELEFONO_PACIENTE         IN RNAM_CAT_TIPOS_TELEFONOS.TIPO_TELEFONO%TYPE
    , p_TELEFONO_PACIENTE              IN RNAM_TELEFONOS_PACIENTES.TELEFONO_PACIENTE%TYPE
    , p_EXTENSION_PACIENTE             IN RNAM_TELEFONOS_PACIENTES.EXTENSION%TYPE
    , VCSEMAFORO                       OUT VARCHAR2
    , error_info                       OUT VARCHAR2)

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
    sql_stmt          VARCHAR2(8000);
    nombrecompleto    VARCHAR2(100) := '';
    p_resultado       INT := 0;
    p_ID_SEMAFORO     INT := 0;

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

     CASE  p_resultado
        WHEN  0 THEN   p_ID_SEMAFORO := 1;
        WHEN  1 THEN   p_ID_SEMAFORO := 2;
        ELSE  p_ID_SEMAFORO := 3;
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

PROCEDURE sp_inserta_tipos_telefonos (
    VNIdTipoTelefono INTEGER
    , VCTipoTelefono varchar2 ) 
    is
    vnExiste      integer := 0;
     begin

        select id_tipo_telefono
        into vnExiste
        from rnam_cat_tipos_telefonos
        WHERE id_tipo_telefono = VNIdTipoTelefono;

    exception
    when no_data_found then 
         vnExiste := 0;

            INSERT INTO rnam_cat_tipos_telefonos
            (id_tipo_telefono, tipo_telefono)
            VALUES (VNIdTipoTelefono, VCTipoTelefono);

             vnExiste := VNIdTipoTelefono;

    END sp_inserta_tipos_telefonos;

------------------
PROCEDURE rnam_ingresa_paciente(
    p_ID_RNAM_INSTITUCION            IN RNAM_PACIENTES.ID_RNAM_INSTITUCION%TYPE,
    p_NOMBRE_INST                    IN RNAM_CAT_INSTITUCIONES_MEDICAS.NOMBRE%TYPE,
    p_FOLIO_REPORTE                  IN RNAM_PACIENTES.FOLIO_REPORTE%TYPE,
    p_ID_USUARIOS                    IN RNAM_PACIENTES.ID_USUARIOS%TYPE,
    p_ID_EDO_REPUBLICA_EVENTO        IN RNAM_PACIENTES.ID_EDO_REPUBLICA_EVENTO%TYPE,
    p_EDO_REPUBLICA_EVENTO           IN RNAM_PACIENTES.EDO_REPUBLICA_EVENTO%TYPE,
    p_ID_MPIO_REPUBLICA_EVENTO       IN RNAM_PACIENTES.ID_MPIO_REPUBLICA_EVENTO%TYPE,
    p_MPIO_REPUBLICA_EVENTO          IN RNAM_PACIENTES.MPIO_REPUBLICA_EVENTO%TYPE,
    p_NOMBRE                         IN RNAM_PACIENTES.NOMBRE%TYPE,
    p_PATERNO                        IN RNAM_PACIENTES.PATERNO%TYPE,
    p_MATERNO                        IN RNAM_PACIENTES.MATERNO%TYPE,
    p_FECHA_NACIMIENTO               IN RNAM_PACIENTES.FECHA_NACIMIENTO%TYPE,
    p_ID_SEXO                        IN RNAM_PACIENTES.ID_SEXO%TYPE,
    p_SEXO                           IN RNAM_CAT_SEXOS.SEXO%TYPE,
    p_ID_ESTADO_NACIMIENTO           IN RNAM_PACIENTES.ID_ESTADO_NACIMIENTO%TYPE,
    p_ESTADO_NACIMIENTO              IN RNAM_PACIENTES.ESTADO_NACIMIENTO%TYPE,
    p_CURP                           IN RNAM_PACIENTES.CURP%TYPE,
    p_PESO                           IN RNAM_PACIENTES.PESO%TYPE,
    p_ES_EXTRANJERO                  IN RNAM_PACIENTES.ES_EXTRANJERO%TYPE,
    p_ID_NACIONALIDAD                IN RNAM_PACIENTES.ID_NACIONALIDAD%TYPE,
    p_NACIONALIDAD                   IN RNAM_CAT_NACIONALIDADES.NACIONALIDAD%TYPE,
    p_FECHA_INGRESO                  IN RNAM_PACIENTES.FECHA_INGRESO%TYPE,
    p_LUGAR_OCURRENCIA               IN RNAM_PACIENTES.LUGAR_OCURRENCIA%TYPE,
    p_MOTIVO_ATENCION                IN RNAM_PACIENTES.MOTIVO_ATENCION%TYPE,
    p_FECHA_ATENCION                 IN RNAM_PACIENTES.FECHA_ATENCION%TYPE,
    p_HORA_ATENCION                  IN RNAM_PACIENTES.HORA_ATENCION%TYPE,
    p_PACIENTE_VIVO                  IN RNAM_PACIENTES.PACIENTE_VIVO%TYPE,
    p_AUTORIDAD_ATENDIO              IN RNAM_PACIENTES.AUTORIDAD_ATENDIO%TYPE,
    p_LUGAR_TRASLADO                 IN RNAM_PACIENTES.LUGAR_TRASLADO%TYPE,
    p_ES_MENOR_EDAD                  IN RNAM_PACIENTES.ES_MENOR_EDAD%TYPE,
    p_NOMBRE_RESPONSABLE             IN RNAM_RESPONSABLES.NOMBRE_RESPONSABLE%TYPE,
    p_PATERNO_RESPONSABLE            IN RNAM_RESPONSABLES.PATERNO_RESPONSABLE%TYPE,
    p_MATERNO_RESPONSABLE            IN RNAM_RESPONSABLES.MATERNO_RESPONSABLE%TYPE,
    p_PARENTESCO_RESPONSABLE         IN RNAM_RESPONSABLES.PARENTESCO_RESPONSABLE%TYPE,
    p_ID_TIPO_TEL_RESPONSABLE        IN RNAM_TELEFONOS_RESPONSABLES.ID_TIPO_TELEFONO%TYPE,
    p_TIPO_TEL_RESPONSABLE           IN RNAM_CAT_TIPOS_TELEFONOS.TIPO_TELEFONO%TYPE,
    p_TEL_RESPONSABLE                IN RNAM_TELEFONOS_RESPONSABLES.TELEFONO_RESPONSABLE%TYPE,
    p_EXT_RESPONSABLE                IN RNAM_TELEFONOS_RESPONSABLES.EXTENSION%TYPE,
    p_NOMBRE_CONTACTO                IN RNAM_CONTACTOS.NOMBRE_CONTACTO%TYPE,
    p_PATERNO_CONTACTO               IN RNAM_CONTACTOS.PATERNO_CONTACTO%TYPE,
    p_MATERNO_CONTACTO               IN RNAM_CONTACTOS.MATERNO_CONTACTO%TYPE,
    p_PARENTESCO_CONTACTO            IN RNAM_CONTACTOS.PARENTESCO_CONTACTO%TYPE,
    p_ID_TIPO_TEL_CONTACTO           IN RNAM_TELEFONOS_CONTACTOS.ID_TIPO_TELEFONO%TYPE,
    p_TIPO_TEL_CONTACTO              IN RNAM_CAT_TIPOS_TELEFONOS.TIPO_TELEFONO%TYPE,
    p_TEL_CONTACTO                   IN RNAM_TELEFONOS_CONTACTOS.TELEFONO_CONTACTO%TYPE,
    p_EXT_CONTACTO                   IN RNAM_TELEFONOS_CONTACTOS.EXTENSION%TYPE,
    p_ID_TIPO_TELEFONO_PACIENTE      IN RNAM_TELEFONOS_PACIENTES.ID_TIPO_TELEFONO%TYPE,
    p_TIPO_TELEFONO_PACIENTE         IN RNAM_CAT_TIPOS_TELEFONOS.TIPO_TELEFONO%TYPE,
    p_TELEFONO_PACIENTE              IN RNAM_TELEFONOS_PACIENTES.TELEFONO_PACIENTE%TYPE,
    p_EXTENSION_PACIENTE             IN RNAM_TELEFONOS_PACIENTES.EXTENSION%TYPE,
    VCSEMAFORO                       out VARCHAR2,
    error_info                       out VARCHAR2
    )

IS
-----------------------------------------------------------------------------
-- Creación: 14 FEBRERO 23
-- Autor: JLCR
-- Descripción: Ingresa informacion del paciente al RNAM
-----------------------------------------------------------------------------

    ---DEFINICION DE VARIABLES
    Sql_err           NUMBER(10);
    Isam_err          NUMBER(10);
    sql_stmt          VARCHAR2(8000);
    nombrecompleto    VARCHAR2(100) := '';
    p_resultado       INT := 0;
    p_ID_SEMAFORO     INT := 0;
    p_FECHA_MODIFICA  date := ''; 

    vnexisinst         number(3):=0;
    vnexissexo         number(3):=0;
    vnexisnaci         number(3):=0;
    vnexisfolio        number(3):=0;
    vnsecpaciente      RNAM_PACIENTES.id_rnam_paciente%TYPE; 
    vnexistelpaciente  RNAM_TELEFONOS_PACIENTES.id_rnam_paciente%TYPE;
    vnexisresponsable  RNAM_RESPONSABLES.id_responsable%TYPE;
    vnexiscont         RNAM_CONTACTOS.id_contacto%TYPE;
    vnexisrespon       RNAM_TELEFONOS_RESPONSABLES.id_telefono_responsable%TYPE;
    vnexiscontacto     RNAM_TELEFONOS_CONTACTOS.id_telefono_contacto%TYPE;

BEGIN
       nombrecompleto := '%' ||p_NOMBRE || ' ' || nvl(p_PATERNO,'%') || ' ' || p_MATERNO || '%';

       dbms_output.put_line('nombre completo...' || nombrecompleto);

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
           WHERE utl_raw.cast_to_varchar2(nlssort((case when ddc."nombre_detenido" || '' '' || ddc."apellido_paterno" || '' '' || ddc."apellido_materno" is null 
                            then dt."nombre" || '' '' || dt."apellido_paterno" || '' '' || dt."apellido_materno" 
                        when dt."nombre" || '' '' || dt."apellido_paterno" || '' '' || dt."apellido_materno" is null 
                            then ddc."nombre_detenido" || '' '' || ddc."apellido_paterno" || '' '' || ddc."apellido_materno" 
                        else dt."nombre" || '' '' || dt."apellido_paterno" || '' '' || dt."apellido_materno" end) , ''nls_sort=binary_ai''))
                       like  utl_raw.cast_to_varchar2(nlssort(:nombre, ''nls_sort=binary_ai''))';

       EXECUTE IMMEDIATE sql_stmt INTO  p_resultado USING nombrecompleto;

      CASE p_resultado
        WHEN  0 THEN VCSEMAFORO := 'VERDE';
        WHEN  1 THEN VCSEMAFORO := 'AMARILLO';
        ELSE VCSEMAFORO := 'ROJO';
       END CASE;

     CASE  p_resultado
        WHEN  0 THEN   p_ID_SEMAFORO := 1;
        WHEN  1 THEN   p_ID_SEMAFORO := 2;
        ELSE  p_ID_SEMAFORO := 3;
       END CASE;

--dbms_output.put_line('SEMAFORO...' || TO_CHAR(p_ID_SEMAFORO) ||' ' || VCSEMAFORO);

    --rnam_cat_instituciones_medicas
    begin

        select (1)
        into vnexisinst 
        from rnam_cat_instituciones_medicas
        WHERE ID_RNAM_INSTITUCION = p_ID_RNAM_INSTITUCION;

    exception
    when no_data_found then 
        vnexisinst :=0;
    end;

        if (vnexisinst = 0) then

            INSERT INTO rnam_cat_instituciones_medicas
            (ID_RNAM_INSTITUCION, nombre)
            VALUES (p_ID_RNAM_INSTITUCION, p_NOMBRE_INST);

        end if;

     --rnam_cat_sexos 
     begin

        select id_sexo
        into vnexissexo
        from rnam_cat_sexos
        WHERE id_sexo = p_ID_SEXO;

    exception
    when no_data_found then 
        vnexissexo :=0;
    end;

        if (vnexissexo = 0) then

            INSERT INTO rnam_cat_sexos
            (id_sexo, sexo)
            VALUES (p_ID_SEXO, p_SEXO);

        end if;

     --rnam_cat_nacionalidades
     begin

        select id_nacionalidad
        into vnexisnaci
        from rnam_cat_nacionalidades
        WHERE id_nacionalidad = p_ID_NACIONALIDAD;

    exception
    when no_data_found then 
        vnexisnaci :=0;
    end;

        if (vnexisnaci = 0) then

            INSERT INTO rnam_cat_nacionalidades
            (id_nacionalidad, nacionalidad)
            VALUES (p_ID_NACIONALIDAD, p_NACIONALIDAD);

        end if;

    --rnam_pacientes
     begin

        INSERT INTO rnam_pacientes
            (ID_RNAM_INSTITUCION
            , FOLIO_REPORTE
            , ID_USUARIOS
            , ID_EDO_REPUBLICA_EVENTO
            , EDO_REPUBLICA_EVENTO
            , ID_MPIO_REPUBLICA_EVENTO
            , MPIO_REPUBLICA_EVENTO
            , NOMBRE
            , PATERNO
            , MATERNO
            , FECHA_NACIMIENTO
            , ID_SEXO
            , ID_ESTADO_NACIMIENTO
            , ESTADO_NACIMIENTO
            , CURP
            , PESO
            , ES_EXTRANJERO
            , ID_NACIONALIDAD
            , FECHA_INGRESO
            , LUGAR_OCURRENCIA
            , MOTIVO_ATENCION
            , FECHA_ATENCION
            , HORA_ATENCION
            , PACIENTE_VIVO
            , AUTORIDAD_ATENDIO
            , LUGAR_TRASLADO
            , ES_MENOR_EDAD
           -- , FECHA_INSERTA
            , FECHA_MODIFICA
            , ID_SEMAFORO
            )
        VALUES (
               p_ID_RNAM_INSTITUCION
             , p_FOLIO_REPORTE
             , p_ID_USUARIOS
             , p_ID_EDO_REPUBLICA_EVENTO
             , p_EDO_REPUBLICA_EVENTO
             , p_ID_MPIO_REPUBLICA_EVENTO
             , p_MPIO_REPUBLICA_EVENTO
             , p_NOMBRE
             , p_PATERNO
             , p_MATERNO
             , p_FECHA_NACIMIENTO
             , p_ID_SEXO           
             , p_ID_ESTADO_NACIMIENTO
             , p_ESTADO_NACIMIENTO
             , p_CURP
             , p_PESO
             , p_ES_EXTRANJERO
             , p_ID_NACIONALIDAD
             , p_FECHA_INGRESO
             , p_LUGAR_OCURRENCIA
             , p_MOTIVO_ATENCION
             , p_FECHA_ATENCION
             , p_HORA_ATENCION
             , p_PACIENTE_VIVO
             , p_AUTORIDAD_ATENDIO
             , p_LUGAR_TRASLADO
             , p_ES_MENOR_EDAD
            -- , p_FECHA_INSERTA
             , p_FECHA_MODIFICA
             , p_ID_SEMAFORO
            )RETURNING id_rnam_paciente INTO vnexisfolio;

           -- dbms_output.put_line('vnsecpaciente INSERT...' || TO_CHAR(vnexisfolio));

         end;

     --rnam_cat_tipos_telefonos
     PKG_ASISTENCIA_MEDICAS.sp_inserta_tipos_telefonos(p_ID_TIPO_TELEFONO_PACIENTE, p_TIPO_TELEFONO_PACIENTE);

    --RNAM_TELEFONOS_PACIENTES
    begin

        INSERT INTO rnam_telefonos_pacientes
            (id_rnam_paciente
            , id_tipo_telefono
            , telefono_paciente
            , extension)
        VALUES 
            ( vnexisfolio
            , p_ID_TIPO_TELEFONO_PACIENTE
            , p_TELEFONO_PACIENTE
            , p_EXTENSION_PACIENTE);

    end;

    --RNAM_RESPONSABLES
    begin

        INSERT INTO rnam_responsables
            (id_rnam_paciente
            , nombre_responsable
            , paterno_responsable
            , materno_responsable
            , parentesco_responsable)
        VALUES 
            ( vnexisfolio
            , p_NOMBRE_RESPONSABLE
            , p_PATERNO_RESPONSABLE
            , p_MATERNO_RESPONSABLE
            , p_PARENTESCO_RESPONSABLE) 
            RETURNING id_responsable INTO vnexisresponsable;

    end;


    --RNAM_CONTACTOS
    begin

        INSERT INTO rnam_contactos
            (id_rnam_paciente
            , nombre_contacto
            , paterno_contacto
            , materno_contacto
            , parentesco_contacto)
        VALUES 
            ( vnexisfolio
            , p_NOMBRE_CONTACTO
            , p_PATERNO_CONTACTO
            , p_MATERNO_CONTACTO
            , p_PARENTESCO_CONTACTO) 
            RETURNING id_contacto INTO vnexiscont;

    end;

    --rnam_cat_tipos_telefonos
     PKG_ASISTENCIA_MEDICAS.sp_inserta_tipos_telefonos(p_ID_TIPO_TEL_RESPONSABLE, p_TIPO_TEL_RESPONSABLE);   

    --RNAM_TELEFONOS_RESPONSABLES
    begin

        INSERT INTO rnam_telefonos_responsables
            (id_responsable
            , id_tipo_telefono
            , telefono_responsable
            , extension)
        VALUES 
            ( vnexisresponsable
            , p_ID_TIPO_TEL_RESPONSABLE
            , p_TEL_RESPONSABLE
            , p_EXT_RESPONSABLE);

    end;

    --rnam_cat_tipos_telefonos
    PKG_ASISTENCIA_MEDICAS.sp_inserta_tipos_telefonos(p_ID_TIPO_TEL_CONTACTO, p_TIPO_TEL_CONTACTO);   

    --RNAM_TELEFONOS_CONTACTOS
    begin

        INSERT INTO rnam_telefonos_contactos
            (id_contacto
            , id_tipo_telefono
            , telefono_contacto
            , extension)
        VALUES 
            ( vnexiscont
            , p_ID_TIPO_TEL_CONTACTO
            , p_TEL_CONTACTO
            , p_EXT_CONTACTO);

    end;

    commit;
 dbms_output.put_line('Termino...' || p_FOLIO_REPORTE);
 EXCEPTION
        WHEN OTHERS THEN
            p_resultado := 0;
            sql_err := SQLCODE;
            isam_err := SQLCODE;
            error_info := SQLERRM;
            error_info := error_info || ' ERROR_STACK: ' || DBMS_UTILITY.FORMAT_ERROR_STACK;
            error_info := error_info || ' ERROR_BACKTRACE: ' || DBMS_UTILITY.FORMAT_ERROR_BACKTRACE;

            dbms_output.put_line('Error...' || error_info);

END rnam_ingresa_paciente;

--------------------

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