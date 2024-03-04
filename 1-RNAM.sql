-----------------------------------------------------------------------------
-- Creación: 06 FEBRERO 24
-- Autor: JLCR
-- Descripción: Creación de objetos esquema RNAMADM
-----------------------------------------------------------------------------

CREATE SEQUENCE rnam_seq_contactos
	INCREMENT BY 1
	START WITH 1
	NOCACHE;

CREATE SEQUENCE rnam_seq_pacientes
	INCREMENT BY 1
	START WITH 1
	NOCACHE;

CREATE SEQUENCE rnam_seq_tel_pacientes
	INCREMENT BY 1
	START WITH 1
	NOCACHE;

CREATE SEQUENCE rnam_seq_tel_responsable
	INCREMENT BY 1
	START WITH 1
	NOCACHE;

CREATE SEQUENCE rnam_seq_tel_contactos
	INCREMENT BY 1
	START WITH 1
	NOCACHE;

CREATE SEQUENCE rnam_seq_usuarios_tok
	INCREMENT BY 1
	START WITH 1
	NOCACHE;

CREATE SEQUENCE rnam_seq_RESPONSABLES
	INCREMENT BY 1
	START WITH 1
	NOCACHE;
	
---Cteación de tablas

CREATE TABLE rnam_cat_instituciones_medicas
(
	id_rnam_institucion   INTEGER  NOT NULL ,
	nombre                VARCHAR2(60)  NOT NULL 
);



COMMENT ON COLUMN rnam_cat_instituciones_medicas.id_rnam_institucion IS 'Clave única del catálogo de instituciones que envian información al RNAM';
COMMENT ON COLUMN rnam_cat_instituciones_medicas.nombre IS 'Nombre de Instituciön';
CREATE UNIQUE INDEX XPKrnam_cat_instituciones_medi ON rnam_cat_instituciones_medicas
(id_rnam_institucion  ASC) TABLESPACE RNAM_INDX01;;



ALTER TABLE rnam_cat_instituciones_medicas
	ADD CONSTRAINT  XPKrnam_cat_instituciones_medi PRIMARY KEY (id_rnam_institucion);



CREATE TABLE rnam_cat_nacionalidades
(
	id_nacionalidad       INTEGER  NOT NULL ,
	nacionalidad          VARCHAR2(20)  NULL 
);



COMMENT ON COLUMN rnam_cat_nacionalidades.id_nacionalidad IS 'Clave única de nacionalidad del paciente';
COMMENT ON COLUMN rnam_cat_nacionalidades.nacionalidad IS 'Nacionalidad';

CREATE UNIQUE INDEX XPKrnam_cat_nacionalidades ON rnam_cat_nacionalidades
(id_nacionalidad  ASC) TABLESPACE RNAM_INDX01;



ALTER TABLE rnam_cat_nacionalidades
	ADD CONSTRAINT  XPKrnam_cat_nacionalidades PRIMARY KEY (id_nacionalidad);



CREATE TABLE rnam_cat_semaforo
(
	id_semaforo           INTEGER  NOT NULL ,
	nombre                VARCHAR2(20)  NULL 
);



COMMENT ON COLUMN rnam_cat_semaforo.id_semaforo IS 'Clave única de la señalizacion del paciente pata identicarlo como reincidente';
COMMENT ON COLUMN rnam_cat_semaforo.nombre IS 'Señalización del paciente commo reincidente 0 = Verde, no se emcontro, 1 = Amarillo, se encontro, 2 = Se encontro mas de 2 Veces';

CREATE UNIQUE INDEX XPKrnam_cat_semaforo ON rnam_cat_semaforo
(id_semaforo  ASC) TABLESPACE RNAM_INDX01;



ALTER TABLE rnam_cat_semaforo
	ADD CONSTRAINT  XPKrnam_cat_semaforo PRIMARY KEY (id_semaforo);



CREATE TABLE rnam_cat_sexos
(
	id_sexo               INTEGER  NOT NULL ,
	sexo                  VARCHAR2(20)  NULL 
);



