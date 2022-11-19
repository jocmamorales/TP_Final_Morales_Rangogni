﻿--DROP DATABASE ClinicaMora

USE master
GO

CREATE DATABASE ClinicaMora
GO

USE ClinicaMora
GO

CREATE TABLE [dbo].[Perfiles] (
    [IdPerfil]    INT          IDENTITY (1, 1) NOT NULL,
    [Descripcion] VARCHAR (50) NOT NULL,
    [Estado]      BIT          NOT NULL,
    PRIMARY KEY CLUSTERED ([IdPerfil] ASC)
);
GO

CREATE TABLE [dbo].[Jornadas] (
    [IdJornada]   INT          IDENTITY (1, 1) NOT NULL,
    [Descripcion] VARCHAR (50) NOT NULL,
    [Estado]      BIT          NOT NULL,
    [Inicio]      INT          NOT NULL,
    [Fin]         INT          NOT NULL,
    PRIMARY KEY CLUSTERED ([IdJornada])
);
ALTER TABLE [dbo].[Jornadas]
    ADD CONSTRAINT [UK_JornadaInicioFin] UNIQUE ([IdJornada],[Inicio],[Fin]);
GO

CREATE TABLE [dbo].[Especialidad] (
    [IdEspecialidad] INT          IDENTITY (1, 1) NOT NULL,
    [Descripcion]    VARCHAR (50) NOT NULL,
    [Estado]         BIT          NOT NULL,
    PRIMARY KEY CLUSTERED ([IdEspecialidad] ASC)
);
GO

CREATE TABLE [dbo].[Empleados] (
    [Id]           INT PRIMARY KEY IDENTITY (1, 1) NOT NULL,
    [IdPerfil] INT          NULL,
    [Nombre]       VARCHAR (50) NOT NULL,
    [Apellido]     VARCHAR (50) NOT NULL,
    [NroDocumento] VARCHAR (10) NOT NULL,
    [FechaAlta]    DATETIME     NOT NULL,
    [IdJornada]    INT          NOT NULL,
    [Estado]       BIT          NOT NULL
);
ALTER TABLE [dbo].[Empleados]
    ADD CONSTRAINT [FK_EmpleadoPerfil] FOREIGN KEY ([IdPerfil]) REFERENCES [dbo].[Perfiles] ([IdPerfil]);
ALTER TABLE [dbo].[Empleados]
    ADD CONSTRAINT [FK_EmpleadoIdJornada] FOREIGN KEY ([IdJornada]) REFERENCES [dbo].[Jornadas] (IdJornada);
GO

CREATE TABLE [dbo].[Usuarios] (
    [IdUsuario]  INT PRIMARY KEY IDENTITY (1, 1) NOT NULL,
    [UserLogin]  VARCHAR (50) NOT NULL,
    [Password]   VARCHAR (50) NOT NULL,
    [IdEmpleado] INT          NOT NULL
);
ALTER TABLE [dbo].[Usuarios]
    ADD CONSTRAINT [FK_IdEmpleado] FOREIGN KEY ([IdEmpleado]) REFERENCES [dbo].[Empleados] ([Id]);
GO

CREATE TABLE [dbo].[Pacientes] (
    [IdPaciente]      INT           IDENTITY (1, 1) NOT NULL,
    [Nombres]         VARCHAR (50)  NOT NULL,
    [Apellidos]       VARCHAR (50)  NOT NULL,
    [NroDocumento]    VARCHAR (10)  NOT NULL,
    [FechaNacimiento] DATETIME      NOT NULL,
    [Sexo]            VARCHAR (20)  NULL,
    [FechaAlta]       DATETIME      NOT NULL,
    [Estado]          BIT           NOT NULL,
    [Telefono]        VARCHAR (15)  NULL,
    [Email]           VARCHAR (50)  NULL,
    [Imagen]          VARCHAR (150) NULL,
    PRIMARY KEY CLUSTERED ([IdPaciente] ASC)
);
GO

