USE [master]
GO
/****** Object:  Database [SAT]    Script Date: 2/4/2021 12:13:43 AM ******/
CREATE DATABASE [SAT]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'SAT', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\SAT.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'SAT_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\SAT_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [SAT] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [SAT].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [SAT] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [SAT] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [SAT] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [SAT] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [SAT] SET ARITHABORT OFF 
GO
ALTER DATABASE [SAT] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [SAT] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [SAT] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [SAT] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [SAT] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [SAT] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [SAT] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [SAT] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [SAT] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [SAT] SET  ENABLE_BROKER 
GO
ALTER DATABASE [SAT] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [SAT] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [SAT] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [SAT] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [SAT] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [SAT] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [SAT] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [SAT] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [SAT] SET  MULTI_USER 
GO
ALTER DATABASE [SAT] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [SAT] SET DB_CHAINING OFF 
GO
ALTER DATABASE [SAT] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [SAT] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [SAT] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [SAT] SET QUERY_STORE = OFF
GO
USE [SAT]
GO
/****** Object:  Schema [Proceso]    Script Date: 2/4/2021 12:13:43 AM ******/
CREATE SCHEMA [Proceso]
GO
/****** Object:  Schema [Seguridad]    Script Date: 2/4/2021 12:13:43 AM ******/
CREATE SCHEMA [Seguridad]
GO
/****** Object:  Schema [UserInfo]    Script Date: 2/4/2021 12:13:43 AM ******/
CREATE SCHEMA [UserInfo]
GO
/****** Object:  Table [Proceso].[Salas]    Script Date: 2/4/2021 12:13:43 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Proceso].[Salas](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Nombre] [varchar](100) NOT NULL,
	[MomentoIncio] [datetime] NOT NULL,
	[Duracion] [int] NOT NULL,
	[Host] [varchar](15) NOT NULL,
	[Intervalo] [int] NOT NULL,
 CONSTRAINT [PK_Salas] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [Proceso].[Salas_Usuarios]    Script Date: 2/4/2021 12:13:43 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Proceso].[Salas_Usuarios](
	[ID_Salas_Usuarios] [int] IDENTITY(1,1) NOT NULL,
	[ID_Sala] [int] NOT NULL,
	[ID_Usuario] [varchar](15) NOT NULL,
	[Presente] [bit] NOT NULL,
 CONSTRAINT [PK_Salas_Usuarios] PRIMARY KEY CLUSTERED 
(
	[ID_Salas_Usuarios] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [Seguridad].[Sesiones]    Script Date: 2/4/2021 12:13:43 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Seguridad].[Sesiones](
	[ID_Sesion] [int] IDENTITY(1,1) NOT NULL,
	[Token] [varchar](100) NOT NULL,
	[Vigencia] [datetime] NOT NULL,
	[ID_Dispositivo] [int] NOT NULL,
	[Usuario] [varchar](15) NOT NULL,
 CONSTRAINT [PK_Sesiones] PRIMARY KEY CLUSTERED 
(
	[ID_Sesion] ASC,
	[Token] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [UserInfo].[Rol_Usuario]    Script Date: 2/4/2021 12:13:43 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [UserInfo].[Rol_Usuario](
	[ID_Usuario] [varchar](15) NOT NULL,
	[ID_Rol] [int] NOT NULL,
 CONSTRAINT [PK_Rol_Usuario] PRIMARY KEY CLUSTERED 
(
	[ID_Usuario] ASC,
	[ID_Rol] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [UserInfo].[Roles]    Script Date: 2/4/2021 12:13:43 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [UserInfo].[Roles](
	[ID] [int] NOT NULL,
	[Descripcion] [varchar](50) NOT NULL,
 CONSTRAINT [PK_Roles] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [UserInfo].[Usuarios]    Script Date: 2/4/2021 12:13:43 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [UserInfo].[Usuarios](
	[ID] [varchar](15) NOT NULL,
	[Nombre] [varchar](30) NOT NULL,
	[Matricula] [varchar](10) NULL,
	[Correo] [varchar](100) NOT NULL,
	[Password] [varchar](50) NULL,
 CONSTRAINT [PK_Users] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [Seguridad].[Sesiones] ON 

INSERT [Seguridad].[Sesiones] ([ID_Sesion], [Token], [Vigencia], [ID_Dispositivo], [Usuario]) VALUES (1, N'd5cebeef-0f49-46fe-bfe7-af54422c2321', CAST(N'2021-02-03T23:13:59.030' AS DateTime), 123456, N'2')
INSERT [Seguridad].[Sesiones] ([ID_Sesion], [Token], [Vigencia], [ID_Dispositivo], [Usuario]) VALUES (2, N'a70a53ec-f072-4231-a10c-261b95c8d241', CAST(N'2021-02-03T23:19:38.280' AS DateTime), 123456, N'2')
INSERT [Seguridad].[Sesiones] ([ID_Sesion], [Token], [Vigencia], [ID_Dispositivo], [Usuario]) VALUES (3, N'68ed77c1-ef5b-4cb7-a006-2165e7757737', CAST(N'2021-02-03T23:22:07.527' AS DateTime), 123456, N'4')
SET IDENTITY_INSERT [Seguridad].[Sesiones] OFF
GO
INSERT [UserInfo].[Rol_Usuario] ([ID_Usuario], [ID_Rol]) VALUES (N'4', 2)
GO
INSERT [UserInfo].[Roles] ([ID], [Descripcion]) VALUES (1, N'ESTUDIANTE')
INSERT [UserInfo].[Roles] ([ID], [Descripcion]) VALUES (2, N'PROFESOR')
GO
INSERT [UserInfo].[Usuarios] ([ID], [Nombre], [Matricula], [Correo], [Password]) VALUES (N'1', N'Luis Delgado', N'20151064', N'delgado.tdp@gmail.com', N'12345')
INSERT [UserInfo].[Usuarios] ([ID], [Nombre], [Matricula], [Correo], [Password]) VALUES (N'2', N'Samuel Peña', N'20151234', N'ersamu@gmail.com', N'123456')
INSERT [UserInfo].[Usuarios] ([ID], [Nombre], [Matricula], [Correo], [Password]) VALUES (N'3', N'Ermosen', N'20154321', N'fasd@gmail.com', NULL)
INSERT [UserInfo].[Usuarios] ([ID], [Nombre], [Matricula], [Correo], [Password]) VALUES (N'4', N'Bulin', N'2056641', N'bulin47@gmail.com', N'12')
GO
ALTER TABLE [Proceso].[Salas_Usuarios] ADD  CONSTRAINT [DF__Salas_Usu__Prese__2E1BDC42]  DEFAULT ((0)) FOR [Presente]
GO
ALTER TABLE [Proceso].[Salas]  WITH CHECK ADD  CONSTRAINT [FK_Salas_Usuarios] FOREIGN KEY([Host])
REFERENCES [UserInfo].[Usuarios] ([ID])
GO
ALTER TABLE [Proceso].[Salas] CHECK CONSTRAINT [FK_Salas_Usuarios]
GO
ALTER TABLE [Proceso].[Salas_Usuarios]  WITH CHECK ADD  CONSTRAINT [FK_SalasUsuarios_Salas] FOREIGN KEY([ID_Sala])
REFERENCES [Proceso].[Salas] ([ID])
GO
ALTER TABLE [Proceso].[Salas_Usuarios] CHECK CONSTRAINT [FK_SalasUsuarios_Salas]
GO
ALTER TABLE [Proceso].[Salas_Usuarios]  WITH CHECK ADD  CONSTRAINT [FK_SalasUsuarios_Usuarios] FOREIGN KEY([ID_Usuario])
REFERENCES [UserInfo].[Usuarios] ([ID])
GO
ALTER TABLE [Proceso].[Salas_Usuarios] CHECK CONSTRAINT [FK_SalasUsuarios_Usuarios]
GO
ALTER TABLE [Seguridad].[Sesiones]  WITH CHECK ADD  CONSTRAINT [FK_Sesiones_Usuario] FOREIGN KEY([Usuario])
REFERENCES [UserInfo].[Usuarios] ([ID])
GO
ALTER TABLE [Seguridad].[Sesiones] CHECK CONSTRAINT [FK_Sesiones_Usuario]
GO
USE [master]
GO
ALTER DATABASE [SAT] SET  READ_WRITE 
GO