COMMENT ON COLUMN rnam_cat_sexos.id_sexo IS 'Clave única del catálogo de sexos';
COMMENT ON COLUMN rnam_cat_sexos.sexo IS 'Sexo';


CREATE UNIQUE INDEX XPKrnam_cat_sexos ON rnam_cat_sexos
(id_sexo  ASC) TABLESPACE RNAM_INDX01;;



ALTER TABLE rnam_cat_sexos
	ADD CONSTRAINT  XPKrnam_cat_sexos PRIMARY KEY (id_sexo);



CREATE TABLE rnam_cat_tipos_telefonos
(
	id_tipo_telefono       INTEGER  NOT NULL ,
	tipo_telefono         VARCHAR2(20)  NOT NULL 
);



COMMENT ON COLUMN rnam_cat_tipos_telefonos.id_tipo_telefono IS 'Clave ónica de tipo de teléfono';
COMMENT ON COLUMN rnam_cat_tipos_telefonos.tipo_telefono IS 'Tipo de teléfono';


CREATE UNIQUE INDEX XPKrnam_cat_tipos_telefonos ON rnam_cat_tipos_telefonos
(id_tipo_telefono  ASC) TABLESPACE RNAM_INDX01;



ALTER TABLE rnam_cat_tipos_telefonos
	ADD CONSTRAINT  XPKrnam_cat_tipos_telefonos PRIMARY KEY (id_tipo_telefono);



CREATE TABLE rnam_cat_usuarios_token
(
	id_rnam_usuario       INTEGER  NOT NULL ,
	id_rnam_institucion   INTEGER  NOT NULL ,
	fecha_inserta         TIMESTAMP   DEFAULT  sysdate NULL ,
	es_activo             INTEGER   DEFAULT  1 NULL   CHECK (es_activo BETWEEN 0 AND 1),
	cv_usuario            VARCHAR2(20)  NOT NULL ,
	clave                 VARCHAR2(500)   DEFAULT ' '   NOT NULL 
);



COMMENT ON TABLE rnam_cat_usuarios_token IS 'Tabla que almacena los datos de los usuarios del aplicativo RNNAM';
COMMENT ON COLUMN rnam_cat_usuarios_token.id_rnam_usuario IS 'Clave única del registro de usuarios';
COMMENT ON COLUMN rnam_cat_usuarios_token.fecha_inserta IS 'Fecha en que se ingreso el registro';
COMMENT ON COLUMN rnam_cat_usuarios_token.es_activo IS 'El usuario es 0=Inactivo, 1=Activo';
COMMENT ON COLUMN rnam_cat_usuarios_token.id_rnam_institucion IS 'Clave única del catálogo de instituciones que envian información al RNAM';
COMMENT ON COLUMN rnam_cat_usuarios_token.cv_usuario IS 'Usuario con la que se registra';
COMMENT ON COLUMN rnam_cat_usuarios_token.clave IS 'Palabra clave para autenticarse';


CREATE UNIQUE INDEX XPKrman_usuarios_idusuario ON rnam_cat_usuarios_token
(id_rnam_usuario  ASC) TABLESPACE RNAM_INDX01;



ALTER TABLE rnam_cat_usuarios_token
	ADD CONSTRAINT  XPKrman_usuarios_idusuario PRIMARY KEY (id_rnam_usuario);



CREATE TABLE rnam_contactos
(
	id_contacto           INTEGER  NOT NULL ,
	id_rnam_paciente      INTEGER  NULL ,
	nombre_contacto       VARCHAR2(20)  NOT NULL ,
	paterno_contacto      VARCHAR2(20)  NULL ,
	materno_contacto      VARCHAR2(20)  NULL ,
	parentesco_contacto   VARCHAR2(20)  NOT NULL
);



