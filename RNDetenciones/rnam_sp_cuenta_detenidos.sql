USE [RNDetenciones]
GO
/****** Object:  StoredProcedure [dbo].[rnam_sp_cuenta_detenidos]    Script Date: 07/02/2024 02:39:12 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:      JLCR  
-- Create date: 07 Febrero 2024
-- Proyecto: interoperabilidad BNDF-RND
-- Description:	cuenta registros coincidentes con los parametros de entrada
--			de RNDetenciones HPD
-- =============================================

CREATE PROCEDURE dbo.rnam_sp_cuenta_detenidos
( 
  @Nombre_usuario     varchar(70) = ''
, @Nombre             varchar(70) = ''
, @paterno            varchar(70) = ''
, @materno            varchar(50) = ''
)
AS
BEGIN

   BEGIN TRY
    SET NOCOUNT ON

    DECLARE @sSQL             varchar(5000)
    DECLARE @sSQLWhere        varchar(5000)
    DECLARE @vcnombrecompleto varchar(5000)
    DECLARE @vnreg            int = 0



    SET @sSQLWhere = ''
    SET @sSQL=''

    IF OBJECT_ID(N'tempdb.dbo.##reghpd', N'U') IS NOT NULL  
       DROP TABLE ##reghpd;


    SET    @sSQL = 'Select count(1)
            into ##reghpd
            FROM detenciones d
            INNER JOIN detenidos dt
                ON D.id_detencion = dt.id_detencion
                AND dt.es_borrado = 0
            LEFT JOIN puesta_disposiciones pd
                ON dt.id_detenido = pd.id_detenido
                AND pd.es_borrado = 0
            LEFT JOIN detenidos_datoscomplementarios ddc
                ON pd.id_puesta_disposicion = ddc.id_puesta_disposicion
            LEFT JOIN traslados tr
                ON ddc.id_detenido_complemento = tr.id_detenido_complemento
                AND tr.es_activo = 1
            INNER JOIN geodirecciones..entidad CE 
                ON CE.identidad = D.id_entidad
            INNER JOIN geodirecciones..municipio CM 
                ON CM.identidad = D.id_entidad 
                AND CM.idmpio = D.id_municipio ';

        ---formacion de la instruccion WHERE
        IF @Nombre <> '' OR @paterno <> '' OR @materno <> ''

        BEGIN

             IF @paterno = '' SET @paterno = '%'
             
             SET @vcnombrecompleto = @Nombre + ' ' + @paterno + ' ' + @materno
                   
             SET @sSQLWhere = @sSQLWhere + ' case ' +
                        'when ddc.nombre_detenido + '' '' + ddc.apellido_paterno + '' '' + ddc.apellido_materno is null ' +
                            'then dt.nombre + '' '' + dt.apellido_paterno + '' '' + dt.apellido_materno ' +
                          'when dt.nombre + '' '' + dt.apellido_paterno + '' '' + dt.apellido_materno is null ' +
                            'then ddc.nombre_detenido + '' '' + ddc.apellido_paterno + '' '' + ddc.apellido_materno ' +
                     'else ddc.nombre_detenido + '' '' + ddc.apellido_paterno + '' '' + ddc.apellido_materno end like ' + '''%' + rtrim(ltrim(@vcnombrecompleto)) + '%'''
            
        END


	----crea la instruccion where
        IF @sSQLWhere <> ''
        BEGIN
         SET @sSQL = @sSQL + ' WHERE '
         SET @sSQL = @sSQL + @sSQLWhere 
         SET @sSQL = @sSQL + ' ORDER BY 1, 3, 4, 2 '
        END

        --PRINT @sSQL

        EXEC (@sSQL)

        --Lista registros encontrados HPD y FA
        select * from ##reghpd

END TRY
  BEGIN CATCH
        EXEC RethrowError;
  END CATCH
END