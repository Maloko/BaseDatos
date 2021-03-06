USE [Calidda_SGC_DEV]
GO
/****** Object:  User [caliddasa]    Script Date: 11/08/2021 18:59:04 ******/
CREATE USER [caliddasa] FOR LOGIN [caliddasa] WITH DEFAULT_SCHEMA=[dbo]
GO
ALTER ROLE [db_owner] ADD MEMBER [caliddasa]
GO
ALTER ROLE [db_accessadmin] ADD MEMBER [caliddasa]
GO
ALTER ROLE [db_securityadmin] ADD MEMBER [caliddasa]
GO
ALTER ROLE [db_datawriter] ADD MEMBER [caliddasa]
GO
/****** Object:  Table [dbo].[AgendaReunion]    Script Date: 11/08/2021 18:59:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AgendaReunion](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[ReunionId] [int] NOT NULL,
	[Orden] [int] NOT NULL,
	[Tema] [varchar](100) NULL,
	[ResponsableId] [int] NOT NULL,
	[Fecha] [datetime] NULL,
	[HoraInicio] [datetime] NULL,
	[HoraFinal] [datetime] NULL,
	[Estado] [char](1) NOT NULL,
	[UsuarioCreacionId] [int] NOT NULL,
	[UsuarioModificacionId] [int] NULL,
	[FechaCreacion] [datetime] NOT NULL,
	[FechaModificacion] [datetime] NULL,
 CONSTRAINT [PK_AGENDA_REUNION] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Audits]    Script Date: 11/08/2021 18:59:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Audits](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[TableName] [nvarchar](50) NOT NULL,
	[DateTime] [datetime] NOT NULL,
	[KeyValues] [nvarchar](max) NULL,
	[OldValues] [nvarchar](max) NULL,
	[NewValues] [nvarchar](max) NULL,
	[UserId] [int] NULL,
 CONSTRAINT [PK_Audits] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CargoMiembro]    Script Date: 11/08/2021 18:59:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CargoMiembro](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Nombre] [varchar](100) NOT NULL,
	[Estado] [int] NOT NULL,
 CONSTRAINT [PK_CARGOCOMITE] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Comite]    Script Date: 11/08/2021 18:59:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Comite](
	[Id] [int] IDENTITY(0,1) NOT NULL,
	[EmpresaId] [int] NOT NULL,
	[PaisId] [int] NOT NULL,
	[SecretarioId] [int] NOT NULL,
	[Nombre] [varchar](70) NULL,
	[DireccionId] [int] NOT NULL,
	[Codigo] [varchar](100) NOT NULL,
	[FechaHora] [datetime] NOT NULL,
	[EstadoComiteId] [int] NOT NULL,
	[FrecuenciaId] [int] NULL,
	[FechaHoraUltima] [datetime] NULL,
	[PasoConfiguracion] [int] NULL,
	[AcuerdoConfidencialidad] [bit] NULL,
	[UsuarioCreacionId] [int] NOT NULL,
	[UsuarioModificacionId] [int] NULL,
	[FechaCreacion] [datetime] NOT NULL,
	[FechaModificacion] [datetime] NULL,
 CONSTRAINT [PK_COMITE] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ComiteDetalle]    Script Date: 11/08/2021 18:59:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ComiteDetalle](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[ComiteId] [int] NOT NULL,
	[Descripcion] [varchar](150) NULL,
	[Objetivo] [varchar](150) NULL,
	[Periodicidad] [bit] NULL,
	[FrecuenciaId] [int] NULL,
	[DiaId] [int] NULL,
	[FechaInicio] [datetime] NULL,
	[HoraInicio] [datetime] NULL,
	[HoraFin] [datetime] NULL,
	[ToleranciaId] [int] NULL,
	[Repeticion] [int] NULL,
	[DiasAnticipacion] [int] NULL,
	[Voto] [bit] NULL,
	[Cuorum] [decimal](5, 2) NULL,
	[Estado] [int] NULL,
	[UsuarioCreacionId] [int] NOT NULL,
	[UsuarioModificacionId] [int] NULL,
	[FechaCreacion] [datetime] NOT NULL,
	[FechaModificacion] [datetime] NULL,
 CONSTRAINT [PK_ComiteDetalle] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Compromiso]    Script Date: 11/08/2021 18:59:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Compromiso](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[ReunionId] [int] NOT NULL,
	[ResponsableId] [int] NOT NULL,
	[Concepto] [varchar](50) NOT NULL,
	[AvanceActual] [int] NOT NULL,
	[AvanceAnterior] [int] NOT NULL,
	[FechaCierre] [datetime] NULL,
	[Estado] [char](1) NULL,
	[UsuarioCreacionId] [int] NOT NULL,
	[UsuarioModificacionId] [int] NULL,
	[FechaCreacion] [datetime] NOT NULL,
	[FechaModificacion] [datetime] NULL,
 CONSTRAINT [PK_COMPROMISO] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ConfidencialDocumento]    Script Date: 11/08/2021 18:59:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ConfidencialDocumento](
	[Id] [int] IDENTITY(0,1) NOT NULL,
	[Nombre] [varchar](50) NOT NULL,
	[Tipo] [int] NOT NULL,
	[NombreOriginal] [varchar](100) NULL,
	[GuideNombre] [varchar](100) NULL,
	[Estado] [int] NOT NULL,
	[UsuarioCreacionId] [int] NULL,
	[UsuarioModificacionId] [int] NULL,
	[FechaCreacion] [datetime] NOT NULL,
	[FechaModificacion] [datetime] NULL,
 CONSTRAINT [PK_ConfidencialDocumento] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DesarrolloGeneralReunion]    Script Date: 11/08/2021 18:59:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DesarrolloGeneralReunion](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[ReunionId] [int] NOT NULL,
	[Titulo] [varchar](2000) NOT NULL,
	[Descripcion] [varchar](2000) NOT NULL,
	[UsuarioId] [int] NOT NULL,
	[Estado] [int] NOT NULL,
	[UsuarioCreacionId] [int] NOT NULL,
	[UsuarioModificacionId] [int] NULL,
	[FechaCreacion] [datetime] NOT NULL,
	[FechaModificacion] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Direccion]    Script Date: 11/08/2021 18:59:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Direccion](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Nombre] [varchar](70) NOT NULL,
	[Estado] [int] NULL,
	[UsuarioCreacionId] [int] NOT NULL,
	[UsuarioModificacionId] [int] NULL,
	[FechaCreacion] [datetime] NOT NULL,
	[FechaModificacion] [datetime] NULL,
 CONSTRAINT [PK_Direccion] PRIMARY KEY NONCLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DocumentoAgenda]    Script Date: 11/08/2021 18:59:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DocumentoAgenda](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[AgendaReunionId] [int] NOT NULL,
	[Nombre] [varchar](100) NOT NULL,
	[GuidNombre] [varchar](100) NOT NULL,
	[Estado] [int] NOT NULL,
	[UsuarioCreacionId] [int] NOT NULL,
	[UsuarioModificacionId] [int] NULL,
	[FechaCreacion] [datetime] NOT NULL,
	[FechaModificacion] [datetime] NULL,
 CONSTRAINT [PK_DOCUMENTOAGENDA] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DocumentoComite]    Script Date: 11/08/2021 18:59:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DocumentoComite](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[ComiteId] [int] NOT NULL,
	[TipoArchivoId] [int] NOT NULL,
	[Nombre] [varchar](100) NOT NULL,
	[GuidNombre] [varchar](100) NULL,
	[Estado] [int] NOT NULL,
	[UsuarioCreacionId] [int] NOT NULL,
	[UsuarioModificacionId] [int] NULL,
	[FechaCreacion] [datetime] NOT NULL,
	[FechaModificacion] [datetime] NULL,
 CONSTRAINT [PK_DOCUMENTOCOMITE] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DocumentoReunion]    Script Date: 11/08/2021 18:59:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DocumentoReunion](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[ReunionId] [int] NOT NULL,
	[TipoArchivo] [int] NULL,
	[Nombre] [varchar](100) NOT NULL,
	[GuidNombre] [varchar](100) NOT NULL,
	[Ruta] [varchar](100) NOT NULL,
	[CodigoActa] [varchar](35) NULL,
	[FechaLimiteAprobacion] [datetime] NULL,
	[FechaLimiteFirma] [datetime] NULL,
	[Estado] [char](1) NOT NULL,
	[CodigoNotificacion] [int] NULL,
	[UsuarioCreacionId] [int] NOT NULL,
	[UsuarioModificacionId] [int] NULL,
	[FechaCreacion] [datetime] NOT NULL,
	[FechaModificacion] [datetime] NULL,
 CONSTRAINT [PK_DOCUMENTO_REUNION] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Empresa]    Script Date: 11/08/2021 18:59:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Empresa](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[PaisId] [int] NOT NULL,
	[Nombre] [varchar](70) NULL,
	[Ruc] [varchar](11) NOT NULL,
	[Estado] [int] NOT NULL,
	[UsuarioCreacionId] [int] NULL,
	[UsuarioModificacionId] [int] NULL,
	[FechaCreacion] [datetime] NOT NULL,
	[FechaModificacion] [datetime] NULL,
 CONSTRAINT [PK_Empresa] PRIMARY KEY NONCLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[EstadoComite]    Script Date: 11/08/2021 18:59:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[EstadoComite](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Nombre] [varchar](50) NULL,
	[Estado] [int] NOT NULL,
 CONSTRAINT [PK_ComiteEstado] PRIMARY KEY NONCLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[FacultadMiembro]    Script Date: 11/08/2021 18:59:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[FacultadMiembro](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Nombre] [varchar](100) NOT NULL,
	[Estado] [int] NOT NULL,
 CONSTRAINT [PK_VOTOCOMITE] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ForumMiembroReunion]    Script Date: 11/08/2021 18:59:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ForumMiembroReunion](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[MiembroReunionId] [int] NOT NULL,
	[AutorId] [int] NOT NULL,
	[Mensaje] [varchar](2000) NOT NULL,
	[Estado] [int] NOT NULL,
	[UsuarioCreacionId] [int] NOT NULL,
	[UsuarioModificacionId] [int] NULL,
	[FechaCreacion] [datetime] NOT NULL,
	[FechaModificacion] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[HistorialCompromiso]    Script Date: 11/08/2021 18:59:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[HistorialCompromiso](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[CompromisoId] [int] NOT NULL,
	[Fecha] [datetime] NULL,
	[Hora] [datetime] NULL,
	[Informe] [varchar](100) NULL,
	[Avance] [int] NOT NULL,
	[UsuarioCreacionId] [int] NOT NULL,
	[UsuarioModificacionId] [int] NULL,
	[FechaCreacion] [datetime] NOT NULL,
	[FechaModificacion] [datetime] NULL,
 CONSTRAINT [PK_HISTORIAL_COMPROMISO] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[HistorialSubTarea]    Script Date: 11/08/2021 18:59:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[HistorialSubTarea](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[SubTareaId] [int] NOT NULL,
	[Fecha] [datetime] NULL,
	[Hora] [datetime] NULL,
	[Informe] [varchar](100) NULL,
	[Avance] [int] NOT NULL,
	[UsuarioCreacionId] [int] NOT NULL,
	[UsuarioModificacionId] [int] NULL,
	[FechaCreacion] [datetime] NOT NULL,
	[FechaModificacion] [datetime] NULL,
 CONSTRAINT [PK_HISTORIAL_SUBTAREA] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[HistoricoComite]    Script Date: 11/08/2021 18:59:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[HistoricoComite](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[ComiteId] [int] NULL,
	[Descripcion] [varchar](255) NULL,
	[FechaRegistro] [datetime] NULL,
	[UsuarioCreacionId] [int] NULL,
	[UsuarioModificacionId] [int] NULL,
	[FechaCreacion] [datetime] NOT NULL,
	[FechaModificacion] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[LogSessionUser]    Script Date: 11/08/2021 18:59:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[LogSessionUser](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[UserId] [int] NOT NULL,
	[Platform] [char](1) NOT NULL,
	[LoginDate] [datetime] NOT NULL,
 CONSTRAINT [PK_LogSessionUser] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Maestro]    Script Date: 11/08/2021 18:59:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Maestro](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Nombre] [varchar](30) NOT NULL,
	[Descripcion] [varchar](500) NOT NULL,
 CONSTRAINT [PK_Maestro] PRIMARY KEY NONCLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[MaestroDetalle]    Script Date: 11/08/2021 18:59:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MaestroDetalle](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[MaestroId] [int] NOT NULL,
	[Nombre] [varchar](100) NOT NULL,
	[Valor] [varchar](max) NOT NULL,
	[Descripcion] [varchar](500) NOT NULL,
	[Estado] [int] NOT NULL,
 CONSTRAINT [PK_MaestroDetalle] PRIMARY KEY NONCLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[MiembroComite]    Script Date: 11/08/2021 18:59:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MiembroComite](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[MiembroId] [int] NOT NULL,
	[ComiteId] [int] NOT NULL,
	[TipoMiembroComiteId] [int] NOT NULL,
	[CargoMiembroId] [int] NULL,
	[FacultadMiembroId] [int] NULL,
	[MiembroSuplantadoId] [int] NULL,
	[AgregadoPor] [int] NULL,
	[AprobadoPor] [int] NULL,
	[EstadoAprobacion] [bit] NULL,
	[Estado] [int] NOT NULL,
	[FechaAsignacion] [datetime] NULL,
	[UsuarioCreacionId] [int] NOT NULL,
	[UsuarioModificacionId] [int] NULL,
	[FechaCreacion] [datetime] NOT NULL,
	[FechaModificacion] [datetime] NULL,
 CONSTRAINT [PK_MIEMBROCOMITE] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[MiembroReunion]    Script Date: 11/08/2021 18:59:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MiembroReunion](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[ReunionId] [int] NOT NULL,
	[MiembroId] [int] NOT NULL,
	[TipoMiembroId] [int] NOT NULL,
	[CargoMiembroId] [int] NULL,
	[FacultadMiembroId] [int] NULL,
	[MiembroSuplantadoId] [int] NULL,
	[MotivoParticipacion] [varchar](100) NULL,
	[EstadoConfirmacion] [char](1) NULL,
	[Asistio] [char](1) NULL,
	[FechaMarcoAsistencia] [datetime] NULL,
	[UsuarioMarcoAsistenciaId] [int] NULL,
	[FechaConfirmoInvitacion] [datetime] NULL,
	[AgregadoPor] [int] NULL,
	[AprobadoPor] [int] NULL,
	[EstadoAprobacion] [bit] NULL,
	[Estado] [char](1) NULL,
	[UsuarioCreacionId] [int] NOT NULL,
	[UsuarioModificacionId] [int] NULL,
	[FechaCreacion] [datetime] NOT NULL,
	[FechaModificacion] [datetime] NULL,
 CONSTRAINT [PK_MIEMBRO REUNION] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Notificacion]    Script Date: 11/08/2021 18:59:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Notificacion](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[UsuarioEmisorId] [int] NULL,
	[UsuarioReceptorId] [int] NOT NULL,
	[TipoNotificacionId] [char](1) NULL,
	[Titulo] [nvarchar](1000) NOT NULL,
	[Descripcion] [varchar](2000) NOT NULL,
	[MiembroComiteId] [int] NULL,
	[MiembroReunionId] [int] NULL,
	[UrlBotonConfirmar] [varchar](2000) NULL,
	[FechaEmision] [datetime] NOT NULL,
	[Visto] [bit] NOT NULL,
	[EstadoAprobacionEntidad] [int] NULL,
	[Estado] [int] NOT NULL,
	[UsuarioCreacionId] [int] NOT NULL,
	[UsuarioModificacionId] [int] NULL,
	[FechaCreacion] [datetime] NOT NULL,
	[FechaModificacion] [datetime] NULL,
 CONSTRAINT [PK__Notifica__3214EC07979EB14A] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Numerador]    Script Date: 11/08/2021 18:59:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Numerador](
	[Origen] [varchar](10) NOT NULL,
	[Ano] [int] NULL,
	[Mes] [int] NULL,
	[Dia] [int] NULL,
	[Filtro1] [varchar](10) NULL,
	[Filtro2] [varchar](10) NULL,
	[Valor] [int] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Pais]    Script Date: 11/08/2021 18:59:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Pais](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Nombre] [varchar](50) NOT NULL,
	[Sigla] [varchar](50) NOT NULL,
	[Estado] [int] NOT NULL,
 CONSTRAINT [PK_Pais] PRIMARY KEY NONCLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PermisoDocumentoComite]    Script Date: 11/08/2021 18:59:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PermisoDocumentoComite](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[DocumentoComiteId] [int] NOT NULL,
	[MiembroComiteId] [int] NOT NULL,
	[Visualizar] [bit] NOT NULL,
	[Firmar] [bit] NULL,
	[Firmante] [bit] NULL,
	[AceptoAcuerdo] [bit] NULL,
	[Estado] [int] NOT NULL,
	[UsuarioCreacionId] [int] NOT NULL,
	[UsuarioModificacionId] [int] NULL,
	[FechaCreacion] [datetime] NOT NULL,
	[FechaModificacion] [datetime] NULL,
 CONSTRAINT [PermisosDocumentoComite] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PermisoDocumentoReunion]    Script Date: 11/08/2021 18:59:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PermisoDocumentoReunion](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[DocumentoReunionId] [int] NOT NULL,
	[MiembroReunionId] [int] NOT NULL,
	[Visualizar] [bit] NOT NULL,
	[Aprobacion] [bit] NULL,
	[OrdenFirma] [int] NULL,
	[Firma] [bit] NULL,
	[Estado] [int] NOT NULL,
	[UsuarioCreacionId] [int] NOT NULL,
	[UsuarioModificacionId] [int] NULL,
	[FechaCreacion] [datetime] NOT NULL,
	[FechaModificacion] [datetime] NULL,
 CONSTRAINT [PK__PermisoD__3214EC07E672854E] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Persona]    Script Date: 11/08/2021 18:59:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Persona](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Nombre] [varchar](150) NOT NULL,
	[EmpresaId] [int] NULL,
	[Celular] [varchar](11) NULL,
	[Dni] [varchar](15) NULL,
	[CargoEmpresa] [varchar](100) NULL,
	[UsuarioCreacionId] [int] NOT NULL,
	[UsuarioModificacionId] [int] NULL,
	[FechaCreacion] [datetime] NOT NULL,
	[FechaModificacion] [datetime] NULL,
 CONSTRAINT [PK_Persona] PRIMARY KEY NONCLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Reunion]    Script Date: 11/08/2021 18:59:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Reunion](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[CodigoReunion] [varchar](30) NULL,
	[ComiteId] [int] NOT NULL,
	[TipoReunionId] [char](1) NOT NULL,
	[Ubicacion] [nvarchar](1000) NULL,
	[Fecha] [datetime] NULL,
	[HoraInicio] [datetime] NULL,
	[HoraFinal] [datetime] NULL,
	[Link] [nvarchar](max) NULL,
	[EventoId] [nvarchar](max) NULL,
	[LimiteArchivo] [datetime] NULL,
	[Quorum] [int] NULL,
	[QuorumAsistentes] [int] NULL,
	[ToleranciaId] [char](1) NULL,
	[Titulo] [nvarchar](100) NOT NULL,
	[TiempoMaxEspera] [datetime] NULL,
	[PalabraClave] [varchar](50) NULL,
	[MostrarActa] [bit] NULL,
	[Estado] [char](1) NOT NULL,
	[UsuarioCreacionId] [int] NOT NULL,
	[UsuarioModificacionId] [int] NULL,
	[FechaCreacion] [datetime] NOT NULL,
	[FechaModificacion] [datetime] NULL,
 CONSTRAINT [PK_REUNION] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Rol]    Script Date: 11/08/2021 18:59:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Rol](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Nombre] [varchar](30) NOT NULL,
	[Estado] [int] NOT NULL,
 CONSTRAINT [PK_Rol] PRIMARY KEY NONCLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[RolUsuario]    Script Date: 11/08/2021 18:59:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[RolUsuario](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[RolId] [int] NOT NULL,
	[UsuarioId] [int] NOT NULL,
	[FechaCreacion] [datetime] NOT NULL,
	[Estado] [int] NOT NULL,
 CONSTRAINT [PK_RolUsuario] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SubTarea]    Script Date: 11/08/2021 18:59:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SubTarea](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[CompromisoId] [int] NOT NULL,
	[ResponsableId] [int] NOT NULL,
	[Concepto] [varchar](50) NOT NULL,
	[Avance] [int] NOT NULL,
	[FechaCierre] [datetime] NULL,
	[UsuarioCreacionId] [int] NOT NULL,
	[UsuarioModificacionId] [int] NULL,
	[FechaCreacion] [datetime] NOT NULL,
	[FechaModificacion] [datetime] NULL,
 CONSTRAINT [PK_SUBTAREA] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TipoMiembroComite]    Script Date: 11/08/2021 18:59:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TipoMiembroComite](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Nombre] [varchar](100) NOT NULL,
	[Estado] [int] NOT NULL,
 CONSTRAINT [PK_TIPOMIEMBROCOMITE] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Usuario]    Script Date: 11/08/2021 18:59:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Usuario](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Username] [varchar](50) NOT NULL,
	[Password] [varchar](100) NULL,
	[PersonaId] [int] NOT NULL,
	[Foto] [varchar](100) NULL,
	[ModoAutenticacion] [char](1) NOT NULL,
	[Correo] [varchar](50) NOT NULL,
	[EmailConfirmado] [int] NULL,
	[CambioContraseña] [int] NULL,
	[Estado] [int] NOT NULL,
	[EstadoAprobacion] [bit] NULL,
	[UsuarioCreacionId] [int] NOT NULL,
	[UsuarioModificacionId] [int] NULL,
	[FechaCreacion] [datetime] NOT NULL,
	[FechaModificacion] [datetime] NULL,
 CONSTRAINT [PK_Usuario] PRIMARY KEY NONCLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[VideoReunion]    Script Date: 11/08/2021 18:59:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[VideoReunion](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[ReunionId] [int] NOT NULL,
	[Nombre] [varchar](100) NOT NULL,
	[GuidNombre] [varchar](100) NOT NULL,
	[Ruta] [varchar](100) NOT NULL,
	[Estado] [char](1) NOT NULL,
	[UsuarioCreacionId] [int] NOT NULL,
	[UsuarioModificacionId] [int] NULL,
	[FechaCreacion] [datetime] NOT NULL,
	[FechaModificacion] [datetime] NULL,
 CONSTRAINT [PK_VIDEO_REUNION] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[VotacionMiembroReunion]    Script Date: 11/08/2021 18:59:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[VotacionMiembroReunion](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[VotacionReunionId] [int] NOT NULL,
	[MiembroId] [int] NOT NULL,
	[Voto] [char](1) NULL,
	[Estado] [char](1) NOT NULL,
	[UsuarioCreacionId] [int] NOT NULL,
	[UsuarioModificacionId] [int] NULL,
	[FechaCreacion] [datetime] NOT NULL,
	[FechaModificacion] [datetime] NULL,
 CONSTRAINT [PK_VOTACION_MIEMBRO_REUNION] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[VotacionReunion]    Script Date: 11/08/2021 18:59:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[VotacionReunion](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[ReunionId] [int] NOT NULL,
	[Tema] [varchar](100) NOT NULL,
	[Pregunta] [varchar](100) NOT NULL,
	[Voto] [char](1) NOT NULL,
	[Aspecto] [char](1) NOT NULL,
	[FechaLimite] [datetime] NOT NULL,
	[Estado] [char](1) NOT NULL,
	[UsuarioCreacionId] [int] NOT NULL,
	[UsuarioModificacionId] [int] NULL,
	[FechaCreacion] [datetime] NOT NULL,
	[FechaModificacion] [datetime] NULL,
 CONSTRAINT [PK_VOTACION_REUNION] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Comite] ADD  CONSTRAINT [DF_Comite_AcuerdoConfidencialidad]  DEFAULT ((0)) FOR [AcuerdoConfidencialidad]
GO
ALTER TABLE [dbo].[Numerador] ADD  DEFAULT ((0)) FOR [Valor]
GO
ALTER TABLE [dbo].[Reunion] ADD  CONSTRAINT [DF__Reunion__Quorum__5DB5E0CB]  DEFAULT ((1)) FOR [Quorum]
GO
ALTER TABLE [dbo].[Reunion] ADD  CONSTRAINT [DF_Reunion_MostrarActa]  DEFAULT ((0)) FOR [MostrarActa]
GO
ALTER TABLE [dbo].[VideoReunion] ADD  DEFAULT ('1') FOR [Estado]
GO
ALTER TABLE [dbo].[AgendaReunion]  WITH CHECK ADD  CONSTRAINT [FK_AgendaReunion_Reunion] FOREIGN KEY([ReunionId])
REFERENCES [dbo].[Reunion] ([Id])
GO
ALTER TABLE [dbo].[AgendaReunion] CHECK CONSTRAINT [FK_AgendaReunion_Reunion]
GO
ALTER TABLE [dbo].[AgendaReunion]  WITH CHECK ADD  CONSTRAINT [FK_AgendaReunion_Usuario] FOREIGN KEY([ResponsableId])
REFERENCES [dbo].[Usuario] ([Id])
GO
ALTER TABLE [dbo].[AgendaReunion] CHECK CONSTRAINT [FK_AgendaReunion_Usuario]
GO
ALTER TABLE [dbo].[Audits]  WITH CHECK ADD  CONSTRAINT [FK_Audits_Usuario_Id] FOREIGN KEY([UserId])
REFERENCES [dbo].[Usuario] ([Id])
GO
ALTER TABLE [dbo].[Audits] CHECK CONSTRAINT [FK_Audits_Usuario_Id]
GO
ALTER TABLE [dbo].[Comite]  WITH CHECK ADD  CONSTRAINT [FK_Comite_Direccion] FOREIGN KEY([DireccionId])
REFERENCES [dbo].[Direccion] ([Id])
GO
ALTER TABLE [dbo].[Comite] CHECK CONSTRAINT [FK_Comite_Direccion]
GO
ALTER TABLE [dbo].[Comite]  WITH CHECK ADD  CONSTRAINT [FK_Comite_Empresa] FOREIGN KEY([EmpresaId])
REFERENCES [dbo].[Empresa] ([Id])
GO
ALTER TABLE [dbo].[Comite] CHECK CONSTRAINT [FK_Comite_Empresa]
GO
ALTER TABLE [dbo].[Comite]  WITH CHECK ADD  CONSTRAINT [FK_Comite_Pais] FOREIGN KEY([PaisId])
REFERENCES [dbo].[Pais] ([Id])
GO
ALTER TABLE [dbo].[Comite] CHECK CONSTRAINT [FK_Comite_Pais]
GO
ALTER TABLE [dbo].[ComiteDetalle]  WITH CHECK ADD  CONSTRAINT [FK_ComiteDetalle_Comite] FOREIGN KEY([ComiteId])
REFERENCES [dbo].[Comite] ([Id])
GO
ALTER TABLE [dbo].[ComiteDetalle] CHECK CONSTRAINT [FK_ComiteDetalle_Comite]
GO
ALTER TABLE [dbo].[Compromiso]  WITH CHECK ADD  CONSTRAINT [FK_Compromiso_Reunion] FOREIGN KEY([ReunionId])
REFERENCES [dbo].[Reunion] ([Id])
GO
ALTER TABLE [dbo].[Compromiso] CHECK CONSTRAINT [FK_Compromiso_Reunion]
GO
ALTER TABLE [dbo].[Compromiso]  WITH CHECK ADD  CONSTRAINT [FK_Compromiso_Usuario] FOREIGN KEY([ResponsableId])
REFERENCES [dbo].[Usuario] ([Id])
GO
ALTER TABLE [dbo].[Compromiso] CHECK CONSTRAINT [FK_Compromiso_Usuario]
GO
ALTER TABLE [dbo].[DesarrolloGeneralReunion]  WITH CHECK ADD  CONSTRAINT [FK__Desarroll__Reuni__618671AF] FOREIGN KEY([ReunionId])
REFERENCES [dbo].[Reunion] ([Id])
GO
ALTER TABLE [dbo].[DesarrolloGeneralReunion] CHECK CONSTRAINT [FK__Desarroll__Reuni__618671AF]
GO
ALTER TABLE [dbo].[DesarrolloGeneralReunion]  WITH CHECK ADD  CONSTRAINT [FK__Desarroll__Usuar__627A95E8] FOREIGN KEY([UsuarioId])
REFERENCES [dbo].[Usuario] ([Id])
GO
ALTER TABLE [dbo].[DesarrolloGeneralReunion] CHECK CONSTRAINT [FK__Desarroll__Usuar__627A95E8]
GO
ALTER TABLE [dbo].[DocumentoAgenda]  WITH CHECK ADD  CONSTRAINT [FK_DocumentoAgenda_AgendaReunion] FOREIGN KEY([AgendaReunionId])
REFERENCES [dbo].[AgendaReunion] ([Id])
GO
ALTER TABLE [dbo].[DocumentoAgenda] CHECK CONSTRAINT [FK_DocumentoAgenda_AgendaReunion]
GO
ALTER TABLE [dbo].[DocumentoComite]  WITH CHECK ADD  CONSTRAINT [FK_DocumentoComite_MiembroComite] FOREIGN KEY([ComiteId])
REFERENCES [dbo].[Comite] ([Id])
GO
ALTER TABLE [dbo].[DocumentoComite] CHECK CONSTRAINT [FK_DocumentoComite_MiembroComite]
GO
ALTER TABLE [dbo].[DocumentoReunion]  WITH CHECK ADD  CONSTRAINT [FK_Documento_Reunion] FOREIGN KEY([ReunionId])
REFERENCES [dbo].[Reunion] ([Id])
GO
ALTER TABLE [dbo].[DocumentoReunion] CHECK CONSTRAINT [FK_Documento_Reunion]
GO
ALTER TABLE [dbo].[Empresa]  WITH CHECK ADD  CONSTRAINT [FK_Empresa_Pais_Id] FOREIGN KEY([PaisId])
REFERENCES [dbo].[Pais] ([Id])
GO
ALTER TABLE [dbo].[Empresa] CHECK CONSTRAINT [FK_Empresa_Pais_Id]
GO
ALTER TABLE [dbo].[ForumMiembroReunion]  WITH CHECK ADD  CONSTRAINT [FK__ForumMiem__Autor__7EE1CA6C] FOREIGN KEY([AutorId])
REFERENCES [dbo].[Usuario] ([Id])
GO
ALTER TABLE [dbo].[ForumMiembroReunion] CHECK CONSTRAINT [FK__ForumMiem__Autor__7EE1CA6C]
GO
ALTER TABLE [dbo].[ForumMiembroReunion]  WITH CHECK ADD  CONSTRAINT [FK__ForumMiem__Miemb__7DEDA633] FOREIGN KEY([MiembroReunionId])
REFERENCES [dbo].[MiembroReunion] ([Id])
GO
ALTER TABLE [dbo].[ForumMiembroReunion] CHECK CONSTRAINT [FK__ForumMiem__Miemb__7DEDA633]
GO
ALTER TABLE [dbo].[HistorialCompromiso]  WITH CHECK ADD  CONSTRAINT [FK_Historial_Compromiso] FOREIGN KEY([CompromisoId])
REFERENCES [dbo].[Compromiso] ([Id])
GO
ALTER TABLE [dbo].[HistorialCompromiso] CHECK CONSTRAINT [FK_Historial_Compromiso]
GO
ALTER TABLE [dbo].[HistorialSubTarea]  WITH CHECK ADD  CONSTRAINT [FK_Historial_SubTarea] FOREIGN KEY([SubTareaId])
REFERENCES [dbo].[SubTarea] ([Id])
GO
ALTER TABLE [dbo].[HistorialSubTarea] CHECK CONSTRAINT [FK_Historial_SubTarea]
GO
ALTER TABLE [dbo].[HistoricoComite]  WITH CHECK ADD  CONSTRAINT [FK_HISTORICOCOMITE_COMITE] FOREIGN KEY([ComiteId])
REFERENCES [dbo].[Comite] ([Id])
GO
ALTER TABLE [dbo].[HistoricoComite] CHECK CONSTRAINT [FK_HISTORICOCOMITE_COMITE]
GO
ALTER TABLE [dbo].[LogSessionUser]  WITH CHECK ADD  CONSTRAINT [FK_LogSessionUser_Usuario_Id] FOREIGN KEY([UserId])
REFERENCES [dbo].[Usuario] ([Id])
GO
ALTER TABLE [dbo].[LogSessionUser] CHECK CONSTRAINT [FK_LogSessionUser_Usuario_Id]
GO
ALTER TABLE [dbo].[MaestroDetalle]  WITH CHECK ADD  CONSTRAINT [FK_MaestroDetalle_Maestro_Id] FOREIGN KEY([MaestroId])
REFERENCES [dbo].[Maestro] ([Id])
GO
ALTER TABLE [dbo].[MaestroDetalle] CHECK CONSTRAINT [FK_MaestroDetalle_Maestro_Id]
GO
ALTER TABLE [dbo].[MiembroComite]  WITH CHECK ADD  CONSTRAINT [FK__MiembroCo__Agreg__638EB5B2] FOREIGN KEY([AgregadoPor])
REFERENCES [dbo].[Usuario] ([Id])
GO
ALTER TABLE [dbo].[MiembroComite] CHECK CONSTRAINT [FK__MiembroCo__Agreg__638EB5B2]
GO
ALTER TABLE [dbo].[MiembroComite]  WITH CHECK ADD  CONSTRAINT [FK__MiembroCo__Aprob__6482D9EB] FOREIGN KEY([AprobadoPor])
REFERENCES [dbo].[Usuario] ([Id])
GO
ALTER TABLE [dbo].[MiembroComite] CHECK CONSTRAINT [FK__MiembroCo__Aprob__6482D9EB]
GO
ALTER TABLE [dbo].[MiembroComite]  WITH CHECK ADD  CONSTRAINT [FK_MiembroComite_CargoComite] FOREIGN KEY([CargoMiembroId])
REFERENCES [dbo].[CargoMiembro] ([Id])
GO
ALTER TABLE [dbo].[MiembroComite] CHECK CONSTRAINT [FK_MiembroComite_CargoComite]
GO
ALTER TABLE [dbo].[MiembroComite]  WITH CHECK ADD  CONSTRAINT [FK_MiembroComite_Comite] FOREIGN KEY([ComiteId])
REFERENCES [dbo].[Comite] ([Id])
GO
ALTER TABLE [dbo].[MiembroComite] CHECK CONSTRAINT [FK_MiembroComite_Comite]
GO
ALTER TABLE [dbo].[MiembroComite]  WITH CHECK ADD  CONSTRAINT [FK_MiembroComite_FacultadComite] FOREIGN KEY([FacultadMiembroId])
REFERENCES [dbo].[FacultadMiembro] ([Id])
GO
ALTER TABLE [dbo].[MiembroComite] CHECK CONSTRAINT [FK_MiembroComite_FacultadComite]
GO
ALTER TABLE [dbo].[MiembroComite]  WITH CHECK ADD  CONSTRAINT [FK_MiembroComite_TipoComiteComite] FOREIGN KEY([TipoMiembroComiteId])
REFERENCES [dbo].[TipoMiembroComite] ([Id])
GO
ALTER TABLE [dbo].[MiembroComite] CHECK CONSTRAINT [FK_MiembroComite_TipoComiteComite]
GO
ALTER TABLE [dbo].[MiembroComite]  WITH CHECK ADD  CONSTRAINT [FK_MiembroComite_Usuario] FOREIGN KEY([MiembroId])
REFERENCES [dbo].[Usuario] ([Id])
GO
ALTER TABLE [dbo].[MiembroComite] CHECK CONSTRAINT [FK_MiembroComite_Usuario]
GO
ALTER TABLE [dbo].[MiembroComite]  WITH CHECK ADD  CONSTRAINT [FK_MiembroComite_UsuarioSuplantado] FOREIGN KEY([MiembroSuplantadoId])
REFERENCES [dbo].[Usuario] ([Id])
GO
ALTER TABLE [dbo].[MiembroComite] CHECK CONSTRAINT [FK_MiembroComite_UsuarioSuplantado]
GO
ALTER TABLE [dbo].[MiembroReunion]  WITH CHECK ADD  CONSTRAINT [FK_MiembroReunion_CargoMiembro] FOREIGN KEY([CargoMiembroId])
REFERENCES [dbo].[CargoMiembro] ([Id])
GO
ALTER TABLE [dbo].[MiembroReunion] CHECK CONSTRAINT [FK_MiembroReunion_CargoMiembro]
GO
ALTER TABLE [dbo].[MiembroReunion]  WITH CHECK ADD  CONSTRAINT [FK_MiembroReunion_MiembroSuplantado] FOREIGN KEY([MiembroSuplantadoId])
REFERENCES [dbo].[Usuario] ([Id])
GO
ALTER TABLE [dbo].[MiembroReunion] CHECK CONSTRAINT [FK_MiembroReunion_MiembroSuplantado]
GO
ALTER TABLE [dbo].[MiembroReunion]  WITH CHECK ADD  CONSTRAINT [FK_MiembroReunion_Reunion] FOREIGN KEY([ReunionId])
REFERENCES [dbo].[Reunion] ([Id])
GO
ALTER TABLE [dbo].[MiembroReunion] CHECK CONSTRAINT [FK_MiembroReunion_Reunion]
GO
ALTER TABLE [dbo].[MiembroReunion]  WITH CHECK ADD  CONSTRAINT [FK_MiembroReunion_TipoMiembroComite] FOREIGN KEY([TipoMiembroId])
REFERENCES [dbo].[TipoMiembroComite] ([Id])
GO
ALTER TABLE [dbo].[MiembroReunion] CHECK CONSTRAINT [FK_MiembroReunion_TipoMiembroComite]
GO
ALTER TABLE [dbo].[MiembroReunion]  WITH CHECK ADD  CONSTRAINT [FK_MiembroReunion_Usuario] FOREIGN KEY([MiembroId])
REFERENCES [dbo].[Usuario] ([Id])
GO
ALTER TABLE [dbo].[MiembroReunion] CHECK CONSTRAINT [FK_MiembroReunion_Usuario]
GO
ALTER TABLE [dbo].[MiembroReunion]  WITH CHECK ADD  CONSTRAINT [FK_MiembroReunion_UsuarioAgrego] FOREIGN KEY([AgregadoPor])
REFERENCES [dbo].[Usuario] ([Id])
GO
ALTER TABLE [dbo].[MiembroReunion] CHECK CONSTRAINT [FK_MiembroReunion_UsuarioAgrego]
GO
ALTER TABLE [dbo].[MiembroReunion]  WITH CHECK ADD  CONSTRAINT [FK_MiembroReunion_UsuarioAprobador] FOREIGN KEY([AprobadoPor])
REFERENCES [dbo].[Usuario] ([Id])
GO
ALTER TABLE [dbo].[MiembroReunion] CHECK CONSTRAINT [FK_MiembroReunion_UsuarioAprobador]
GO
ALTER TABLE [dbo].[MiembroReunion]  WITH CHECK ADD  CONSTRAINT [FK_MiembroReunion_UsuarioMarcoAsistencia] FOREIGN KEY([UsuarioMarcoAsistenciaId])
REFERENCES [dbo].[Usuario] ([Id])
GO
ALTER TABLE [dbo].[MiembroReunion] CHECK CONSTRAINT [FK_MiembroReunion_UsuarioMarcoAsistencia]
GO
ALTER TABLE [dbo].[Notificacion]  WITH CHECK ADD  CONSTRAINT [FK__Notificac__Miemb__1E256B9B] FOREIGN KEY([MiembroReunionId])
REFERENCES [dbo].[MiembroReunion] ([Id])
GO
ALTER TABLE [dbo].[Notificacion] CHECK CONSTRAINT [FK__Notificac__Miemb__1E256B9B]
GO
ALTER TABLE [dbo].[Notificacion]  WITH CHECK ADD  CONSTRAINT [FK__Notificac__Miemb__COMITE] FOREIGN KEY([MiembroComiteId])
REFERENCES [dbo].[MiembroComite] ([Id])
GO
ALTER TABLE [dbo].[Notificacion] CHECK CONSTRAINT [FK__Notificac__Miemb__COMITE]
GO
ALTER TABLE [dbo].[Notificacion]  WITH CHECK ADD  CONSTRAINT [FK__Notificac__Usuar__611C5D5B] FOREIGN KEY([UsuarioEmisorId])
REFERENCES [dbo].[Usuario] ([Id])
GO
ALTER TABLE [dbo].[Notificacion] CHECK CONSTRAINT [FK__Notificac__Usuar__611C5D5B]
GO
ALTER TABLE [dbo].[Notificacion]  WITH CHECK ADD  CONSTRAINT [FK__Notificac__Usuar__62108194] FOREIGN KEY([UsuarioReceptorId])
REFERENCES [dbo].[Usuario] ([Id])
GO
ALTER TABLE [dbo].[Notificacion] CHECK CONSTRAINT [FK__Notificac__Usuar__62108194]
GO
ALTER TABLE [dbo].[PermisoDocumentoComite]  WITH CHECK ADD  CONSTRAINT [FK_PermisoDocumentoComite_DocumentoComite] FOREIGN KEY([DocumentoComiteId])
REFERENCES [dbo].[DocumentoComite] ([Id])
GO
ALTER TABLE [dbo].[PermisoDocumentoComite] CHECK CONSTRAINT [FK_PermisoDocumentoComite_DocumentoComite]
GO
ALTER TABLE [dbo].[PermisoDocumentoComite]  WITH CHECK ADD  CONSTRAINT [FK_PermisoDocumentoComite_MiembroComite] FOREIGN KEY([MiembroComiteId])
REFERENCES [dbo].[MiembroComite] ([Id])
GO
ALTER TABLE [dbo].[PermisoDocumentoComite] CHECK CONSTRAINT [FK_PermisoDocumentoComite_MiembroComite]
GO
ALTER TABLE [dbo].[PermisoDocumentoReunion]  WITH CHECK ADD  CONSTRAINT [FK__PermisoDo__Docum__68336F3E] FOREIGN KEY([DocumentoReunionId])
REFERENCES [dbo].[DocumentoReunion] ([Id])
GO
ALTER TABLE [dbo].[PermisoDocumentoReunion] CHECK CONSTRAINT [FK__PermisoDo__Docum__68336F3E]
GO
ALTER TABLE [dbo].[PermisoDocumentoReunion]  WITH CHECK ADD  CONSTRAINT [FK__PermisoDo__Miemb__69279377] FOREIGN KEY([MiembroReunionId])
REFERENCES [dbo].[MiembroReunion] ([Id])
GO
ALTER TABLE [dbo].[PermisoDocumentoReunion] CHECK CONSTRAINT [FK__PermisoDo__Miemb__69279377]
GO
ALTER TABLE [dbo].[Persona]  WITH CHECK ADD  CONSTRAINT [FK_Persona_Empresa_Id] FOREIGN KEY([EmpresaId])
REFERENCES [dbo].[Empresa] ([Id])
GO
ALTER TABLE [dbo].[Persona] CHECK CONSTRAINT [FK_Persona_Empresa_Id]
GO
ALTER TABLE [dbo].[Reunion]  WITH CHECK ADD  CONSTRAINT [FK_Reunion_Comite] FOREIGN KEY([ComiteId])
REFERENCES [dbo].[Comite] ([Id])
GO
ALTER TABLE [dbo].[Reunion] CHECK CONSTRAINT [FK_Reunion_Comite]
GO
ALTER TABLE [dbo].[RolUsuario]  WITH CHECK ADD  CONSTRAINT [FK_RolUsuario_Rol_Id] FOREIGN KEY([RolId])
REFERENCES [dbo].[Rol] ([Id])
GO
ALTER TABLE [dbo].[RolUsuario] CHECK CONSTRAINT [FK_RolUsuario_Rol_Id]
GO
ALTER TABLE [dbo].[RolUsuario]  WITH CHECK ADD  CONSTRAINT [FK_RolUsuario_Usuario_Id] FOREIGN KEY([UsuarioId])
REFERENCES [dbo].[Usuario] ([Id])
GO
ALTER TABLE [dbo].[RolUsuario] CHECK CONSTRAINT [FK_RolUsuario_Usuario_Id]
GO
ALTER TABLE [dbo].[SubTarea]  WITH CHECK ADD  CONSTRAINT [FK_SubTarea_Reunion] FOREIGN KEY([CompromisoId])
REFERENCES [dbo].[Compromiso] ([Id])
GO
ALTER TABLE [dbo].[SubTarea] CHECK CONSTRAINT [FK_SubTarea_Reunion]
GO
ALTER TABLE [dbo].[SubTarea]  WITH CHECK ADD  CONSTRAINT [FK_SubTarea_Usuario] FOREIGN KEY([ResponsableId])
REFERENCES [dbo].[Usuario] ([Id])
GO
ALTER TABLE [dbo].[SubTarea] CHECK CONSTRAINT [FK_SubTarea_Usuario]
GO
ALTER TABLE [dbo].[Usuario]  WITH CHECK ADD  CONSTRAINT [FK_Usuario_Persona_Id] FOREIGN KEY([PersonaId])
REFERENCES [dbo].[Persona] ([Id])
GO
ALTER TABLE [dbo].[Usuario] CHECK CONSTRAINT [FK_Usuario_Persona_Id]
GO
ALTER TABLE [dbo].[VideoReunion]  WITH CHECK ADD  CONSTRAINT [FK_Video_Reunion] FOREIGN KEY([ReunionId])
REFERENCES [dbo].[Reunion] ([Id])
GO
ALTER TABLE [dbo].[VideoReunion] CHECK CONSTRAINT [FK_Video_Reunion]
GO
ALTER TABLE [dbo].[VotacionMiembroReunion]  WITH CHECK ADD  CONSTRAINT [FK_VotacionMiembroReunion_MiembroReunion] FOREIGN KEY([MiembroId])
REFERENCES [dbo].[MiembroReunion] ([Id])
GO
ALTER TABLE [dbo].[VotacionMiembroReunion] CHECK CONSTRAINT [FK_VotacionMiembroReunion_MiembroReunion]
GO
ALTER TABLE [dbo].[VotacionMiembroReunion]  WITH CHECK ADD  CONSTRAINT [FK_VotacionMiembroReunion_VotacionReunion] FOREIGN KEY([VotacionReunionId])
REFERENCES [dbo].[VotacionReunion] ([Id])
GO
ALTER TABLE [dbo].[VotacionMiembroReunion] CHECK CONSTRAINT [FK_VotacionMiembroReunion_VotacionReunion]
GO
ALTER TABLE [dbo].[VotacionReunion]  WITH CHECK ADD  CONSTRAINT [FK_Votacion_Reunion] FOREIGN KEY([ReunionId])
REFERENCES [dbo].[Reunion] ([Id])
GO
ALTER TABLE [dbo].[VotacionReunion] CHECK CONSTRAINT [FK_Votacion_Reunion]
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'1:Informacion Basica, 2:Detalle Comite,3:Miembro Comite,4:Documentos Comite ' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Comite', @level2type=N'COLUMN',@level2name=N'PasoConfiguracion'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Inndica a que comite pertenece esos documentos' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'DocumentoComite', @level2type=N'COLUMN',@level2name=N'ComiteId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Indica el tipo de archivo q se carga, ejemplo "1: documentos de constitucion"' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'DocumentoComite', @level2type=N'COLUMN',@level2name=N'TipoArchivoId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Identificador Unico del archivo' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'DocumentoComite', @level2type=N'COLUMN',@level2name=N'GuidNombre'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Código de notificación electrónica, generado por plataforma PEGASUS' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'DocumentoReunion', @level2type=N'COLUMN',@level2name=N'CodigoNotificacion'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'carga ' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'MiembroComite', @level2type=N'COLUMN',@level2name=N'FacultadMiembroId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'id del miembro a quien esta sustituyendo' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'MiembroReunion', @level2type=N'COLUMN',@level2name=N'MiembroSuplantadoId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Columnas para indicar el estado de aceptacion a una reunion , "Pendiente", "Confirmado"' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'MiembroReunion', @level2type=N'COLUMN',@level2name=N'EstadoConfirmacion'
GO