COMMENT ON COLUMN rnam_contactos.id_contacto IS 'Clave única decontacto del paciente';
COMMENT ON COLUMN rnam_contactos.nombre_contacto IS 'Nombre del contacto';
COMMENT ON COLUMN rnam_contactos.paterno_contacto IS 'Apellido del contacto';
COMMENT ON COLUMN rnam_contactos.materno_contacto IS 'Apellido del contacto';
COMMENT ON COLUMN rnam_contactos.parentesco_contacto IS 'Parentesco que tiene con el contacto con paciente';
COMMENT ON COLUMN rnam_contactos.id_rnam_paciente IS 'Clave única del paciente en el RNAM';


CREATE UNIQUE INDEX XPKrnam_contactos ON rnam_contactos
(id_contacto  ASC) TABLESPACE RNAM_INDX01;



ALTER TABLE rnam_contactos
	ADD CONSTRAINT  XPKrnam_contactos PRIMARY KEY (id_contacto);



CREATE TABLE rnam_pacientes
(
	id_rnam_paciente      INTEGER  NOT NULL ,
	id_rnam_institucion   INTEGER  NOT NULL ,
	folio_reporte         VARCHAR2(20)  NOT NULL ,
	id_usuarios           INTEGER  NOT NULL ,
	id_edo_republica_evento  INTEGER  NOT NULL ,
	edo_republica_evento  VARCHAR2(20)  NULL ,
	id_mpio_republica_evento  INTEGER  NOT NULL ,
	mpio_republica_evento  VARCHAR2(20)  NULL ,	
	nombre                VARCHAR2(20)  NULL ,
	paterno               VARCHAR2(20)  NULL ,
	materno               VARCHAR2(20)  NULL ,
	fecha_nacimiento      DATE  NULL ,
	id_sexo               INTEGER  NULL ,
	id_estado_nacimiento  INTEGER  NULL ,
	estado_nacimiento     VARCHAR2(20)  NULL ,
	CURP                  VARCHAR2(20)  NULL ,
	peso                  NUMBER(5,2)   DEFAULT  0 NOT NULL ,
	es_extranjero         INTEGER  NULL ,
	id_nacionalidad       INTEGER  NOT NULL ,
	fecha_ingreso         TIMESTAMP  NULL ,
	lugar_ocurrencia      VARCHAR2(20)  NULL ,
	motivo_atencion       VARCHAR2(20)  NULL ,
	fecha_atencion        DATE  NULL ,
	hora_atencion         DATE  NULL ,
	paciente_vivo         NUMBER(1)   DEFAULT  0 NOT NULL CHECK (paciente_vivo BETWEEN 0 AND 1),
	autoridad_atendio     VARCHAR2(20)  NULL ,
	lugar_traslado        VARCHAR2(20)  NULL ,
	es_menor_edad         INTEGER   DEFAULT  0 NULL CHECK (es_menor_edad BETWEEN 0 AND 1),
	fecha_inserta         TIMESTAMP   DEFAULT  sysdate NULL ,
	fecha_modifica        VARCHAR2(20)  NULL ,
	id_semaforo           INTEGER  NULL 
);