CREATE TABLE [dbo].[MedicosEspecialidad] (
    [IdMedico]       INT PRIMARY KEY NOT NULL,
    [IdEspecialidad] INT NOT NULL,
    [Estado]         BIT NULL
);
ALTER TABLE [dbo].[MedicosEspecialidad]
    ADD CONSTRAINT [FK_MedicoIdEspecialidad] FOREIGN KEY ([IdEspecialidad]) REFERENCES [dbo].[Especialidad] ([IdEspecialidad]);
GO

CREATE TABLE [dbo].[Turnos] (
    [IdTurnos]     INT PRIMARY KEY IDENTITY (1, 1) NOT NULL,
    [IdEmpleado]   INT           NULL,
    [IdPaciente]   INT           NULL,
    [FechaReserva] DATETIME      NOT NULL,
    [Observacion]  VARCHAR (MAX) NOT NULL,
    [IdJornada]    INT           NULL,
    [Estado]       BIT           NOT NULL,
    [Hora]         INT           NULL
);
ALTER TABLE [dbo].[Turnos]
    ADD CONSTRAINT [FK_TurnoIdEmpleado] FOREIGN KEY ([IdEmpleado]) REFERENCES [dbo].[Empleados] ([Id]);
ALTER TABLE [dbo].[Turnos]
    ADD CONSTRAINT [FK_TurnoIdPaciente] FOREIGN KEY ([IdPaciente]) REFERENCES [dbo].[Pacientes] ([IdPaciente]);
ALTER TABLE [dbo].[Turnos]
    ADD CONSTRAINT [FK_TurnoIdJornada] FOREIGN KEY ([IdJornada]) REFERENCES [dbo].[Jornadas] (IdJornada);
GO

SET IDENTITY_INSERT [dbo].[Perfiles] ON
INSERT INTO [dbo].[Perfiles] ([IdPerfil], [Descripcion], [Estado]) VALUES (1, N'Administrador', 1)
INSERT INTO [dbo].[Perfiles] ([IdPerfil], [Descripcion], [Estado]) VALUES (2, N'Empleado', 1)
INSERT INTO [dbo].[Perfiles] ([IdPerfil], [Descripcion], [Estado]) VALUES (3, N'Medico', 1)
SET IDENTITY_INSERT [dbo].[Perfiles] OFF


SET IDENTITY_INSERT [dbo].[Jornadas] ON
INSERT INTO [dbo].[Jornadas] ([IdJornada], [Descripcion], [Estado], [Inicio], [Fin]) VALUES (1, N'Mañana 1', 1, 8, 12)
INSERT INTO [dbo].[Jornadas] ([IdJornada], [Descripcion], [Estado], [Inicio], [Fin]) VALUES (2, N'Tarde 1', 1, 14, 18)
INSERT INTO [dbo].[Jornadas] ([IdJornada], [Descripcion], [Estado], [Inicio], [Fin]) VALUES (3, N'Tarde 2', 1, 16, 20)
INSERT INTO [dbo].[Jornadas] ([IdJornada], [Descripcion], [Estado], [Inicio], [Fin]) VALUES (4, N'Mañana 2', 1, 9, 13)
INSERT INTO [dbo].[Jornadas] ([IdJornada], [Descripcion], [Estado], [Inicio], [Fin]) VALUES (5, N'Completa 1', 1, 8, 15)
INSERT INTO [dbo].[Jornadas] ([IdJornada], [Descripcion], [Estado], [Inicio], [Fin]) VALUES (6, N'Completa 2', 1, 13, 20)
SET IDENTITY_INSERT [dbo].[Jornadas] OFF

SET IDENTITY_INSERT [dbo].[Empleados] ON
INSERT INTO [dbo].[Empleados] ([Id], [IdPerfil], [Nombre], [Apellido], [NroDocumento], [FechaAlta],[IdJornada], [Estado]) 
VALUES (1, 1, N'Admin', N'Admin', N'11111111', N'2000-01-01 00:00:0', 5, 1)
SET IDENTITY_INSERT [dbo].[Empleados] OFF

SET IDENTITY_INSERT [dbo].[Usuarios] ON
INSERT INTO [dbo].[Usuarios] ([IdUsuario], [UserLogin], [Password], [IdEmpleado]) 
VALUES (1, N'Admin', N'Admin', 1)
SET IDENTITY_INSERT [dbo].[Empleados] OFF

select * from Empleados