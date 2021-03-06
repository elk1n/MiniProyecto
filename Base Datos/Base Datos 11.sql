USE [master]
GO
/****** Object:  Database [AEROLINEA]    Script Date: 09/22/2013 18:46:03 ******/
CREATE DATABASE [AEROLINEA] ON  PRIMARY 
( NAME = N'AEROLINEA', FILENAME = N'C:\Program Files (x86)\Microsoft SQL Server\MSSQL10_50.SQLSERVER\MSSQL\DATA\AEROLINEA.mdf' , SIZE = 3072KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'AEROLINEA_log', FILENAME = N'C:\Program Files (x86)\Microsoft SQL Server\MSSQL10_50.SQLSERVER\MSSQL\DATA\AEROLINEA_log.ldf' , SIZE = 1024KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [AEROLINEA] SET COMPATIBILITY_LEVEL = 100
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [AEROLINEA].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [AEROLINEA] SET ANSI_NULL_DEFAULT OFF
GO
ALTER DATABASE [AEROLINEA] SET ANSI_NULLS OFF
GO
ALTER DATABASE [AEROLINEA] SET ANSI_PADDING OFF
GO
ALTER DATABASE [AEROLINEA] SET ANSI_WARNINGS OFF
GO
ALTER DATABASE [AEROLINEA] SET ARITHABORT OFF
GO
ALTER DATABASE [AEROLINEA] SET AUTO_CLOSE OFF
GO
ALTER DATABASE [AEROLINEA] SET AUTO_CREATE_STATISTICS ON
GO
ALTER DATABASE [AEROLINEA] SET AUTO_SHRINK OFF
GO
ALTER DATABASE [AEROLINEA] SET AUTO_UPDATE_STATISTICS ON
GO
ALTER DATABASE [AEROLINEA] SET CURSOR_CLOSE_ON_COMMIT OFF
GO
ALTER DATABASE [AEROLINEA] SET CURSOR_DEFAULT  GLOBAL
GO
ALTER DATABASE [AEROLINEA] SET CONCAT_NULL_YIELDS_NULL OFF
GO
ALTER DATABASE [AEROLINEA] SET NUMERIC_ROUNDABORT OFF
GO
ALTER DATABASE [AEROLINEA] SET QUOTED_IDENTIFIER OFF
GO
ALTER DATABASE [AEROLINEA] SET RECURSIVE_TRIGGERS OFF
GO
ALTER DATABASE [AEROLINEA] SET  DISABLE_BROKER
GO
ALTER DATABASE [AEROLINEA] SET AUTO_UPDATE_STATISTICS_ASYNC OFF
GO
ALTER DATABASE [AEROLINEA] SET DATE_CORRELATION_OPTIMIZATION OFF
GO
ALTER DATABASE [AEROLINEA] SET TRUSTWORTHY OFF
GO
ALTER DATABASE [AEROLINEA] SET ALLOW_SNAPSHOT_ISOLATION OFF
GO
ALTER DATABASE [AEROLINEA] SET PARAMETERIZATION SIMPLE
GO
ALTER DATABASE [AEROLINEA] SET READ_COMMITTED_SNAPSHOT OFF
GO
ALTER DATABASE [AEROLINEA] SET HONOR_BROKER_PRIORITY OFF
GO
ALTER DATABASE [AEROLINEA] SET  READ_WRITE
GO
ALTER DATABASE [AEROLINEA] SET RECOVERY SIMPLE
GO
ALTER DATABASE [AEROLINEA] SET  MULTI_USER
GO
ALTER DATABASE [AEROLINEA] SET PAGE_VERIFY CHECKSUM
GO
ALTER DATABASE [AEROLINEA] SET DB_CHAINING OFF
GO
USE [AEROLINEA]
GO
/****** Object:  Table [dbo].[TRAYECTOS]    Script Date: 09/22/2013 18:46:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[TRAYECTOS](
	[IdTrayecto] [varchar](40) NOT NULL,
	[Origen] [varchar](32) NOT NULL,
	[Destino] [varchar](32) NOT NULL,
	[PrecioBase] [money] NOT NULL,
	[Descuento] [int] NULL,
	[Duracion] [time](7) NOT NULL,
 CONSTRAINT [PK_TRAYECTOS] PRIMARY KEY CLUSTERED 
(
	[IdTrayecto] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
INSERT [dbo].[TRAYECTOS] ([IdTrayecto], [Origen], [Destino], [PrecioBase], [Descuento], [Duracion]) VALUES (N'BQL-MED', N'Barranquilla', N'Medellín', 140000.0000, 150, CAST(0x07005847F80D0000 AS Time))
INSERT [dbo].[TRAYECTOS] ([IdTrayecto], [Origen], [Destino], [PrecioBase], [Descuento], [Duracion]) VALUES (N'BTA-MED', N'Bogotá', N'Medellín', 102000.0000, 100, CAST(0x070068C461080000 AS Time))
INSERT [dbo].[TRAYECTOS] ([IdTrayecto], [Origen], [Destino], [PrecioBase], [Descuento], [Duracion]) VALUES (N'CAL-MED', N'Cali', N'Medellín', 120000.0000, 130, CAST(0x0700E0052D0B0000 AS Time))
INSERT [dbo].[TRAYECTOS] ([IdTrayecto], [Origen], [Destino], [PrecioBase], [Descuento], [Duracion]) VALUES (N'MED-BQL', N'Medellín', N'Barranquilla', 130000.0000, 140, CAST(0x07005847F80D0000 AS Time))
INSERT [dbo].[TRAYECTOS] ([IdTrayecto], [Origen], [Destino], [PrecioBase], [Descuento], [Duracion]) VALUES (N'MED-BTA', N'Medellín', N'Bogotá', 99000.0000, 90, CAST(0x070068C461080000 AS Time))
INSERT [dbo].[TRAYECTOS] ([IdTrayecto], [Origen], [Destino], [PrecioBase], [Descuento], [Duracion]) VALUES (N'MED-CAL', N'Medellín', N'Cali', 115000.0000, 120, CAST(0x0700E0052D0B0000 AS Time))
/****** Object:  UserDefinedFunction [dbo].[getTime]    Script Date: 09/22/2013 18:46:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE function [dbo].[getTime]
(@seconds int)  
returns  varchar(20)  
as
 begin  
   declare @time varchar(20)  
   set @time = CASE 
				WHEN @seconds/3600<10 
				THEN '0' ELSE '' END   
				+ RTRIM(@seconds/3600)  + ':' + RIGHT('0'+RTRIM((@seconds % 3600) / 60),2)  + ':' + RIGHT('0'+RTRIM((@seconds % 3600) % 60),2)  
   return(@time) 
 end
GO
/****** Object:  Table [dbo].[PILOTOS]    Script Date: 09/22/2013 18:46:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[PILOTOS](
	[Nombre] [varchar](50) NOT NULL,
	[Usuario] [varchar](20) NOT NULL,
	[Contrasenia] [varchar](20) NOT NULL,
	[HorasVuelo] [float] NOT NULL,
 CONSTRAINT [PK_PILOTOS] PRIMARY KEY CLUSTERED 
(
	[Usuario] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY],
 CONSTRAINT [IdPiloto] UNIQUE NONCLUSTERED 
(
	[Nombre] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
INSERT [dbo].[PILOTOS] ([Nombre], [Usuario], [Contrasenia], [HorasVuelo]) VALUES (N'Piloto 0001', N'piloto', N'123', 196800)
INSERT [dbo].[PILOTOS] ([Nombre], [Usuario], [Contrasenia], [HorasVuelo]) VALUES (N'Piloto 0002', N'piloto2', N'456', 87600)
/****** Object:  Table [dbo].[PASAJEROS]    Script Date: 09/22/2013 18:46:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[PASAJEROS](
	[Identificacion] [varchar](15) NOT NULL,
	[Nombre] [varchar](50) NOT NULL,
	[Usuario] [varchar](20) NOT NULL,
	[Contrasenia] [varchar](20) NOT NULL,
	[Millas] [int] NULL,
	[Frecuente] [bit] NULL,
 CONSTRAINT [PK_PASAJEROS] PRIMARY KEY CLUSTERED 
(
	[Identificacion] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
INSERT [dbo].[PASAJEROS] ([Identificacion], [Nombre], [Usuario], [Contrasenia], [Millas], [Frecuente]) VALUES (N'11114111', N'Natalia', N'nat', N'1234', 955, 1)
INSERT [dbo].[PASAJEROS] ([Identificacion], [Nombre], [Usuario], [Contrasenia], [Millas], [Frecuente]) VALUES (N'123456', N'Pepito', N'Perez', N'123', 25, 0)
INSERT [dbo].[PASAJEROS] ([Identificacion], [Nombre], [Usuario], [Contrasenia], [Millas], [Frecuente]) VALUES (N'5555555', N'Jose', N'jos', N'456', 25, 0)
INSERT [dbo].[PASAJEROS] ([Identificacion], [Nombre], [Usuario], [Contrasenia], [Millas], [Frecuente]) VALUES (N'666666', N'Prueba2', N'prueba2', N'123', 25, 0)
/****** Object:  Table [dbo].[AERONAVES]    Script Date: 09/22/2013 18:46:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[AERONAVES](
	[IdAeronave] [int] NOT NULL,
	[Tipo] [varchar](30) NOT NULL,
	[Licencia] [varchar](4) NOT NULL,
	[Pasajeros] [int] NOT NULL,
	[Carga] [float] NOT NULL,
	[Unidades] [int] NULL,
	[Autonomia] [time](7) NULL,
 CONSTRAINT [PK_AERONAVES] PRIMARY KEY CLUSTERED 
(
	[IdAeronave] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
INSERT [dbo].[AERONAVES] ([IdAeronave], [Tipo], [Licencia], [Pasajeros], [Carga], [Unidades], [Autonomia]) VALUES (1, N'Embraer ERJ 170', N'A', 5, 400, 1, CAST(0x0700384D25190000 AS Time))
INSERT [dbo].[AERONAVES] ([IdAeronave], [Tipo], [Licencia], [Pasajeros], [Carga], [Unidades], [Autonomia]) VALUES (2, N'Embraer ERJ 145', N'A', 4, 250, 2, CAST(0x0700D088C3100000 AS Time))
INSERT [dbo].[AERONAVES] ([IdAeronave], [Tipo], [Licencia], [Pasajeros], [Carga], [Unidades], [Autonomia]) VALUES (3, N'ATR 42 500', N'B', 4, 200, 1, CAST(0x07009CA6920C0000 AS Time))
INSERT [dbo].[AERONAVES] ([IdAeronave], [Tipo], [Licencia], [Pasajeros], [Carga], [Unidades], [Autonomia]) VALUES (4, N'DORNIER 328', N'B', 3, 150, 2, CAST(0x070068C461080000 AS Time))
/****** Object:  Table [dbo].[ADMINISTRADOR]    Script Date: 09/22/2013 18:46:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[ADMINISTRADOR](
	[Nombre] [varchar](50) NULL,
	[Usuario] [varchar](20) NOT NULL,
	[Contrasenia] [varchar](20) NOT NULL,
 CONSTRAINT [PK_ADMINISTRADOR] PRIMARY KEY CLUSTERED 
(
	[Usuario] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
INSERT [dbo].[ADMINISTRADOR] ([Nombre], [Usuario], [Contrasenia]) VALUES (N'Administrador', N'admin', N'123')
INSERT [dbo].[ADMINISTRADOR] ([Nombre], [Usuario], [Contrasenia]) VALUES (N'Administrador', N'admin2', N'456')
/****** Object:  UserDefinedFunction [dbo].[getHoras]    Script Date: 09/22/2013 18:46:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE function [dbo].[getHoras](@seconds int)  
returns  varchar(20)  
as
 begin  
   declare @time varchar(20)  
   set @time = CASE 
   WHEN @seconds/3600<10 THEN '0' ELSE '' END   + RTRIM(@seconds/3600)  + ':' + RIGHT('0'+RTRIM((@seconds % 3600) / 60),2)  + ':' + RIGHT('0'+RTRIM((@seconds % 3600) % 60),2)  
   return(@time) 
 end
GO
/****** Object:  Table [dbo].[VUELOS]    Script Date: 09/22/2013 18:46:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[VUELOS](
	[IdVuelo] [int] NOT NULL,
	[FechaHoraViaje] [datetime] NOT NULL,
	[Temporada] [varchar](16) NOT NULL,
	[IdAdmin] [varchar](20) NULL,
	[Trayecto] [varchar](40) NOT NULL,
 CONSTRAINT [PK_VUELOS] PRIMARY KEY CLUSTERED 
(
	[IdVuelo] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
INSERT [dbo].[VUELOS] ([IdVuelo], [FechaHoraViaje], [Temporada], [IdAdmin], [Trayecto]) VALUES (1, CAST(0x0000A23C011C4570 AS DateTime), N'Baja', N'admin', N'MED-BTA')
INSERT [dbo].[VUELOS] ([IdVuelo], [FechaHoraViaje], [Temporada], [IdAdmin], [Trayecto]) VALUES (2, CAST(0x0000A23C007B98A0 AS DateTime), N'Baja', N'admin', N'CAL-MED')
INSERT [dbo].[VUELOS] ([IdVuelo], [FechaHoraViaje], [Temporada], [IdAdmin], [Trayecto]) VALUES (3, CAST(0x0000A24100F73140 AS DateTime), N'Baja', N'admin', N'CAL-MED')
INSERT [dbo].[VUELOS] ([IdVuelo], [FechaHoraViaje], [Temporada], [IdAdmin], [Trayecto]) VALUES (4, CAST(0x0000A23A0107AC00 AS DateTime), N'Baja', N'admin', N'CAL-MED')
INSERT [dbo].[VUELOS] ([IdVuelo], [FechaHoraViaje], [Temporada], [IdAdmin], [Trayecto]) VALUES (5, CAST(0x0000A23B012D9320 AS DateTime), N'Baja', N'admin', N'BTA-MED')
INSERT [dbo].[VUELOS] ([IdVuelo], [FechaHoraViaje], [Temporada], [IdAdmin], [Trayecto]) VALUES (6, CAST(0x0000A24100FB4FF0 AS DateTime), N'Baja', N'admin', N'BQL-MED')
INSERT [dbo].[VUELOS] ([IdVuelo], [FechaHoraViaje], [Temporada], [IdAdmin], [Trayecto]) VALUES (8, CAST(0x0000A23F00FB4FF0 AS DateTime), N'Baja', N'admin', N'BQL-MED')
INSERT [dbo].[VUELOS] ([IdVuelo], [FechaHoraViaje], [Temporada], [IdAdmin], [Trayecto]) VALUES (9, CAST(0x0000A23F00FB4FF0 AS DateTime), N'Baja', N'admin', N'BTA-MED')
INSERT [dbo].[VUELOS] ([IdVuelo], [FechaHoraViaje], [Temporada], [IdAdmin], [Trayecto]) VALUES (10, CAST(0x0000A24300F73140 AS DateTime), N'Baja', N'admin', N'CAL-MED')
INSERT [dbo].[VUELOS] ([IdVuelo], [FechaHoraViaje], [Temporada], [IdAdmin], [Trayecto]) VALUES (12, CAST(0x0000A24400EAD530 AS DateTime), N'Baja', N'admin', N'MED-BTA')
INSERT [dbo].[VUELOS] ([IdVuelo], [FechaHoraViaje], [Temporada], [IdAdmin], [Trayecto]) VALUES (13, CAST(0x0000A24400EAD530 AS DateTime), N'Baja', N'admin', N'BQL-MED')
INSERT [dbo].[VUELOS] ([IdVuelo], [FechaHoraViaje], [Temporada], [IdAdmin], [Trayecto]) VALUES (14, CAST(0x0000A24300EAD530 AS DateTime), N'Baja', N'admin', N'MED-BTA')
INSERT [dbo].[VUELOS] ([IdVuelo], [FechaHoraViaje], [Temporada], [IdAdmin], [Trayecto]) VALUES (15, CAST(0x0000A24300DAA0C0 AS DateTime), N'Baja', N'admin', N'MED-BTA')
/****** Object:  UserDefinedFunction [dbo].[getUnidades]    Script Date: 09/22/2013 18:46:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE FUNCTION [dbo].[getUnidades]
(@id int)
RETURNS INT
AS
BEGIN
DECLARE @unidades INT
SET @unidades =(SELECT Unidades FROM AERONAVES WHERE IdAeronave = @id)
RETURN @unidades
END
GO
/****** Object:  StoredProcedure [dbo].[sumarHorasVuelo]    Script Date: 09/22/2013 18:46:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sumarHorasVuelo]
@usuario VARCHAR(20),
@trayecto VARCHAR(40)
AS
BEGIN
	UPDATE PILOTOS SET HorasVuelo=HorasVuelo+(SELECT Convert(Bigint,Datediff(SS,0,Duracion))FROM TRAYECTOS WHERE IdTrayecto=@trayecto)WHERE Usuario=@usuario 
END
GO
/****** Object:  UserDefinedFunction [dbo].[getAutonomia]    Script Date: 09/22/2013 18:46:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE FUNCTION [dbo].[getAutonomia]
(@id int)
RETURNS INT
AS
BEGIN
DECLARE @autonomia INT
SET @autonomia = (SELECT (DATEPART(HOUR,Autonomia)* 3600) + 
						 (DATEPART(MINUTE,Autonomia) * 60) +  
						  DATEPART(SECOND,Autonomia) 
						  FROM AERONAVES WHERE IdAeronave = @id)
RETURN @autonomia
END
GO
/****** Object:  UserDefinedFunction [dbo].[getDuracion]    Script Date: 09/22/2013 18:46:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE FUNCTION [dbo].[getDuracion]
(@id VARCHAR(40))
RETURNS INT
AS
BEGIN
DECLARE @autonomia INT
SET @autonomia = (SELECT (DATEPART(HOUR,Duracion)* 3600) + 
						 (DATEPART(MINUTE,Duracion) * 60) +  
						  DATEPART(SECOND,Duracion) 
						  FROM TRAYECTOS WHERE IdTrayecto = @id)
RETURN @autonomia
END
GO
/****** Object:  UserDefinedFunction [dbo].[getIdPasajero]    Script Date: 09/22/2013 18:46:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE FUNCTION [dbo].[getIdPasajero]
(@usuario VARCHAR(20))
RETURNS VARCHAR(15)
AS
BEGIN
DECLARE @id VARCHAR(15)
SET @id = (SELECT Identificacion FROM PASAJEROS WHERE Usuario = @usuario)
RETURN @id
END
GO
/****** Object:  StoredProcedure [dbo].[clientesFrecuentes]    Script Date: 09/22/2013 18:46:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[clientesFrecuentes]
@numeroClientes Varchar(8) OUTPUT
AS
	SET @numeroClientes = (select COUNT(Frecuente) FROM PASAJEROS WHERE Frecuente = 1)

SELECT Identificacion, Nombre, Millas 
FROM PASAJEROS
WHERE Frecuente = 1
Order by Nombre
GO
/****** Object:  StoredProcedure [dbo].[registrarPiloto]    Script Date: 09/22/2013 18:46:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[registrarPiloto]
@nombre VARCHAR(50),
@usuario VARCHAR(20),
@contrasenia VARCHAR(20),
@horasVuelo FLOAT

AS
IF(NOT EXISTS(SELECT Usuario FROM PILOTOS WHERE Usuario=@usuario))
	BEGIN
		INSERT INTO PILOTOS(Nombre, Usuario, Contrasenia, HorasVuelo)
		VALUES(@nombre, @usuario, @contrasenia, @horasVuelo)
	END
	ELSE
	BEGIN
	PRINT 'Ya existe el piloto en la base de datos';
END
GO
/****** Object:  StoredProcedure [dbo].[registrarPasajero]    Script Date: 09/22/2013 18:46:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[registrarPasajero]
@identificacion VARCHAR(15),
@nombre VARCHAR(50),
@usuario VARCHAR(20),
@contrasenia VARCHAR(20),
@millas INT,
@frecuente bit

AS
IF(NOT EXISTS(SELECT Identificacion FROM PASAJEROS WHERE Identificacion=@identificacion) AND 
   NOT EXISTS(SELECT Usuario FROM PASAJEROS WHERE Usuario = @usuario))
	BEGIN
		INSERT INTO PASAJEROS(Identificacion, Nombre, Usuario, Contrasenia, Millas, Frecuente)
		VALUES(@identificacion, @nombre, @usuario, @contrasenia, @millas, @frecuente)
	END
	ELSE
	BEGIN
	PRINT 'Ya existe el pasajero en la base de datos';
END
GO
/****** Object:  StoredProcedure [dbo].[registrarAeronave]    Script Date: 09/22/2013 18:46:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[registrarAeronave]
@idAeronave INT,
@tipo VARCHAR(30),
@licencia VARCHAR(4),
@pasajeros INT,
@carga FLOAT,
@autonomia TIME(7)
AS
IF(NOT EXISTS(SELECT IdAeronave FROM AERONAVES WHERE IdAeronave=@idAeronave))
	BEGIN
		INSERT INTO AERONAVES(IdAeronave, Tipo, Licencia, Pasajeros, Carga, Autonomia)
		VALUES(@idAeronave, @tipo, @licencia, @pasajeros, @carga, @autonomia)
	END
	ELSE
	BEGIN
	PRINT 'Ya existe la aeronave en la base de datos';
END
GO
/****** Object:  StoredProcedure [dbo].[registrarAdministrador]    Script Date: 09/22/2013 18:46:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[registrarAdministrador]
@nombre VARCHAR(50),
@usuario VARCHAR(20),
@contrasenia VARCHAR(20)
AS
IF(NOT EXISTS(SELECT Usuario FROM ADMINISTRADOR WHERE Usuario=@usuario))
	BEGIN
		INSERT INTO ADMINISTRADOR(Nombre, Usuario, Contrasenia)
		VALUES(@nombre, @usuario, @contrasenia)
	END
	ELSE
	BEGIN
	PRINT 'Ya existe el usuario en la base de datos';
END
GO
/****** Object:  UserDefinedFunction [dbo].[getMillasPasajero]    Script Date: 09/22/2013 18:46:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE FUNCTION [dbo].[getMillasPasajero]
(@usuario VARCHAR(20))
RETURNS INT
AS
BEGIN
	DECLARE @millas INT
		SET @millas =(SELECT Millas 
					  FROM PASAJEROS
					  WHERE Usuario = @usuario)
	RETURN @millas
END
GO
/****** Object:  StoredProcedure [dbo].[registrarTrayecto]    Script Date: 09/22/2013 18:46:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[registrarTrayecto]
@idTrayecto VARCHAR(40),
@origen VARCHAR(32),
@destino VARCHAR(32),
@precioBase MONEY,
@descuento INT,
@duracion TIME(7)

AS
IF(NOT EXISTS(SELECT IdTrayecto FROM TRAYECTOS WHERE IdTrayecto=@idTrayecto))
	BEGIN
		INSERT INTO TRAYECTOS(IdTrayecto, Origen, Destino, PrecioBase, Descuento, Duracion)
		VALUES(@idTrayecto, @origen, @destino, @precioBase, @descuento, @duracion)
	END
	ELSE
	BEGIN
	PRINT 'Ya existe el trayecto en la base de datos o no existe el usuario adminitrador';
END
GO
/****** Object:  StoredProcedure [dbo].[setMillas]    Script Date: 09/22/2013 18:46:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[setMillas]
@usuario VARCHAR(20),
@millas INT
AS

UPDATE PASAJEROS SET Millas = Millas+@millas WHERE Usuario = @usuario

IF((SELECT Millas FROM PASAJEROS WHERE Usuario=@usuario)>=500)
	BEGIN
		UPDATE PASAJEROS SET Frecuente = 1 WHERE Usuario = @usuario;
	END
GO
/****** Object:  StoredProcedure [dbo].[setAutonomia]    Script Date: 09/22/2013 18:46:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[setAutonomia]
 @idAeronave INT,
 @duracion INT
AS
	UPDATE AERONAVES SET Autonomia = CONVERT(TIME,dbo.getTime(@duracion),0) WHERE IdAeronave = @idAeronave
GO
/****** Object:  StoredProcedure [dbo].[restablecerAutonomia]    Script Date: 09/22/2013 18:46:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[restablecerAutonomia]
 @opcion INT,
 @idAeronave INT,
 @mensaje VARCHAR(128) OUTPUT
 AS
	IF(EXISTS(SELECT IdAeronave FROM AERONAVES WHERE IdAeronave=@idAeronave))
	BEGIN
		IF(@opcion = 1 )
			BEGIN
				UPDATE AERONAVES SET Autonomia = '04:00:00' WHERE IdAeronave = 1
			END;
		ELSE IF(@opcion = 2 )
			BEGIN
				UPDATE AERONAVES SET Autonomia = '03:00:00' WHERE IdAeronave = 2
			END;
		ELSE IF(@opcion = 3 )
			BEGIN			
				UPDATE AERONAVES SET Autonomia = '02:50:00' WHERE IdAeronave = 3
			END;
		ELSE IF(@opcion = 4 )
			BEGIN			
				UPDATE AERONAVES SET Autonomia = '02:00:00' WHERE IdAeronave = 4			
			END;		
		
		END;
	ELSE
	BEGIN
	SET @mensaje = 'No se ha realizado la operación solicitada';
	
END
GO
/****** Object:  Table [dbo].[TICKET]    Script Date: 09/22/2013 18:46:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[TICKET](
	[CodigoTicket] [int] NOT NULL,
	[IdAeronave] [int] NOT NULL,
	[Piloto] [varchar](20) NOT NULL,
	[IdVuelo] [int] NOT NULL,
	[PesoEquipaje] [int] NULL,
	[Asientos] [int] NULL,
 CONSTRAINT [PK_TICKET] PRIMARY KEY CLUSTERED 
(
	[CodigoTicket] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
INSERT [dbo].[TICKET] ([CodigoTicket], [IdAeronave], [Piloto], [IdVuelo], [PesoEquipaje], [Asientos]) VALUES (1001, 2, N'piloto2', 9, 34, 1)
INSERT [dbo].[TICKET] ([CodigoTicket], [IdAeronave], [Piloto], [IdVuelo], [PesoEquipaje], [Asientos]) VALUES (1002, 4, N'piloto2', 1, 34, 0)
INSERT [dbo].[TICKET] ([CodigoTicket], [IdAeronave], [Piloto], [IdVuelo], [PesoEquipaje], [Asientos]) VALUES (1003, 3, N'piloto2', 3, 0, 4)
INSERT [dbo].[TICKET] ([CodigoTicket], [IdAeronave], [Piloto], [IdVuelo], [PesoEquipaje], [Asientos]) VALUES (1020, 4, N'piloto', 6, 0, 3)
INSERT [dbo].[TICKET] ([CodigoTicket], [IdAeronave], [Piloto], [IdVuelo], [PesoEquipaje], [Asientos]) VALUES (1022, 4, N'piloto', 14, 0, 3)
INSERT [dbo].[TICKET] ([CodigoTicket], [IdAeronave], [Piloto], [IdVuelo], [PesoEquipaje], [Asientos]) VALUES (1023, 4, N'piloto', 15, 35, 0)
/****** Object:  StoredProcedure [dbo].[registrarVuelo]    Script Date: 09/22/2013 18:46:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[registrarVuelo]
@idVuelo INT,
@fechaHoraViaje DATETIME,
@temporada VARCHAR(16),
@idAdmin VARCHAR(20),
@trayecto VARCHAR(40),
@mensaje VARCHAR(128) OUTPUT

AS
IF(NOT EXISTS(SELECT IdVuelo FROM VUELOS WHERE IdVuelo=@idVuelo))
	BEGIN
		IF(@trayecto IN (SELECT IdTrayecto FROM TRAYECTOS))
			BEGIN
				IF((CONVERT(nvarchar(10), @fechaHoraViaje, 105)IN
					(SELECT CONVERT(nvarchar(10), V.FechaHoraViaje, 105)FROM VUELOS AS V
					 JOIN TRAYECTOS AS T ON V.Trayecto = T.IdTrayecto 
					 WHERE T.Origen=(SELECT Origen FROM TRAYECTOS WHERE IdTrayecto = @trayecto)))
				AND (SELECT Origen FROM TRAYECTOS WHERE IdTrayecto = @trayecto)IN
					(SELECT T.Origen FROM TRAYECTOS AS T JOIN VUELOS AS V ON V.Trayecto = T.IdTrayecto))
					BEGIN				 	
						IF(Convert(time,CONVERT(nvarchar(12),@fechaHoraViaje, 114))IN(SELECT Convert(time,CONVERT(nvarchar(12),FechaHoraViaje, 114))FROM VUELOS))
							BEGIN
								SET @mensaje = 'No pueden salir dos vuelos a la misma hora desde el mismo origen';
							END
						ELSE
						BEGIN
							INSERT INTO VUELOS(IdVuelo, FechaHoraViaje, Temporada, IdAdmin, Trayecto)
							VALUES(@idVuelo, @fechaHoraViaje, @temporada, @idAdmin, @trayecto)
							SET @mensaje = 'El vuelo se ha registrado correctamente';
						END									
					END
				ELSE
				BEGIN
					INSERT INTO VUELOS(IdVuelo, FechaHoraViaje, Temporada, IdAdmin, Trayecto)
					VALUES(@idVuelo, @fechaHoraViaje, @temporada, @idAdmin, @trayecto)
					SET @mensaje = 'El vuelo se ha registrado correctamente';
				END				
		END		
		ELSE
		BEGIN
			SET @mensaje = 'No existe el trayecto';				
		END
END
ELSE
	BEGIN
	SET @mensaje = 'Ya existe el código de vuelo en la base de datos';			
END
GO
/****** Object:  StoredProcedure [dbo].[vuelosPiloto]    Script Date: 09/22/2013 18:46:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[vuelosPiloto]
@usuario VARCHAR(20)
AS
SELECT T.Origen, T.Destino, V.FechaHoraViaje AS "Fecha Hora Viaje", T.Duracion AS "Duración", A.Tipo AS "Aeronave", A.Pasajeros,
TI.Piloto, V.Temporada, TI.CodigoTicket as "Referencia"
FROM TICKET AS TI
JOIN AERONAVES A ON A.IdAeronave = TI.IdAeronave
JOIN VUELOS V ON TI.IdVuelo = V.IdVuelo
JOIN TRAYECTOS T ON T.IdTrayecto = V.Trayecto
WHERE TI.Piloto = @usuario
ORDER BY V.FechaHoraViaje
GO
/****** Object:  StoredProcedure [dbo].[vuelosPasajero]    Script Date: 09/22/2013 18:46:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[vuelosPasajero]
AS
BEGIN
SELECT T.Origen, T.Destino, V.FechaHoraViaje AS "Fecha Hora Viaje", T.Duracion AS "Duración", A.Tipo AS "Aeronave",
V.Temporada, CONVERT(VARCHAR , T.PrecioBase,1) AS "Precio Base", TI.Asientos AS "Asientos", TI.CodigoTicket as "Referencia"
FROM TICKET AS TI
JOIN AERONAVES A ON A.IdAeronave = TI.IdAeronave
JOIN VUELOS V ON TI.IdVuelo = V.IdVuelo
JOIN TRAYECTOS T ON T.IdTrayecto = V.Trayecto
WHERE TI.Asientos >0
ORDER BY V.FechaHoraViaje
END
GO
/****** Object:  StoredProcedure [dbo].[setPesoEquipaje]    Script Date: 09/22/2013 18:46:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[setPesoEquipaje]
@idTicket INT,
@peso INT
AS	
	UPDATE TICKET SET PesoEquipaje = @peso WHERE CodigoTicket = @idTicket
GO
/****** Object:  Table [dbo].[VOLETO]    Script Date: 09/22/2013 18:46:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[VOLETO](
	[Pasajero] [varchar](15) NOT NULL,
	[Valor] [money] NOT NULL,
	[IdaVuelta] [bit] NULL,
	[TicketIda] [int] NOT NULL,
	[TicketRegreso] [int] NULL,
	[PesoEquipaje] [float] NOT NULL,
	[IdVoleto] [int] IDENTITY(1,1) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[IdVoleto] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
SET IDENTITY_INSERT [dbo].[VOLETO] ON
INSERT [dbo].[VOLETO] ([Pasajero], [Valor], [IdaVuelta], [TicketIda], [TicketRegreso], [PesoEquipaje], [IdVoleto]) VALUES (N'11114111', 99000.0000, 0, 1002, NULL, 12, 1)
INSERT [dbo].[VOLETO] ([Pasajero], [Valor], [IdaVuelta], [TicketIda], [TicketRegreso], [PesoEquipaje], [IdVoleto]) VALUES (N'11114111', 99000.0000, 0, 1002, NULL, 12, 2)
INSERT [dbo].[VOLETO] ([Pasajero], [Valor], [IdaVuelta], [TicketIda], [TicketRegreso], [PesoEquipaje], [IdVoleto]) VALUES (N'11114111', 99000.0000, 0, 1023, NULL, 40, 3)
INSERT [dbo].[VOLETO] ([Pasajero], [Valor], [IdaVuelta], [TicketIda], [TicketRegreso], [PesoEquipaje], [IdVoleto]) VALUES (N'11114111', 201000.0000, 1, 1023, 1001, 58, 4)
INSERT [dbo].[VOLETO] ([Pasajero], [Valor], [IdaVuelta], [TicketIda], [TicketRegreso], [PesoEquipaje], [IdVoleto]) VALUES (N'11114111', 99000.0000, 0, 1023, NULL, 35, 5)
INSERT [dbo].[VOLETO] ([Pasajero], [Valor], [IdaVuelta], [TicketIda], [TicketRegreso], [PesoEquipaje], [IdVoleto]) VALUES (N'11114111', 170850.0000, 1, 1001, 1002, 58, 6)
INSERT [dbo].[VOLETO] ([Pasajero], [Valor], [IdaVuelta], [TicketIda], [TicketRegreso], [PesoEquipaje], [IdVoleto]) VALUES (N'11114111', 170850.0000, 1, 1002, 1001, 68, 7)
SET IDENTITY_INSERT [dbo].[VOLETO] OFF
/****** Object:  StoredProcedure [dbo].[listarVuelosRegistro]    Script Date: 09/22/2013 18:46:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[listarVuelosRegistro] 
AS
BEGIN
SELECT IdVuelo, Trayecto 
FROM VUELOS
WHERE IdVuelo NOT IN(SELECT IdVuelo FROM TICKET)
END
GO
/****** Object:  StoredProcedure [dbo].[listarVuelos]    Script Date: 09/22/2013 18:46:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[listarVuelos]
AS
BEGIN
SELECT T.Origen, T.Destino, V.FechaHoraViaje AS "Fecha Hora Viaje", T.Duracion AS "Duración", A.Tipo AS "Aeronave",
TI.Piloto, V.Temporada, CONVERT(VARCHAR , T.PrecioBase,1) AS "Precio Base", TI.CodigoTicket as "Referencia"
FROM TICKET AS TI
JOIN AERONAVES A ON A.IdAeronave = TI.IdAeronave
JOIN VUELOS V ON TI.IdVuelo = V.IdVuelo
JOIN TRAYECTOS T ON T.IdTrayecto = V.Trayecto
ORDER BY V.FechaHoraViaje
END
GO
/****** Object:  UserDefinedFunction [dbo].[getFechaViaje]    Script Date: 09/22/2013 18:46:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE FUNCTION [dbo].[getFechaViaje]
(@idTicket INT)
RETURNS DATETIME
AS
BEGIN
DECLARE @fecha DATETIME
SET @fecha = (SELECT V.FechaHoraViaje
			  FROM VUELOS AS V
			  JOIN TICKET AS TI ON TI.IdVuelo = V.IdVuelo
			  WHERE TI.CodigoTicket = @idTicket)
RETURN @fecha
END
GO
/****** Object:  UserDefinedFunction [dbo].[getCarga]    Script Date: 09/22/2013 18:46:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE FUNCTION [dbo].[getCarga]
(@ticket int)
RETURNS FLOAT
AS
BEGIN
DECLARE @carga FLOAT
SET @carga =(SELECT A.Carga 
			 FROM TICKET AS TI
			 JOIN AERONAVES AS A ON TI.IdAeronave = A.IdAeronave
			 WHERE TI.CodigoTicket = @ticket)
RETURN @carga
END
GO
/****** Object:  UserDefinedFunction [dbo].[getAsientos]    Script Date: 09/22/2013 18:46:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE FUNCTION [dbo].[getAsientos]
(@codigoTicket INT)
RETURNS INT
AS
BEGIN
DECLARE @asientos INT
SET @asientos =(SELECT Asientos 
					FROM TICKET 
					WHERE CodigoTicket = @codigoTicket)
RETURN @asientos
END
GO
/****** Object:  UserDefinedFunction [dbo].[getTemporada]    Script Date: 09/22/2013 18:46:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE FUNCTION [dbo].[getTemporada]
(@codigoTicket INT)
RETURNS VARCHAR(16)
AS
BEGIN
	DECLARE @temporada VARCHAR(16)
	SET @temporada =(SELECT V.Temporada
					 FROM VUELOS AS V
					 JOIN TICKET AS TI ON V.IdVuelo = TI.IdVuelo
					 WHERE TI.CodigoTicket = @codigoTicket)
	RETURN @temporada
END
GO
/****** Object:  UserDefinedFunction [dbo].[getPrecio]    Script Date: 09/22/2013 18:46:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE FUNCTION [dbo].[getPrecio]
(@codigoTicket INT)
RETURNS DECIMAL
AS
BEGIN
	DECLARE @precio DECIMAL
	SET @precio =(SELECT T.PrecioBase 
			      FROM TRAYECTOS AS T
			      JOIN VUELOS AS V ON T.IdTrayecto= V.Trayecto
			      JOIN TICKET AS TI ON V.IdVuelo = TI.IdVuelo
			      WHERE TI.CodigoTicket = @codigoTicket)
	RETURN @precio
END
GO
/****** Object:  UserDefinedFunction [dbo].[getPesoTicket]    Script Date: 09/22/2013 18:46:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE FUNCTION [dbo].[getPesoTicket]
(@ticket INT)
RETURNS INT
AS
BEGIN
DECLARE @peso INT
SET @peso = (SELECT PesoEquipaje FROM TICKET WHERE CodigoTicket = @ticket)
RETURN @peso
END
GO
/****** Object:  StoredProcedure [dbo].[registrarTicket]    Script Date: 09/22/2013 18:46:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[registrarTicket]
@codigoTiquete INT,
@idAeronave INT,
@piloto VARCHAR(20),
@idVuelo INT,
@mensaje VARCHAR(64) OUTPUT

AS
DECLARE @asientos INT
IF(NOT EXISTS(SELECT CodigoTicket FROM TICKET WHERE CodigoTicket=@codigoTiquete))
	BEGIN
		IF(EXISTS(SELECT IdVuelo FROM TICKET WHERE IdVuelo = @idVuelo))
			BEGIN
				SET @mensaje = 'El vuelo ya se encuentra asignado a un ticket';
			END
		ELSE
		BEGIN
		SET @asientos =(SELECT Pasajeros FROM AERONAVES WHERE IdAeronave = @idAeronave);
			INSERT INTO TICKET(CodigoTicket, IdAeronave,  Piloto, IdVuelo, Asientos, PesoEquipaje)
			VALUES(@codigoTiquete, @idAeronave, @piloto, @idVuelo, @asientos,0)
			SET @mensaje = 'El ticket se ha registrado correctamente';
		END		
END
ELSE
	BEGIN
	SET @mensaje = 'Ya existe el código de ticket en la base de datos';
END


select * from pasajeros;

select COUNT(Frecuente) FROM PASAJEROS WHERE Frecuente = 1;






update pasajeros set frecuente = 0
GO
/****** Object:  UserDefinedFunction [dbo].[getMillas]    Script Date: 09/22/2013 18:46:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE FUNCTION [dbo].[getMillas]
(@codigoTicket INT)
RETURNS INT
AS
BEGIN
DECLARE @millas INT
SET @millas = (SELECT T.Descuento 
				FROM TICKET AS TI
				JOIN VUELOS AS V ON V.IdVuelo = TI.IdVuelo
				JOIN TRAYECTOS AS T ON T.IdTrayecto= V.Trayecto 
				WHERE CodigoTicket = @codigoTicket)
RETURN @millas
END
GO
/****** Object:  StoredProcedure [dbo].[setAsientos]    Script Date: 09/22/2013 18:46:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[setAsientos]
@idTicket INT
AS
	UPDATE TICKET SET Asientos = Asientos-1 WHERE CodigoTicket = @idTicket
GO
/****** Object:  StoredProcedure [dbo].[registrarVoleto]    Script Date: 09/22/2013 18:46:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[registrarVoleto]
@pasajero VARCHAR(15),
@valor MONEY,
@idaVuelta BIT,
@ticketIda INT,
@ticketRegreso INT,
@peso FLOAT,
@mensaje VARCHAR(128) OUTPUT

AS
IF(EXISTS(SELECT Identificacion FROM PASAJEROS WHERE Identificacion=@pasajero)AND
   EXISTS(SELECT CodigoTicket FROM TICKET WHERE CodigoTicket=@ticketIda)OR
   EXISTS(SELECT CodigoTicket FROM TICKET WHERE CodigoTicket=@ticketRegreso))
	BEGIN
		INSERT INTO VOLETO(Pasajero, Valor, IdaVuelta, TicketIda, TicketRegreso, PesoEquipaje)
		VALUES(@pasajero, @valor, @idaVuelta, @ticketIda, @ticketRegreso, @peso)
		SET @mensaje = 'Su voleto se ha generado correctamente';
	END
	ELSE
	BEGIN
	SET @mensaje = 'No existe el usuario o el tiquete en  la base de datos';
END
GO
/****** Object:  StoredProcedure [dbo].[clientesIdaVuelta]    Script Date: 09/22/2013 18:46:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[clientesIdaVuelta]
@numeroClientes Varchar(8) OUTPUT
AS
	SET @numeroClientes = (select COUNT(IdaVuelta) FROM VOLETO WHERE IdaVuelta = 1)

SELECT P.Identificacion, P.Nombre, TR.Origen, TR.Destino, V.Valor 
FROM PASAJEROS AS P
JOIN VOLETO AS V ON V.Pasajero = P.Identificacion
JOIN TICKET AS T ON V.TicketIda = T.CodigoTicket
JOIN VUELOS AS VU ON VU.IdVuelo = T.IdVuelo
JOIN TRAYECTOS AS TR ON VU.Trayecto = TR.IdTrayecto
WHERE IdaVuelta = 1
GO
/****** Object:  Check [Ch_Peso]    Script Date: 09/22/2013 18:46:19 ******/
ALTER TABLE [dbo].[VOLETO]  WITH CHECK ADD  CONSTRAINT [Ch_Peso] CHECK  (([PesoEquipaje]>(0)))
GO
ALTER TABLE [dbo].[VOLETO] CHECK CONSTRAINT [Ch_Peso]
GO
/****** Object:  Check [Ch_Valor]    Script Date: 09/22/2013 18:46:19 ******/
ALTER TABLE [dbo].[VOLETO]  WITH CHECK ADD  CONSTRAINT [Ch_Valor] CHECK  (([Valor]>(0)))
GO
ALTER TABLE [dbo].[VOLETO] CHECK CONSTRAINT [Ch_Valor]
GO
/****** Object:  ForeignKey [FK_VUELOS_ADMINISTRADOR]    Script Date: 09/22/2013 18:46:08 ******/
ALTER TABLE [dbo].[VUELOS]  WITH CHECK ADD  CONSTRAINT [FK_VUELOS_ADMINISTRADOR] FOREIGN KEY([IdAdmin])
REFERENCES [dbo].[ADMINISTRADOR] ([Usuario])
GO
ALTER TABLE [dbo].[VUELOS] CHECK CONSTRAINT [FK_VUELOS_ADMINISTRADOR]
GO
/****** Object:  ForeignKey [Trayecto]    Script Date: 09/22/2013 18:46:08 ******/
ALTER TABLE [dbo].[VUELOS]  WITH CHECK ADD  CONSTRAINT [Trayecto] FOREIGN KEY([Trayecto])
REFERENCES [dbo].[TRAYECTOS] ([IdTrayecto])
GO
ALTER TABLE [dbo].[VUELOS] CHECK CONSTRAINT [Trayecto]
GO
/****** Object:  ForeignKey [FK_TICKET_AERONAVES]    Script Date: 09/22/2013 18:46:19 ******/
ALTER TABLE [dbo].[TICKET]  WITH CHECK ADD  CONSTRAINT [FK_TICKET_AERONAVES] FOREIGN KEY([IdAeronave])
REFERENCES [dbo].[AERONAVES] ([IdAeronave])
GO
ALTER TABLE [dbo].[TICKET] CHECK CONSTRAINT [FK_TICKET_AERONAVES]
GO
/****** Object:  ForeignKey [FK_TICKET_PILOTOS]    Script Date: 09/22/2013 18:46:19 ******/
ALTER TABLE [dbo].[TICKET]  WITH CHECK ADD  CONSTRAINT [FK_TICKET_PILOTOS] FOREIGN KEY([Piloto])
REFERENCES [dbo].[PILOTOS] ([Usuario])
GO
ALTER TABLE [dbo].[TICKET] CHECK CONSTRAINT [FK_TICKET_PILOTOS]
GO
/****** Object:  ForeignKey [FK_TICKET_VUELOS]    Script Date: 09/22/2013 18:46:19 ******/
ALTER TABLE [dbo].[TICKET]  WITH CHECK ADD  CONSTRAINT [FK_TICKET_VUELOS] FOREIGN KEY([IdVuelo])
REFERENCES [dbo].[VUELOS] ([IdVuelo])
GO
ALTER TABLE [dbo].[TICKET] CHECK CONSTRAINT [FK_TICKET_VUELOS]
GO
/****** Object:  ForeignKey [Ida]    Script Date: 09/22/2013 18:46:19 ******/
ALTER TABLE [dbo].[VOLETO]  WITH CHECK ADD  CONSTRAINT [Ida] FOREIGN KEY([TicketIda])
REFERENCES [dbo].[TICKET] ([CodigoTicket])
GO
ALTER TABLE [dbo].[VOLETO] CHECK CONSTRAINT [Ida]
GO
/****** Object:  ForeignKey [Pasajero]    Script Date: 09/22/2013 18:46:19 ******/
ALTER TABLE [dbo].[VOLETO]  WITH CHECK ADD  CONSTRAINT [Pasajero] FOREIGN KEY([Pasajero])
REFERENCES [dbo].[PASAJEROS] ([Identificacion])
GO
ALTER TABLE [dbo].[VOLETO] CHECK CONSTRAINT [Pasajero]
GO
/****** Object:  ForeignKey [Regreso]    Script Date: 09/22/2013 18:46:19 ******/
ALTER TABLE [dbo].[VOLETO]  WITH CHECK ADD  CONSTRAINT [Regreso] FOREIGN KEY([TicketRegreso])
REFERENCES [dbo].[TICKET] ([CodigoTicket])
GO
ALTER TABLE [dbo].[VOLETO] CHECK CONSTRAINT [Regreso]
GO