COMMENT ON COLUMN rnam_pacientes.nombre IS 'Nombre del paciente';
COMMENT ON COLUMN rnam_pacientes.paterno IS 'Apellido Paterno de paciente';
COMMENT ON COLUMN rnam_pacientes.materno IS 'Apellido materno del paciente';
COMMENT ON COLUMN rnam_pacientes.CURP IS 'CURP del Paciente';
COMMENT ON COLUMN rnam_pacientes.peso IS 'Peso en kilos del paciente';
COMMENT ON COLUMN rnam_pacientes.es_extranjero IS 'El paciente es Extranjero? 0 = No! = Si';
COMMENT ON COLUMN rnam_pacientes.fecha_nacimiento IS 'Fecha de nacimiento del paciente';
COMMENT ON COLUMN rnam_pacientes.fecha_ingreso IS 'Fecha en la que ingreso';
COMMENT ON COLUMN rnam_pacientes.fecha_inserta IS 'Fecha de ingresa el registro al RNAM';
COMMENT ON COLUMN rnam_pacientes.lugar_ocurrencia IS 'lugar en donde ocurrio el evento';
COMMENT ON COLUMN rnam_pacientes.fecha_modifica IS 'Fecha en la que se modifica el registro del RNAM';
COMMENT ON COLUMN rnam_pacientes.motivo_atencion IS 'Motivo por el cual ingreso';
COMMENT ON COLUMN rnam_pacientes.fecha_atencion IS 'fecha en la que se atendio';
COMMENT ON COLUMN rnam_pacientes.hora_atencion IS 'Hora en la que se antendio';
COMMENT ON COLUMN rnam_pacientes.paciente_vivo IS 'El paciente se presento vivo? 1= Si, 0=No';
COMMENT ON COLUMN rnam_pacientes.folio_reporte IS 'Número del reporte en el FRAP';
COMMENT ON COLUMN rnam_pacientes.autoridad_atendio IS 'Nombre de la autoridad  Que atendio';
COMMENT ON COLUMN rnam_pacientes.es_menor_edad IS 'El paciente es menor de edad?, 0 = N0, 1 = Si';
COMMENT ON COLUMN rnam_pacientes.id_rnam_paciente IS 'Clave única del paciente en el RNAM';
COMMENT ON COLUMN rnam_pacientes.lugar_traslado IS 'Lugar al que se traslado';
COMMENT ON COLUMN rnam_pacientes.id_rnam_institucion IS 'Clave única del catálogo de instituciones que envian información al RNAM';
COMMENT ON COLUMN rnam_pacientes.id_sexo IS 'Clave única del catálogo de sexos';
COMMENT ON COLUMN rnam_pacientes.id_nacionalidad IS 'Clave única de nacionalidad del paciente';
COMMENT ON COLUMN rnam_pacientes.id_usuarios IS 'Clave de paciente en el FRAP';
COMMENT ON COLUMN rnam_pacientes.edo_republica_evento IS 'Nombre del estado de la republica donde se levanto el reporte en el FRAP';
COMMENT ON COLUMN rnam_pacientes.mpio_republica_evento IS 'nombre del mu nicipiode la republica donde se levanto el reporte en el FRAP';
COMMENT ON COLUMN rnam_pacientes.id_semaforo IS 'Clave única de la señalizacion del paciente pata identicarlo como reincidente';
COMMENT ON COLUMN rnam_pacientes.id_edo_republica_evento IS 'Clave del estado de la republica donde se levanto el reporte en el FRAP';
COMMENT ON COLUMN rnam_pacientes.id_mpio_republica_evento IS 'Clave del municipio de la republica donde se levanto el reporte en el FRAP';


CREATE UNIQUE INDEX XPKrnam_pacientes ON rnam_pacientes
(id_rnam_paciente  ASC) TABLESPACE RNAM_INDX01;

CREATE UNIQUE INDEX IDX_PACIENTES_ID_USUARIOS ON RNAM_PACIENTES 
(ID_USUARIOS ASC) TABLESPACE RNAM_INDX01;

ALTER TABLE rnam_pacientes
	ADD CONSTRAINT  XPKrnam_pacientes PRIMARY KEY (id_rnam_paciente);



CREATE TABLE rnam_responsables
(
	id_responsable        INTEGER  NOT NULL ,
	id_rnam_paciente      INTEGER  NULL ,
	nombre_responsable    VARCHAR2(20)  NOT NULL ,
	paterno_responsable   VARCHAR2(20)  NULL ,
	materno_responsable   VARCHAR2(20)  NULL ,
	parentesco_responsable  VARCHAR2(20)  NOT NULL
);



COMMENT ON COLUMN rnam_responsables.id_responsable IS 'Clave única del reponsable del  paciente';
COMMENT ON COLUMN rnam_responsables.nombre_responsable IS 'Nombre del reponsable';
COMMENT ON COLUMN rnam_responsables.paterno_responsable IS 'Apellido paterno del responsable';
COMMENT ON COLUMN rnam_responsables.materno_responsable IS 'Apellido materno del responsable';
COMMENT ON COLUMN rnam_responsables.parentesco_responsable IS 'Parentesco que tiene con el responsable con paciente';
COMMENT ON COLUMN rnam_responsables.id_rnam_paciente IS 'Clave única del paciente en el RNAM';


CREATE UNIQUE INDEX XPKrnam_responsables ON rnam_responsables
(id_responsable  ASC) TABLESPACE RNAM_INDX01;



ALTER TABLE rnam_responsables
	ADD CONSTRAINT  XPKrnam_responsables PRIMARY KEY (id_responsable);



CREATE TABLE rnam_telefonos_contactos
(
	id_telefono_contacto  INTEGER  NOT NULL ,
	id_contacto           INTEGER  NULL ,
	id_tipo_telefono       INTEGER  NOT NULL ,
	telefono_contacto     VARCHAR2(20)  NULL ,
	extension             VARCHAR2(18)  NULL 
);



COMMENT ON COLUMN rnam_telefonos_contactos.id_telefono_contacto IS 'Clave única del teléfono del contacto';
COMMENT ON COLUMN rnam_telefonos_contactos.id_tipo_telefono IS 'Clave ónica de tipo de teléfono';
COMMENT ON COLUMN rnam_telefonos_contactos.id_contacto IS 'Clave única decontacto del paciente';
COMMENT ON COLUMN rnam_telefonos_contactos.telefono_contacto IS 'Número tefonico del contacto';
COMMENT ON COLUMN rnam_telefonos_contactos.extension IS 'Extención telefonica';


CREATE UNIQUE INDEX XPKrnam_telefonos_contactos ON rnam_telefonos_contactos
(id_telefono_contacto  ASC) TABLESPACE RNAM_INDX01;



ALTER TABLE rnam_telefonos_contactos
	ADD CONSTRAINT  XPKrnam_telefonos_contactos PRIMARY KEY (id_telefono_contacto);



CREATE TABLE rnam_telefonos_pacientes
(
	id_telefono_paciente  INTEGER  NOT NULL ,
	id_rnam_paciente      INTEGER  NOT NULL ,
	id_tipo_telefono       INTEGER  NOT NULL ,
	telefono_paciente     VARCHAR2(20)  NULL ,
	extension             VARCHAR2(18)  NULL 
);



COMMENT ON COLUMN rnam_telefonos_pacientes.id_telefono_paciente IS 'Clave únical del teléfono del paciente';
COMMENT ON COLUMN rnam_telefonos_pacientes.id_tipo_telefono IS 'Clave ónica de tipo de teléfono';
COMMENT ON COLUMN rnam_telefonos_pacientes.id_rnam_paciente IS 'Clave única del paciente en el RNAM';
COMMENT ON COLUMN rnam_telefonos_pacientes.extension IS 'extención telefonica';
COMMENT ON COLUMN rnam_telefonos_pacientes.telefono_paciente IS 'Número telefononico';



CREATE UNIQUE INDEX XPKrnam_telefonos_pacientes ON rnam_telefonos_pacientes
(id_telefono_paciente  ASC) TABLESPACE RNAM_INDX01;



ALTER TABLE rnam_telefonos_pacientes
	ADD CONSTRAINT  XPKrnam_telefonos_pacientes PRIMARY KEY (id_telefono_paciente);



CREATE TABLE rnam_telefonos_responsables
(
	id_telefono_responsable  INTEGER  NOT NULL ,
	id_responsable           INTEGER  NULL ,
	id_tipo_telefono         INTEGER  NOT NULL ,
	telefono_responsable     VARCHAR2(20)  NULL ,
	extension                VARCHAR2(18)  NULL 
);



COMMENT ON COLUMN rnam_telefonos_responsables.id_telefono_reponsable IS 'Clave únical del teléfono del repondable';
COMMENT ON COLUMN rnam_telefonos_responsables.id_tipo_telefono IS 'Clave ónica de tipo de teléfono';
COMMENT ON COLUMN rnam_telefonos_responsables.id_responsable IS 'Clave única del reponsable del  paciente';
COMMENT ON COLUMN rnam_telefonos_responsables.telefono_responsable IS 'Númerro telefonico del responsable';
COMMENT ON COLUMN rnam_telefonos_responsables.extension IS 'Extención telefonica';


CREATE UNIQUE INDEX XPKrnam_telefonos_responsables ON rnam_telefonos_responsables
(id_telefono_reponsable  ASC) TABLESPACE RNAM_INDX01;



ALTER TABLE rnam_telefonos_responsables
	ADD CONSTRAINT  XPKrnam_telefonos_responsables PRIMARY KEY (id_telefono_reponsable);

ALTER TABLE rnam_cat_usuarios_token
	ADD (CONSTRAINT  fk_catinstituciones_usuarios FOREIGN KEY (id_rnam_institucion) REFERENCES rnam_cat_instituciones_medicas(id_rnam_institucion));

ALTER TABLE rnam_contactos
	ADD (CONSTRAINT  fk_pacientes_contactos FOREIGN KEY (id_rnam_paciente) REFERENCES rnam_pacientes(id_rnam_paciente) ON DELETE SET NULL);

ALTER TABLE rnam_pacientes
	ADD (CONSTRAINT  fk_pacientes_instituciones FOREIGN KEY (id_rnam_institucion) REFERENCES rnam_cat_instituciones_medicas(id_rnam_institucion));

ALTER TABLE rnam_pacientes
	ADD (CONSTRAINT  fk_pacientes_institucion FOREIGN KEY (id_sexo) REFERENCES rnam_cat_sexos(id_sexo) ON DELETE SET NULL);

ALTER TABLE rnam_pacientes
	ADD (CONSTRAINT  fk_pacientes_nacionalidad FOREIGN KEY (id_nacionalidad) REFERENCES rnam_cat_nacionalidades(id_nacionalidad));

ALTER TABLE rnam_pacientes
	ADD (CONSTRAINT  fk_pacientes_semaforo FOREIGN KEY (id_semaforo) REFERENCES rnam_cat_semaforo(id_semaforo) ON DELETE SET NULL);

ALTER TABLE rnam_responsables
	ADD (CONSTRAINT  fk_pacientes_responsables FOREIGN KEY (id_rnam_paciente) REFERENCES rnam_pacientes(id_rnam_paciente) ON DELETE SET NULL);

ALTER TABLE rnam_telefonos_contactos
	ADD (CONSTRAINT  fk_telcontactos_tipotel FOREIGN KEY (id_tipo_telefono) REFERENCES rnam_cat_tipos_telefonos(id_tipo_telefono) ON DELETE SET NULL);

ALTER TABLE rnam_telefonos_contactos
	ADD (CONSTRAINT  fk_contactos_telefonos FOREIGN KEY (id_contacto) REFERENCES rnam_contactos(id_contacto) ON DELETE SET NULL);

ALTER TABLE rnam_telefonos_pacientes
	ADD (CONSTRAINT  fk_telpacientes_tipotel FOREIGN KEY (id_tipo_telefono) REFERENCES rnam_cat_tipos_telefonos(id_tipo_telefono) ON DELETE SET NULL);

ALTER TABLE rnam_telefonos_pacientes
	ADD (CONSTRAINT  fk_pacientes_tel_pacientes FOREIGN KEY (id_rnam_paciente) REFERENCES rnam_pacientes(id_rnam_paciente) ON DELETE SET NULL);

ALTER TABLE rnam_telefonos_responsables
	ADD (CONSTRAINT  fk_telresponsables_tipotel FOREIGN KEY (id_tipo_telefono) REFERENCES rnam_cat_tipos_telefonos(id_tipo_telefono) ON DELETE SET NULL);

ALTER TABLE rnam_telefonos_responsables
	ADD (CONSTRAINT  fk_responsables_telefonos FOREIGN KEY (id_responsable) REFERENCES rnam_responsables(id_responsable) ON DELETE SET NULL);


