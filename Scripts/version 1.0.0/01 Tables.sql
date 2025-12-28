/****** Object:  Table [dbo].[ACCESODATOS]    Script Date: 12/19/2020 6:53:34 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[ACCESODATOS]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[ACCESODATOS](
	[Cod_Usuario] [smallint] NOT NULL,
	[Cod_Entidad] [char](1) NOT NULL,
	[Cod_Detalle] [smallint] NOT NULL,
	[AutoNum] [numeric](18, 0) IDENTITY(1,1) NOT NULL,
 CONSTRAINT [PK_ACCESODATOS] PRIMARY KEY CLUSTERED 
(
	[AutoNum] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[ACUMULADOS]    Script Date: 12/19/2020 6:53:34 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[ACUMULADOS]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[ACUMULADOS](
	[Cod_Empleado] [smallint] NOT NULL,
	[Cod_Concepto] [smallint] NOT NULL,
	[SaldoInicial] [float] NULL,
	[AcumAnoVigente] [float] NULL,
	[AcumTotConcepto] [float] NOT NULL,
	[AcumDiasAnoVigente] [int] NOT NULL,
	[AcumTotDias] [int] NULL,
	[Cod_Ccosto] [smallint] NOT NULL,
	[Cod_Depto] [smallint] NOT NULL,
	[Cod_Sucursal] [smallint] NOT NULL,
	[Cod_Sub_Concepto] [smallint] NOT NULL
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[AFP]    Script Date: 12/19/2020 6:53:34 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[AFP]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[AFP](
	[Cod_Afp] [smallint] NOT NULL,
	[Nom_Afp] [char](30) NOT NULL,
	[Nit_Afp] [char](9) NULL,
	[Digito_Verificacion] [char](1) NULL,
	[Dir_Afp] [char](40) NOT NULL,
	[Tel1_Afp] [char](10) NOT NULL,
	[Tel2_Afp] [char](10) NOT NULL,
	[Fax_Afp] [char](10) NOT NULL,
	[Contacto_Afp] [char](30) NOT NULL,
	[Tot_Afiliados] [int] NOT NULL,
	[Cod_Super] [char](6) NULL,
	[Porc_Pension] [real] NULL,
	[Porc_Fondo] [real] NOT NULL,
	[Porc_Comision] [real] NOT NULL,
	[Tope_Seguro] [float] NOT NULL,
	[Porc_Seguro] [real] NOT NULL,
 CONSTRAINT [PK_AFP] PRIMARY KEY CLUSTERED 
(
	[Cod_Afp] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY],
 CONSTRAINT [IX_AFP] UNIQUE NONCLUSTERED 
(
	[Nom_Afp] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[Analisis]    Script Date: 12/19/2020 6:53:34 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Analisis]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Analisis](
	[Cod_Concepto] [smallint] NOT NULL,
	[Cod_Empleado] [smallint] NOT NULL,
	[Empleado] [char](45) NOT NULL,
	[Cedula] [char](12) NOT NULL,
	[Nom_Concepto] [char](100) NULL
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[ApplicationGroup]    Script Date: 12/19/2020 6:53:34 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[ApplicationGroup]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[ApplicationGroup](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](max) NOT NULL,
 CONSTRAINT [PK_dbo.ApplicationGroup] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[ApplicationRoleGroups]    Script Date: 12/19/2020 6:53:34 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[ApplicationRoleGroups]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[ApplicationRoleGroups](
	[RoleId] [nvarchar](128) NOT NULL,
	[GroupId] [int] NOT NULL,
 CONSTRAINT [PK_dbo.ApplicationRoleGroups] PRIMARY KEY CLUSTERED 
(
	[RoleId] ASC,
	[GroupId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[ApplicationUserGroups]    Script Date: 12/19/2020 6:53:34 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[ApplicationUserGroups]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[ApplicationUserGroups](
	[UserId] [nvarchar](128) NOT NULL,
	[GroupId] [int] NOT NULL,
 CONSTRAINT [PK_dbo.ApplicationUserGroups] PRIMARY KEY CLUSTERED 
(
	[UserId] ASC,
	[GroupId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[APROBACIONES]    Script Date: 12/19/2020 6:53:34 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[APROBACIONES]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[APROBACIONES](
	[Id_Aprobacion] [int] IDENTITY(1,1) NOT NULL,
	[Id_Solicitud] [int] NOT NULL,
	[Id_Aprobador] [int] NOT NULL,
	[Observaciones] [varchar](max) NOT NULL,
	[Fecha_Aprobado] [char](8) NOT NULL,
	[Depto_Sol] [smallint] NOT NULL,
	[Nivel] [int] NOT NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[APROBADORES]    Script Date: 12/19/2020 6:53:34 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[APROBADORES]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[APROBADORES](
	[Cod_Aprobador] [int] IDENTITY(1,1) NOT NULL,
	[Cod_Empleado] [smallint] NULL,
	[Filtro] [varchar](1) NULL,
	[Cod_Filtro] [smallint] NULL,
	[Tipo_Aprobacion] [varchar](1) NULL,
	[Estado] [varchar](1) NULL,
	[Nivel] [varchar](1) NULL,
	[Sub_Nivel] [varchar](2) NULL
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[ARP]    Script Date: 12/19/2020 6:53:34 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[ARP]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[ARP](
	[Cod_Arp] [smallint] NOT NULL,
	[Nom_Arp] [char](30) NOT NULL,
	[Nit_Arp] [char](9) NULL,
	[Digito_Verificacion] [char](1) NULL,
	[Dir_Arp] [char](40) NOT NULL,
	[Tel1_Arp] [char](10) NOT NULL,
	[Tel2_Arp] [char](10) NOT NULL,
	[Fax_Arp] [char](10) NOT NULL,
	[Contacto_Arp] [char](30) NOT NULL,
	[Tot_Afiliados] [int] NOT NULL,
	[Cod_Super] [char](6) NULL,
 CONSTRAINT [PK_ARP] PRIMARY KEY CLUSTERED 
(
	[Cod_Arp] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY],
 CONSTRAINT [IX_ARP] UNIQUE NONCLUSTERED 
(
	[Nom_Arp] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[AspNetRoles]    Script Date: 12/19/2020 6:53:34 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[AspNetRoles]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[AspNetRoles](
	[Id] [nvarchar](128) NOT NULL,
	[Name] [nvarchar](max) NULL,
	[Description] [nvarchar](max) NULL,
	[Discriminator] [nvarchar](128) NOT NULL,
 CONSTRAINT [PK_dbo.AspNetRoles] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[AspNetUserLogins]    Script Date: 12/19/2020 6:53:34 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[AspNetUserLogins]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[AspNetUserLogins](
	[UserId] [nvarchar](128) NOT NULL,
	[LoginProvider] [nvarchar](128) NOT NULL,
	[ProviderKey] [nvarchar](128) NOT NULL,
	[IdentityUser_Id] [nvarchar](128) NULL,
 CONSTRAINT [PK_dbo.AspNetUserLogins] PRIMARY KEY CLUSTERED 
(
	[UserId] ASC,
	[LoginProvider] ASC,
	[ProviderKey] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[AspNetUserRoles]    Script Date: 12/19/2020 6:53:34 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[AspNetUserRoles]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[AspNetUserRoles](
	[UserId] [nvarchar](128) NOT NULL,
	[RoleId] [nvarchar](128) NOT NULL,
	[IdentityRole_Id] [nvarchar](128) NULL,
	[IdentityUser_Id] [nvarchar](128) NULL,
 CONSTRAINT [PK_dbo.AspNetUserRoles] PRIMARY KEY CLUSTERED 
(
	[UserId] ASC,
	[RoleId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[AspNetUsers]    Script Date: 12/19/2020 6:53:34 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[AspNetUsers]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[AspNetUsers](
	[Id] [nvarchar](128) NOT NULL,
	[Email] [nvarchar](max) NULL,
	[EmailConfirmed] [bit] NOT NULL,
	[PasswordHash] [nvarchar](max) NULL,
	[SecurityStamp] [nvarchar](max) NULL,
	[PhoneNumber] [nvarchar](max) NULL,
	[PhoneNumberConfirmed] [bit] NOT NULL,
	[TwoFactorEnabled] [bit] NOT NULL,
	[LockoutEndDateUtc] [datetime] NULL,
	[LockoutEnabled] [bit] NOT NULL,
	[AccessFailedCount] [int] NOT NULL,
	[UserName] [nvarchar](max) NULL,
	[Empleado] [nvarchar](max) NULL,
	[DBName] [nvarchar](max) NULL,
	[Discriminator] [nvarchar](128) NOT NULL,
 CONSTRAINT [PK_dbo.AspNetUsers] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[AUDITORIA]    Script Date: 12/19/2020 6:53:34 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[AUDITORIA]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[AUDITORIA](
	[Cod_Usuario] [smallint] NOT NULL,
	[Fec_Transaccion] [char](8) NOT NULL,
	[Hora_Transaccion] [char](8) NOT NULL,
	[Tabla] [char](30) NULL,
	[Accion] [char](1) NOT NULL,
	[Descripcion] [text] NOT NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[AUDITORIA_FUENTE]    Script Date: 12/19/2020 6:53:34 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[AUDITORIA_FUENTE]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[AUDITORIA_FUENTE](
	[Autonum] [int] IDENTITY(1,1) NOT NULL,
	[Cod_Fuente] [varchar](1) NOT NULL,
	[Cod_Usuario_Fuente] [int] NOT NULL,
	[Fec_Transaccion] [datetime] NOT NULL,
	[Tabla] [varchar](25) NOT NULL,
	[Accion] [char](1) NOT NULL,
	[A] [smallint] NOT NULL,
	[B] [varchar](100) NOT NULL,
	[C] [varchar](100) NOT NULL,
	[Descripcion] [text] NOT NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[BANCOS]    Script Date: 12/19/2020 6:53:34 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[BANCOS]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[BANCOS](
	[Cod_Banco] [smallint] NOT NULL,
	[Banco] [char](25) NOT NULL,
	[Cta_Bancaria] [char](20) NULL,
	[Ult_Cheque] [char](8) NOT NULL,
	[Ult_PagoElectronico] [char](8) NULL,
	[Cta_Contable] [char](20) NULL,
	[Contacto] [char](25) NOT NULL,
	[Telefono] [char](7) NOT NULL,
	[Tipo_Banco] [char](1) NULL,
	[Cod_Alterno] [char](15) NULL,
	[Tipo_Cta] [char](1) NULL,
	[Ult_PagoTarjeta] [char](8) NOT NULL,
	[Tipo_Cta_Index] [char](1) NOT NULL,
	[Cta_Bancaria_Index] [char](20) NULL,
	[Cta_PorPagar] [char](20) NULL,
	[Nit_Banco] [char](9) NOT NULL,
	[Digito_Verificacion] [char](1) NOT NULL,
	[Cod_Alterno_Bancolombia] [char](7) NOT NULL,
 CONSTRAINT [PK_BANCOS] PRIMARY KEY CLUSTERED 
(
	[Cod_Banco] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[BARRIOS]    Script Date: 12/19/2020 6:53:34 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[BARRIOS]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[BARRIOS](
	[Cod_Barrio] [smallint] NOT NULL,
	[Nom_Barrio] [char](30) NOT NULL,
	[Cod_Ciudad] [smallint] NOT NULL
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[CAJASCOMP]    Script Date: 12/19/2020 6:53:34 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[CAJASCOMP]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[CAJASCOMP](
	[Codigo] [smallint] NOT NULL,
	[Nom_Caja] [char](40) NULL,
	[Contacto] [char](30) NULL,
	[Direccion] [char](30) NULL,
	[TotAfiliados] [real] NULL,
	[Tel1] [char](10) NULL,
	[Tel2] [char](10) NULL,
	[Fax] [char](10) NULL,
	[Nit_CajaComp] [char](10) NOT NULL,
	[Dig_Verificacion] [char](1) NOT NULL,
	[Cod_Super] [char](6) NOT NULL,
	[Nit_CajaCompensacion] [char](10) NOT NULL,
 CONSTRAINT [PK_CAJASCOMP] PRIMARY KEY CLUSTERED 
(
	[Codigo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[CANDIDATOS]    Script Date: 12/19/2020 6:53:34 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[CANDIDATOS]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[CANDIDATOS](
	[Cod_Candidato] [smallint] NOT NULL,
	[Cod_Requerimiento] [smallint] NOT NULL,
	[Fec_Cita] [char](8) NOT NULL,
	[Hora_Cita] [char](10) NOT NULL,
	[Fecha_Llegada] [char](8) NOT NULL,
	[Hora_Llegada] [char](10) NOT NULL,
	[Cantidad_Entrevistas] [smallint] NOT NULL,
	[Calificacion1] [smallint] NOT NULL,
	[Calificacion2] [smallint] NOT NULL,
	[Comentario] [text] NOT NULL,
	[Fecha_Aprobacion] [char](8) NOT NULL,
	[Cod_Usuario] [smallint] NOT NULL,
	[Estado] [char](1) NOT NULL,
	[Beneficios] [float] NOT NULL,
	[Salario] [float] NOT NULL,
	[Dias_Contrato] [smallint] NOT NULL,
	[Tipo_Contrato] [char](1) NOT NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[CAPACITACIONSALUDOCUPACIONAL]    Script Date: 12/19/2020 6:53:34 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[CAPACITACIONSALUDOCUPACIONAL]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[CAPACITACIONSALUDOCUPACIONAL](
	[Cod_Curso] [smallint] NOT NULL,
	[Nom_Curso] [char](50) NOT NULL,
	[Cod_Empleado] [smallint] NOT NULL,
	[Fec_Curso] [char](8) NOT NULL,
	[Comentario] [text] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Cod_Curso] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[CAPACITADORES]    Script Date: 12/19/2020 6:53:34 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[CAPACITADORES]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[CAPACITADORES](
	[Cod_Capacitador] [smallint] NOT NULL,
	[Nom_Capacitador] [char](30) NOT NULL,
	[Nit_Capacitador] [char](9) NOT NULL,
	[Digito_Verificacion] [char](1) NOT NULL,
	[Dir_Capacitador] [char](40) NOT NULL,
	[Tel1_Capacitador] [char](10) NOT NULL,
	[Tel2_Capacitador] [char](10) NOT NULL,
	[Fax_Capacitador] [char](10) NOT NULL,
	[Contacto_Capacitador] [char](30) NOT NULL,
	[Total_Cursos] [smallint] NOT NULL,
	[Calificacion] [smallint] NOT NULL,
	[Comentario] [text] NOT NULL,
	[Fec_Ingreso] [char](8) NOT NULL,
	[Estado] [char](1) NOT NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[CARGOS]    Script Date: 12/19/2020 6:53:34 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[CARGOS]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[CARGOS](
	[Cod_Cargo] [smallint] NOT NULL,
	[Nom_Cargo] [char](100) NULL,
	[Sue_Disponible] [float] NOT NULL,
	[Cod_Alterno] [smallint] NOT NULL,
	[Objetivo] [text] NOT NULL,
	[Funciones] [text] NOT NULL,
	[Perfil] [text] NOT NULL,
	[AutorizaSalarios] [char](1) NOT NULL,
	[RecibeMail] [char](1) NOT NULL,
	[TieneJefe] [char](1) NOT NULL,
	[Cod_CargoJefe] [smallint] NOT NULL,
	[Firma_Doc] [bit] NOT NULL,
	[Firma_Digital] [varbinary](max) NULL,
	[Docu_Firma] [varchar](50) NOT NULL,
	[Cod_Oficio] [char](4) NOT NULL,
	[Art209] [char](1) NOT NULL,
 CONSTRAINT [PK_CARGOS] PRIMARY KEY CLUSTERED 
(
	[Cod_Cargo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY],
 CONSTRAINT [IX_CARGOS] UNIQUE NONCLUSTERED 
(
	[Nom_Cargo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[CAUSALESRETIRO]    Script Date: 12/19/2020 6:53:34 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[CAUSALESRETIRO]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[CAUSALESRETIRO](
	[Codigo] [smallint] NULL,
	[Descripcion] [char](50) NULL
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[CCOSTOS]    Script Date: 12/19/2020 6:53:34 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[CCOSTOS]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[CCOSTOS](
	[Cod_Ccosto] [smallint] NOT NULL,
	[Nom_Ccosto] [char](200) NULL,
	[Ccosto_Sec] [char](10) NULL,
	[Ppto_SAP] [char](6) NOT NULL,
	[PMP] [char](12) NOT NULL,
	[ProfitCenter] [char](10) NOT NULL,
	[Sucursal] [char](1) NOT NULL,
 CONSTRAINT [PK_CCOSTOS] PRIMARY KEY CLUSTERED 
(
	[Cod_Ccosto] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY],
 CONSTRAINT [IX_CCOSTOS] UNIQUE NONCLUSTERED 
(
	[Nom_Ccosto] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[CESANTIAS]    Script Date: 12/19/2020 6:53:34 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[CESANTIAS]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[CESANTIAS](
	[Cod_Empleado] [smallint] NOT NULL,
	[Periodo] [char](2) NOT NULL,
	[Desde] [char](8) NOT NULL,
	[Hasta] [char](8) NOT NULL,
	[Dias_Base_Acumulados] [int] NULL,
	[Salario_Base_Acumulado] [float] NULL,
	[Valor] [float] NOT NULL,
	[Fec_Aprobado] [char](8) NOT NULL,
	[Fec_Desaprobado] [char](8) NOT NULL,
	[Estado] [char](1) NOT NULL,
	[Fec_Liquidacion] [char](8) NOT NULL,
	[Resolucion] [char](10) NOT NULL,
	[Fec_Resolucion] [char](8) NOT NULL,
	[Regimen] [char](1) NULL,
	[Tipo_Registro] [char](1) NULL,
	[Fec_Ing_Novedad] [char](8) NULL,
	[Valor_Consignado] [float] NOT NULL,
	[Cod_Usuario] [smallint] NOT NULL
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[CIUDADES]    Script Date: 12/19/2020 6:53:34 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[CIUDADES]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[CIUDADES](
	[Codigo] [smallint] NOT NULL,
	[Codigo_Departamento] [char](2) NOT NULL,
	[Codigo_Dane] [char](8) NOT NULL,
	[Nom_Ciudad] [char](15) NOT NULL,
 CONSTRAINT [PK_CIUDADES] PRIMARY KEY CLUSTERED 
(
	[Codigo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[CODOBS]    Script Date: 12/19/2020 6:53:34 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[CODOBS]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[CODOBS](
	[Cod] [char](2) NOT NULL,
	[Des] [char](20) NOT NULL,
	[cod] [char](2) NOT NULL
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[COLUMNASTEMP]    Script Date: 12/19/2020 6:53:34 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[COLUMNASTEMP]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[COLUMNASTEMP](
	[Devengo] [char](1) NOT NULL,
	[Cod_Concepto] [smallint] NULL,
	[Nom_Concepto] [char](30) NOT NULL
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[COMISIONES]    Script Date: 12/19/2020 6:53:34 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[COMISIONES]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[COMISIONES](
	[Nom_Rango] [varchar](50) NOT NULL,
	[Por_Cumplimiento] [decimal](10, 2) NOT NULL,
	[Por_Comision] [decimal](10, 2) NOT NULL,
	[Total_Compensacion] [decimal](10, 2) NOT NULL
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[COMITEPARITARIO]    Script Date: 12/19/2020 6:53:34 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[COMITEPARITARIO]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[COMITEPARITARIO](
	[Cod_Miembro] [smallint] NOT NULL,
	[Miembro] [char](30) NOT NULL,
	[Cod_Representante] [char](1) NOT NULL,
	[Email] [char](30) NOT NULL,
	[Dir] [char](45) NOT NULL,
	[Tel1] [char](10) NOT NULL,
	[Tel2] [char](10) NOT NULL,
	[Periodo_Inicio] [char](8) NOT NULL,
	[Periodo_Fin] [char](8) NOT NULL,
	[Estado] [char](1) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Cod_Miembro] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[COMPETENCIAS]    Script Date: 12/19/2020 6:53:34 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[COMPETENCIAS]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[COMPETENCIAS](
	[Cod_Competencia] [smallint] NOT NULL,
	[Nom_Competencia] [char](30) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Cod_Competencia] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[COMPETENCIASHOJAVIDA]    Script Date: 12/19/2020 6:53:34 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[COMPETENCIASHOJAVIDA]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[COMPETENCIASHOJAVIDA](
	[Cod_HojaVida] [smallint] NOT NULL,
	[Cod_Competencia] [smallint] NOT NULL
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[CONCEPTOS]    Script Date: 12/19/2020 6:53:34 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[CONCEPTOS]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[CONCEPTOS](
	[Cod_Concepto] [smallint] NOT NULL,
	[Nom_Concepto] [char](100) NULL,
	[Devengo] [char](1) NOT NULL,
	[BSCesantias] [char](1) NOT NULL,
	[BSIntCesantia] [char](1) NOT NULL,
	[BSPension] [char](1) NOT NULL,
	[BSPrima] [char](1) NOT NULL,
	[BSRetefuente] [char](1) NOT NULL,
	[BSSalud] [char](1) NOT NULL,
	[BSVacaciones] [char](1) NOT NULL,
	[BSSueldo] [char](1) NOT NULL,
	[BSIncapacidad] [char](1) NOT NULL,
	[AfectaPres] [char](1) NOT NULL,
	[Tot_Concepto] [float] NOT NULL,
	[Cta] [char](10) NULL,
	[Tipo_Concepto] [char](1) NOT NULL,
	[Acumula] [char](1) NOT NULL,
	[Jornada] [char](1) NOT NULL,
	[BSAuxTransporte] [char](1) NULL,
	[BSIcbf] [char](1) NULL,
	[BSSena] [char](1) NULL,
	[BSCajaCompensacion] [char](1) NULL,
	[BSRiesgosProfesionales] [char](1) NULL,
	[BSPrimaVacaciones] [char](1) NULL,
	[Aplica_Quincena] [char](1) NOT NULL,
	[Estado] [char](1) NOT NULL,
	[BSBenSalario] [char](1) NOT NULL,
	[BSBonoRetefuente] [char](1) NOT NULL,
	[UReportes] [smallint] NOT NULL,
	[Cod_ConceptoRelacion] [smallint] NOT NULL,
	[BSVacacionesDinero] [char](1) NOT NULL,
	[BSAuxilioPromedio] [char](1) NOT NULL,
	[CertificadoIngresos] [char](2) NOT NULL,
	[BSTopeExonerado] [char](1) NOT NULL,
	[Por_Concepto] [float] NOT NULL,
	[DedSaludMesAct] [char](1) NOT NULL,
	[BSNoDescuentaDomingo] [char](1) NOT NULL,
	[BSTopeLey1393] [char](1) NOT NULL,
	[OtrosIngCertLab] [bit] NOT NULL,
	[BSBonoDesempeno] [char](1) NOT NULL,
	[BSSalarioIntegralAportes] [char](1) NOT NULL,
	[BSPrimaNavidad] [char](1) NOT NULL,
	[BSIngresoTotal] [char](1) NOT NULL,
	[Tipo_Bono] [char](1) NOT NULL,
	[BSIman] [char](1) NOT NULL,
	[BSPorcentaje] [char](1) NOT NULL,
	[BSPrestaciones] [varchar](1) NOT NULL,
	[BSGrossUP] [varchar](1) NOT NULL,
	[OrdenDevengo] [varchar](1) NOT NULL,
	[BSNoRenta] [varchar](1) NOT NULL,
 CONSTRAINT [PK_CONCEPTOS] PRIMARY KEY NONCLUSTERED 
(
	[Cod_Concepto] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[CONTINGENTETEMP]    Script Date: 12/19/2020 6:53:34 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[CONTINGENTETEMP]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[CONTINGENTETEMP](
	[Cedula] [char](12) NOT NULL,
	[Empleado] [char](200) NOT NULL,
	[Num_Cta] [char](20) NOT NULL,
	[Valor] [float] NOT NULL,
	[ValorAporte] [float] NOT NULL,
	[Nom_Concepto] [char](100) NOT NULL
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[CONTRATOANTERIOR]    Script Date: 12/19/2020 6:53:34 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[CONTRATOANTERIOR]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[CONTRATOANTERIOR](
	[Cedula_Emp] [char](12) NOT NULL,
	[Fec_Ingreso] [char](8) NOT NULL,
	[Fec_Retiro] [char](8) NOT NULL,
	[AutoNum] [numeric](18, 0) IDENTITY(1,1) NOT NULL
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[CONTROLCAMBIOENTIDAD]    Script Date: 12/19/2020 6:53:34 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[CONTROLCAMBIOENTIDAD]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[CONTROLCAMBIOENTIDAD](
	[Cod_Empleado] [smallint] NOT NULL,
	[Fec_Cambio] [char](8) NOT NULL,
	[Val_Anterior] [char](8) NOT NULL,
	[Val_Nuevo] [char](8) NOT NULL,
	[AutoNum] [numeric](18, 0) IDENTITY(1,1) NOT NULL,
	[Entidad] [char](1) NOT NULL
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[CONTROLDOCPROC]    Script Date: 12/19/2020 6:53:34 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[CONTROLDOCPROC]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[CONTROLDOCPROC](
	[Cod_Empleado] [smallint] NOT NULL,
	[Cod_Documento] [smallint] NOT NULL,
	[Chequeada] [char](1) NOT NULL
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[CONTROLTIEMPO]    Script Date: 12/19/2020 6:53:34 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[CONTROLTIEMPO]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[CONTROLTIEMPO](
	[Cod_Emp] [smallint] NULL,
	[Fecha_Labores] [char](8) NULL,
	[Hora_Labores] [char](15) NULL,
	[Cod_Observacion] [smallint] NULL,
	[Tipo] [char](1) NULL,
	[Tiempo] [smallint] NULL,
	[Estado] [char](1) NULL,
	[Fec_Nomina] [char](8) NULL,
	[Tiempo_Proyectado] [smallint] NOT NULL,
	[AutoNum] [numeric](18, 0) IDENTITY(1,1) NOT NULL
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[DEPARTAMENTOS]    Script Date: 12/19/2020 6:53:34 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DEPARTAMENTOS]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[DEPARTAMENTOS](
	[Codigo] [smallint] NOT NULL,
	[Codigo_Dane] [char](4) NOT NULL,
	[Nom_Depto] [char](15) NOT NULL,
 CONSTRAINT [PK_DEPARTAMENTOS] PRIMARY KEY CLUSTERED 
(
	[Codigo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[DEPTOS]    Script Date: 12/19/2020 6:53:34 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DEPTOS]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[DEPTOS](
	[Cod_Depto] [smallint] NOT NULL,
	[Nombre_Depto] [char](30) NOT NULL,
	[Num_Personas] [int] NOT NULL,
	[Jefe] [char](30) NOT NULL,
	[Cod_Alterno] [char](20) NOT NULL,
	[Cod_Secundario] [smallint] NOT NULL,
	[Turnos] [smallint] NOT NULL,
	[Numero_Alterno] [varchar](50) NOT NULL,
	[Cuenta_Unica] [smallint] NOT NULL,
 CONSTRAINT [PK_DEPTOS] PRIMARY KEY CLUSTERED 
(
	[Cod_Depto] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY],
 CONSTRAINT [IX_DEPTOS] UNIQUE NONCLUSTERED 
(
	[Nombre_Depto] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[DIAGNOSTICOS]    Script Date: 12/19/2020 6:53:34 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DIAGNOSTICOS]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[DIAGNOSTICOS](
	[Codigo] [smallint] NOT NULL,
	[Descripcion] [char](200) NULL,
	[Cod_Alterno] [char](20) NOT NULL,
 CONSTRAINT [PK_DIAGNOSTICOS] PRIMARY KEY CLUSTERED 
(
	[Codigo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[DIASTRABAJADOS]    Script Date: 12/19/2020 6:53:34 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DIASTRABAJADOS]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[DIASTRABAJADOS](
	[Fec_Nomina] [char](8) NOT NULL,
	[Cod_Empleado] [smallint] NOT NULL,
	[Dias_Trabajados] [smallint] NOT NULL,
	[Fec_Ing_Novedad] [char](8) NOT NULL,
	[Fec_Aprobado] [char](8) NOT NULL,
	[Fec_Desaprobado] [char](8) NOT NULL,
	[Cod_Usuario] [smallint] NOT NULL,
	[Estado] [char](1) NOT NULL,
	[Cod_Concepto] [smallint] NOT NULL,
	[AutoNum] [numeric](18, 0) IDENTITY(1,1) NOT NULL,
 CONSTRAINT [PK_DIASTRABAJADOS] PRIMARY KEY CLUSTERED 
(
	[Fec_Nomina] ASC,
	[Cod_Empleado] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[DIFERENCIASSAP]    Script Date: 12/19/2020 6:53:34 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DIFERENCIASSAP]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[DIFERENCIASSAP](
	[Fec_Archivo] [char](8) NOT NULL,
	[Tip_Documento] [char](2) NOT NULL,
	[Cod_Empresa_SAP] [char](4) NOT NULL,
	[Fec_Nomina] [char](8) NOT NULL,
	[Tip_Moneda] [char](3) NOT NULL,
	[Descripcion] [char](50) NOT NULL,
	[Naturaleza] [char](2) NOT NULL,
	[Cuenta_SAP] [char](10) NOT NULL,
	[Val_Novedad] [float] NOT NULL,
	[Cod_CCosto_SAP] [char](14) NOT NULL,
	[WBS_SAP] [char](12) NOT NULL,
	[Cod_Depto_SAP] [char](5) NOT NULL,
	[Descripcion_Reg] [char](60) NOT NULL,
	[Cod_Empleado] [smallint] NOT NULL,
	[Proceso_SAP] [char](1) NOT NULL
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[DISTRIBUCIONSALARIOS]    Script Date: 12/19/2020 6:53:34 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DISTRIBUCIONSALARIOS]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[DISTRIBUCIONSALARIOS](
	[Cod_Empleado] [smallint] NOT NULL,
	[Cod_Sucursal] [smallint] NOT NULL,
	[PorcDistribucion] [real] NOT NULL,
	[Tipo_Distribucion] [char](8) NULL
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[DOCUMENTOS]    Script Date: 12/19/2020 6:53:34 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DOCUMENTOS]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[DOCUMENTOS](
	[Cod_Documento] [smallint] NOT NULL,
	[Nom_Documento] [char](30) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Cod_Documento] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[EMPLEADOS]    Script Date: 12/19/2020 6:53:34 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[EMPLEADOS]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[EMPLEADOS](
	[Cod_Empleado] [smallint] NOT NULL,
	[Empleado] [char](45) NOT NULL,
	[PNombre] [char](15) NOT NULL,
	[SNombre] [char](15) NOT NULL,
	[PApellido] [char](15) NOT NULL,
	[SApellido] [char](15) NOT NULL,
	[Tip_Documento] [char](1) NOT NULL,
	[Cedula] [char](12) NOT NULL,
	[Seguro_Soc] [char](12) NOT NULL,
	[Fec_Nacimiento] [char](8) NOT NULL,
	[Est_Civil] [char](1) NOT NULL,
	[Sexo] [char](1) NOT NULL,
	[Direccion] [char](150) NOT NULL,
	[Estado] [char](1) NOT NULL,
	[Telefono] [char](25) NOT NULL,
	[Celular] [char](14) NOT NULL,
	[Lib_Militar] [char](12) NOT NULL,
	[Distrito] [char](3) NOT NULL,
	[Dir_Elec] [char](150) NOT NULL,
	[Cod_Profesion] [smallint] NOT NULL,
	[Tipo_Contrato] [char](1) NOT NULL,
	[Dias_Contrato] [smallint] NOT NULL,
	[Periodo_Prueba] [smallint] NOT NULL,
	[Tipo_Salario] [char](1) NOT NULL,
	[Horas_Acumuladas] [numeric](18, 0) NULL,
	[Fec_Ingreso] [char](8) NOT NULL,
	[Fec_Salario] [char](8) NOT NULL,
	[Salario] [float] NOT NULL,
	[MetodoRetefuente] [char](1) NOT NULL,
	[Val_Retefuente] [float] NOT NULL,
	[Por_Retefuente] [real] NOT NULL,
	[Tipo_Retefuente] [char](1) NOT NULL,
	[Deducible] [float] NOT NULL,
	[DedSaludEdu] [float] NOT NULL,
	[DedAFC] [float] NOT NULL,
	[DedAlimentacion] [float] NOT NULL,
	[Regimen] [char](1) NOT NULL,
	[Fec_Retiro] [char](8) NOT NULL,
	[Val_Liq_Contrato] [float] NOT NULL,
	[FormaPago] [char](1) NOT NULL,
	[Sabado] [char](1) NOT NULL,
	[Cod_Ciudad] [smallint] NOT NULL,
	[Cod_CajaCompensacion] [smallint] NOT NULL,
	[Clasificacion_Contable] [char](1) NOT NULL,
	[Tipo_Cta] [char](1) NOT NULL,
	[Num_Cta] [char](20) NOT NULL,
	[Banco] [char](15) NOT NULL,
	[Cod_Zona] [smallint] NOT NULL,
	[Cod_Sucursal] [smallint] NOT NULL,
	[Cod_Ccostos] [smallint] NOT NULL,
	[Cod_Depto] [smallint] NOT NULL,
	[Cod_Cargo] [smallint] NOT NULL,
	[Cod_Grupo] [smallint] NOT NULL,
	[Cod_Arp] [smallint] NOT NULL,
	[Cod_Eps] [smallint] NOT NULL,
	[Cod_Afp] [smallint] NOT NULL,
	[Cod_Afc] [smallint] NOT NULL,
	[Cod_Escala] [smallint] NOT NULL,
	[Cod_Tarifa_Plena] [smallint] NOT NULL,
	[Modo_Costo_Hora] [char](1) NOT NULL,
	[Cod_Empleador] [smallint] NOT NULL,
	[Aux_Transporte] [char](1) NOT NULL,
	[Cod_Pais_Nacimiento] [smallint] NOT NULL,
	[Cod_Pais_Nacionalidad] [smallint] NOT NULL,
	[Fec_Vence_Visa] [char](8) NOT NULL,
	[Porc_Anticipo] [real] NOT NULL,
	[Porc_Anticipo_Prima] [real] NOT NULL,
	[ModoSalario] [char](1) NOT NULL,
	[AnticipoPrima] [char](1) NOT NULL,
	[Cod_NvaEps] [smallint] NOT NULL,
	[Cod_NvaAfp] [smallint] NOT NULL,
	[Cod_NvaAfc] [smallint] NOT NULL,
	[Fec_CamEps] [char](8) NOT NULL,
	[Fec_CamAfp] [char](8) NOT NULL,
	[Fec_CamAfc] [char](8) NOT NULL,
	[Tiempo_C] [char](1) NOT NULL,
	[Clave] [char](10) NOT NULL,
	[Saldo_Base_Aporte] [float] NOT NULL,
	[Base_Aporte] [float] NOT NULL,
	[Saldo_Dias_Aporte] [smallint] NOT NULL,
	[Dias_Aporte] [smallint] NOT NULL,
	[No_Hijos] [smallint] NOT NULL,
	[LiqNomina] [smallint] NOT NULL,
	[Estudiante] [char](1) NOT NULL,
	[Practicante] [char](1) NOT NULL,
	[MedicinaPrepagada] [char](1) NOT NULL,
	[Telefono1] [char](12) NOT NULL,
	[Porc_Embargo] [real] NOT NULL,
	[Saldo_Ini_Horas] [float] NOT NULL,
	[DiasVacAno] [smallint] NOT NULL,
	[Cod_Causal_Retiro] [smallint] NOT NULL,
	[Cod_Lugar_Expedicion] [smallint] NOT NULL,
	[DiasVacPendientesDisfrute] [smallint] NOT NULL,
	[DiasSalud] [int] NOT NULL,
	[FecLimiteDeducible] [char](8) NOT NULL,
	[Fec_Cambio_Tipo_Salario] [char](8) NOT NULL,
	[GrupoSanguineo] [char](20) NOT NULL,
	[Cod_Colaborador] [char](20) NOT NULL,
	[Cod_Barrio] [smallint] NOT NULL,
	[Cod_Jefe] [smallint] NOT NULL,
	[Declarante] [char](1) NOT NULL,
	[VigenciaDependientes] [char](8) NOT NULL,
	[DiasVivienda] [smallint] NOT NULL,
	[DiasPrepagada] [smallint] NOT NULL,
	[DiasDependientes] [smallint] NOT NULL,
	[FecSubstitucionPatronal] [char](8) NOT NULL,
	[Cod_Alterno] [smallint] NOT NULL,
	[Cod_GrupoDif] [smallint] NOT NULL,
	[Tipo_Pension] [char](2) NOT NULL,
	[Tipo_Pensionado] [char](1) NOT NULL,
	[Pension_Compartida] [char](1) NOT NULL,
	[Cod_Agencia] [smallint] NOT NULL,
	[Regretted] [char](1) NOT NULL,
	[NoBeneficio558] [char](1) NOT NULL,
	[Regreted] [char](1) NOT NULL,
 CONSTRAINT [PK_EMPLEADOS] PRIMARY KEY CLUSTERED 
(
	[Cod_Empleado] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[EMPLEADOS_APROBA]    Script Date: 12/19/2020 6:53:34 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[EMPLEADOS_APROBA]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[EMPLEADOS_APROBA](
	[Id_Aprobador] [int] IDENTITY(1,1) NOT NULL,
	[Cod_Depto] [int] NOT NULL,
	[Cod_Aprob] [smallint] NOT NULL,
	[Nivel] [int] NOT NULL,
	[Modulo] [varchar](2) NOT NULL
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[EMPLEADOSTEMP]    Script Date: 12/19/2020 6:53:34 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[EMPLEADOSTEMP]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[EMPLEADOSTEMP](
	[Código] [smallint] NOT NULL,
	[Identificación] [char](12) NOT NULL,
	[Empleado] [char](45) NOT NULL,
	[Cargo] [char](100) NULL,
	[Fecha de Ingreso] [varchar](10) NULL,
	[Fecha de Nacimiento] [varchar](10) NULL,
	[Tipo de Contrato] [varchar](37) NULL,
	[Sueldo Basico] [float] NOT NULL,
	[Tipo de Salario] [varchar](17) NULL,
	[Centro de Costo] [char](200) NULL,
	[Estado] [char](1) NOT NULL,
	[Cod_Empleador] [smallint] NOT NULL
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[EMPRESAS]    Script Date: 12/19/2020 6:53:34 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[EMPRESAS]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[EMPRESAS](
	[Codigo] [smallint] NOT NULL,
	[Tipo_Documento] [char](1) NOT NULL,
	[Num_Documento] [char](9) NOT NULL,
	[Digito_Verificacion] [char](1) NOT NULL,
	[Nombre_Empresa] [char](40) NOT NULL,
	[Direccion] [char](40) NOT NULL,
	[Cod_Depto] [smallint] NOT NULL,
	[Cod_Ciudad] [smallint] NOT NULL,
	[Tel] [char](10) NOT NULL,
	[Fax] [char](10) NOT NULL,
	[Cod_Arp] [smallint] NOT NULL,
	[Cod_Sucursal_Pag] [smallint] NOT NULL,
	[Clase_Aportante] [char](1) NOT NULL,
	[Forma_Presenta] [char](1) NOT NULL,
	[Fec_Instalacion] [char](8) NOT NULL,
	[Fec_Ult_Acceso] [char](8) NOT NULL,
	[Dias_Vigencia] [smallint] NOT NULL,
	[Fec_Vence_Licencia] [char](8) NOT NULL,
	[Clave] [char](10) NOT NULL,
	[Codigo_Habilitacion] [char](10) NOT NULL,
	[Cod_Pais] [char](1) NOT NULL,
	[Licencias] [smallint] NOT NULL,
	[Servidor] [char](50) NULL,
	[BaseDatos] [char](25) NOT NULL,
	[Usuario] [char](25) NOT NULL,
	[Passw] [char](25) NOT NULL,
	[Ruta] [char](30) NULL,
	[ModNOM] [char](1) NOT NULL,
	[ModRH] [char](1) NOT NULL,
	[ModMIS] [char](1) NOT NULL,
	[Serial] [char](10) NOT NULL,
	[Cod_Local] [char](20) NOT NULL,
	[Logo] [varbinary](max) NULL,
	[LogoOpc] [varchar](max) NOT NULL,
	[CargaLogoOpc] [bit] NULL,
	[Estado] [varchar](1) NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[EMPRESASPRUEBA]    Script Date: 12/19/2020 6:53:34 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[EMPRESASPRUEBA]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[EMPRESASPRUEBA](
	[Codigo] [smallint] NOT NULL,
	[Tipo_Documento] [char](1) NOT NULL,
	[Num_Documento] [char](9) NOT NULL,
	[Digito_Verificacion] [char](1) NOT NULL,
	[Nombre_Empresa] [char](40) NOT NULL,
	[Direccion] [char](40) NOT NULL,
	[Cod_Depto] [smallint] NOT NULL,
	[Cod_Ciudad] [smallint] NOT NULL,
	[Tel] [char](10) NOT NULL,
	[Fax] [char](10) NOT NULL,
	[Cod_Arp] [smallint] NOT NULL,
	[Cod_Sucursal_Pag] [smallint] NOT NULL,
	[Clase_Aportante] [char](1) NOT NULL,
	[Forma_Presenta] [char](1) NOT NULL,
	[Fec_Instalacion] [char](8) NOT NULL,
	[Fec_Ult_Acceso] [char](8) NOT NULL,
	[Dias_Vigencia] [smallint] NOT NULL,
	[Fec_Vence_Licencia] [char](8) NOT NULL,
	[Clave] [char](10) NOT NULL,
	[Codigo_Habilitacion] [char](10) NOT NULL,
	[Cod_Pais] [char](1) NOT NULL,
	[Licencias] [smallint] NOT NULL,
	[Servidor] [char](25) NOT NULL,
	[BaseDatos] [char](25) NOT NULL,
	[Usuario] [char](25) NOT NULL,
	[Passw] [char](25) NOT NULL,
	[Ruta] [char](25) NOT NULL,
	[ModNOM] [char](1) NOT NULL,
	[ModRH] [char](1) NOT NULL,
	[ModMIS] [char](1) NOT NULL,
	[Serial] [char](10) NOT NULL,
	[Cod_Local] [char](20) NOT NULL
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[EMPRESASTEMP]    Script Date: 12/19/2020 6:53:34 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[EMPRESASTEMP]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[EMPRESASTEMP](
	[Codigo] [smallint] NOT NULL,
	[Tipo_Documento] [char](1) NOT NULL,
	[Num_Documento] [char](9) NOT NULL,
	[Digito_Verificacion] [char](1) NOT NULL,
	[Nombre_Empresa] [char](70) NULL,
	[Direccion] [char](40) NOT NULL,
	[Cod_Depto] [smallint] NOT NULL,
	[Cod_Ciudad] [smallint] NOT NULL,
	[Tel] [char](10) NOT NULL,
	[Fax] [char](10) NOT NULL,
	[Cod_Arp] [smallint] NOT NULL,
	[Cod_Sucursal_Pag] [smallint] NOT NULL,
	[Clase_Aportante] [char](1) NOT NULL,
	[Forma_Presenta] [char](1) NOT NULL,
	[Fec_Instalacion] [char](8) NOT NULL,
	[Fec_Ult_Acceso] [char](8) NOT NULL,
	[Dias_Vigencia] [smallint] NOT NULL,
	[Fec_Vence_Licencia] [char](8) NOT NULL,
	[Clave] [char](10) NOT NULL,
	[Codigo_Habilitacion] [char](10) NOT NULL,
	[Cod_Pais] [char](1) NOT NULL,
	[Licencias] [smallint] NOT NULL,
	[Servidor] [char](25) NOT NULL,
	[BaseDatos] [char](25) NOT NULL,
	[Usuario] [char](25) NOT NULL,
	[Passw] [char](25) NOT NULL,
	[Ruta] [char](30) NULL,
	[ModNOM] [char](1) NOT NULL,
	[ModRH] [char](1) NOT NULL,
	[ModMIS] [char](1) NOT NULL,
	[Serial] [char](10) NOT NULL,
	[Cod_Local] [char](20) NOT NULL,
	[Logo] [varbinary](max) NULL,
	[LogoOpc] [varchar](max) NOT NULL,
	[CargaLogoOpc] [bit] NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[ENVIO_NOVEDADES]    Script Date: 12/19/2020 6:53:34 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[ENVIO_NOVEDADES]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[ENVIO_NOVEDADES](
	[Autonum] [int] IDENTITY(1,1) NOT NULL,
	[Fec_Nomina] [varchar](8) NULL,
	[Fec_Envio] [datetime] NULL,
	[Email_Id] [varchar](max) NULL,
	[Doc_Filaname] [varchar](max) NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[EPS]    Script Date: 12/19/2020 6:53:34 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[EPS]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[EPS](
	[Cod_Eps] [smallint] NOT NULL,
	[Nom_Eps] [char](30) NOT NULL,
	[Nit_Eps] [char](9) NULL,
	[Digito_Verificacion] [char](1) NULL,
	[Dir_Eps] [char](40) NOT NULL,
	[Tel1_Eps] [char](10) NOT NULL,
	[Tel2_Eps] [char](10) NOT NULL,
	[Fax_Eps] [char](10) NOT NULL,
	[Contacto_Eps] [char](30) NOT NULL,
	[Tot_Afiliados] [int] NOT NULL,
	[Cod_Super] [char](6) NULL,
 CONSTRAINT [PK_EPS] PRIMARY KEY CLUSTERED 
(
	[Cod_Eps] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY],
 CONSTRAINT [IX_EPS] UNIQUE NONCLUSTERED 
(
	[Nom_Eps] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[ESCALAS]    Script Date: 12/19/2020 6:53:34 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[ESCALAS]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[ESCALAS](
	[Cod_Escala] [smallint] NOT NULL,
	[Desde] [int] NOT NULL,
	[Hasta] [int] NOT NULL,
	[VLDiurna] [real] NOT NULL,
	[VLNocturna] [real] NOT NULL
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[ESCALASENC]    Script Date: 12/19/2020 6:53:34 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[ESCALASENC]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[ESCALASENC](
	[Cod_Escala] [smallint] NOT NULL,
	[Nom_Escala] [char](25) NOT NULL,
	[Cod_Zona] [smallint] NOT NULL,
	[Cod_Sucursal] [smallint] NOT NULL,
	[Cod_Ccosto] [smallint] NOT NULL,
	[Por_Bonificacion] [real] NOT NULL,
 CONSTRAINT [PK_ESCALASENC] PRIMARY KEY CLUSTERED 
(
	[Cod_Escala] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[ESPECIALIDADES]    Script Date: 12/19/2020 6:53:34 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[ESPECIALIDADES]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[ESPECIALIDADES](
	[Cod_Especialidad] [smallint] NOT NULL,
	[Descripcion] [char](50) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Cod_Especialidad] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[EVALUACIONEMPLEADOS]    Script Date: 12/19/2020 6:53:34 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[EVALUACIONEMPLEADOS]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[EVALUACIONEMPLEADOS](
	[Cod_Empleado] [smallint] NOT NULL,
	[Fecha_Inicio] [char](8) NOT NULL,
	[Hora_Inicio] [char](5) NOT NULL,
	[Cod_Pregunta] [smallint] NOT NULL,
	[Calificacion1] [smallint] NOT NULL,
	[Calificacion2] [smallint] NOT NULL,
	[Comentario] [text] NOT NULL,
	[Cod_Usuario] [smallint] NOT NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[EVALUACIONES]    Script Date: 12/19/2020 6:53:34 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[EVALUACIONES]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[EVALUACIONES](
	[Cod_Requerimiento] [smallint] NOT NULL,
	[Cod_HojaVida] [smallint] NOT NULL,
	[Fecha_Inicio] [char](8) NOT NULL,
	[Hora_Inicio] [char](5) NOT NULL,
	[Cod_Pregunta] [smallint] NOT NULL,
	[Calificacion1] [smallint] NOT NULL,
	[Calificacion2] [smallint] NOT NULL,
	[Cod_Soporte] [smallint] NOT NULL,
	[Comentario] [text] NOT NULL,
	[Duracion] [smallint] NOT NULL,
	[Cod_Usuario] [smallint] NOT NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[EXPLABORAL]    Script Date: 12/19/2020 6:53:34 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[EXPLABORAL]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[EXPLABORAL](
	[Cod_HojaVida] [varchar](max) NOT NULL,
	[Empresa] [varchar](50) NOT NULL,
	[Telefono] [varchar](14) NOT NULL,
	[Industria] [varchar](max) NOT NULL,
	[Sector] [varchar](50) NOT NULL,
	[Cargo] [varchar](50) NOT NULL,
	[AreaTrabajo] [varchar](100) NOT NULL,
	[Fec_Ingreso] [varchar](50) NOT NULL,
	[Fec_Retiro] [varchar](14) NOT NULL,
	[Funciones] [varchar](50) NOT NULL,
	[Jefe_Inmediato] [varchar](50) NOT NULL,
	[Logros] [varchar](50) NOT NULL,
	[Opinion] [varchar](50) NOT NULL,
	[Verificado] [varchar](1) NOT NULL,
	[Cod_ExpLaboral] [int] IDENTITY(1,1) NOT NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[FAMILIARES]    Script Date: 12/19/2020 6:53:34 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[FAMILIARES]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[FAMILIARES](
	[Cod_Empleado] [smallint] NOT NULL,
	[Nombre] [char](45) NOT NULL,
	[Parentesco] [char](25) NOT NULL,
	[Edad] [char](3) NOT NULL,
	[Profesion] [char](35) NOT NULL,
	[Empresa] [char](35) NOT NULL,
	[Cargo] [char](25) NOT NULL,
	[FechaNacimiento] [char](8) NOT NULL,
	[PNombre] [char](20) NOT NULL,
	[SNombre] [char](30) NOT NULL,
	[PApellido] [char](20) NOT NULL,
	[SApellido] [char](30) NOT NULL,
	[Cedula] [char](12) NOT NULL,
	[Tipo_Documento] [char](1) NOT NULL,
	[Upc] [float] NOT NULL,
	[AutoNum] [numeric](18, 0) IDENTITY(1,1) NOT NULL
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[FERIADOS]    Script Date: 12/19/2020 6:53:34 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[FERIADOS]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[FERIADOS](
	[Cod_Feriado] [smallint] NOT NULL,
	[Fecha] [char](8) NOT NULL,
	[Descripcion] [char](30) NOT NULL,
 CONSTRAINT [PK_FERIADOS] PRIMARY KEY CLUSTERED 
(
	[Cod_Feriado] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[FORMACADEMICA]    Script Date: 12/19/2020 6:53:34 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[FORMACADEMICA]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[FORMACADEMICA](
	[Cod_HojaVida] [nvarchar](10) NOT NULL,
	[Cod_Institucion] [smallint] NOT NULL,
	[Cod_Titulo] [smallint] NOT NULL,
	[Cod_Nivel] [smallint] NOT NULL,
	[Inicio] [char](8) NOT NULL,
	[Salida] [char](8) NOT NULL,
	[Cod_Especialidad] [smallint] NOT NULL,
	[Otra_Institucion] [nvarchar](20) NOT NULL,
	[Otro_Titulo] [nvarchar](20) NOT NULL,
	[Otra_Especialidad] [nvarchar](20) NOT NULL,
	[Adjunto] [varchar](max) NULL,
	[Cod_FormAcademica] [int] IDENTITY(1,1) NOT NULL,
	[Estado] [varchar](1) NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[GRUPOSARP]    Script Date: 12/19/2020 6:53:34 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[GRUPOSARP]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[GRUPOSARP](
	[Cod_Grupo] [smallint] NOT NULL,
	[Nom_Grupo] [char](30) NULL,
	[Porc_Grupo] [real] NULL,
 CONSTRAINT [PK_GRUPOSARP] PRIMARY KEY CLUSTERED 
(
	[Cod_Grupo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[HISTORIACLINICA]    Script Date: 12/19/2020 6:53:34 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[HISTORIACLINICA]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[HISTORIACLINICA](
	[Codigo] [smallint] NOT NULL,
	[Cod_Empleado] [smallint] NOT NULL,
	[Diagnostico] [text] NOT NULL,
	[Fecha_Control] [char](8) NOT NULL,
	[Fecha_Prox_Control] [char](8) NOT NULL,
	[Estado] [char](1) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Codigo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[HISTORICO]    Script Date: 12/19/2020 6:53:34 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[HISTORICO]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[HISTORICO](
	[Cod_Empleado] [smallint] NOT NULL,
	[Cod_Concepto] [smallint] NULL,
	[Fec_Novedad] [char](8) NOT NULL,
	[Fec_Ing_Novedad] [char](8) NOT NULL,
	[Val_Novedad] [float] NOT NULL,
	[Dias_Novedad] [real] NOT NULL,
	[Horas_Novedad] [real] NOT NULL,
	[Cod_Zona] [smallint] NOT NULL,
	[Cod_Sucursal] [smallint] NOT NULL,
	[Cod_Ccosto] [smallint] NOT NULL,
	[Cod_Depto] [smallint] NOT NULL,
	[Cod_Sub_Concepto] [smallint] NOT NULL,
	[Fec_Nomina] [char](8) NOT NULL,
	[Fec_Aprobado] [char](8) NOT NULL,
	[Cta_Contable] [char](10) NOT NULL,
	[Cod_Usuario] [smallint] NOT NULL,
	[Estado] [char](1) NOT NULL,
	[Usado_BS] [char](20) NULL,
	[Porcentaje] [real] NOT NULL,
	[C1] [char](20) NOT NULL,
	[C2] [char](20) NOT NULL,
	[C3] [char](20) NOT NULL,
	[C4] [char](20) NOT NULL,
	[Cod_Cargo] [smallint] NOT NULL,
	[ModuloPago] [char](1) NOT NULL,
	[NumAprobacion] [char](10) NOT NULL,
	[NumComprobante] [char](10) NOT NULL,
	[AutoNum] [numeric](18, 0) IDENTITY(1,1) NOT NULL
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[HISTORICO_AUTOLIQUIDACIONES]    Script Date: 12/19/2020 6:53:34 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[HISTORICO_AUTOLIQUIDACIONES]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[HISTORICO_AUTOLIQUIDACIONES](
	[Cod_Empleador] [smallint] NOT NULL,
	[Cod_Empleado] [smallint] NOT NULL,
	[Cod_Concepto] [smallint] NOT NULL,
	[Fec_Nomina] [char](8) NOT NULL,
	[Val_Novedad] [float] NOT NULL,
	[Val_IBC] [float] NOT NULL,
	[Dias_Novedad] [real] NOT NULL,
	[Cod_Sub_Concepto] [smallint] NOT NULL,
	[Cod_Sub_Concepto1] [smallint] NOT NULL,
	[Fec_Pago] [char](8) NOT NULL,
	[Num_Planilla] [char](30) NOT NULL,
	[RegDoble] [char](1) NOT NULL,
	[Num_Registro] [smallint] NOT NULL,
	[Num_Horas] [smallint] NOT NULL,
	[IbcReferencia] [float] NOT NULL,
	[PlanillaMes] [smallint] NOT NULL
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[HISTORICO_CLAVES]    Script Date: 12/19/2020 6:53:34 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[HISTORICO_CLAVES]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[HISTORICO_CLAVES](
	[Cod_Usuario] [smallint] NOT NULL,
	[Clave] [char](20) NOT NULL,
	[Fecha_Clave] [char](8) NOT NULL
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[HISTORICO_NOVEDADES_AUTOLIQUIDACIONES]    Script Date: 12/19/2020 6:53:34 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[HISTORICO_NOVEDADES_AUTOLIQUIDACIONES]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[HISTORICO_NOVEDADES_AUTOLIQUIDACIONES](
	[Cod_Empleado] [smallint] NOT NULL,
	[Fec_Nomina] [char](8) NOT NULL,
	[Ing] [char](1) NOT NULL,
	[Ret] [char](1) NOT NULL,
	[Tde] [char](1) NOT NULL,
	[Tae] [char](1) NOT NULL,
	[Tdp] [char](1) NOT NULL,
	[Tap] [char](1) NOT NULL,
	[Vsp] [char](1) NOT NULL,
	[Vte] [char](1) NOT NULL,
	[Vst] [char](1) NOT NULL,
	[Sln] [char](1) NOT NULL,
	[Ige] [char](1) NOT NULL,
	[Lma] [char](1) NOT NULL,
	[Vac] [char](1) NOT NULL,
	[Avp] [char](1) NOT NULL,
	[Vct] [char](1) NOT NULL,
	[Irp] [char](1) NOT NULL,
	[Exo] [char](1) NOT NULL,
	[Num_Registro] [smallint] NOT NULL,
	[Fec_Ingreso] [char](8) NOT NULL,
	[Fec_Retiro] [char](8) NOT NULL,
	[Fec_IniVSP] [char](8) NOT NULL,
	[Fec_IniSLN] [char](8) NOT NULL,
	[Fec_FinSLN] [char](8) NOT NULL,
	[Fec_IniIGE] [char](8) NOT NULL,
	[Fec_FinIGE] [char](8) NOT NULL,
	[Fec_IniLMA] [char](8) NOT NULL,
	[Fec_FinLMA] [char](8) NOT NULL,
	[Fec_IniVAC] [char](8) NOT NULL,
	[Fec_FinVAC] [char](8) NOT NULL,
	[Fec_IniVCT] [char](8) NOT NULL,
	[Fec_FinVCT] [char](8) NOT NULL,
	[Fec_IniIRL] [char](8) NOT NULL,
	[Fec_FinIRL] [char](8) NOT NULL
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[HISTORICODEDUCIBLESRETENCION]    Script Date: 12/19/2020 6:53:34 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[HISTORICODEDUCIBLESRETENCION]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[HISTORICODEDUCIBLESRETENCION](
	[Cod_Empleado] [smallint] NOT NULL,
	[Fec_Nomina] [char](8) NOT NULL,
	[DedSalud] [float] NOT NULL,
	[DedMedicina] [float] NOT NULL,
	[DedDependientes] [float] NOT NULL,
	[DedVivienda] [float] NOT NULL,
	[Dias_Novedad] [smallint] NOT NULL
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[HISTORICODOCUMENTOS]    Script Date: 12/19/2020 6:53:34 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[HISTORICODOCUMENTOS]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[HISTORICODOCUMENTOS](
	[Cod_Empleado] [smallint] NOT NULL,
	[Cod_Modelo] [smallint] NOT NULL,
	[Documento] [text] NOT NULL,
	[Fec_Solicitud] [char](8) NOT NULL,
	[Fec_Creacion] [char](8) NOT NULL,
	[Fec_Mail] [char](8) NOT NULL,
	[Fec_Recibido] [char](8) NOT NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[HISTORICOOBJETIVOS]    Script Date: 12/19/2020 6:53:34 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[HISTORICOOBJETIVOS]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[HISTORICOOBJETIVOS](
	[Codigo] [smallint] NOT NULL,
	[Cod_Objetivo] [smallint] NOT NULL,
	[Cod_Empleado] [smallint] NOT NULL,
	[Detalle_Objetivo] [text] NOT NULL,
	[Fecha_Inicio_Objetivo] [char](8) NOT NULL,
	[Fecha_Aprox_Cumplimiento] [char](8) NOT NULL,
	[Fecha_Real_Cumplimiento] [char](8) NOT NULL,
	[Porcentaje_Cumplimiento] [smallint] NOT NULL,
	[Solucion] [text] NOT NULL,
	[Estado] [char](1) NOT NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[HISTORICOPROGRAMASSALUDOCUPACIONAL]    Script Date: 12/19/2020 6:53:34 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[HISTORICOPROGRAMASSALUDOCUPACIONAL]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[HISTORICOPROGRAMASSALUDOCUPACIONAL](
	[Cod_Programa] [smallint] NOT NULL,
	[Cod_Programa_Maestro] [smallint] NOT NULL,
	[Cod_Empleado] [smallint] NOT NULL,
	[Comentario] [text] NOT NULL,
	[Cod_Usuario] [smallint] NOT NULL,
	[Fecha_Control] [char](8) NOT NULL,
	[Fecha_Evento] [char](8) NOT NULL,
	[Chequeada] [char](1) NOT NULL,
	[Aprobo] [char](1) NOT NULL,
	[Invitado] [char](1) NOT NULL,
	[Confirmo] [char](1) NOT NULL,
	[Asistio] [char](1) NOT NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[HISTORICORIESGOS]    Script Date: 12/19/2020 6:53:34 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[HISTORICORIESGOS]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[HISTORICORIESGOS](
	[Codigo] [smallint] NOT NULL,
	[Cod_Riesgo] [smallint] NOT NULL,
	[Detalle_Riesgo] [text] NOT NULL,
	[Fecha_Reporte_Riesgo] [char](8) NOT NULL,
	[Fecha_Aprox_Solucion] [char](8) NOT NULL,
	[Fecha_Real_Solucion] [char](8) NOT NULL,
	[Fuente_Generadora] [char](20) NOT NULL,
	[Total_Expuestos] [smallint] NOT NULL,
	[Consecuencias] [text] NOT NULL,
	[Probabilidad_Ocurrencia] [smallint] NOT NULL,
	[Solucion] [text] NOT NULL,
	[Estado] [char](1) NOT NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[HISTORICOTEMP]    Script Date: 12/19/2020 6:53:34 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[HISTORICOTEMP]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[HISTORICOTEMP](
	[Cod_Empleado] [smallint] NOT NULL,
	[DedSaludEdu] [float] NOT NULL,
	[Deducible] [float] NOT NULL,
	[DedAlimentacion] [float] NOT NULL,
	[Por_Retefuente] [real] NOT NULL,
	[Empleado] [char](45) NOT NULL,
	[Cedula] [char](12) NOT NULL,
	[Fec_Ingreso] [char](8) NOT NULL,
	[Estado] [char](1) NOT NULL,
	[Cod_Afp] [smallint] NOT NULL,
	[Tipo_Salario] [char](1) NOT NULL,
	[FecLimiteDeducible] [char](8) NOT NULL,
	[VigenciaDependientes] [char](8) NOT NULL,
	[MetodoRetefuente] [char](1) NOT NULL,
	[Salario] [float] NOT NULL,
	[Fec_Retiro] [char](8) NOT NULL
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[HITOS]    Script Date: 12/19/2020 6:53:34 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[HITOS]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[HITOS](
	[Cod_Hito] [int] IDENTITY(1,1) NOT NULL,
	[Nom_Hito] [varchar](100) NOT NULL,
	[Orden_Visualizacion] [smallint] NOT NULL,
	[Duracion] [smallint] NOT NULL,
	[Tipo_Hito] [char](1) NOT NULL,
	[Cod_Dependiente] [int] NOT NULL
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[HOJAVIDA]    Script Date: 12/19/2020 6:53:34 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[HOJAVIDA]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[HOJAVIDA](
	[Cod_HojaVida] [smallint] NOT NULL,
	[PNombre] [char](15) NOT NULL,
	[SNombre] [char](15) NOT NULL,
	[PApellido] [char](15) NOT NULL,
	[SApellido] [char](15) NOT NULL,
	[Aspirante] [char](60) NOT NULL,
	[Doc_Identidad] [char](12) NOT NULL,
	[Cod_Nacionalidad] [smallint] NOT NULL,
	[Fec_Nacimiento] [char](8) NOT NULL,
	[Sexo] [char](1) NOT NULL,
	[Lib_Militar] [char](12) NOT NULL,
	[Distrito] [char](3) NOT NULL,
	[Est_Civil] [char](1) NOT NULL,
	[Direccion] [char](100) NOT NULL,
	[Cod_Pais] [smallint] NOT NULL,
	[Dir_Electronica] [char](45) NOT NULL,
	[Cod_Ciudad] [smallint] NOT NULL,
	[Tel1] [char](25) NULL,
	[Tel2] [char](12) NULL,
	[Celular] [char](15) NOT NULL,
	[Asp_Salarial] [float] NOT NULL,
	[PViaje] [char](2) NOT NULL,
	[PTraslado] [char](2) NOT NULL,
	[Cod_Profesion] [smallint] NOT NULL,
	[Idioma_Nativo] [char](15) NOT NULL,
	[Idioma1] [char](15) NOT NULL,
	[Porc_Conocimiento_Idioma1] [real] NOT NULL,
	[Idioma2] [char](15) NOT NULL,
	[Porc_Conocimiento_Idioma2] [real] NOT NULL,
	[Estudiante_Practica] [char](2) NOT NULL,
	[Anos_Experiencia] [int] NOT NULL,
	[Fec_Creacion] [char](8) NOT NULL,
	[Fec_Actualizacion] [char](8) NOT NULL,
	[Cod_Cargo_Aspira] [smallint] NOT NULL,
	[Sketch] [text] NOT NULL,
	[Cod_Personalidad] [smallint] NOT NULL,
	[Tipo_Documento] [char](1) NOT NULL,
	[Estado] [char](1) NOT NULL,
	[Cod_Lugar_Expedicion] [smallint] NOT NULL,
	[Nivel_Idioma1] [varchar](20) NOT NULL,
	[Nivel_Idioma2] [varchar](20) NOT NULL,
	[Unidad_Tiempo] [varchar](100) NOT NULL,
	[Imagen_Perfil] [varchar](max) NULL,
 CONSTRAINT [PK__HOJAVIDA__6E4C3B47] PRIMARY KEY CLUSTERED 
(
	[Cod_HojaVida] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[IdentityUserClaims]    Script Date: 12/19/2020 6:53:34 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[IdentityUserClaims]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[IdentityUserClaims](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[UserId] [nvarchar](max) NULL,
	[ClaimType] [nvarchar](max) NULL,
	[ClaimValue] [nvarchar](max) NULL,
	[IdentityUser_Id] [nvarchar](128) NULL,
 CONSTRAINT [PK_dbo.IdentityUserClaims] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[IDIOMAS]    Script Date: 12/19/2020 6:53:34 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[IDIOMAS]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[IDIOMAS](
	[Cod_Idioma] [smallint] IDENTITY(1,1) NOT NULL,
	[Nom_Idioma] [varchar](35) NULL,
	[ISO639] [varchar](3) NULL
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[IDIOMAS_HOJAVIDA]    Script Date: 12/19/2020 6:53:34 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[IDIOMAS_HOJAVIDA]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[IDIOMAS_HOJAVIDA](
	[Cod_Idioma_Hojavida] [smallint] IDENTITY(1,1) NOT NULL,
	[Cod_HojaVida] [smallint] NOT NULL,
	[Cod_Idioma] [smallint] NOT NULL,
	[Nivel_Idioma] [varchar](5) NULL
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[IMAS]    Script Date: 12/19/2020 6:53:34 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[IMAS]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[IMAS](
	[Desde] [real] NOT NULL,
	[Hasta] [real] NOT NULL,
	[Val_Retefuente] [real] NOT NULL
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[INCONSISTENCIAS]    Script Date: 12/19/2020 6:53:34 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[INCONSISTENCIAS]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[INCONSISTENCIAS](
	[Con_Inconsis] [int] NULL,
	[Fec_Evento] [nvarchar](8) NULL,
	[Hora_Evento] [nvarchar](20) NULL,
	[Tabla] [nvarchar](15) NULL,
	[Fuente] [nvarchar](1) NULL,
	[Descripcion] [nvarchar](50) NULL,
	[Cod_Usuario] [smallint] NULL,
	[Num_Registro] [int] NULL,
	[Cod_Empleado] [smallint] NULL,
	[Fec_Nomina] [nvarchar](8) NULL,
	[Fec_Ing_Novedad] [nvarchar](8) NULL,
	[Estado] [nvarchar](1) NULL,
	[Fec_Correccion] [nvarchar](8) NULL,
	[Cod_Concepto] [smallint] NULL,
	[Val_Inconsistencias] [float] NULL
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[INSTEDUCATIVAS]    Script Date: 12/19/2020 6:53:34 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[INSTEDUCATIVAS]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[INSTEDUCATIVAS](
	[Cod_Institucion] [smallint] NOT NULL,
	[Nom_Institucion] [char](50) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Cod_Institucion] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[JEFES]    Script Date: 12/19/2020 6:53:34 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[JEFES]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[JEFES](
	[Cod_Jefe] [smallint] NOT NULL,
	[Nom_Jefe] [char](50) NOT NULL,
	[Cod_Dependencia] [smallint] NOT NULL
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[LOCKREGISTRO]    Script Date: 12/19/2020 6:53:34 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[LOCKREGISTRO]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[LOCKREGISTRO](
	[Cod_Usuario] [smallint] NOT NULL,
	[Tabla] [varchar](30) NOT NULL,
	[Cod_Registro] [smallint] NOT NULL,
	[FechaHora] [datetime] NOT NULL
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[MODELOPORCARGOS]    Script Date: 12/19/2020 6:53:34 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[MODELOPORCARGOS]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[MODELOPORCARGOS](
	[Cod_Cargo] [smallint] NOT NULL,
	[Cod_Pregunta] [smallint] NOT NULL,
	[Peso] [smallint] NOT NULL,
	[Fec_Creada] [char](8) NOT NULL,
	[Creador] [smallint] NOT NULL,
	[Estado] [char](1) NOT NULL
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[MODELOPORCARGOSEMP]    Script Date: 12/19/2020 6:53:34 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[MODELOPORCARGOSEMP]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[MODELOPORCARGOSEMP](
	[Cod_Cargo] [smallint] NOT NULL,
	[Cod_Pregunta] [smallint] NOT NULL,
	[Peso] [smallint] NOT NULL,
	[Fec_Creada] [char](8) NOT NULL,
	[Creador] [smallint] NOT NULL,
	[Estado] [char](1) NOT NULL
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[MODELOS]    Script Date: 12/19/2020 6:53:34 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[MODELOS]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[MODELOS](
	[Cod_Modelo] [smallint] NOT NULL,
	[Tipo_Modelo] [smallint] NOT NULL,
	[Descripcion] [char](50) NOT NULL,
	[Modelo] [text] NOT NULL,
	[Fec_Creacion] [char](8) NOT NULL,
	[Fec_Modificacion] [char](8) NOT NULL,
	[Usuario_Creo] [char](10) NOT NULL,
	[Usuario_Modifico] [char](10) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Cod_Modelo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[MOTIVOS_RECHAZO]    Script Date: 12/19/2020 6:53:34 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[MOTIVOS_RECHAZO]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[MOTIVOS_RECHAZO](
	[Cod_Motivo_Rechazo] [smallint] IDENTITY(1,1) NOT NULL,
	[Descripcion] [varchar](150) NULL,
 CONSTRAINT [PK_MOTIVOS_RECHAZO] PRIMARY KEY CLUSTERED 
(
	[Cod_Motivo_Rechazo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[NITALTERNO]    Script Date: 12/19/2020 6:53:34 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[NITALTERNO]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[NITALTERNO](
	[NitOriginal] [char](15) NOT NULL,
	[NitAlterno] [char](15) NOT NULL,
	[Nit] [char](1) NOT NULL
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[NOMENCLATURAS]    Script Date: 12/19/2020 6:53:34 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[NOMENCLATURAS]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[NOMENCLATURAS](
	[CodInterno] [smallint] NOT NULL,
	[Codigo] [char](10) NOT NULL,
	[Nombre] [char](30) NOT NULL
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[NOVAUT]    Script Date: 12/19/2020 6:53:34 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[NOVAUT]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[NOVAUT](
	[Cod_Empleado] [smallint] NOT NULL,
	[Cod_Concepto] [smallint] NOT NULL,
	[Desde] [char](8) NOT NULL,
	[Hasta] [char](8) NOT NULL,
	[Dias] [smallint] NOT NULL,
	[Cod_Diag] [smallint] NULL,
	[Cod_Imagen] [smallint] NULL,
	[Cod_Usuario] [smallint] NULL,
	[Fec_Aprobado] [char](8) NULL,
	[Fec_Desaprobado] [char](8) NULL,
	[Estado] [char](1) NULL,
	[Num_Autoriza] [char](15) NULL,
	[Val_Novedad] [float] NULL,
	[Dias_Pag_100] [smallint] NULL,
	[Val_Reembolso_Eps] [float] NULL,
	[IBC] [float] NULL,
	[Dias_Pag_100_Ant] [smallint] NULL,
	[NumComprobante] [char](10) NOT NULL,
	[Horas] [float] NOT NULL,
	[AutoNum] [numeric](18, 0) IDENTITY(1,1) NOT NULL,
	[Prorroga] [smallint] NOT NULL,
	[DescuentaAuxilio] [char](1) NOT NULL,
	[Adjunto] [varchar](max) NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[NOVEDADES]    Script Date: 12/19/2020 6:53:34 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[NOVEDADES]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[NOVEDADES](
	[Cod_Empleado] [smallint] NOT NULL,
	[Cod_Concepto] [smallint] NOT NULL,
	[Fec_Novedad] [char](8) NOT NULL,
	[Fec_Ing_Novedad] [char](8) NOT NULL,
	[Val_Novedad] [float] NOT NULL,
	[Dias_Novedad] [real] NOT NULL,
	[Horas_Novedad] [real] NOT NULL,
	[Cod_Zona] [smallint] NOT NULL,
	[Cod_Sucursal] [smallint] NOT NULL,
	[Cod_Ccosto] [smallint] NOT NULL,
	[Cod_Depto] [smallint] NOT NULL,
	[Cod_Sub_Concepto] [smallint] NOT NULL,
	[Fec_Nomina] [char](8) NOT NULL,
	[Fec_Aprobado] [char](8) NOT NULL,
	[Cta_Contable] [char](10) NOT NULL,
	[Cod_Usuario] [smallint] NOT NULL,
	[Estado] [char](1) NOT NULL,
	[Usado_BS] [char](20) NULL,
	[Porcentaje] [real] NOT NULL,
	[C1] [char](20) NOT NULL,
	[C2] [char](20) NOT NULL,
	[C3] [char](20) NOT NULL,
	[C4] [char](20) NOT NULL,
	[Cod_Cargo] [smallint] NOT NULL,
	[ModuloPago] [char](1) NOT NULL,
	[NumAprobacion] [char](10) NOT NULL,
	[NumComprobante] [char](10) NOT NULL,
	[AutoNum] [numeric](18, 0) IDENTITY(1,1) NOT NULL
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[NOVESCALA]    Script Date: 12/19/2020 6:53:34 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[NOVESCALA]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[NOVESCALA](
	[Fec_Nomina] [char](8) NOT NULL,
	[Fec_Ing_Novedad] [char](8) NOT NULL,
	[Cod_Empleado] [smallint] NOT NULL,
	[Cod_Zona] [smallint] NOT NULL,
	[Cod_Sucursal] [smallint] NOT NULL,
	[Cod_Ccosto] [smallint] NOT NULL,
	[Cod_Concepto] [smallint] NOT NULL,
	[No_Horas] [float] NOT NULL,
	[Fec_Aprobado] [char](8) NOT NULL,
	[Fec_Desaprobado] [char](8) NOT NULL,
	[Cod_Usuario] [smallint] NOT NULL,
	[Estado] [char](1) NOT NULL,
	[Horas_Mes] [smallint] NOT NULL,
	[HorasTra_Mes] [float] NOT NULL,
	[Dia_Novedad] [smallint] NOT NULL,
	[Mes_Novedad] [smallint] NOT NULL,
	[AutoNum] [numeric](18, 0) IDENTITY(1,1) NOT NULL
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[OBJETIVOS]    Script Date: 12/19/2020 6:53:34 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[OBJETIVOS]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[OBJETIVOS](
	[Cod_Objetivo] [smallint] NOT NULL,
	[Tipo_Objetivo] [char](1) NOT NULL,
	[Nom_Objetivo] [char](30) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Cod_Objetivo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[OBSERVACIONES_EMPLEADO]    Script Date: 12/19/2020 6:53:34 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[OBSERVACIONES_EMPLEADO]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[OBSERVACIONES_EMPLEADO](
	[Cod_Empleado] [smallint] NOT NULL,
	[Cod_Observacion_Empleado] [numeric](18, 0) IDENTITY(1,1) NOT NULL,
	[Tipo_Novedad] [varchar](1) NULL,
	[Fec_Novedad] [varchar](8) NULL,
	[Observacion] [varchar](max) NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[OPCIONES]    Script Date: 12/19/2020 6:53:34 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[OPCIONES]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[OPCIONES](
	[Cod_Opcion] [char](3) NOT NULL,
	[Opcion] [char](50) NOT NULL,
	[Icono] [numeric](10, 0) NOT NULL,
	[OpcionDependiente] [char](50) NOT NULL
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[OTRASNOV]    Script Date: 12/19/2020 6:53:34 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[OTRASNOV]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[OTRASNOV](
	[Cod_Empleado] [smallint] NOT NULL,
	[Cod_Zona] [smallint] NULL,
	[Cod_Sucursal] [smallint] NULL,
	[Cod_Ccosto] [smallint] NULL,
	[Cod_Concepto] [smallint] NOT NULL,
	[Prioridad] [char](1) NULL,
	[Porc_OtrasNov] [real] NOT NULL,
	[Val_OtrasNov] [float] NOT NULL,
	[Dias] [real] NOT NULL,
	[Vigencia] [char](8) NOT NULL,
	[Tipo] [char](1) NOT NULL,
	[Estado] [char](1) NULL,
	[Fec_Aprobado] [char](8) NULL,
	[Fec_Desaprobado] [char](8) NULL,
	[Aplica] [char](1) NULL,
	[Fec_Ing_Novedad] [char](8) NOT NULL,
	[AutoNum] [numeric](18, 0) IDENTITY(1,1) NOT NULL,
	[Tipo_Especial] [real] NOT NULL,
	[NumCtaVoluntarios] [char](20) NOT NULL,
	[Cuotas] [smallint] NOT NULL,
	[VigenciaDesde] [char](8) NOT NULL,
	[Fuente] [char](2) NOT NULL,
	[Cod_Usuario] [char](20) NOT NULL
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[OTRASNOVTEMPORALES0]    Script Date: 12/19/2020 6:53:34 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[OTRASNOVTEMPORALES0]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[OTRASNOVTEMPORALES0](
	[Cod_Concepto] [smallint] NOT NULL,
	[Nom_Concepto] [char](100) NULL,
	[Val_OtrasNov] [float] NOT NULL
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[OTRASNOVTEMPORALES1]    Script Date: 12/19/2020 6:53:34 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[OTRASNOVTEMPORALES1]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[OTRASNOVTEMPORALES1](
	[Cod_Concepto] [smallint] NOT NULL,
	[Nom_Concepto] [char](100) NULL,
	[Val_OtrasNov] [float] NOT NULL
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[PAGINAS_PERMISOS]    Script Date: 12/19/2020 6:53:34 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[PAGINAS_PERMISOS]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[PAGINAS_PERMISOS](
	[Pagina] [nvarchar](max) NOT NULL,
	[Descripcion] [nvarchar](max) NOT NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[PAGOS]    Script Date: 12/19/2020 6:53:34 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[PAGOS]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[PAGOS](
	[Cod_Banco] [smallint] NOT NULL,
	[Tipo_Transaccion] [char](1) NOT NULL,
	[Num_Comprobante] [char](10) NOT NULL,
	[Fecha_Transaccion] [char](8) NOT NULL,
	[Fec_Nomina] [char](8) NOT NULL,
	[Valor] [float] NOT NULL,
	[Cod_Empleado] [smallint] NOT NULL,
	[Estado] [char](1) NOT NULL,
	[MotivoPago] [char](1) NOT NULL,
	[AutoNum] [numeric](18, 0) IDENTITY(1,1) NOT NULL
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[PAISES]    Script Date: 12/19/2020 6:53:34 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[PAISES]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[PAISES](
	[Cod_Pais] [smallint] NOT NULL,
	[Pais] [char](30) NOT NULL
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[PARAMETROS]    Script Date: 12/19/2020 6:53:34 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[PARAMETROS]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[PARAMETROS](
	[Ano] [smallint] NOT NULL,
	[Salmin] [float] NOT NULL,
	[Salint] [float] NOT NULL,
	[SubTrans] [float] NOT NULL,
	[ApoSalud] [real] NOT NULL,
	[ApoFondoSalud] [real] NULL,
	[ApoFondoPen] [real] NOT NULL,
	[ApoFondoSolPen] [real] NOT NULL,
	[Cod_Arp] [smallint] NOT NULL,
	[ApoFondoArp] [real] NULL,
	[LiqNomina] [smallint] NOT NULL,
	[ApoPsalud] [real] NOT NULL,
	[ApoPFondoPen] [real] NOT NULL,
	[ApoPriesProf] [real] NOT NULL,
	[ApoCajaCom] [real] NOT NULL,
	[ApoIcbf] [real] NOT NULL,
	[ApoSena] [real] NOT NULL,
	[ACesantias] [real] NOT NULL,
	[AintCesantias] [real] NOT NULL,
	[Aprimas] [real] NOT NULL,
	[Avacaciones] [real] NOT NULL,
	[Fec_Inicial] [char](8) NULL,
	[Fec_Nomina] [char](8) NULL,
	[Tipo_Liquidacion] [char](1) NULL,
	[PorcSalNor] [real] NULL,
	[PorcSalInt] [real] NULL,
	[PorcSalEsc] [real] NULL,
	[TipoSabado] [char](1) NULL,
	[Codigo] [smallint] NULL,
	[CtaGtoCajas] [char](10) NULL,
	[CtaPasCajas] [char](10) NULL,
	[CtaGtoIcbf] [char](10) NULL,
	[CtaPasIcbf] [char](10) NULL,
	[CtaGtoSena] [char](10) NULL,
	[CtaPasSena] [char](10) NULL,
	[CtaGtoSalud] [char](10) NULL,
	[CtaPasSalud] [char](10) NULL,
	[CtaGtoPension] [char](10) NULL,
	[CtaPasPension] [char](10) NULL,
	[CtaGtoRiesProf] [char](10) NULL,
	[CtaPasRiesProf] [char](10) NULL,
	[CtaGtoCesantias] [char](10) NULL,
	[CtaPasCesantias] [char](10) NULL,
	[CtaGtoIntCesantias] [char](10) NULL,
	[CtaPasIntCesantias] [char](10) NULL,
	[CtaGtoPrimas] [char](10) NULL,
	[CtaPasPrimas] [char](10) NULL,
	[CtaGtoVacaciones] [char](10) NULL,
	[CtaPasVacaciones] [char](10) NULL,
	[Tipo_Interfase] [char](2) NULL,
	[DiasMaxHabiles] [int] NULL,
	[IntMora] [real] NULL,
	[Sal_Max_Asegur] [smallint] NULL,
	[ValMaxAnual] [float] NULL,
	[ValMaxMensual] [float] NULL,
	[PorcEduMensual] [real] NULL,
	[PorcPrimaSalNormal] [real] NULL,
	[PorcPrimaSalEscala] [real] NULL,
	[Hora_Ent] [char](10) NULL,
	[Hora_Sal] [char](10) NULL,
	[Tiempo_Alm] [char](10) NULL,
	[TopeMaxRentaExcenta] [float] NULL,
	[PorcMaxApoPen] [real] NULL,
	[TipoLiqFestivos] [char](1) NOT NULL,
	[Corte30Retefuente] [char](1) NOT NULL,
	[Corte30SegSocial] [char](1) NOT NULL,
	[Fec_Acumulado] [char](8) NOT NULL,
	[Val_Uvt] [float] NOT NULL,
	[PptoAnualCap] [float] NOT NULL,
	[Promedio_Cesantias] [char](1) NOT NULL,
	[Corte30Provisiones] [char](1) NOT NULL,
	[BasePrimaSubsidio] [char](1) NOT NULL,
	[Sal_Max_AsegurRie] [smallint] NOT NULL,
	[Calculo_Anticipo] [char](1) NOT NULL,
	[Pago_Vac_FecLlegada] [char](1) NOT NULL,
	[LogoSucursal] [char](1) NOT NULL,
	[DedFiscales] [char](1) NOT NULL,
	[CtaActGasAnt] [char](10) NOT NULL,
	[GastoAnticipadoSueldos] [char](1) NOT NULL,
	[DedFiscalSalud] [char](1) NOT NULL,
	[Servidor] [char](30) NOT NULL,
	[Usuario] [char](60) NULL,
	[Clave] [char](20) NOT NULL,
	[Puerto] [char](6) NOT NULL,
	[Remitente] [char](60) NOT NULL,
	[Mensaje] [char](400) NOT NULL,
	[Por_Bonos] [real] NOT NULL,
	[CtaPasBonificaciones] [char](10) NULL,
	[TopeSalud] [int] NOT NULL,
	[TopePension] [int] NOT NULL,
	[TopeRiesgos] [int] NOT NULL,
	[TopeCaja] [int] NOT NULL,
	[Vac100] [char](1) NOT NULL,
	[TopeMaximo] [real] NOT NULL,
	[DiasLic] [char](1) NOT NULL,
	[DiasCesantias] [smallint] NOT NULL,
	[Ley1429] [char](1) NOT NULL,
	[UVTActual] [char](1) NOT NULL,
	[BaseCesantiaSubsidio] [char](1) NOT NULL,
	[SubParcial] [char](1) NOT NULL,
	[SubCompleto] [char](1) NOT NULL,
	[SubDiasParcial] [char](1) NOT NULL,
	[SubDiasCompleto] [char](1) NOT NULL,
	[TopeMaxAportes] [float] NOT NULL,
	[TopeMaxSalud] [float] NOT NULL,
	[TopeMaxDependientes] [float] NOT NULL,
	[AportanteExoneradoCajaSalud] [char](1) NOT NULL,
	[RedoneaRetefuente] [char](1) NOT NULL,
	[SubPrimeraVariables] [char](1) NOT NULL,
	[DiasNoLabDerecho] [char](1) NOT NULL,
	[DiasTrans] [char](1) NOT NULL,
	[GastoVacacionesAnt] [char](1) NOT NULL,
	[DedSaludMesAct] [char](1) NOT NULL,
	[RedondeoSaludPension] [char](1) NOT NULL,
	[UsaConceptosSena] [char](1) NOT NULL,
	[SSL] [bit] NOT NULL,
	[LiquidaDiasDerecho] [char](1) NOT NULL,
	[Dia31] [char](1) NOT NULL,
	[IbcAnt] [char](1) NOT NULL,
	[PorcMinBaseRet] [float] NOT NULL,
	[Fec_Aplica_Reforma] [char](8) NOT NULL,
	[Autenticar] [bit] NOT NULL
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[PARAMETROS_CERTLAB]    Script Date: 12/19/2020 6:53:34 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[PARAMETROS_CERTLAB]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[PARAMETROS_CERTLAB](
	[Cod_Parametros_Certlab] [int] IDENTITY(1,1) NOT NULL,
	[Filter] [varchar](15) NULL,
	[Cod_Filter] [smallint] NULL,
	[Otros_Devengos] [bit] NULL,
	[Horas_Extras] [bit] NULL,
	[Base_Salario] [bit] NULL,
	[Otros_Ingresos] [bit] NULL,
	[Conceptos] [varchar](250) NULL,
	[Meses_Promedio] [smallint] NULL,
	[Cod_Empleado_Autoriza] [smallint] NULL,
	[Texto_Embajada] [text] NULL,
	[Texto_Viaje_Laboral] [text] NULL,
	[Firma_Digital] [bit] NULL,
	[Firma_Filename] [varchar](max) NULL,
	[Plantilla] [varchar](max) NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[PARAMETROS_WEB]    Script Date: 12/19/2020 6:53:34 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[PARAMETROS_WEB]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[PARAMETROS_WEB](
	[Cod_Parametros_Web] [int] IDENTITY(1,1) NOT NULL,
	[Ano_Compropago] [smallint] NULL,
	[Mes_Compropago] [varchar](2) NULL,
	[Mostrar_Ano_Anterior] [bit] NULL,
	[Redondear_Renglones] [bit] NULL,
	[Unificar_Contratos] [bit] NULL,
	[Firmar_Certlab] [bit] NULL,
	[Cod_Aprobador] [smallint] NULL,
	[Firma_Path] [varchar](max) NULL,
	[Aprobar_Compropago] [bit] NULL,
	[Modo_Compropago] [varchar](2) NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[PARAMETROSPROYECCIONES]    Script Date: 12/19/2020 6:53:34 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[PARAMETROSPROYECCIONES]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[PARAMETROSPROYECCIONES](
	[Ano] [smallint] NOT NULL,
	[PorCesantias] [real] NOT NULL,
	[PorPrimas] [real] NOT NULL,
	[PorVacaciones] [real] NOT NULL,
	[PorCajaCompensacion] [real] NOT NULL,
	[PorICBF] [real] NOT NULL,
	[PorSena] [real] NOT NULL,
	[PorSaludEmpresa] [real] NOT NULL,
	[PorPensionEmpresa] [real] NOT NULL,
	[PorARL] [real] NOT NULL,
	[MinimoLegal] [float] NOT NULL,
	[MinimoIntegral] [float] NOT NULL,
	[SubsidioTransporte] [float] NOT NULL,
	[Ley1429] [char](1) NOT NULL,
	[SalMinAsegurables] [real] NOT NULL
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[PARAMETROSRRHH]    Script Date: 12/19/2020 6:53:34 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[PARAMETROSRRHH]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[PARAMETROSRRHH](
	[Excelente] [smallint] NOT NULL,
	[Bueno] [smallint] NOT NULL,
	[Aceptable] [smallint] NOT NULL,
	[Regular] [smallint] NOT NULL,
	[Deficiente] [smallint] NOT NULL,
	[Alto] [smallint] NOT NULL,
	[Medio] [smallint] NOT NULL,
	[Bajo] [smallint] NOT NULL
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[PARAMETROSSEGURIDAD]    Script Date: 12/19/2020 6:53:34 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[PARAMETROSSEGURIDAD]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[PARAMETROSSEGURIDAD](
	[ClaveSegura] [char](1) NOT NULL,
	[CaseSensitive] [char](1) NOT NULL,
	[CantIntentos] [int] NOT NULL,
	[CantClavesAnt] [int] NOT NULL,
	[DiasAviso] [int] NOT NULL,
	[CambClave] [int] NOT NULL,
	[MinClave] [int] NOT NULL
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[PERFILCARGO]    Script Date: 12/19/2020 6:53:34 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[PERFILCARGO]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[PERFILCARGO](
	[Cod_Cargo] [smallint] NOT NULL,
	[Cod_Perfil] [smallint] NOT NULL,
	[Cod_Profesion] [smallint] NOT NULL,
	[Cod_Institucion] [smallint] NOT NULL,
	[Cod_Especialidad] [smallint] NOT NULL,
	[Nivel_Educativo] [smallint] NOT NULL,
	[Asp_Salarial] [float] NOT NULL,
	[Idioma] [char](30) NOT NULL,
	[Dominio] [smallint] NOT NULL,
	[Exp_Laboral] [char](2) NOT NULL,
	[Sexo] [char](1) NOT NULL,
	[Edad] [char](2) NOT NULL,
	[Nacionalidad] [smallint] NOT NULL,
	[Est_Civil] [char](1) NOT NULL
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[PERFILCOMPETENCIA]    Script Date: 12/19/2020 6:53:34 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[PERFILCOMPETENCIA]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[PERFILCOMPETENCIA](
	[Cod_Perfil] [smallint] NOT NULL,
	[Cod_Competencia] [smallint] NOT NULL
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[PERFILES]    Script Date: 12/19/2020 6:53:34 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[PERFILES]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[PERFILES](
	[Cod_Perfil] [smallint] NOT NULL,
	[Descripcion] [char](50) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Cod_Perfil] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[PERFILESPECIALIDAD]    Script Date: 12/19/2020 6:53:34 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[PERFILESPECIALIDAD]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[PERFILESPECIALIDAD](
	[Cod_Perfil] [smallint] NOT NULL,
	[Cod_Especialidad] [smallint] NOT NULL
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[PERFILINSTITUCION]    Script Date: 12/19/2020 6:53:34 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[PERFILINSTITUCION]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[PERFILINSTITUCION](
	[Cod_Perfil] [smallint] NOT NULL,
	[Cod_Institucion] [smallint] NOT NULL
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[PERFILNIVELEDUCATIVO]    Script Date: 12/19/2020 6:53:34 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[PERFILNIVELEDUCATIVO]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[PERFILNIVELEDUCATIVO](
	[Cod_Perfil] [smallint] NOT NULL,
	[Cod_NivelEducativo] [smallint] NOT NULL,
	[Nom_NivelEducativo] [char](30) NOT NULL
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[PERFILPROFESION]    Script Date: 12/19/2020 6:53:34 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[PERFILPROFESION]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[PERFILPROFESION](
	[Cod_Perfil] [smallint] NOT NULL,
	[Cod_Profesion] [smallint] NOT NULL
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[PERMISOS]    Script Date: 12/19/2020 6:53:34 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[PERMISOS]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[PERMISOS](
	[Cod_Usuario] [smallint] NOT NULL,
	[Cod_Opcion] [char](3) NOT NULL,
	[Nivel] [char](1) NOT NULL
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[PERMISOS_WEB]    Script Date: 12/19/2020 6:53:34 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[PERMISOS_WEB]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[PERMISOS_WEB](
	[Usuario] [char](12) NOT NULL,
	[Pagina] [varchar](max) NOT NULL,
	[Permiso] [bit] NOT NULL,
	[Descripcion] [varchar](max) NOT NULL,
	[Page] [varchar](max) NOT NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[PERSONALIDADES]    Script Date: 12/19/2020 6:53:34 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[PERSONALIDADES]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[PERSONALIDADES](
	[Cod_Perfil] [smallint] NOT NULL,
	[Cod_Personalidad] [smallint] NOT NULL,
	[Descripcion] [char](50) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Cod_Perfil] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[PLANTILLAS_CERTIFICADOS]    Script Date: 12/19/2020 6:53:34 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[PLANTILLAS_CERTIFICADOS]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[PLANTILLAS_CERTIFICADOS](
	[Autonum] [int] IDENTITY(1,1) NOT NULL,
	[Plantilla] [text] NULL,
	[Nomb_Plantilla] [varchar](100) NOT NULL,
	[Aprobacion] [bit] NOT NULL,
	[Tipo_plantilla] [varchar](20) NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[PPTOGASTOSDET]    Script Date: 12/19/2020 6:53:34 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[PPTOGASTOSDET]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[PPTOGASTOSDET](
	[Num_Ppto] [int] NOT NULL,
	[Cod_Empleado] [smallint] NOT NULL,
	[Empleado] [char](45) NOT NULL,
	[Mes1] [float] NOT NULL,
	[Mes2] [float] NOT NULL,
	[Mes3] [float] NOT NULL,
	[Mes4] [float] NOT NULL,
	[Mes5] [float] NOT NULL,
	[Mes6] [float] NOT NULL,
	[Mes7] [float] NOT NULL,
	[Mes8] [float] NOT NULL,
	[Mes9] [float] NOT NULL,
	[Mes10] [float] NOT NULL,
	[Mes11] [float] NOT NULL,
	[Mes12] [float] NOT NULL,
	[Mes13] [float] NOT NULL,
	[Fec_Propuesta_A] [char](8) NOT NULL,
	[Val_Propuesto_A] [float] NOT NULL,
	[Por_Propuesto_A] [char](10) NOT NULL,
	[Fec_Aprobado] [char](8) NOT NULL,
	[Fec_Desaprobado] [char](8) NOT NULL,
	[Cod_Usuario] [smallint] NULL,
	[Estado] [char](1) NOT NULL,
	[Mes1Prov] [float] NOT NULL,
	[Mes2Prov] [float] NOT NULL,
	[Mes3Prov] [float] NOT NULL,
	[Mes4Prov] [float] NOT NULL,
	[Mes5Prov] [float] NOT NULL,
	[Mes6Prov] [float] NOT NULL,
	[Mes7Prov] [float] NOT NULL,
	[Mes8Prov] [float] NOT NULL,
	[Mes9Prov] [float] NOT NULL,
	[Mes10Prov] [float] NOT NULL,
	[Mes11Prov] [float] NOT NULL,
	[Mes12Prov] [float] NOT NULL,
	[Mes1SS] [float] NOT NULL,
	[Mes2SS] [float] NOT NULL,
	[Mes3SS] [float] NOT NULL,
	[Mes4SS] [float] NOT NULL,
	[Mes5SS] [float] NOT NULL,
	[Mes6SS] [float] NOT NULL,
	[Mes7SS] [float] NOT NULL,
	[Mes8SS] [float] NOT NULL,
	[Mes9SS] [float] NOT NULL,
	[Mes10SS] [float] NOT NULL,
	[Mes11SS] [float] NOT NULL,
	[Mes12SS] [float] NOT NULL,
	[TipoPP] [char](1) NOT NULL,
	[Consecutivo] [int] NOT NULL
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[PPTOGASTOSENC]    Script Date: 12/19/2020 6:53:34 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[PPTOGASTOSENC]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[PPTOGASTOSENC](
	[Num_Ppto] [int] NOT NULL,
	[Desde] [char](7) NOT NULL,
	[Hasta] [char](7) NOT NULL,
	[Descripcion] [char](50) NOT NULL,
	[Estado] [char](1) NOT NULL,
	[TipoPpto] [char](1) NOT NULL,
	[FecRolling] [char](7) NOT NULL,
	[Cod_AccesoDatos] [numeric](18, 0) NOT NULL,
 CONSTRAINT [PK_PPTOGASTOSENC] PRIMARY KEY CLUSTERED 
(
	[Num_Ppto] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY],
 CONSTRAINT [IX_PPTOGASTOSENC] UNIQUE NONCLUSTERED 
(
	[Descripcion] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[PPTOINGRESOS]    Script Date: 12/19/2020 6:53:34 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[PPTOINGRESOS]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[PPTOINGRESOS](
	[Num_Ppto] [int] NOT NULL,
	[Desde] [char](6) NOT NULL,
	[Hasta] [char](6) NOT NULL,
	[Mes1] [float] NOT NULL,
	[Mes2] [float] NOT NULL,
	[Mes3] [float] NOT NULL,
	[Mes4] [float] NOT NULL,
	[Mes5] [float] NOT NULL,
	[Mes6] [float] NOT NULL,
	[Mes7] [float] NOT NULL,
	[Mes8] [float] NOT NULL,
	[Mes9] [float] NOT NULL,
	[Mes10] [float] NOT NULL,
	[Mes11] [float] NOT NULL,
	[Mes12] [float] NOT NULL,
	[Estado] [char](1) NOT NULL
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[PREGUNTAS]    Script Date: 12/19/2020 6:53:34 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[PREGUNTAS]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[PREGUNTAS](
	[Cod_Pregunta] [smallint] NOT NULL,
	[Nom_Pregunta] [char](500) NOT NULL,
	[Tipo_Pregunta] [char](1) NOT NULL,
	[Dirigida] [char](1) NOT NULL,
	[Definicion] [char](5000) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Cod_Pregunta] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[PRESTAMOS]    Script Date: 12/19/2020 6:53:34 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[PRESTAMOS]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[PRESTAMOS](
	[Cod_Empleado] [smallint] NOT NULL,
	[MontoInicial] [numeric](18, 0) NOT NULL,
	[MontoFinal] [numeric](18, 0) NOT NULL,
	[Periodos] [numeric](6, 2) NOT NULL,
	[EfectivoAnual] [numeric](6, 2) NOT NULL,
	[FechaInicial] [char](8) NOT NULL,
	[Cod_ConceptoIntereses] [smallint] NOT NULL,
	[Cod_ConceptoCapital] [smallint] NOT NULL,
	[AutoNum] [numeric](18, 0) IDENTITY(1,1) NOT NULL,
	[AutoNumNovedadesCap] [int] NOT NULL,
	[AutoNumNovedadesInt] [int] NOT NULL,
	[TipoInteres] [char](1) NOT NULL,
	[Aplica] [smallint] NOT NULL
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[PRIMAS]    Script Date: 12/19/2020 6:53:34 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[PRIMAS]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[PRIMAS](
	[Cod_Empleado] [smallint] NOT NULL,
	[Desde] [char](8) NOT NULL,
	[Hasta] [char](8) NOT NULL,
	[Dias_Base_Acumulados] [smallint] NULL,
	[Salario_Base_Acumulado] [float] NULL,
	[Valor_Prima] [float] NOT NULL,
	[Fec_Aprobado] [char](8) NOT NULL,
	[Fec_Desaprobado] [char](8) NOT NULL,
	[Cod_Usuario] [char](4) NULL,
	[Estado] [char](1) NOT NULL,
	[Fec_Liquidacion] [char](8) NOT NULL
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[PROFESIONES]    Script Date: 12/19/2020 6:53:34 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[PROFESIONES]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[PROFESIONES](
	[Cod_Profesion] [smallint] NOT NULL,
	[Descripcion] [char](30) NOT NULL,
 CONSTRAINT [PK_PROFESIONES] PRIMARY KEY CLUSTERED 
(
	[Cod_Profesion] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY],
 CONSTRAINT [IX_PROFESIONES] UNIQUE NONCLUSTERED 
(
	[Descripcion] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[PROGRAMAS]    Script Date: 12/19/2020 6:53:34 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[PROGRAMAS]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[PROGRAMAS](
	[Cod_Programa] [smallint] NOT NULL,
	[Tipo_Programa] [char](1) NOT NULL,
	[Nom_Programa] [char](50) NOT NULL,
	[Costo_Promedio_Programa] [float] NOT NULL,
	[Duracion] [int] NOT NULL,
	[Calificacion] [smallint] NOT NULL,
	[Objetivo] [text] NOT NULL,
	[Estado] [char](1) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Cod_Programa] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[PROGRAMASSALUDOCUPACIONAL]    Script Date: 12/19/2020 6:53:34 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[PROGRAMASSALUDOCUPACIONAL]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[PROGRAMASSALUDOCUPACIONAL](
	[Cod_Programa] [smallint] NOT NULL,
	[Cod_Programa_Maestro] [smallint] NOT NULL,
	[Tipo_Programa] [char](1) NOT NULL,
	[Cod_Capacitador] [smallint] NOT NULL,
	[Costo_Aproximado_Programa] [int] NOT NULL,
	[Tiempo_Estimado_Por_Unidad] [smallint] NOT NULL,
	[Total_Candidatos] [smallint] NOT NULL,
	[Total_Participantes] [smallint] NOT NULL,
	[Efectividad] [real] NOT NULL,
	[Cod_Usuario] [smallint] NOT NULL,
	[Fecha_Aprobado] [char](8) NOT NULL,
	[Fecha_Inicio] [char](8) NOT NULL,
	[Fecha_Cierre] [char](8) NOT NULL,
	[Fecha_Real_Inicio] [char](8) NOT NULL,
	[Fecha_Real_Cierre] [char](8) NOT NULL,
	[Estado] [char](1) NOT NULL,
	[Fecha_Req] [char](8) NOT NULL,
	[Hora_Req] [char](5) NOT NULL,
	[Cobertura] [smallint] NOT NULL
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[PUC]    Script Date: 12/19/2020 6:53:34 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[PUC]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[PUC](
	[Codigo] [char](10) NULL,
	[Nom_Cta] [char](50) NOT NULL,
	[Cod_Concepto] [smallint] NULL,
	[Clase] [char](1) NULL,
	[Naturaleza] [char](1) NULL,
	[Clasificacion_Contable] [char](5) NULL,
	[Cod_Secundario] [char](30) NULL,
	[UtilizaSucursal] [char](1) NOT NULL,
	[UtilizaTercero] [char](1) NOT NULL,
	[UbiReportes] [int] NULL,
	[TipoTercero] [char](1) NOT NULL,
	[CodigoExterno] [char](20) NOT NULL,
	[CodigoLocal] [char](20) NOT NULL,
	[UtilizaProfit] [char](1) NOT NULL,
	[UtilizaCostCenter] [char](1) NOT NULL,
	[SubCta] [smallint] NOT NULL
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[RANGO_INCAPACIDADES]    Script Date: 12/19/2020 6:53:34 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[RANGO_INCAPACIDADES]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[RANGO_INCAPACIDADES](
	[Codigo] [smallint] NOT NULL,
	[Desde] [smallint] NOT NULL,
	[Hasta] [smallint] NOT NULL,
	[Porc] [real] NOT NULL,
	[PorcEmpresa] [real] NOT NULL
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[RANGOSPRIMAS]    Script Date: 12/19/2020 6:53:34 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[RANGOSPRIMAS]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[RANGOSPRIMAS](
	[Desde] [real] NOT NULL,
	[Hasta] [real] NOT NULL,
	[Por_Aplicar] [real] NOT NULL,
	[Val_Aplicar] [real] NOT NULL,
	[Cod_Variable] [smallint] NOT NULL,
	[Dias_Aplicar] [smallint] NOT NULL
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[RANGOSSOLPENSION]    Script Date: 12/19/2020 6:53:34 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[RANGOSSOLPENSION]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[RANGOSSOLPENSION](
	[Ano] [smallint] NOT NULL,
	[Desde] [real] NOT NULL,
	[Hasta] [real] NOT NULL,
	[Porc_Sol_Pen] [real] NOT NULL
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[REFERENCIAS_PERSONALES]    Script Date: 12/19/2020 6:53:34 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[REFERENCIAS_PERSONALES]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[REFERENCIAS_PERSONALES](
	[Cod_HojaVida] [smallint] NOT NULL,
	[Nombre] [char](50) NOT NULL,
	[Ocupacion] [char](50) NOT NULL,
	[Telefono] [char](14) NULL,
	[Verificado] [char](1) NOT NULL,
	[Observaciones] [text] NOT NULL,
	[Tipo_Referencia] [char](1) NOT NULL,
	[Cod_Referencia_Personal] [int] IDENTITY(1,1) NOT NULL,
 CONSTRAINT [PK_YourTable] PRIMARY KEY CLUSTERED 
(
	[Cod_Referencia_Personal] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[RELACIONBANCOEMPLEADO]    Script Date: 12/19/2020 6:53:34 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[RELACIONBANCOEMPLEADO]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[RELACIONBANCOEMPLEADO](
	[Cod_Empleado] [smallint] NOT NULL,
	[FormaPago] [char](1) NOT NULL,
	[Vigencia] [char](8) NOT NULL,
	[Prioridad] [char](1) NOT NULL,
	[Tipo_Cta] [char](1) NOT NULL,
	[Banco] [char](15) NOT NULL,
	[Num_Cta] [char](20) NOT NULL,
	[ValorDivision] [float] NOT NULL,
	[AutoNum] [numeric](18, 0) IDENTITY(1,1) NOT NULL
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[RELACIONCAPACITADORESPROGRAMAS]    Script Date: 12/19/2020 6:53:34 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[RELACIONCAPACITADORESPROGRAMAS]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[RELACIONCAPACITADORESPROGRAMAS](
	[Cod_Capacitador] [smallint] NOT NULL,
	[Cod_Programa] [smallint] NOT NULL,
	[Costo_Programa] [int] NOT NULL,
	[Duracion] [int] NOT NULL,
	[Calificacion] [smallint] NOT NULL,
	[Alcance] [text] NOT NULL,
	[Estado] [char](1) NOT NULL,
	[Cobertura] [int] NOT NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[RELACIONCARGOSPROGRAMAS]    Script Date: 12/19/2020 6:53:34 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[RELACIONCARGOSPROGRAMAS]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[RELACIONCARGOSPROGRAMAS](
	[Cod_Cargo] [smallint] NOT NULL,
	[Cod_Programa] [smallint] NOT NULL,
	[Justificacion] [text] NOT NULL,
	[Estado] [char](1) NOT NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[RELACIONCARGOSWBS]    Script Date: 12/19/2020 6:53:34 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[RELACIONCARGOSWBS]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[RELACIONCARGOSWBS](
	[Cod_Cargo_WBS] [smallint] NOT NULL,
	[Nom_Cargo_WBS] [char](40) NOT NULL,
	[Cod_Cargo] [smallint] NOT NULL,
	[Cod_Secuencia_WBS] [smallint] NOT NULL,
	[Cod_Dep] [smallint] NOT NULL,
	[WBS_Usado] [char](1) NOT NULL
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[RELACIONCONENTIDAD]    Script Date: 12/19/2020 6:53:34 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[RELACIONCONENTIDAD]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[RELACIONCONENTIDAD](
	[Cod_Entidad] [smallint] NOT NULL,
	[Cod_Concepto] [smallint] NOT NULL,
	[Cod_Detalle] [smallint] NOT NULL,
	[AutoNum] [numeric](18, 0) IDENTITY(1,1) NOT NULL
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[RELACIONEMPCONPUC]    Script Date: 12/19/2020 6:53:34 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[RELACIONEMPCONPUC]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[RELACIONEMPCONPUC](
	[Cod_Empleado] [smallint] NOT NULL,
	[Cod_Concepto] [smallint] NOT NULL,
	[Cod_Puc] [char](10) NULL
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[RELACIONEMPCTASUBCTA]    Script Date: 12/19/2020 6:53:34 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[RELACIONEMPCTASUBCTA]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[RELACIONEMPCTASUBCTA](
	[Cod_Empleado] [smallint] NULL,
	[Cta] [char](20) NULL,
	[SubCta] [char](4) NULL,
	[Tipo_SubCta] [int] NULL
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[RELACIONEMPLEADOSWBS]    Script Date: 12/19/2020 6:53:34 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[RELACIONEMPLEADOSWBS]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[RELACIONEMPLEADOSWBS](
	[Cod_Empleado] [smallint] NOT NULL,
	[WBS] [char](6) NOT NULL,
	[CodigoCcos] [smallint] NOT NULL,
	[Consecutivo] [smallint] NOT NULL
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[RELACIONEMPTAR]    Script Date: 12/19/2020 6:53:34 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[RELACIONEMPTAR]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[RELACIONEMPTAR](
	[Cod_Empleado] [smallint] NOT NULL,
	[Cod_Concepto] [smallint] NOT NULL,
	[Cod_Tarifa_Reducida] [smallint] NOT NULL,
	[Acumula] [char](1) NOT NULL,
	[Cod_Depto] [smallint] NOT NULL
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[RELACIONGASTOCONPUC]    Script Date: 12/19/2020 6:53:34 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[RELACIONGASTOCONPUC]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[RELACIONGASTOCONPUC](
	[Cod_Clase] [smallint] NOT NULL,
	[Cod_Tipo_Campo] [char](1) NOT NULL,
	[Cod_Detalle] [smallint] NOT NULL,
	[Cod_Tipo_Gasto] [smallint] NOT NULL,
	[Cod_Concepto] [smallint] NOT NULL,
	[Cod_Cta] [char](10) NULL,
	[AutoNum] [numeric](18, 0) IDENTITY(1,1) NOT NULL
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[RELACIONPAGOSASOCIADOS]    Script Date: 12/19/2020 6:53:34 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[RELACIONPAGOSASOCIADOS]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[RELACIONPAGOSASOCIADOS](
	[RelacionPagoDivision] [int] NOT NULL,
	[RelacionPagoDivisionSecundario] [int] NOT NULL
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[RELACIONSOLVAC]    Script Date: 12/19/2020 6:53:34 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[RELACIONSOLVAC]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[RELACIONSOLVAC](
	[Cod_Solicitud] [int] NOT NULL,
	[Cod_Vacaciones] [int] NOT NULL
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[REQUERIMIENTOS]    Script Date: 12/19/2020 6:53:34 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[REQUERIMIENTOS]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[REQUERIMIENTOS](
	[Cod_Requerimiento] [smallint] NOT NULL,
	[Cod_Usuario] [smallint] NOT NULL,
	[Fecha_Req] [char](8) NOT NULL,
	[Hora_Req] [char](5) NOT NULL,
	[Cod_Motivo] [char](1) NOT NULL,
	[Cod_Cargo] [smallint] NOT NULL,
	[Cod_Perfil] [smallint] NOT NULL,
	[Fecha_Ing_Aprox] [char](8) NOT NULL,
	[Puntaje1] [smallint] NOT NULL,
	[Puntaje2] [smallint] NOT NULL,
	[Cod_Zona] [smallint] NOT NULL,
	[Cod_Sucursal] [smallint] NOT NULL,
	[Cod_Ccosto] [smallint] NOT NULL,
	[Cod_Depto] [smallint] NOT NULL,
	[Fecha_Evento] [char](8) NOT NULL,
	[Fecha_Cierre] [char](8) NOT NULL,
	[Estado] [char](1) NOT NULL,
	[Descripcion] [text] NOT NULL,
	[Cod_Solicitante] [smallint] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Cod_Requerimiento] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[RESUMENAPORTES]    Script Date: 12/19/2020 6:53:34 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[RESUMENAPORTES]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[RESUMENAPORTES](
	[Cod_Empleado] [smallint] NOT NULL,
	[Cod_Concepto] [smallint] NOT NULL,
	[Val_Novedad] [float] NOT NULL,
	[Cod_Sucursal] [smallint] NOT NULL,
	[Fec_Nomina] [char](8) NOT NULL,
	[Num_Registro] [smallint] NOT NULL
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[RETEFUENTE]    Script Date: 12/19/2020 6:53:34 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[RETEFUENTE]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[RETEFUENTE](
	[Desde] [real] NOT NULL,
	[Hasta] [real] NOT NULL,
	[Por_ReteFuente] [real] NOT NULL,
	[Val_ReteFuente] [real] NOT NULL
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[RETEFUENTETEMP0]    Script Date: 12/19/2020 6:53:34 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[RETEFUENTETEMP0]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[RETEFUENTETEMP0](
	[Cod_Empleado] [smallint] NOT NULL,
	[Empleado] [char](45) NOT NULL,
	[FecLimiteDeducible] [char](8) NOT NULL,
	[VigenciaDependientes] [char](8) NOT NULL,
	[Fec_Ingreso] [char](8) NOT NULL,
	[Cedula] [char](12) NOT NULL,
	[Val_Novedad] [float] NULL,
	[Deducible] [float] NOT NULL,
	[DedAlimentacion] [float] NOT NULL,
	[Salario] [float] NOT NULL,
	[MetodoRetefuente] [char](1) NOT NULL,
	[Por_Retefuente] [real] NOT NULL,
	[FecSubstitucionPatronal] [char](8) NOT NULL,
	[Declarante] [char](1) NOT NULL,
	[DedSaludEdu] [float] NOT NULL,
	[DiasPrepagada] [smallint] NOT NULL,
	[DiasVivienda] [smallint] NOT NULL,
	[DiasDependientes] [smallint] NOT NULL,
	[Estado] [char](1) NOT NULL,
	[Tipo_Contrato] [char](1) NOT NULL,
	[Tipo_Salario] [char](1) NOT NULL
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[RETEFUENTETEMP1]    Script Date: 12/19/2020 6:53:34 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[RETEFUENTETEMP1]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[RETEFUENTETEMP1](
	[Cod_Empleado] [smallint] NOT NULL,
	[Empleado] [char](45) NOT NULL,
	[FecLimiteDeducible] [char](8) NOT NULL,
	[VigenciaDependientes] [char](8) NOT NULL,
	[Fec_Ingreso] [char](8) NOT NULL,
	[Cedula] [char](12) NOT NULL,
	[Val_Novedad] [float] NULL,
	[Deducible] [float] NOT NULL,
	[DedAlimentacion] [float] NOT NULL,
	[Salario] [float] NOT NULL,
	[MetodoRetefuente] [char](1) NOT NULL,
	[Por_Retefuente] [real] NOT NULL,
	[FecSubstitucionPatronal] [char](8) NOT NULL,
	[Declarante] [char](1) NOT NULL,
	[DedSaludEdu] [float] NOT NULL,
	[DiasPrepagada] [smallint] NOT NULL,
	[DiasVivienda] [smallint] NOT NULL,
	[DiasDependientes] [smallint] NOT NULL,
	[Estado] [char](1) NOT NULL,
	[Tipo_Contrato] [char](1) NOT NULL,
	[Tipo_Salario] [char](1) NOT NULL
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[RIESGOS]    Script Date: 12/19/2020 6:53:34 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[RIESGOS]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[RIESGOS](
	[Cod_Riesgo] [smallint] NOT NULL,
	[Tipo_Riesgo] [char](1) NOT NULL,
	[Nom_Riesgo] [char](30) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Cod_Riesgo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[SALARIOS]    Script Date: 12/19/2020 6:53:34 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[SALARIOS]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[SALARIOS](
	[Cod_Empleado] [smallint] NOT NULL,
	[Salario] [float] NOT NULL,
	[Fec_Salario] [char](8) NOT NULL,
	[Aprobado] [char](1) NOT NULL,
	[Por_Aumento] [real] NULL,
	[Aum_Propuesto] [float] NOT NULL,
	[Autoriza] [char](25) NOT NULL,
	[Mot_Cambio_Sal] [char](1) NOT NULL,
	[Por_Salario] [int] NOT NULL,
	[Porc_Salario] [float] NOT NULL,
	[FechaAplicaRetroactivo] [char](8) NOT NULL,
	[Beneficios] [float] NOT NULL,
	[AutoNum] [numeric](18, 0) IDENTITY(1,1) NOT NULL,
	[Cod_Usuario] [smallint] NOT NULL
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[SOLICITUD_APROBA]    Script Date: 12/19/2020 6:53:34 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[SOLICITUD_APROBA]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[SOLICITUD_APROBA](
	[Id_Solicitud] [int] IDENTITY(1,1) NOT NULL,
	[Fecha_Solic] [char](8) NOT NULL,
	[Cod_Emple] [smallint] NOT NULL,
	[Tipo_Solic] [varchar](2) NOT NULL,
	[Cant_Aprobar] [real] NOT NULL,
	[Tipo_Cant] [varchar](2) NOT NULL,
	[Id_Aprobador] [int] NOT NULL,
	[Aprobado] [bit] NOT NULL,
	[Anulado] [bit] NOT NULL,
	[Depto_Sol] [smallint] NOT NULL
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[SOLICITUDES]    Script Date: 12/19/2020 6:53:34 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[SOLICITUDES]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[SOLICITUDES](
	[Cod_Solicitud] [int] IDENTITY(1,1) NOT NULL,
	[Cod_Empleado] [smallint] NOT NULL,
	[Cod_Aprobador] [smallint] NOT NULL,
	[Fec_Solicitud] [datetime] NOT NULL,
	[Tipo_Solicitud] [varchar](1) NOT NULL,
	[Estado] [varchar](2) NULL,
	[Fec_Salida] [datetime] NULL,
	[Fec_Llegada] [datetime] NULL,
	[Modo_Vacaciones] [varchar](1) NULL,
	[Cantidad] [int] NOT NULL,
	[Cod_Motivo_Rechazo] [smallint] NULL,
	[Observacion] [text] NULL,
	[Cod_Concepto] [smallint] NOT NULL,
	[Descripcion] [varchar](250) NULL,
 CONSTRAINT [PK_SOLICITUD] PRIMARY KEY CLUSTERED 
(
	[Cod_Solicitud] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[SUBPREGUNTAS]    Script Date: 12/19/2020 6:53:34 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[SUBPREGUNTAS]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[SUBPREGUNTAS](
	[Cod_SubPregunta] [smallint] NOT NULL,
	[Cod_Pregunta] [smallint] NOT NULL,
	[Nom_SubPregunta] [char](500) NOT NULL
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[SUCURSALES]    Script Date: 12/19/2020 6:53:34 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[SUCURSALES]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[SUCURSALES](
	[Cod_Sucursal] [smallint] NOT NULL,
	[Cod_Zona] [smallint] NOT NULL,
	[Nom_Sucursal] [char](30) NOT NULL,
	[Cumplio_Meta] [char](1) NOT NULL,
	[Cod_CajaComp] [smallint] NOT NULL,
	[Sucursal_Sec] [char](2) NOT NULL,
	[EsEmpresa] [char](1) NOT NULL,
	[Nit_Sucursal] [char](9) NOT NULL,
	[Digito_Verificacion] [char](1) NOT NULL,
	[Unificado] [char](2) NOT NULL,
	[Cod_Agencia] [smallint] NOT NULL,
 CONSTRAINT [PK_SUCURSALES] PRIMARY KEY CLUSTERED 
(
	[Cod_Sucursal] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY],
 CONSTRAINT [IX_SUCURSALES] UNIQUE NONCLUSTERED 
(
	[Nom_Sucursal] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[TABLA_TEMP]    Script Date: 12/19/2020 6:53:34 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[TABLA_TEMP]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[TABLA_TEMP](
	[Codigo] [smallint] NOT NULL,
	[Nom_Tabla] [char](30) NOT NULL
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[TABLAS_TMP]    Script Date: 12/19/2020 6:53:34 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[TABLAS_TMP]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[TABLAS_TMP](
	[Codigo] [smallint] NOT NULL,
	[Nom_Tabla] [char](30) NOT NULL,
	[Cod_Consecutivo] [int] NOT NULL
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[TARIFA_PLENA]    Script Date: 12/19/2020 6:53:34 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[TARIFA_PLENA]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[TARIFA_PLENA](
	[Codigo] [smallint] NOT NULL,
	[Descripcion] [char](25) NOT NULL,
	[Cod_Zona] [smallint] NOT NULL,
	[Cod_Sucursal] [smallint] NOT NULL,
	[Cod_Ccosto] [smallint] NOT NULL,
	[Valor] [float] NOT NULL,
	[Cod_Depto] [smallint] NOT NULL,
	[Cod_Concepto] [smallint] NOT NULL
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[TARIFA_REDUCIDA]    Script Date: 12/19/2020 6:53:34 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[TARIFA_REDUCIDA]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[TARIFA_REDUCIDA](
	[Codigo] [smallint] NOT NULL,
	[Descripcion] [char](25) NOT NULL,
	[Cod_Zona] [smallint] NOT NULL,
	[Cod_Sucursal] [smallint] NOT NULL,
	[Cod_Ccosto] [smallint] NOT NULL,
	[Cod_Concepto] [smallint] NOT NULL,
	[Valor] [float] NOT NULL,
	[Cod_Depto] [smallint] NOT NULL
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[TEMPO_HISTORICO]    Script Date: 12/19/2020 6:53:34 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[TEMPO_HISTORICO]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[TEMPO_HISTORICO](
	[Cedula] [varchar](12) NOT NULL,
	[Nombre_Ccost] [varchar](30) NULL,
	[Cod_Empleado] [smallint] NULL,
	[Cod_Concepto] [smallint] NULL,
	[Fec_Novedad] [varchar](12) NULL,
	[Fec_Ing_Novedad] [varchar](12) NULL,
	[Val_Novedad] [float] NULL,
	[Cod_Ccosto] [smallint] NULL,
	[C1] [varchar](20) NULL,
	[C2] [varchar](20) NULL,
	[C3] [varchar](20) NULL,
	[C4] [varchar](20) NULL
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[TemporalFecha]    Script Date: 12/19/2020 6:53:34 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[TemporalFecha]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[TemporalFecha](
	[Cod_Empleado] [smallint] NOT NULL,
	[FechaInicio] [char](8) NOT NULL,
	[FecFinal] [varchar](8) NOT NULL,
	[Cod_Concepto] [int] NOT NULL,
	[FechaInicioPatronal] [char](8) NOT NULL
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[TERCEROS]    Script Date: 12/19/2020 6:53:34 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[TERCEROS]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[TERCEROS](
	[Cod_Tercero] [smallint] NOT NULL,
	[Documento] [char](15) NOT NULL,
	[Dv] [char](2) NOT NULL,
	[Tipo_Documento] [char](2) NOT NULL,
	[Tipo_Tercero] [char](10) NOT NULL,
	[PNombre] [char](30) NOT NULL,
	[SNombre] [char](30) NOT NULL,
	[PApellido] [char](30) NOT NULL,
	[SApellido] [char](30) NOT NULL,
	[Tercero] [char](120) NOT NULL,
	[Dir_Elec] [char](100) NOT NULL,
	[Cargo] [varchar](100) NOT NULL,
 CONSTRAINT [PK_TERCEROS] PRIMARY KEY CLUSTERED 
(
	[Cod_Tercero] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[TITULOS_ACADEMICOS]    Script Date: 12/19/2020 6:53:34 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[TITULOS_ACADEMICOS]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[TITULOS_ACADEMICOS](
	[Cod_Perfil] [smallint] NULL,
	[Cod_Titulo] [smallint] NULL,
	[Descripcion] [char](50) NULL
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[TITULOSACADEMICOS]    Script Date: 12/19/2020 6:53:34 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[TITULOSACADEMICOS]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[TITULOSACADEMICOS](
	[Cod_Titulo] [smallint] NOT NULL,
	[Descripcion] [char](50) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Cod_Titulo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[Tmp_PlanillaPago]    Script Date: 12/19/2020 6:53:34 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Tmp_PlanillaPago]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Tmp_PlanillaPago](
	[Cedula] [char](12) NULL,
	[Cod_Emple] [smallint] NULL,
	[Cod_Pension] [smallint] NULL,
	[Dias_Pension] [real] NULL,
	[IBC_Pension] [float] NULL,
	[Val_Pension] [float] NULL,
	[Cod_SolidPension] [smallint] NULL,
	[Val_SolidPension] [float] NULL,
	[Cod_EPS] [smallint] NULL,
	[Dias_EPS] [real] NULL,
	[IBC_EPS] [float] NULL,
	[Val_EPS] [float] NULL,
	[Cod_ARL] [smallint] NULL,
	[Dias_ARL] [real] NULL,
	[IBC_ARL] [float] NULL,
	[Val_ARL] [float] NULL,
	[Cod_Caja] [smallint] NULL,
	[Dias_Caja] [real] NULL,
	[IBC_Caja] [float] NULL,
	[Val_Caja] [float] NULL,
	[Cod_Sena] [smallint] NULL,
	[Val_Sena] [float] NULL,
	[Cod_ICBF] [smallint] NULL,
	[Val_ICBF] [float] NULL,
	[Fec_Nomina] [char](8) NULL
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[TURNOS]    Script Date: 12/19/2020 6:53:34 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[TURNOS]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[TURNOS](
	[Cod_Turno] [smallint] NOT NULL,
	[Nom_Turno] [char](50) NOT NULL,
	[Hora_Ent] [char](10) NOT NULL,
	[Hora_Sal] [char](10) NOT NULL,
	[Tiempo_Alm] [char](10) NOT NULL,
	[Estado_Tur] [char](1) NOT NULL,
	[Tipo] [char](1) NOT NULL,
	[Recargo] [char](1) NOT NULL,
	[Cod_Depto] [smallint] NOT NULL
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[USUARIOS]    Script Date: 12/19/2020 6:53:34 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[USUARIOS]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[USUARIOS](
	[Cod_Usuario] [smallint] NOT NULL,
	[Usuario] [char](10) NOT NULL,
	[Nombre] [char](30) NOT NULL,
	[Clave] [char](20) NULL,
	[Fec_Ingreso] [char](8) NOT NULL,
	[Fec_Ult_Acceso] [char](8) NOT NULL,
	[Fec_Actualizo_Clave] [char](8) NOT NULL,
	[Fec_Eliminado] [char](8) NOT NULL,
	[Nivel] [char](1) NOT NULL,
	[Mod_Nomina] [char](1) NOT NULL,
	[Mod_Recursos] [char](1) NOT NULL,
	[Estado] [char](1) NOT NULL,
	[AutorizaPagos] [char](1) NOT NULL,
	[Cedula] [char](12) NOT NULL,
	[AjustaProvisiones] [char](1) NOT NULL,
	[Tipousuario] [char](1) NOT NULL,
	[Val_Asignado] [smallint] NOT NULL,
	[VisualizaSalarios] [char](1) NOT NULL,
	[TipoUsuario] [char](1) NOT NULL,
	[PerfilAsignado] [smallint] NOT NULL,
	[Dir_Elec] [varchar](100) NOT NULL,
	[Analista] [varchar](1) NOT NULL,
 CONSTRAINT [PK_USUARIOS] PRIMARY KEY CLUSTERED 
(
	[Cod_Usuario] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[USUARIOS_WEB]    Script Date: 12/19/2020 6:53:34 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[USUARIOS_WEB]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[USUARIOS_WEB](
	[Usuario] [char](12) NOT NULL,
	[Clave] [varchar](20) NOT NULL
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[UsuWeb_Empresas]    Script Date: 12/19/2020 6:53:34 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[UsuWeb_Empresas]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[UsuWeb_Empresas](
	[Usuario] [char](12) NOT NULL,
	[Empresa] [smallint] NOT NULL
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[VACACIONES]    Script Date: 12/19/2020 6:53:34 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[VACACIONES]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[VACACIONES](
	[Cod_Empleado] [smallint] NOT NULL,
	[Periodo] [smallint] NOT NULL,
	[SubPeriodo] [smallint] NOT NULL,
	[Desde] [char](8) NOT NULL,
	[Hasta] [char](8) NOT NULL,
	[Dias_Tiempo] [real] NOT NULL,
	[Liq_Vacaciones] [float] NOT NULL,
	[Dias_Disponibles] [real] NOT NULL,
	[Dias_Anticipados] [real] NOT NULL,
	[Dias_Dinero] [real] NOT NULL,
	[Fec_Aprobado] [char](8) NULL,
	[Fec_Desaprobado] [char](8) NULL,
	[Estado] [char](1) NULL,
	[Fec_Pago] [char](8) NULL,
	[Cod_Usuario] [smallint] NULL,
	[Clase] [char](1) NULL,
	[Normales] [char](1) NOT NULL,
	[Descuentos] [char](1) NOT NULL,
	[Fec_Cierre] [char](8) NOT NULL,
	[Novedades] [char](1) NOT NULL,
	[ProporcionalesP] [char](1) NOT NULL,
	[NumComprobante] [char](10) NOT NULL,
	[EstadoRec] [char](1) NOT NULL,
	[PagaSueldo] [char](1) NOT NULL,
	[AutoNum] [int] IDENTITY(1,1) NOT NULL,
	[Util_A] [char](1) NOT NULL
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[VACACIONESTEMP]    Script Date: 12/19/2020 6:53:34 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[VACACIONESTEMP]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[VACACIONESTEMP](
	[Cod_Empleado] [smallint] NOT NULL,
	[Periodo] [smallint] NOT NULL,
	[SubPeriodo] [smallint] NOT NULL,
	[Desde] [char](8) NOT NULL,
	[Hasta] [char](8) NOT NULL,
	[Dias_Tiempo] [real] NOT NULL,
	[Liq_Vacaciones] [float] NOT NULL,
	[Dias_Disponibles] [real] NOT NULL,
	[Dias_Anticipados] [real] NOT NULL,
	[Dias_Dinero] [real] NOT NULL,
	[Fec_Aprobado] [char](8) NULL,
	[Fec_Desaprobado] [char](8) NULL,
	[Estado] [char](1) NULL,
	[Fec_Pago] [char](8) NULL,
	[Cod_Usuario] [smallint] NULL,
	[Clase] [char](1) NULL,
	[Normales] [char](1) NOT NULL,
	[Descuentos] [char](1) NOT NULL,
	[Fec_Cierre] [char](8) NOT NULL,
	[Novedades] [char](1) NOT NULL,
	[ProporcionalesP] [char](1) NOT NULL,
	[NumComprobante] [char](10) NOT NULL,
	[EstadoRec] [char](1) NOT NULL,
	[PagaSueldo] [char](1) NOT NULL,
	[AutoNum] [int] IDENTITY(1,1) NOT NULL,
	[Util_A] [char](1) NOT NULL
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[VARIABLES]    Script Date: 12/19/2020 6:53:34 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[VARIABLES]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[VARIABLES](
	[Cod_Variable] [smallint] NOT NULL,
	[Descripcion] [char](50) NOT NULL,
	[Tipo_Dato] [char](20) NOT NULL,
	[Tamano] [int] NOT NULL,
	[Uso] [int] NOT NULL,
	[UsaConcepto] [char](1) NOT NULL,
	[Cod_Concepto] [smallint] NOT NULL,
	[Obligatoria] [bit] NOT NULL
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[VARIABLES_VACACIONES]    Script Date: 12/19/2020 6:53:34 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[VARIABLES_VACACIONES]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[VARIABLES_VACACIONES](
	[Cod_Variable] [smallint] NOT NULL,
	[Descripcion] [char](50) NOT NULL,
	[Tipo_Dato] [char](20) NOT NULL,
	[Tamano] [int] NOT NULL,
	[Uso] [int] NOT NULL,
	[UsaConcepto] [char](1) NOT NULL,
	[Cod_Concepto] [smallint] NOT NULL,
	[Obligatoria] [bit] NOT NULL
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[VARIABLESEMPLEADO]    Script Date: 12/19/2020 6:53:34 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[VARIABLESEMPLEADO]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[VARIABLESEMPLEADO](
	[Cod_Empleado] [smallint] NOT NULL,
	[Cod_Variable] [smallint] NOT NULL,
	[Valor] [varchar](max) NOT NULL,
	[Aplica] [int] NOT NULL,
	[Vigencia] [char](8) NOT NULL,
	[AutoNum] [int] IDENTITY(1,1) NOT NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[ZONAS]    Script Date: 12/19/2020 6:53:34 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[ZONAS]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[ZONAS](
	[Cod_Zona] [smallint] NOT NULL,
	[Nom_Zona] [char](25) NOT NULL,
	[Tipo_Zona] [smallint] NULL,
 CONSTRAINT [PK_ZONAS] PRIMARY KEY CLUSTERED 
(
	[Cod_Zona] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY],
 CONSTRAINT [IX_ZONAS] UNIQUE NONCLUSTERED 
(
	[Nom_Zona] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__ACCESODAT__Cod_U__008AE713]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[ACCESODATOS] ADD  DEFAULT ('') FOR [Cod_Usuario]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__ACCESODAT__Cod_E__017F0B4C]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[ACCESODATOS] ADD  DEFAULT ('') FOR [Cod_Entidad]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__ACCESODAT__Cod_D__02732F85]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[ACCESODATOS] ADD  DEFAULT ('') FOR [Cod_Detalle]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__AFP__Porc_Fondo__452A2A23]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[AFP] ADD  DEFAULT ('') FOR [Porc_Fondo]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__AFP__Porc_Comisi__461E4E5C]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[AFP] ADD  DEFAULT ('') FOR [Porc_Comision]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__AFP__Tope_Seguro__47127295]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[AFP] ADD  DEFAULT ('') FOR [Tope_Seguro]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__AFP__Porc_Seguro__4CCB4BEB]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[AFP] ADD  DEFAULT ('') FOR [Porc_Seguro]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__APROBACIO__Id_So__609318CD]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[APROBACIONES] ADD  DEFAULT ((0)) FOR [Id_Solicitud]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__APROBACIO__Id_Ap__61873D06]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[APROBACIONES] ADD  DEFAULT ((0)) FOR [Id_Aprobador]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__APROBACIO__Obser__627B613F]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[APROBACIONES] ADD  DEFAULT ('') FOR [Observaciones]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__APROBACIO__Fecha__636F8578]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[APROBACIONES] ADD  DEFAULT ('') FOR [Fecha_Aprobado]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__APROBACIO__Depto__6463A9B1]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[APROBACIONES] ADD  DEFAULT ((0)) FOR [Depto_Sol]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__APROBACIO__Nivel__6557CDEA]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[APROBACIONES] ADD  DEFAULT ((0)) FOR [Nivel]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__AUDITORIA__Descr__41A7AAB5]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[AUDITORIA_FUENTE] ADD  DEFAULT ('') FOR [Descripcion]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__BANCOS__Ult_Pago__480696CE]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[BANCOS] ADD  DEFAULT ('') FOR [Ult_PagoTarjeta]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__BANCOS__Tipo_Cta__48FABB07]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[BANCOS] ADD  DEFAULT ('') FOR [Tipo_Cta_Index]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__BANCOS__Cta_Banc__49EEDF40]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[BANCOS] ADD  DEFAULT ('') FOR [Cta_Bancaria_Index]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__BANCOS__Cta_PorP__73E5190C]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[BANCOS] ADD  DEFAULT ('') FOR [Cta_PorPagar]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__BANCOS__Nit_Banc__717DADAD]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[BANCOS] ADD  DEFAULT ('') FOR [Nit_Banco]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__BANCOS__Digito_V__7271D1E6]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[BANCOS] ADD  DEFAULT ('') FOR [Digito_Verificacion]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__BANCOS__Cod_Alte__1B3EDD4F]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[BANCOS] ADD  DEFAULT ('') FOR [Cod_Alterno_Bancolombia]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__CAJASCOMP__Nit_C__7D2E8C24]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[CAJASCOMP] ADD  DEFAULT ('') FOR [Nit_CajaComp]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__CAJASCOMP__Dig_V__7E22B05D]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[CAJASCOMP] ADD  DEFAULT ('') FOR [Dig_Verificacion]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__CAJASCOMP__Cod_S__38C4533E]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[CAJASCOMP] ADD  DEFAULT ('') FOR [Cod_Super]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__CAJASCOMP__Nit_C__2DC7A1DE]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[CAJASCOMP] ADD  DEFAULT ('') FOR [Nit_CajaCompensacion]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__CANDIDATO__Cod_C__55B597A7]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[CANDIDATOS] ADD  DEFAULT ('') FOR [Cod_Candidato]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__CANDIDATO__Cod_R__56A9BBE0]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[CANDIDATOS] ADD  DEFAULT ('') FOR [Cod_Requerimiento]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__CANDIDATO__Fec_C__579DE019]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[CANDIDATOS] ADD  DEFAULT ('') FOR [Fec_Cita]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__CANDIDATO__Hora___58920452]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[CANDIDATOS] ADD  DEFAULT ('') FOR [Hora_Cita]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__CANDIDATO__Fecha__5986288B]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[CANDIDATOS] ADD  DEFAULT ('') FOR [Fecha_Llegada]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__CANDIDATO__Hora___5A7A4CC4]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[CANDIDATOS] ADD  DEFAULT ('') FOR [Hora_Llegada]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__CANDIDATO__Canti__5B6E70FD]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[CANDIDATOS] ADD  DEFAULT ('') FOR [Cantidad_Entrevistas]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__CANDIDATO__Calif__5C629536]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[CANDIDATOS] ADD  DEFAULT ('') FOR [Calificacion1]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__CANDIDATO__Calif__5D56B96F]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[CANDIDATOS] ADD  DEFAULT ('') FOR [Calificacion2]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__CANDIDATO__Comen__5E4ADDA8]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[CANDIDATOS] ADD  DEFAULT ('') FOR [Comentario]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__CANDIDATO__Fecha__5F3F01E1]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[CANDIDATOS] ADD  DEFAULT ('') FOR [Fecha_Aprobacion]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__CANDIDATO__Cod_U__6033261A]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[CANDIDATOS] ADD  DEFAULT ('') FOR [Cod_Usuario]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__CANDIDATO__Estad__61274A53]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[CANDIDATOS] ADD  DEFAULT ('') FOR [Estado]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__CANDIDATO__Benef__4B5804C5]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[CANDIDATOS] ADD  DEFAULT ('') FOR [Beneficios]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__CANDIDATO__Salar__4C4C28FE]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[CANDIDATOS] ADD  DEFAULT ('') FOR [Salario]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__CANDIDATO__Dias___4D404D37]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[CANDIDATOS] ADD  DEFAULT ('') FOR [Dias_Contrato]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__CANDIDATO__Tipo___4E347170]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[CANDIDATOS] ADD  DEFAULT ('') FOR [Tipo_Contrato]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__CAPACITAC__Cod_C__6403B6FE]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[CAPACITACIONSALUDOCUPACIONAL] ADD  DEFAULT ('') FOR [Cod_Curso]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__CAPACITAC__Nom_C__64F7DB37]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[CAPACITACIONSALUDOCUPACIONAL] ADD  DEFAULT ('') FOR [Nom_Curso]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__CAPACITAC__Cod_E__65EBFF70]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[CAPACITACIONSALUDOCUPACIONAL] ADD  DEFAULT ('') FOR [Cod_Empleado]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__CAPACITAC__Fec_C__66E023A9]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[CAPACITACIONSALUDOCUPACIONAL] ADD  DEFAULT ('') FOR [Fec_Curso]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__CAPACITAC__Comen__67D447E2]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[CAPACITACIONSALUDOCUPACIONAL] ADD  DEFAULT ('') FOR [Comentario]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__CAPACITAD__Cod_C__69BC9054]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[CAPACITADORES] ADD  DEFAULT ('') FOR [Cod_Capacitador]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__CAPACITAD__Nom_C__6AB0B48D]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[CAPACITADORES] ADD  DEFAULT ('') FOR [Nom_Capacitador]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__CAPACITAD__Nit_C__6BA4D8C6]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[CAPACITADORES] ADD  DEFAULT ('') FOR [Nit_Capacitador]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__CAPACITAD__Digit__6C98FCFF]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[CAPACITADORES] ADD  DEFAULT ('') FOR [Digito_Verificacion]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__CAPACITAD__Dir_C__6D8D2138]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[CAPACITADORES] ADD  DEFAULT ('') FOR [Dir_Capacitador]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__CAPACITAD__Tel1___6E814571]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[CAPACITADORES] ADD  DEFAULT ('') FOR [Tel1_Capacitador]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__CAPACITAD__Tel2___6F7569AA]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[CAPACITADORES] ADD  DEFAULT ('') FOR [Tel2_Capacitador]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__CAPACITAD__Fax_C__70698DE3]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[CAPACITADORES] ADD  DEFAULT ('') FOR [Fax_Capacitador]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__CAPACITAD__Conta__715DB21C]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[CAPACITADORES] ADD  DEFAULT ('') FOR [Contacto_Capacitador]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__CAPACITAD__Total__7251D655]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[CAPACITADORES] ADD  DEFAULT ('') FOR [Total_Cursos]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__CAPACITAD__Calif__7345FA8E]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[CAPACITADORES] ADD  DEFAULT ('') FOR [Calificacion]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__CAPACITAD__Comen__743A1EC7]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[CAPACITADORES] ADD  DEFAULT ('') FOR [Comentario]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__CAPACITAD__Fec_I__752E4300]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[CAPACITADORES] ADD  DEFAULT ('') FOR [Fec_Ingreso]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__CAPACITAD__Estad__76226739]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[CAPACITADORES] ADD  DEFAULT ('') FOR [Estado]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__CARGOS__Cod_Alte__4C8B54C9]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[CARGOS] ADD  DEFAULT ('') FOR [Cod_Alterno]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__CARGOS__Objetivo__4D7F7902]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[CARGOS] ADD  DEFAULT ('') FOR [Objetivo]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__CARGOS__Funcione__4E739D3B]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[CARGOS] ADD  DEFAULT ('') FOR [Funciones]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__CARGOS__Perfil__4EB3945D]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[CARGOS] ADD  DEFAULT ('') FOR [Perfil]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__CARGOS__Autoriza__78A9CE29]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[CARGOS] ADD  DEFAULT ('') FOR [AutorizaSalarios]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__CARGOS__RecibeMa__121F8769]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[CARGOS] ADD  DEFAULT ('') FOR [RecibeMail]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__CARGOS__TieneJef__4F2895A9]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[CARGOS] ADD  DEFAULT ('') FOR [TieneJefe]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__CARGOS__Cod_Carg__501CB9E2]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[CARGOS] ADD  DEFAULT ('') FOR [Cod_CargoJefe]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__CARGOS__Firma_Do__6E022284]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[CARGOS] ADD  DEFAULT ('') FOR [Firma_Doc]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__CARGOS__Docu_Fir__6EF646BD]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[CARGOS] ADD  DEFAULT ('') FOR [Docu_Firma]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__CARGOS__Cod_Ofic__0777DBC4]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[CARGOS] ADD  DEFAULT ('') FOR [Cod_Oficio]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__CARGOS__Art209__49F075EE]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[CARGOS] ADD  DEFAULT ('') FOR [Art209]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__CCOSTOS__Ccosto___77B5A9F0]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[CCOSTOS] ADD  DEFAULT ('') FOR [Ccosto_Sec]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__CCOSTOS__Ppto_SA__365CE7DF]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[CCOSTOS] ADD  DEFAULT ('') FOR [Ppto_SAP]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__CCOSTOS__PMP__5110DE1B]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[CCOSTOS] ADD  DEFAULT ('') FOR [PMP]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__CCOSTOS__ProfitC__7365F61F]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[CCOSTOS] ADD  DEFAULT ('') FOR [ProfitCenter]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__CCOSTOS__Sucursa__0861DE5C]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[CCOSTOS] ADD  DEFAULT ('') FOR [Sucursal]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__CESANTIAS__Valor__61B48794]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[CESANTIAS] ADD  DEFAULT ((0)) FOR [Valor_Consignado]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__CESANTIAS__Cod_U__4C8F4D7C]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[CESANTIAS] ADD  DEFAULT ('') FOR [Cod_Usuario]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__CODOBS__cod__30A40E89]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[CODOBS] ADD  DEFAULT ('') FOR [cod]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__COMISIONE__Nom_R__67CA2641]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[COMISIONES] ADD  DEFAULT ('') FOR [Nom_Rango]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__COMISIONE__Por_C__6C8EDB5E]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[COMISIONES] ADD  DEFAULT ((0)) FOR [Por_Cumplimiento]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__COMISIONE__Por_C__6D82FF97]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[COMISIONES] ADD  DEFAULT ((0)) FOR [Por_Comision]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__COMISIONE__Total__6E7723D0]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[COMISIONES] ADD  DEFAULT ((0)) FOR [Total_Compensacion]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__COMITEPAR__Cod_M__78FED3E4]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[COMITEPARITARIO] ADD  DEFAULT ('') FOR [Cod_Miembro]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__COMITEPAR__Miemb__79F2F81D]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[COMITEPARITARIO] ADD  DEFAULT ('') FOR [Miembro]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__COMITEPAR__Cod_R__7AE71C56]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[COMITEPARITARIO] ADD  DEFAULT ('') FOR [Cod_Representante]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__COMITEPAR__Email__7BDB408F]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[COMITEPARITARIO] ADD  DEFAULT ('') FOR [Email]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__COMITEPARIT__Dir__7CCF64C8]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[COMITEPARITARIO] ADD  DEFAULT ('') FOR [Dir]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__COMITEPARI__Tel1__7DC38901]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[COMITEPARITARIO] ADD  DEFAULT ('') FOR [Tel1]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__COMITEPARI__Tel2__7EB7AD3A]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[COMITEPARITARIO] ADD  DEFAULT ('') FOR [Tel2]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__COMITEPAR__Perio__7FABD173]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[COMITEPARITARIO] ADD  DEFAULT ('') FOR [Periodo_Inicio]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__COMITEPAR__Perio__009FF5AC]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[COMITEPARITARIO] ADD  DEFAULT ('') FOR [Periodo_Fin]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__COMITEPAR__Estad__019419E5]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[COMITEPARITARIO] ADD  DEFAULT ('') FOR [Estado]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__COMPETENC__Cod_C__04708690]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[COMPETENCIAS] ADD  DEFAULT ('') FOR [Cod_Competencia]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__COMPETENC__Nom_C__0564AAC9]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[COMPETENCIAS] ADD  DEFAULT ('') FOR [Nom_Competencia]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__COMPETENC__Cod_H__074CF33B]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[COMPETENCIASHOJAVIDA] ADD  DEFAULT ('') FOR [Cod_HojaVida]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__COMPETENC__Cod_C__08411774]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[COMPETENCIASHOJAVIDA] ADD  DEFAULT ('') FOR [Cod_Competencia]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__CONCEPTOS__Aplic__03DB89B3]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[CONCEPTOS] ADD  DEFAULT ('') FOR [Aplica_Quincena]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__CONCEPTOS__Estad__7C30464A]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[CONCEPTOS] ADD  DEFAULT ('A') FOR [Estado]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__CONCEPTOS__BSBen__52050254]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[CONCEPTOS] ADD  DEFAULT ('') FOR [BSBenSalario]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__CONCEPTOS__BSBon__52F9268D]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[CONCEPTOS] ADD  DEFAULT ('') FOR [BSBonoRetefuente]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__CONCEPTOS__URepo__53ED4AC6]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[CONCEPTOS] ADD  DEFAULT ('') FOR [UReportes]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__CONCEPTOS__Cod_C__745A1A58]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[CONCEPTOS] ADD  DEFAULT ('') FOR [Cod_ConceptoRelacion]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__CONCEPTOS__BSVac__1C330188]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[CONCEPTOS] ADD  DEFAULT ('') FOR [BSVacacionesDinero]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__CONCEPTOS__BSAux__1D2725C1]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[CONCEPTOS] ADD  DEFAULT ('N') FOR [BSAuxilioPromedio]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__CONCEPTOS__Certi__62C57A02]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[CONCEPTOS] ADD  DEFAULT ('') FOR [CertificadoIngresos]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__CONCEPTOS__BSTop__70747ADB]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[CONCEPTOS] ADD  DEFAULT ('N') FOR [BSTopeExonerado]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__CONCEPTOS__Por_C__71689F14]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[CONCEPTOS] ADD  DEFAULT ((0)) FOR [Por_Concepto]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__CONCEPTOS__DedSa__019F06DD]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[CONCEPTOS] ADD  DEFAULT ('') FOR [DedSaludMesAct]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__CONCEPTOS__BSNoD__45DF2291]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[CONCEPTOS] ADD  DEFAULT ('') FOR [BSNoDescuentaDomingo]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__CONCEPTOS__BSTop__615232DC]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[CONCEPTOS] ADD  DEFAULT ('') FOR [BSTopeLey1393]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__CONCEPTOS__Otros__71DDA060]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[CONCEPTOS] ADD  DEFAULT ((0)) FOR [OtrosIngCertLab]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__CONCEPTOS__BSBon__3099ECE8]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[CONCEPTOS] ADD  DEFAULT ('') FOR [BSBonoDesempeno]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__CONCEPTOS__BSSal__6C658983]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[CONCEPTOS] ADD  DEFAULT ('') FOR [BSSalarioIntegralAportes]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__CONCEPTOS__BSPri__209A25F7]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[CONCEPTOS] ADD  DEFAULT ('') FOR [BSPrimaNavidad]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__CONCEPTOS__BSIng__4E16D7E4]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[CONCEPTOS] ADD  DEFAULT ('') FOR [BSIngresoTotal]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__CONCEPTOS__Tipo___1A6D16AC]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[CONCEPTOS] ADD  DEFAULT ('') FOR [Tipo_Bono]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__CONCEPTOS__BSIma__48E8D9CA]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[CONCEPTOS] ADD  DEFAULT ('N') FOR [BSIman]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__CONCEPTOS__BSPor__4D8371B5]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[CONCEPTOS] ADD  DEFAULT ('N') FOR [BSPorcentaje]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__CONCEPTOS__BSPre__4E7795EE]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[CONCEPTOS] ADD  DEFAULT ('N') FOR [BSPrestaciones]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__CONCEPTOS__BSGro__4F6BBA27]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[CONCEPTOS] ADD  DEFAULT ('N') FOR [BSGrossUP]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__CONCEPTOS__Orden__505FDE60]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[CONCEPTOS] ADD  DEFAULT ((0)) FOR [OrdenDevengo]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__CONCEPTOS__BSNoR__51540299]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[CONCEPTOS] ADD  DEFAULT ('') FOR [BSNoRenta]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__CONTRATOA__Cedul__0B287117]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[CONTRATOANTERIOR] ADD  DEFAULT ('') FOR [Cedula_Emp]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__CONTRATOA__Fec_I__0E04DDC2]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[CONTRATOANTERIOR] ADD  DEFAULT ('') FOR [Fec_Ingreso]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__CONTRATOA__Fec_R__0EF901FB]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[CONTRATOANTERIOR] ADD  DEFAULT ('') FOR [Fec_Retiro]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__CONTROLCA__Cod_E__23F5B58F]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[CONTROLCAMBIOENTIDAD] ADD  DEFAULT ('') FOR [Cod_Empleado]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__CONTROLCA__Fec_C__24E9D9C8]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[CONTROLCAMBIOENTIDAD] ADD  DEFAULT ('') FOR [Fec_Cambio]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__CONTROLCA__Val_A__25DDFE01]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[CONTROLCAMBIOENTIDAD] ADD  DEFAULT ((0)) FOR [Val_Anterior]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__CONTROLCA__Val_N__26D2223A]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[CONTROLCAMBIOENTIDAD] ADD  DEFAULT ((0)) FOR [Val_Nuevo]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__CONTROLCA__Entid__50C85C06]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[CONTROLCAMBIOENTIDAD] ADD  DEFAULT ('') FOR [Entidad]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__CONTROLDO__Cod_E__0A295FE6]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[CONTROLDOCPROC] ADD  DEFAULT ('') FOR [Cod_Empleado]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__CONTROLDO__Cod_D__0B1D841F]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[CONTROLDOCPROC] ADD  DEFAULT ('') FOR [Cod_Documento]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__CONTROLDO__Chequ__0C11A858]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[CONTROLDOCPROC] ADD  DEFAULT ('') FOR [Chequeada]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__CONTROLTI__Tiemp__0FED2634]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[CONTROLTIEMPO] ADD  DEFAULT ('') FOR [Tiempo_Proyectado]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__DEPTOS__Cod_Alte__754E3E91]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[DEPTOS] ADD  DEFAULT ('') FOR [Cod_Alterno]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__DEPTOS__Cod_Secu__1E1B49FA]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[DEPTOS] ADD  DEFAULT ('') FOR [Cod_Secundario]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__DEPTOS__Turnos__10E14A6D]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[DEPTOS] ADD  DEFAULT ('') FOR [Turnos]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__DEPTOS__Numero_A__7ECD872A]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[DEPTOS] ADD  DEFAULT ('') FOR [Numero_Alterno]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__DEPTOS__Cuenta_U__524826D2]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[DEPTOS] ADD  DEFAULT ((0)) FOR [Cuenta_Unica]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__DIAGNOSTI__Cod_A__43B6E2FD]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[DIAGNOSTICOS] ADD  DEFAULT ('') FOR [Cod_Alterno]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__DIASTRABA__Cod_C__533C4B0B]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[DIASTRABAJADOS] ADD  DEFAULT ((0)) FOR [Cod_Concepto]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__DISTRIBUC__Cod_E__3F7150CD]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[DISTRIBUCIONSALARIOS] ADD  DEFAULT ('') FOR [Cod_Empleado]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__DISTRIBUC__Cod_S__40657506]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[DISTRIBUCIONSALARIOS] ADD  DEFAULT ('') FOR [Cod_Sucursal]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__DISTRIBUC__PorcD__4159993F]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[DISTRIBUCIONSALARIOS] ADD  DEFAULT ('') FOR [PorcDistribucion]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__DOCUMENTO__Cod_D__0EEE1503]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[DOCUMENTOS] ADD  DEFAULT ('') FOR [Cod_Documento]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__DOCUMENTO__Nom_D__0FE2393C]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[DOCUMENTOS] ADD  DEFAULT ('') FOR [Nom_Documento]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__EMPLEADOS__Cod_E__22640986]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[EMPLEADOS] ADD  DEFAULT ('') FOR [Cod_Empleado]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__EMPLEADOS__Emple__23582DBF]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[EMPLEADOS] ADD  DEFAULT ('') FOR [Empleado]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__EMPLEADOS__PNomb__244C51F8]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[EMPLEADOS] ADD  DEFAULT ('') FOR [PNombre]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__EMPLEADOS__SNomb__25407631]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[EMPLEADOS] ADD  DEFAULT ('') FOR [SNombre]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__EMPLEADOS__PApel__26349A6A]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[EMPLEADOS] ADD  DEFAULT ('') FOR [PApellido]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__EMPLEADOS__SApel__2728BEA3]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[EMPLEADOS] ADD  DEFAULT ('') FOR [SApellido]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__EMPLEADOS__Tip_D__281CE2DC]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[EMPLEADOS] ADD  DEFAULT ('') FOR [Tip_Documento]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__EMPLEADOS__Cedul__29110715]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[EMPLEADOS] ADD  DEFAULT ('') FOR [Cedula]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__EMPLEADOS__Segur__2A052B4E]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[EMPLEADOS] ADD  DEFAULT ('') FOR [Seguro_Soc]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__EMPLEADOS__Fec_N__2AF94F87]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[EMPLEADOS] ADD  DEFAULT ('') FOR [Fec_Nacimiento]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__EMPLEADOS__Est_C__2BED73C0]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[EMPLEADOS] ADD  DEFAULT ('') FOR [Est_Civil]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__EMPLEADOS__Sexo__2CE197F9]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[EMPLEADOS] ADD  DEFAULT ('') FOR [Sexo]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__EMPLEADOS__Direc__2DD5BC32]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[EMPLEADOS] ADD  DEFAULT ('') FOR [Direccion]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__EMPLEADOS__Estad__2EC9E06B]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[EMPLEADOS] ADD  DEFAULT ('') FOR [Estado]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__EMPLEADOS__Telef__2FBE04A4]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[EMPLEADOS] ADD  DEFAULT ('') FOR [Telefono]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__EMPLEADOS__Celul__30B228DD]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[EMPLEADOS] ADD  DEFAULT ('') FOR [Celular]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__EMPLEADOS__Lib_M__31A64D16]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[EMPLEADOS] ADD  DEFAULT ('') FOR [Lib_Militar]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__EMPLEADOS__Distr__329A714F]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[EMPLEADOS] ADD  DEFAULT ('') FOR [Distrito]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__EMPLEADOS__Dir_E__338E9588]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[EMPLEADOS] ADD  DEFAULT ('') FOR [Dir_Elec]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__EMPLEADOS__Cod_P__3482B9C1]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[EMPLEADOS] ADD  DEFAULT ('') FOR [Cod_Profesion]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__EMPLEADOS__Tipo___3576DDFA]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[EMPLEADOS] ADD  DEFAULT ('') FOR [Tipo_Contrato]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__EMPLEADOS__Dias___366B0233]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[EMPLEADOS] ADD  DEFAULT ('') FOR [Dias_Contrato]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__EMPLEADOS__Perio__375F266C]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[EMPLEADOS] ADD  DEFAULT ('') FOR [Periodo_Prueba]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__EMPLEADOS__Tipo___38534AA5]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[EMPLEADOS] ADD  DEFAULT ('') FOR [Tipo_Salario]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__EMPLEADOS__Fec_I__3A3B9317]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[EMPLEADOS] ADD  DEFAULT ('') FOR [Fec_Ingreso]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__EMPLEADOS__Fec_S__3B2FB750]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[EMPLEADOS] ADD  DEFAULT ('') FOR [Fec_Salario]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__EMPLEADOS__Salar__3C23DB89]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[EMPLEADOS] ADD  DEFAULT ('') FOR [Salario]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__EMPLEADOS__Metod__3D17FFC2]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[EMPLEADOS] ADD  DEFAULT ('') FOR [MetodoRetefuente]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__EMPLEADOS__Val_R__3E0C23FB]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[EMPLEADOS] ADD  DEFAULT ('') FOR [Val_Retefuente]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__EMPLEADOS__Por_R__3F004834]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[EMPLEADOS] ADD  DEFAULT ('') FOR [Por_Retefuente]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__EMPLEADOS__Tipo___3FF46C6D]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[EMPLEADOS] ADD  DEFAULT ('') FOR [Tipo_Retefuente]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__EMPLEADOS__Deduc__40E890A6]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[EMPLEADOS] ADD  DEFAULT ('') FOR [Deducible]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__EMPLEADOS__DedSa__41DCB4DF]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[EMPLEADOS] ADD  DEFAULT ('') FOR [DedSaludEdu]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__EMPLEADOS__DedAF__42D0D918]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[EMPLEADOS] ADD  DEFAULT ('') FOR [DedAFC]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__EMPLEADOS__DedAl__43C4FD51]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[EMPLEADOS] ADD  DEFAULT ('') FOR [DedAlimentacion]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__EMPLEADOS__Regim__44B9218A]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[EMPLEADOS] ADD  DEFAULT ('') FOR [Regimen]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__EMPLEADOS__Fec_R__45AD45C3]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[EMPLEADOS] ADD  DEFAULT ('') FOR [Fec_Retiro]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__EMPLEADOS__Val_L__46A169FC]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[EMPLEADOS] ADD  DEFAULT ('') FOR [Val_Liq_Contrato]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__EMPLEADOS__Forma__47958E35]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[EMPLEADOS] ADD  DEFAULT ('') FOR [FormaPago]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__EMPLEADOS__Sabad__4889B26E]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[EMPLEADOS] ADD  DEFAULT ('') FOR [Sabado]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__EMPLEADOS__Cod_C__497DD6A7]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[EMPLEADOS] ADD  DEFAULT ('') FOR [Cod_Ciudad]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__EMPLEADOS__Cod_C__4A71FAE0]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[EMPLEADOS] ADD  DEFAULT ('') FOR [Cod_CajaCompensacion]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__EMPLEADOS__Clasi__4B661F19]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[EMPLEADOS] ADD  DEFAULT ('') FOR [Clasificacion_Contable]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__EMPLEADOS__Tipo___4C5A4352]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[EMPLEADOS] ADD  DEFAULT ('') FOR [Tipo_Cta]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__EMPLEADOS__Num_C__4D4E678B]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[EMPLEADOS] ADD  DEFAULT ('') FOR [Num_Cta]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__EMPLEADOS__Banco__4E428BC4]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[EMPLEADOS] ADD  DEFAULT ('') FOR [Banco]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__EMPLEADOS__Cod_Z__4F36AFFD]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[EMPLEADOS] ADD  DEFAULT ('') FOR [Cod_Zona]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__EMPLEADOS__Cod_S__502AD436]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[EMPLEADOS] ADD  DEFAULT ('') FOR [Cod_Sucursal]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__EMPLEADOS__Cod_C__511EF86F]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[EMPLEADOS] ADD  DEFAULT ('') FOR [Cod_Ccostos]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__EMPLEADOS__Cod_D__52131CA8]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[EMPLEADOS] ADD  DEFAULT ('') FOR [Cod_Depto]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__EMPLEADOS__Cod_C__530740E1]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[EMPLEADOS] ADD  DEFAULT ('') FOR [Cod_Cargo]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__EMPLEADOS__Cod_G__53FB651A]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[EMPLEADOS] ADD  DEFAULT ('') FOR [Cod_Grupo]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__EMPLEADOS__Cod_A__54EF8953]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[EMPLEADOS] ADD  DEFAULT ('') FOR [Cod_Arp]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__EMPLEADOS__Cod_E__55E3AD8C]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[EMPLEADOS] ADD  DEFAULT ('') FOR [Cod_Eps]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__EMPLEADOS__Cod_A__56D7D1C5]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[EMPLEADOS] ADD  DEFAULT ('') FOR [Cod_Afp]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__EMPLEADOS__Cod_A__57CBF5FE]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[EMPLEADOS] ADD  DEFAULT ('') FOR [Cod_Afc]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__EMPLEADOS__Cod_E__58C01A37]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[EMPLEADOS] ADD  DEFAULT ('') FOR [Cod_Escala]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__EMPLEADOS__Cod_T__59B43E70]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[EMPLEADOS] ADD  DEFAULT ('') FOR [Cod_Tarifa_Plena]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__EMPLEADOS__Modo___5AA862A9]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[EMPLEADOS] ADD  DEFAULT ('') FOR [Modo_Costo_Hora]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__EMPLEADOS__Cod_E__5B9C86E2]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[EMPLEADOS] ADD  DEFAULT ('') FOR [Cod_Empleador]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__EMPLEADOS__Aux_T__5C90AB1B]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[EMPLEADOS] ADD  DEFAULT ('') FOR [Aux_Transporte]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__EMPLEADOS__Cod_P__5D84CF54]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[EMPLEADOS] ADD  DEFAULT ('') FOR [Cod_Pais_Nacimiento]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__EMPLEADOS__Cod_P__5E78F38D]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[EMPLEADOS] ADD  DEFAULT ('') FOR [Cod_Pais_Nacionalidad]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__EMPLEADOS__Fec_V__5F6D17C6]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[EMPLEADOS] ADD  DEFAULT ('') FOR [Fec_Vence_Visa]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__EMPLEADOS__Porc___60613BFF]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[EMPLEADOS] ADD  DEFAULT ('') FOR [Porc_Anticipo]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__EMPLEADOS__Porc___61556038]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[EMPLEADOS] ADD  DEFAULT ('') FOR [Porc_Anticipo_Prima]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__EMPLEADOS__ModoS__62498471]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[EMPLEADOS] ADD  DEFAULT ('') FOR [ModoSalario]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__EMPLEADOS__Antic__633DA8AA]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[EMPLEADOS] ADD  DEFAULT ('') FOR [AnticipoPrima]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__EMPLEADOS__Cod_N__6431CCE3]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[EMPLEADOS] ADD  DEFAULT ('') FOR [Cod_NvaEps]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__EMPLEADOS__Cod_N__6525F11C]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[EMPLEADOS] ADD  DEFAULT ('') FOR [Cod_NvaAfp]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__EMPLEADOS__Cod_N__661A1555]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[EMPLEADOS] ADD  DEFAULT ('') FOR [Cod_NvaAfc]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__EMPLEADOS__Fec_C__670E398E]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[EMPLEADOS] ADD  DEFAULT ('') FOR [Fec_CamEps]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__EMPLEADOS__Fec_C__68025DC7]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[EMPLEADOS] ADD  DEFAULT ('') FOR [Fec_CamAfp]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__EMPLEADOS__Fec_C__68F68200]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[EMPLEADOS] ADD  DEFAULT ('') FOR [Fec_CamAfc]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__EMPLEADOS__Tiemp__69EAA639]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[EMPLEADOS] ADD  DEFAULT ('') FOR [Tiempo_C]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__EMPLEADOS__Clave__6ADECA72]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[EMPLEADOS] ADD  DEFAULT ('') FOR [Clave]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__EMPLEADOS__Saldo__6BD2EEAB]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[EMPLEADOS] ADD  DEFAULT ('') FOR [Saldo_Base_Aporte]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__EMPLEADOS__Base___6CC712E4]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[EMPLEADOS] ADD  DEFAULT ('') FOR [Base_Aporte]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__EMPLEADOS__Saldo__6DBB371D]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[EMPLEADOS] ADD  DEFAULT ('') FOR [Saldo_Dias_Aporte]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__EMPLEADOS__Dias___6EAF5B56]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[EMPLEADOS] ADD  DEFAULT ('') FOR [Dias_Aporte]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__EMPLEADOS__No_Hi__6FA37F8F]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[EMPLEADOS] ADD  DEFAULT ('') FOR [No_Hijos]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__EMPLEADOS__LiqNo__7097A3C8]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[EMPLEADOS] ADD  DEFAULT ('') FOR [LiqNomina]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__EMPLEADOS__Estud__718BC801]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[EMPLEADOS] ADD  DEFAULT ('') FOR [Estudiante]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__EMPLEADOS__Pract__727FEC3A]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[EMPLEADOS] ADD  DEFAULT ('') FOR [Practicante]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__EMPLEADOS__Medic__73741073]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[EMPLEADOS] ADD  DEFAULT ('') FOR [MedicinaPrepagada]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__EMPLEADOS__Telef__746834AC]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[EMPLEADOS] ADD  DEFAULT ('') FOR [Telefono1]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__EMPLEADOS__Porc___755C58E5]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[EMPLEADOS] ADD  DEFAULT ('') FOR [Porc_Embargo]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__EMPLEADOS__Saldo__76507D1E]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[EMPLEADOS] ADD  DEFAULT ('') FOR [Saldo_Ini_Horas]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__EMPLEADOS__DiasV__7744A157]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[EMPLEADOS] ADD  DEFAULT ('') FOR [DiasVacAno]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__EMPLEADOS__Cod_C__7838C590]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[EMPLEADOS] ADD  DEFAULT ('') FOR [Cod_Causal_Retiro]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__EMPLEADOS__Cod_L__792CE9C9]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[EMPLEADOS] ADD  DEFAULT ('') FOR [Cod_Lugar_Expedicion]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__EMPLEADOS__DiasV__7A210E02]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[EMPLEADOS] ADD  DEFAULT ('') FOR [DiasVacPendientesDisfrute]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__EMPLEADOS__DiasS__7B15323B]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[EMPLEADOS] ADD  DEFAULT ('') FOR [DiasSalud]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__EMPLEADOS__FecLi__7C095674]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[EMPLEADOS] ADD  DEFAULT ('') FOR [FecLimiteDeducible]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__EMPLEADOS__Fec_C__7CFD7AAD]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[EMPLEADOS] ADD  DEFAULT ('') FOR [Fec_Cambio_Tipo_Salario]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__EMPLEADOS__Grupo__7DF19EE6]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[EMPLEADOS] ADD  DEFAULT ('') FOR [GrupoSanguineo]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__EMPLEADOS__Cod_C__7EE5C31F]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[EMPLEADOS] ADD  DEFAULT ('') FOR [Cod_Colaborador]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__EMPLEADOS__Cod_B__7FD9E758]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[EMPLEADOS] ADD  DEFAULT ('') FOR [Cod_Barrio]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__EMPLEADOS__Cod_J__00CE0B91]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[EMPLEADOS] ADD  DEFAULT ('') FOR [Cod_Jefe]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__EMPLEADOS__Decla__01C22FCA]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[EMPLEADOS] ADD  DEFAULT ('') FOR [Declarante]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__EMPLEADOS__Vigen__02B65403]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[EMPLEADOS] ADD  DEFAULT ('') FOR [VigenciaDependientes]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__EMPLEADOS__DiasV__03AA783C]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[EMPLEADOS] ADD  DEFAULT ('') FOR [DiasVivienda]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__EMPLEADOS__DiasP__049E9C75]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[EMPLEADOS] ADD  DEFAULT ('') FOR [DiasPrepagada]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__EMPLEADOS__DiasD__0592C0AE]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[EMPLEADOS] ADD  DEFAULT ('') FOR [DiasDependientes]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__EMPLEADOS__FecSu__0686E4E7]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[EMPLEADOS] ADD  DEFAULT ('') FOR [FecSubstitucionPatronal]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__EMPLEADOS__Cod_A__077B0920]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[EMPLEADOS] ADD  DEFAULT ('') FOR [Cod_Alterno]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__EMPLEADOS__Cod_G__086F2D59]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[EMPLEADOS] ADD  DEFAULT ((1)) FOR [Cod_GrupoDif]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__EMPLEADOS__Tipo___09635192]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[EMPLEADOS] ADD  DEFAULT ('') FOR [Tipo_Pension]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__EMPLEADOS__Tipo___0A5775CB]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[EMPLEADOS] ADD  DEFAULT ('') FOR [Tipo_Pensionado]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__EMPLEADOS__Pensi__0B4B9A04]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[EMPLEADOS] ADD  DEFAULT ((1)) FOR [Pension_Compartida]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__EMPLEADOS__Cod_A__0C3FBE3D]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[EMPLEADOS] ADD  DEFAULT ((0)) FOR [Cod_Agencia]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__EMPLEADOS__Regre__66C4EC22]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[EMPLEADOS] ADD  DEFAULT ('') FOR [Regretted]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__EMPLEADOS__NoBen__6D7E6D57]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[EMPLEADOS] ADD  DEFAULT ('') FOR [NoBeneficio558]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__EMPLEADOS__Regre__44FC4608]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[EMPLEADOS] ADD  DEFAULT ('') FOR [Regreted]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__EMPLEADOS__Cod_D__664BF223]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[EMPLEADOS_APROBA] ADD  DEFAULT ((0)) FOR [Cod_Depto]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__EMPLEADOS__Cod_A__6740165C]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[EMPLEADOS_APROBA] ADD  DEFAULT ((0)) FOR [Cod_Aprob]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__EMPLEADOS__Nivel__68343A95]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[EMPLEADOS_APROBA] ADD  DEFAULT ((0)) FOR [Nivel]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__EMPLEADOS__Modul__69285ECE]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[EMPLEADOS_APROBA] ADD  DEFAULT ('') FOR [Modulo]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__EMPRESAS__Licenc__369C13AA]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[EMPRESAS] ADD  DEFAULT ('') FOR [Licencias]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__EMPRESAS__Servid__379037E3]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[EMPRESAS] ADD  DEFAULT ('') FOR [Servidor]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__EMPRESAS__BaseDa__38845C1C]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[EMPRESAS] ADD  DEFAULT ('') FOR [BaseDatos]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__EMPRESAS__Usuari__39788055]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[EMPRESAS] ADD  DEFAULT ('') FOR [Usuario]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__EMPRESAS__Passw__3A6CA48E]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[EMPRESAS] ADD  DEFAULT ('') FOR [Passw]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__EMPRESAS__Ruta__3B60C8C7]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[EMPRESAS] ADD  DEFAULT ('') FOR [Ruta]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__EMPRESAS__ModNOM__3C54ED00]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[EMPRESAS] ADD  DEFAULT ('') FOR [ModNOM]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__EMPRESAS__ModRH__3D491139]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[EMPRESAS] ADD  DEFAULT ('') FOR [ModRH]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__EMPRESAS__ModMIS__3E3D3572]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[EMPRESAS] ADD  DEFAULT ('') FOR [ModMIS]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__EMPRESAS__Serial__3F3159AB]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[EMPRESAS] ADD  DEFAULT ('') FOR [Serial]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__EMPRESAS__Cod_Lo__478773E1]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[EMPRESAS] ADD  DEFAULT ('') FOR [Cod_Local]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__EMPRESAS__LogoOp__1F0F6E33]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[EMPRESAS] ADD  DEFAULT ('') FOR [LogoOpc]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__ESPECIALI__Cod_E__12BEA5E7]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[ESPECIALIDADES] ADD  DEFAULT ('') FOR [Cod_Especialidad]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__ESPECIALI__Descr__13B2CA20]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[ESPECIALIDADES] ADD  DEFAULT ('') FOR [Descripcion]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__EVALUACIO__Cod_E__159B1292]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[EVALUACIONEMPLEADOS] ADD  DEFAULT ('') FOR [Cod_Empleado]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__EVALUACIO__Fecha__168F36CB]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[EVALUACIONEMPLEADOS] ADD  DEFAULT ('') FOR [Fecha_Inicio]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__EVALUACIO__Hora___17835B04]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[EVALUACIONEMPLEADOS] ADD  DEFAULT ('') FOR [Hora_Inicio]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__EVALUACIO__Cod_P__18777F3D]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[EVALUACIONEMPLEADOS] ADD  DEFAULT ('') FOR [Cod_Pregunta]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__EVALUACIO__Calif__196BA376]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[EVALUACIONEMPLEADOS] ADD  DEFAULT ('') FOR [Calificacion1]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__EVALUACIO__Calif__1A5FC7AF]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[EVALUACIONEMPLEADOS] ADD  DEFAULT ('') FOR [Calificacion2]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__EVALUACIO__Comen__1B53EBE8]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[EVALUACIONEMPLEADOS] ADD  DEFAULT ('') FOR [Comentario]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__EVALUACIO__Cod_U__1C481021]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[EVALUACIONEMPLEADOS] ADD  DEFAULT ('') FOR [Cod_Usuario]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__EVALUACIO__Cod_R__1E305893]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[EVALUACIONES] ADD  DEFAULT ('') FOR [Cod_Requerimiento]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__EVALUACIO__Cod_H__1F247CCC]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[EVALUACIONES] ADD  DEFAULT ('') FOR [Cod_HojaVida]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__EVALUACIO__Fecha__2018A105]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[EVALUACIONES] ADD  DEFAULT ('') FOR [Fecha_Inicio]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__EVALUACIO__Hora___210CC53E]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[EVALUACIONES] ADD  DEFAULT ('') FOR [Hora_Inicio]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__EVALUACIO__Cod_P__2200E977]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[EVALUACIONES] ADD  DEFAULT ('') FOR [Cod_Pregunta]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__EVALUACIO__Calif__22F50DB0]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[EVALUACIONES] ADD  DEFAULT ('') FOR [Calificacion1]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__EVALUACIO__Calif__23E931E9]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[EVALUACIONES] ADD  DEFAULT ('') FOR [Calificacion2]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__EVALUACIO__Cod_S__24DD5622]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[EVALUACIONES] ADD  DEFAULT ('') FOR [Cod_Soporte]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__EVALUACIO__Comen__25D17A5B]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[EVALUACIONES] ADD  DEFAULT ('') FOR [Comentario]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__EVALUACIO__Durac__26C59E94]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[EVALUACIONES] ADD  DEFAULT ('') FOR [Duracion]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__EVALUACIO__Cod_U__27B9C2CD]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[EVALUACIONES] ADD  DEFAULT ('') FOR [Cod_Usuario]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__EXPLABORA__Cod_H__728E068E]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[EXPLABORAL] ADD  DEFAULT ('') FOR [Cod_HojaVida]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__EXPLABORA__Empre__73822AC7]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[EXPLABORAL] ADD  DEFAULT ('') FOR [Empresa]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__EXPLABORA__Telef__74764F00]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[EXPLABORAL] ADD  DEFAULT ('') FOR [Telefono]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__EXPLABORA__Indus__756A7339]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[EXPLABORAL] ADD  DEFAULT ('') FOR [Industria]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__EXPLABORA__Secto__765E9772]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[EXPLABORAL] ADD  DEFAULT ('') FOR [Sector]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__EXPLABORA__Cargo__7752BBAB]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[EXPLABORAL] ADD  DEFAULT ('') FOR [Cargo]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__EXPLABORA__AreaT__7846DFE4]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[EXPLABORAL] ADD  DEFAULT ('') FOR [AreaTrabajo]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__EXPLABORA__Fec_I__793B041D]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[EXPLABORAL] ADD  DEFAULT ('') FOR [Fec_Ingreso]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__EXPLABORA__Fec_R__7A2F2856]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[EXPLABORAL] ADD  DEFAULT ('') FOR [Fec_Retiro]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__EXPLABORA__Funci__7B234C8F]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[EXPLABORAL] ADD  DEFAULT ('') FOR [Funciones]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__EXPLABORA__Jefe___7C1770C8]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[EXPLABORAL] ADD  DEFAULT ('') FOR [Jefe_Inmediato]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__EXPLABORA__Logro__7D0B9501]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[EXPLABORAL] ADD  DEFAULT ('') FOR [Logros]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__EXPLABORA__Opini__7DFFB93A]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[EXPLABORAL] ADD  DEFAULT ('') FOR [Opinion]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__EXPLABORA__Verif__7EF3DD73]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[EXPLABORAL] ADD  DEFAULT ('') FOR [Verificado]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__FAMILIARE__Cod_E__3A6282ED]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[FAMILIARES] ADD  DEFAULT ('') FOR [Cod_Empleado]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__FAMILIARE__Nombr__3B56A726]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[FAMILIARES] ADD  DEFAULT ('') FOR [Nombre]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__FAMILIARE__Paren__3C4ACB5F]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[FAMILIARES] ADD  DEFAULT ('') FOR [Parentesco]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__FAMILIARES__Edad__3D3EEF98]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[FAMILIARES] ADD  DEFAULT ('') FOR [Edad]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__FAMILIARE__Profe__3E3313D1]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[FAMILIARES] ADD  DEFAULT ('') FOR [Profesion]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__FAMILIARE__Empre__3F27380A]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[FAMILIARES] ADD  DEFAULT ('') FOR [Empresa]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__FAMILIARE__Cargo__401B5C43]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[FAMILIARES] ADD  DEFAULT ('') FOR [Cargo]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__FAMILIARE__Fecha__1C9D15DC]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[FAMILIARES] ADD  DEFAULT ('') FOR [FechaNacimiento]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__FAMILIARE__PNomb__271AA44F]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[FAMILIARES] ADD  DEFAULT ('') FOR [PNombre]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__FAMILIARE__SNomb__280EC888]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[FAMILIARES] ADD  DEFAULT ('') FOR [SNombre]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__FAMILIARE__PApel__2902ECC1]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[FAMILIARES] ADD  DEFAULT ('') FOR [PApellido]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__FAMILIARE__SApel__29F710FA]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[FAMILIARES] ADD  DEFAULT ('') FOR [SApellido]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__FAMILIARE__Cedul__2AEB3533]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[FAMILIARES] ADD  DEFAULT ('') FOR [Cedula]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__FAMILIARE__Tipo___2BDF596C]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[FAMILIARES] ADD  DEFAULT ('') FOR [Tipo_Documento]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__FAMILIARES__Upc__2CD37DA5]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[FAMILIARES] ADD  DEFAULT ('') FOR [Upc]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_FERIADOS_Cod_Feriado]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[FERIADOS] ADD  CONSTRAINT [DF_FERIADOS_Cod_Feriado]  DEFAULT (2002) FOR [Cod_Feriado]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__FORMACADE__Cod_H__00DC25E5]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[FORMACADEMICA] ADD  DEFAULT ('') FOR [Cod_HojaVida]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__FORMACADE__Cod_I__01D04A1E]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[FORMACADEMICA] ADD  DEFAULT ('') FOR [Cod_Institucion]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__FORMACADE__Cod_T__02C46E57]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[FORMACADEMICA] ADD  DEFAULT ('') FOR [Cod_Titulo]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__FORMACADE__Cod_N__03B89290]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[FORMACADEMICA] ADD  DEFAULT ('') FOR [Cod_Nivel]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__FORMACADE__Inici__04ACB6C9]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[FORMACADEMICA] ADD  DEFAULT ('') FOR [Inicio]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__FORMACADE__Salid__05A0DB02]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[FORMACADEMICA] ADD  DEFAULT ('') FOR [Salida]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__FORMACADE__Cod_E__0694FF3B]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[FORMACADEMICA] ADD  DEFAULT ('') FOR [Cod_Especialidad]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__FORMACADE__Otra___07892374]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[FORMACADEMICA] ADD  DEFAULT ('') FOR [Otra_Institucion]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__FORMACADE__Otro___087D47AD]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[FORMACADEMICA] ADD  DEFAULT ('') FOR [Otro_Titulo]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__FORMACADE__Otra___09716BE6]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[FORMACADEMICA] ADD  DEFAULT ('') FOR [Otra_Especialidad]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__HISTORIAC__Codig__40857097]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[HISTORIACLINICA] ADD  DEFAULT ('') FOR [Codigo]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__HISTORIAC__Cod_E__417994D0]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[HISTORIACLINICA] ADD  DEFAULT ('') FOR [Cod_Empleado]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__HISTORIAC__Diagn__426DB909]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[HISTORIACLINICA] ADD  DEFAULT ('') FOR [Diagnostico]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__HISTORIAC__Fecha__4361DD42]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[HISTORIACLINICA] ADD  DEFAULT ('') FOR [Fecha_Control]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__HISTORIAC__Fecha__4456017B]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[HISTORIACLINICA] ADD  DEFAULT ('') FOR [Fecha_Prox_Control]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__HISTORIAC__Estad__454A25B4]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[HISTORIACLINICA] ADD  DEFAULT ('') FOR [Estado]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__HISTORICO__Porce__3C94E422]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[HISTORICO] ADD  CONSTRAINT [DF__HISTORICO__Porce__3C94E422]  DEFAULT ('') FOR [Porcentaje]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__HISTORICO__C1__70148828]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[HISTORICO] ADD  CONSTRAINT [DF__HISTORICO__C1__70148828]  DEFAULT ('') FOR [C1]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__HISTORICO__C2__7108AC61]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[HISTORICO] ADD  CONSTRAINT [DF__HISTORICO__C2__7108AC61]  DEFAULT ('') FOR [C2]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__HISTORICO__C3__71FCD09A]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[HISTORICO] ADD  CONSTRAINT [DF__HISTORICO__C3__71FCD09A]  DEFAULT ('') FOR [C3]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__HISTORICO__C4__72F0F4D3]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[HISTORICO] ADD  CONSTRAINT [DF__HISTORICO__C4__72F0F4D3]  DEFAULT ('') FOR [C4]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__HISTORICO__Cod_C__359DCDD0]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[HISTORICO] ADD  CONSTRAINT [DF__HISTORICO__Cod_C__359DCDD0]  DEFAULT ('') FOR [Cod_Cargo]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__HISTORICO__Modul__6641052B]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[HISTORICO] ADD  DEFAULT ('') FOR [ModuloPago]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__HISTORICO__NumAp__7953D99F]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[HISTORICO] ADD  DEFAULT ('') FOR [NumAprobacion]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__HISTORICO__NumCo__7B3C2211]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[HISTORICO] ADD  DEFAULT ('') FOR [NumComprobante]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__HISTORICO__Cod_E__509BDCCF]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[HISTORICO_AUTOLIQUIDACIONES] ADD  DEFAULT ('') FOR [Cod_Empleador]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__HISTORICO__Cod_E__51900108]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[HISTORICO_AUTOLIQUIDACIONES] ADD  DEFAULT ('') FOR [Cod_Empleado]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__HISTORICO__Cod_C__52842541]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[HISTORICO_AUTOLIQUIDACIONES] ADD  DEFAULT ('') FOR [Cod_Concepto]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__HISTORICO__Fec_N__5378497A]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[HISTORICO_AUTOLIQUIDACIONES] ADD  DEFAULT ('') FOR [Fec_Nomina]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__HISTORICO__Val_N__546C6DB3]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[HISTORICO_AUTOLIQUIDACIONES] ADD  DEFAULT ('') FOR [Val_Novedad]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__HISTORICO__Val_I__556091EC]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[HISTORICO_AUTOLIQUIDACIONES] ADD  DEFAULT ('') FOR [Val_IBC]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__HISTORICO__Dias___5654B625]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[HISTORICO_AUTOLIQUIDACIONES] ADD  DEFAULT ('') FOR [Dias_Novedad]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__HISTORICO__Cod_S__5748DA5E]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[HISTORICO_AUTOLIQUIDACIONES] ADD  DEFAULT ('') FOR [Cod_Sub_Concepto]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__HISTORICO__Cod_S__583CFE97]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[HISTORICO_AUTOLIQUIDACIONES] ADD  DEFAULT ('') FOR [Cod_Sub_Concepto1]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__HISTORICO__Fec_P__1E855E4E]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[HISTORICO_AUTOLIQUIDACIONES] ADD  DEFAULT ('') FOR [Fec_Pago]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__HISTORICO__Num_P__1F798287]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[HISTORICO_AUTOLIQUIDACIONES] ADD  DEFAULT ('') FOR [Num_Planilla]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__HISTORICO__RegDo__0822B291]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[HISTORICO_AUTOLIQUIDACIONES] ADD  DEFAULT ('') FOR [RegDoble]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__HISTORICO__Num_R__5ADD6CD3]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[HISTORICO_AUTOLIQUIDACIONES] ADD  DEFAULT ((0)) FOR [Num_Registro]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__HISTORICO__Num_H__5BD1910C]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[HISTORICO_AUTOLIQUIDACIONES] ADD  DEFAULT ((0)) FOR [Num_Horas]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__HISTORICO__IbcRe__5CC5B545]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[HISTORICO_AUTOLIQUIDACIONES] ADD  DEFAULT ((0)) FOR [IbcReferencia]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__HISTORICO__Plani__3270541D]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[HISTORICO_AUTOLIQUIDACIONES] ADD  DEFAULT ((0)) FOR [PlanillaMes]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__HISTORICO__Cod_U__6B05BA48]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[HISTORICO_CLAVES] ADD  DEFAULT ('') FOR [Cod_Usuario]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__HISTORICO__Clave__6BF9DE81]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[HISTORICO_CLAVES] ADD  DEFAULT ('') FOR [Clave]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__HISTORICO__Fecha__6CEE02BA]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[HISTORICO_CLAVES] ADD  DEFAULT ('') FOR [Fecha_Clave]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__HISTORICO__Cod_E__5A254709]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[HISTORICO_NOVEDADES_AUTOLIQUIDACIONES] ADD  DEFAULT ('') FOR [Cod_Empleado]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__HISTORICO__Fec_N__5B196B42]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[HISTORICO_NOVEDADES_AUTOLIQUIDACIONES] ADD  DEFAULT ('') FOR [Fec_Nomina]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__HISTORICO_N__Ing__5C0D8F7B]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[HISTORICO_NOVEDADES_AUTOLIQUIDACIONES] ADD  DEFAULT ('') FOR [Ing]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__HISTORICO_N__Ret__5D01B3B4]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[HISTORICO_NOVEDADES_AUTOLIQUIDACIONES] ADD  DEFAULT ('') FOR [Ret]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__HISTORICO_N__Tde__5DF5D7ED]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[HISTORICO_NOVEDADES_AUTOLIQUIDACIONES] ADD  DEFAULT ('') FOR [Tde]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__HISTORICO_N__Tae__5EE9FC26]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[HISTORICO_NOVEDADES_AUTOLIQUIDACIONES] ADD  DEFAULT ('') FOR [Tae]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__HISTORICO_N__Tdp__5FDE205F]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[HISTORICO_NOVEDADES_AUTOLIQUIDACIONES] ADD  DEFAULT ('') FOR [Tdp]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__HISTORICO_N__Tap__60D24498]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[HISTORICO_NOVEDADES_AUTOLIQUIDACIONES] ADD  DEFAULT ('') FOR [Tap]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__HISTORICO_N__Vsp__61C668D1]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[HISTORICO_NOVEDADES_AUTOLIQUIDACIONES] ADD  DEFAULT ('') FOR [Vsp]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__HISTORICO_N__Vte__62BA8D0A]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[HISTORICO_NOVEDADES_AUTOLIQUIDACIONES] ADD  DEFAULT ('') FOR [Vte]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__HISTORICO_N__Vst__63AEB143]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[HISTORICO_NOVEDADES_AUTOLIQUIDACIONES] ADD  DEFAULT ('') FOR [Vst]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__HISTORICO_N__Sln__64A2D57C]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[HISTORICO_NOVEDADES_AUTOLIQUIDACIONES] ADD  DEFAULT ('') FOR [Sln]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__HISTORICO_N__Ige__6596F9B5]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[HISTORICO_NOVEDADES_AUTOLIQUIDACIONES] ADD  DEFAULT ('') FOR [Ige]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__HISTORICO_N__Lma__668B1DEE]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[HISTORICO_NOVEDADES_AUTOLIQUIDACIONES] ADD  DEFAULT ('') FOR [Lma]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__HISTORICO_N__Vac__677F4227]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[HISTORICO_NOVEDADES_AUTOLIQUIDACIONES] ADD  DEFAULT ('') FOR [Vac]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__HISTORICO_N__Avp__68736660]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[HISTORICO_NOVEDADES_AUTOLIQUIDACIONES] ADD  DEFAULT ('') FOR [Avp]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__HISTORICO_N__Vct__69678A99]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[HISTORICO_NOVEDADES_AUTOLIQUIDACIONES] ADD  DEFAULT ('') FOR [Vct]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__HISTORICO_N__Irp__6A5BAED2]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[HISTORICO_NOVEDADES_AUTOLIQUIDACIONES] ADD  DEFAULT ('') FOR [Irp]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__HISTORICO_N__Exo__22DFFF17]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[HISTORICO_NOVEDADES_AUTOLIQUIDACIONES] ADD  DEFAULT ('') FOR [Exo]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__HISTORICO__Num_R__5DB9D97E]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[HISTORICO_NOVEDADES_AUTOLIQUIDACIONES] ADD  DEFAULT ((0)) FOR [Num_Registro]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__HISTORICO__Fec_I__5EADFDB7]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[HISTORICO_NOVEDADES_AUTOLIQUIDACIONES] ADD  DEFAULT ('') FOR [Fec_Ingreso]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__HISTORICO__Fec_R__5FA221F0]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[HISTORICO_NOVEDADES_AUTOLIQUIDACIONES] ADD  DEFAULT ('') FOR [Fec_Retiro]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__HISTORICO__Fec_I__60964629]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[HISTORICO_NOVEDADES_AUTOLIQUIDACIONES] ADD  DEFAULT ('') FOR [Fec_IniVSP]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__HISTORICO__Fec_I__618A6A62]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[HISTORICO_NOVEDADES_AUTOLIQUIDACIONES] ADD  DEFAULT ('') FOR [Fec_IniSLN]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__HISTORICO__Fec_F__627E8E9B]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[HISTORICO_NOVEDADES_AUTOLIQUIDACIONES] ADD  DEFAULT ('') FOR [Fec_FinSLN]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__HISTORICO__Fec_I__6372B2D4]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[HISTORICO_NOVEDADES_AUTOLIQUIDACIONES] ADD  DEFAULT ('') FOR [Fec_IniIGE]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__HISTORICO__Fec_F__6466D70D]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[HISTORICO_NOVEDADES_AUTOLIQUIDACIONES] ADD  DEFAULT ('') FOR [Fec_FinIGE]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__HISTORICO__Fec_I__655AFB46]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[HISTORICO_NOVEDADES_AUTOLIQUIDACIONES] ADD  DEFAULT ('') FOR [Fec_IniLMA]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__HISTORICO__Fec_F__664F1F7F]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[HISTORICO_NOVEDADES_AUTOLIQUIDACIONES] ADD  DEFAULT ('') FOR [Fec_FinLMA]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__HISTORICO__Fec_I__674343B8]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[HISTORICO_NOVEDADES_AUTOLIQUIDACIONES] ADD  DEFAULT ('') FOR [Fec_IniVAC]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__HISTORICO__Fec_F__683767F1]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[HISTORICO_NOVEDADES_AUTOLIQUIDACIONES] ADD  DEFAULT ('') FOR [Fec_FinVAC]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__HISTORICO__Fec_I__692B8C2A]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[HISTORICO_NOVEDADES_AUTOLIQUIDACIONES] ADD  DEFAULT ('') FOR [Fec_IniVCT]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__HISTORICO__Fec_F__6A1FB063]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[HISTORICO_NOVEDADES_AUTOLIQUIDACIONES] ADD  DEFAULT ('') FOR [Fec_FinVCT]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__HISTORICO__Fec_I__6B13D49C]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[HISTORICO_NOVEDADES_AUTOLIQUIDACIONES] ADD  DEFAULT ('') FOR [Fec_IniIRL]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__HISTORICO__Fec_F__6C07F8D5]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[HISTORICO_NOVEDADES_AUTOLIQUIDACIONES] ADD  DEFAULT ('') FOR [Fec_FinIRL]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__HISTORICO__Cod_E__411D9AD0]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[HISTORICODEDUCIBLESRETENCION] ADD  DEFAULT ('') FOR [Cod_Empleado]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__HISTORICO__Fec_N__5524937D]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[HISTORICODEDUCIBLESRETENCION] ADD  DEFAULT ('') FOR [Fec_Nomina]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__HISTORICO__DedSa__5618B7B6]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[HISTORICODEDUCIBLESRETENCION] ADD  DEFAULT ('') FOR [DedSalud]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__HISTORICO__DedMe__570CDBEF]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[HISTORICODEDUCIBLESRETENCION] ADD  DEFAULT ('') FOR [DedMedicina]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__HISTORICO__DedDe__58010028]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[HISTORICODEDUCIBLESRETENCION] ADD  DEFAULT ('') FOR [DedDependientes]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__HISTORICO__DedVi__58F52461]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[HISTORICODEDUCIBLESRETENCION] ADD  DEFAULT ('') FOR [DedVivienda]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__HISTORICO__Dias___59E9489A]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[HISTORICODEDUCIBLESRETENCION] ADD  DEFAULT ('') FOR [Dias_Novedad]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__HISTORICO__Cod_E__47326E26]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[HISTORICODOCUMENTOS] ADD  DEFAULT ('') FOR [Cod_Empleado]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__HISTORICO__Cod_M__4826925F]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[HISTORICODOCUMENTOS] ADD  DEFAULT ('') FOR [Cod_Modelo]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__HISTORICO__Docum__491AB698]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[HISTORICODOCUMENTOS] ADD  DEFAULT ('') FOR [Documento]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__HISTORICO__Fec_S__4A0EDAD1]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[HISTORICODOCUMENTOS] ADD  DEFAULT ('') FOR [Fec_Solicitud]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__HISTORICO__Fec_C__4B02FF0A]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[HISTORICODOCUMENTOS] ADD  DEFAULT ('') FOR [Fec_Creacion]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__HISTORICO__Fec_M__4BF72343]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[HISTORICODOCUMENTOS] ADD  DEFAULT ('') FOR [Fec_Mail]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__HISTORICO__Fec_R__4CEB477C]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[HISTORICODOCUMENTOS] ADD  DEFAULT ('') FOR [Fec_Recibido]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__HISTORICO__Codig__4ED38FEE]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[HISTORICOOBJETIVOS] ADD  DEFAULT ('') FOR [Codigo]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__HISTORICO__Cod_O__4FC7B427]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[HISTORICOOBJETIVOS] ADD  DEFAULT ('') FOR [Cod_Objetivo]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__HISTORICO__Cod_E__50BBD860]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[HISTORICOOBJETIVOS] ADD  DEFAULT ('') FOR [Cod_Empleado]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__HISTORICO__Detal__51AFFC99]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[HISTORICOOBJETIVOS] ADD  DEFAULT ('') FOR [Detalle_Objetivo]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__HISTORICO__Fecha__52A420D2]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[HISTORICOOBJETIVOS] ADD  DEFAULT ('') FOR [Fecha_Inicio_Objetivo]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__HISTORICO__Fecha__5398450B]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[HISTORICOOBJETIVOS] ADD  DEFAULT ('') FOR [Fecha_Aprox_Cumplimiento]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__HISTORICO__Fecha__548C6944]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[HISTORICOOBJETIVOS] ADD  DEFAULT ('') FOR [Fecha_Real_Cumplimiento]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__HISTORICO__Porce__55808D7D]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[HISTORICOOBJETIVOS] ADD  DEFAULT ('') FOR [Porcentaje_Cumplimiento]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__HISTORICO__Soluc__5674B1B6]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[HISTORICOOBJETIVOS] ADD  DEFAULT ('') FOR [Solucion]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__HISTORICO__Estad__5768D5EF]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[HISTORICOOBJETIVOS] ADD  DEFAULT ('') FOR [Estado]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__HISTORICO__Cod_P__59511E61]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[HISTORICOPROGRAMASSALUDOCUPACIONAL] ADD  DEFAULT ('') FOR [Cod_Programa]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__HISTORICO__Cod_P__5A45429A]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[HISTORICOPROGRAMASSALUDOCUPACIONAL] ADD  DEFAULT ('') FOR [Cod_Programa_Maestro]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__HISTORICO__Cod_E__5B3966D3]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[HISTORICOPROGRAMASSALUDOCUPACIONAL] ADD  DEFAULT ('') FOR [Cod_Empleado]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__HISTORICO__Comen__5C2D8B0C]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[HISTORICOPROGRAMASSALUDOCUPACIONAL] ADD  DEFAULT ('') FOR [Comentario]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__HISTORICO__Cod_U__5D21AF45]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[HISTORICOPROGRAMASSALUDOCUPACIONAL] ADD  DEFAULT ('') FOR [Cod_Usuario]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__HISTORICO__Fecha__5E15D37E]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[HISTORICOPROGRAMASSALUDOCUPACIONAL] ADD  DEFAULT ('') FOR [Fecha_Control]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__HISTORICO__Fecha__5F09F7B7]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[HISTORICOPROGRAMASSALUDOCUPACIONAL] ADD  DEFAULT ('') FOR [Fecha_Evento]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__HISTORICO__Chequ__5FFE1BF0]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[HISTORICOPROGRAMASSALUDOCUPACIONAL] ADD  DEFAULT ('') FOR [Chequeada]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__HISTORICO__Aprob__26268016]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[HISTORICOPROGRAMASSALUDOCUPACIONAL] ADD  DEFAULT ('') FOR [Aprobo]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__HISTORICO__Invit__6CFC1D0E]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[HISTORICOPROGRAMASSALUDOCUPACIONAL] ADD  DEFAULT ('') FOR [Invitado]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__HISTORICO__Confi__6DF04147]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[HISTORICOPROGRAMASSALUDOCUPACIONAL] ADD  DEFAULT ('') FOR [Confirmo]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__HISTORICO__Asist__6EE46580]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[HISTORICOPROGRAMASSALUDOCUPACIONAL] ADD  DEFAULT ('') FOR [Asistio]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__HISTORICO__Codig__61E66462]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[HISTORICORIESGOS] ADD  DEFAULT ('') FOR [Codigo]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__HISTORICO__Cod_R__62DA889B]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[HISTORICORIESGOS] ADD  DEFAULT ('') FOR [Cod_Riesgo]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__HISTORICO__Detal__63CEACD4]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[HISTORICORIESGOS] ADD  DEFAULT ('') FOR [Detalle_Riesgo]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__HISTORICO__Fecha__64C2D10D]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[HISTORICORIESGOS] ADD  DEFAULT ('') FOR [Fecha_Reporte_Riesgo]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__HISTORICO__Fecha__65B6F546]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[HISTORICORIESGOS] ADD  DEFAULT ('') FOR [Fecha_Aprox_Solucion]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__HISTORICO__Fecha__66AB197F]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[HISTORICORIESGOS] ADD  DEFAULT ('') FOR [Fecha_Real_Solucion]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__HISTORICO__Fuent__679F3DB8]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[HISTORICORIESGOS] ADD  DEFAULT ('') FOR [Fuente_Generadora]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__HISTORICO__Total__689361F1]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[HISTORICORIESGOS] ADD  DEFAULT ('') FOR [Total_Expuestos]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__HISTORICO__Conse__6987862A]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[HISTORICORIESGOS] ADD  DEFAULT ('') FOR [Consecuencias]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__HISTORICO__Proba__6A7BAA63]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[HISTORICORIESGOS] ADD  DEFAULT ('') FOR [Probabilidad_Ocurrencia]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__HISTORICO__Soluc__6B6FCE9C]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[HISTORICORIESGOS] ADD  DEFAULT ('') FOR [Solucion]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__HISTORICO__Estad__6C63F2D5]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[HISTORICORIESGOS] ADD  DEFAULT ('') FOR [Estado]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__HITOS__Nom_Hito__429BCEEE]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[HITOS] ADD  DEFAULT ('') FOR [Nom_Hito]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__HITOS__Orden_Vis__438FF327]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[HITOS] ADD  DEFAULT ((0)) FOR [Orden_Visualizacion]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__HITOS__Duracion__44841760]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[HITOS] ADD  DEFAULT ((1)) FOR [Duracion]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__HITOS__Tipo_Hito__45783B99]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[HITOS] ADD  DEFAULT ((1)) FOR [Tipo_Hito]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__HITOS__Cod_Depen__466C5FD2]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[HITOS] ADD  DEFAULT ((0)) FOR [Cod_Dependiente]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__HOJAVIDA__Cod_Ho__6F405F80]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[HOJAVIDA] ADD  CONSTRAINT [DF__HOJAVIDA__Cod_Ho__6F405F80]  DEFAULT ('') FOR [Cod_HojaVida]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__HOJAVIDA__PNombr__703483B9]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[HOJAVIDA] ADD  CONSTRAINT [DF__HOJAVIDA__PNombr__703483B9]  DEFAULT ('') FOR [PNombre]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__HOJAVIDA__SNombr__7128A7F2]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[HOJAVIDA] ADD  CONSTRAINT [DF__HOJAVIDA__SNombr__7128A7F2]  DEFAULT ('') FOR [SNombre]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__HOJAVIDA__PApell__721CCC2B]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[HOJAVIDA] ADD  CONSTRAINT [DF__HOJAVIDA__PApell__721CCC2B]  DEFAULT ('') FOR [PApellido]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__HOJAVIDA__SApell__7310F064]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[HOJAVIDA] ADD  CONSTRAINT [DF__HOJAVIDA__SApell__7310F064]  DEFAULT ('') FOR [SApellido]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__HOJAVIDA__Aspira__7405149D]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[HOJAVIDA] ADD  CONSTRAINT [DF__HOJAVIDA__Aspira__7405149D]  DEFAULT ('') FOR [Aspirante]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__HOJAVIDA__Doc_Id__74F938D6]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[HOJAVIDA] ADD  CONSTRAINT [DF__HOJAVIDA__Doc_Id__74F938D6]  DEFAULT ('') FOR [Doc_Identidad]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__HOJAVIDA__Cod_Na__75ED5D0F]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[HOJAVIDA] ADD  CONSTRAINT [DF__HOJAVIDA__Cod_Na__75ED5D0F]  DEFAULT ('') FOR [Cod_Nacionalidad]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__HOJAVIDA__Fec_Na__76E18148]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[HOJAVIDA] ADD  CONSTRAINT [DF__HOJAVIDA__Fec_Na__76E18148]  DEFAULT ('') FOR [Fec_Nacimiento]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__HOJAVIDA__Sexo__77D5A581]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[HOJAVIDA] ADD  CONSTRAINT [DF__HOJAVIDA__Sexo__77D5A581]  DEFAULT ('') FOR [Sexo]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__HOJAVIDA__Lib_Mi__78C9C9BA]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[HOJAVIDA] ADD  CONSTRAINT [DF__HOJAVIDA__Lib_Mi__78C9C9BA]  DEFAULT ('') FOR [Lib_Militar]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__HOJAVIDA__Distri__79BDEDF3]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[HOJAVIDA] ADD  CONSTRAINT [DF__HOJAVIDA__Distri__79BDEDF3]  DEFAULT ('') FOR [Distrito]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__HOJAVIDA__Est_Ci__7AB2122C]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[HOJAVIDA] ADD  CONSTRAINT [DF__HOJAVIDA__Est_Ci__7AB2122C]  DEFAULT ('') FOR [Est_Civil]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__HOJAVIDA__Direcc__7BA63665]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[HOJAVIDA] ADD  CONSTRAINT [DF__HOJAVIDA__Direcc__7BA63665]  DEFAULT ('') FOR [Direccion]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__HOJAVIDA__Cod_Pa__7C9A5A9E]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[HOJAVIDA] ADD  CONSTRAINT [DF__HOJAVIDA__Cod_Pa__7C9A5A9E]  DEFAULT ('') FOR [Cod_Pais]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__HOJAVIDA__Dir_El__7D8E7ED7]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[HOJAVIDA] ADD  CONSTRAINT [DF__HOJAVIDA__Dir_El__7D8E7ED7]  DEFAULT ('') FOR [Dir_Electronica]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__HOJAVIDA__Cod_Ci__7E82A310]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[HOJAVIDA] ADD  CONSTRAINT [DF__HOJAVIDA__Cod_Ci__7E82A310]  DEFAULT ('') FOR [Cod_Ciudad]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__HOJAVIDA__Tel1__7F76C749]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[HOJAVIDA] ADD  CONSTRAINT [DF__HOJAVIDA__Tel1__7F76C749]  DEFAULT ('') FOR [Tel1]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__HOJAVIDA__Tel2__006AEB82]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[HOJAVIDA] ADD  CONSTRAINT [DF__HOJAVIDA__Tel2__006AEB82]  DEFAULT ('') FOR [Tel2]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__HOJAVIDA__Celula__015F0FBB]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[HOJAVIDA] ADD  CONSTRAINT [DF__HOJAVIDA__Celula__015F0FBB]  DEFAULT ('') FOR [Celular]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__HOJAVIDA__Asp_Sa__025333F4]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[HOJAVIDA] ADD  CONSTRAINT [DF__HOJAVIDA__Asp_Sa__025333F4]  DEFAULT ('') FOR [Asp_Salarial]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__HOJAVIDA__PViaje__0347582D]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[HOJAVIDA] ADD  CONSTRAINT [DF__HOJAVIDA__PViaje__0347582D]  DEFAULT ('') FOR [PViaje]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__HOJAVIDA__PTrasl__043B7C66]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[HOJAVIDA] ADD  CONSTRAINT [DF__HOJAVIDA__PTrasl__043B7C66]  DEFAULT ('') FOR [PTraslado]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__HOJAVIDA__Cod_Pr__052FA09F]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[HOJAVIDA] ADD  CONSTRAINT [DF__HOJAVIDA__Cod_Pr__052FA09F]  DEFAULT ('') FOR [Cod_Profesion]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__HOJAVIDA__Idioma__0623C4D8]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[HOJAVIDA] ADD  CONSTRAINT [DF__HOJAVIDA__Idioma__0623C4D8]  DEFAULT ('') FOR [Idioma_Nativo]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__HOJAVIDA__Idioma__0717E911]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[HOJAVIDA] ADD  CONSTRAINT [DF__HOJAVIDA__Idioma__0717E911]  DEFAULT ('') FOR [Idioma1]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__HOJAVIDA__Porc_C__080C0D4A]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[HOJAVIDA] ADD  CONSTRAINT [DF__HOJAVIDA__Porc_C__080C0D4A]  DEFAULT ('') FOR [Porc_Conocimiento_Idioma1]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__HOJAVIDA__Idioma__09003183]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[HOJAVIDA] ADD  CONSTRAINT [DF__HOJAVIDA__Idioma__09003183]  DEFAULT ('') FOR [Idioma2]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__HOJAVIDA__Porc_C__09F455BC]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[HOJAVIDA] ADD  CONSTRAINT [DF__HOJAVIDA__Porc_C__09F455BC]  DEFAULT ('') FOR [Porc_Conocimiento_Idioma2]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__HOJAVIDA__Estudi__0AE879F5]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[HOJAVIDA] ADD  CONSTRAINT [DF__HOJAVIDA__Estudi__0AE879F5]  DEFAULT ('') FOR [Estudiante_Practica]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__HOJAVIDA__Anos_E__0BDC9E2E]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[HOJAVIDA] ADD  CONSTRAINT [DF__HOJAVIDA__Anos_E__0BDC9E2E]  DEFAULT ('') FOR [Anos_Experiencia]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__HOJAVIDA__Fec_Cr__0CD0C267]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[HOJAVIDA] ADD  CONSTRAINT [DF__HOJAVIDA__Fec_Cr__0CD0C267]  DEFAULT ('') FOR [Fec_Creacion]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__HOJAVIDA__Fec_Ac__0DC4E6A0]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[HOJAVIDA] ADD  CONSTRAINT [DF__HOJAVIDA__Fec_Ac__0DC4E6A0]  DEFAULT ('') FOR [Fec_Actualizacion]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__HOJAVIDA__Cod_Ca__0EB90AD9]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[HOJAVIDA] ADD  CONSTRAINT [DF__HOJAVIDA__Cod_Ca__0EB90AD9]  DEFAULT ('') FOR [Cod_Cargo_Aspira]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__HOJAVIDA__Sketch__0FAD2F12]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[HOJAVIDA] ADD  CONSTRAINT [DF__HOJAVIDA__Sketch__0FAD2F12]  DEFAULT ('') FOR [Sketch]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__HOJAVIDA__Cod_Pe__10A1534B]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[HOJAVIDA] ADD  CONSTRAINT [DF__HOJAVIDA__Cod_Pe__10A1534B]  DEFAULT ('') FOR [Cod_Personalidad]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__HOJAVIDA__Tipo_D__11957784]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[HOJAVIDA] ADD  CONSTRAINT [DF__HOJAVIDA__Tipo_D__11957784]  DEFAULT ('') FOR [Tipo_Documento]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__HOJAVIDA__Estado__12899BBD]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[HOJAVIDA] ADD  CONSTRAINT [DF__HOJAVIDA__Estado__12899BBD]  DEFAULT ('') FOR [Estado]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__HOJAVIDA__Cod_Lu__67352964]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[HOJAVIDA] ADD  CONSTRAINT [DF__HOJAVIDA__Cod_Lu__67352964]  DEFAULT ('') FOR [Cod_Lugar_Expedicion]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__HOJAVIDA__Nivel___23D42350]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[HOJAVIDA] ADD  CONSTRAINT [DF__HOJAVIDA__Nivel___23D42350]  DEFAULT ('') FOR [Nivel_Idioma1]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__HOJAVIDA__Nivel___24C84789]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[HOJAVIDA] ADD  CONSTRAINT [DF__HOJAVIDA__Nivel___24C84789]  DEFAULT ('') FOR [Nivel_Idioma2]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__HOJAVIDA__Unidad__25BC6BC2]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[HOJAVIDA] ADD  CONSTRAINT [DF__HOJAVIDA__Unidad__25BC6BC2]  DEFAULT ('') FOR [Unidad_Tiempo]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__IMAS__Desde__6CB8F890]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[IMAS] ADD  DEFAULT ('') FOR [Desde]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__IMAS__Hasta__77368703]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[IMAS] ADD  DEFAULT ('') FOR [Hasta]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__IMAS__Val_Retefu__782AAB3C]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[IMAS] ADD  DEFAULT ('') FOR [Val_Retefuente]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__INSTEDUCA__Cod_I__15660868]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[INSTEDUCATIVAS] ADD  DEFAULT ('') FOR [Cod_Institucion]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__INSTEDUCA__Nom_I__165A2CA1]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[INSTEDUCATIVAS] ADD  DEFAULT ('') FOR [Nom_Institucion]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__JEFES__Cod_Jefe__6EA14102]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[JEFES] ADD  DEFAULT ('') FOR [Cod_Jefe]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__JEFES__Nom_Jefe__6F95653B]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[JEFES] ADD  DEFAULT ('') FOR [Nom_Jefe]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__JEFES__Cod_Depen__70898974]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[JEFES] ADD  DEFAULT ('') FOR [Cod_Dependencia]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__LOCKREGIS__Cod_U__5EAAD05B]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[LOCKREGISTRO] ADD  DEFAULT ('') FOR [Cod_Usuario]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__LOCKREGIS__Tabla__6A1C8307]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[LOCKREGISTRO] ADD  DEFAULT ('') FOR [Tabla]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__LOCKREGIS__Cod_R__6B10A740]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[LOCKREGISTRO] ADD  DEFAULT ('') FOR [Cod_Registro]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__LOCKREGIS__Fecha__6C04CB79]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[LOCKREGISTRO] ADD  DEFAULT ('') FOR [FechaHora]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__MODELOPOR__Cod_C__18427513]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[MODELOPORCARGOS] ADD  DEFAULT ('') FOR [Cod_Cargo]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__MODELOPOR__Cod_P__1936994C]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[MODELOPORCARGOS] ADD  DEFAULT ('') FOR [Cod_Pregunta]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__MODELOPORC__Peso__1A2ABD85]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[MODELOPORCARGOS] ADD  DEFAULT ('') FOR [Peso]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__MODELOPOR__Fec_C__1B1EE1BE]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[MODELOPORCARGOS] ADD  DEFAULT ('') FOR [Fec_Creada]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__MODELOPOR__Cread__1C1305F7]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[MODELOPORCARGOS] ADD  DEFAULT ('') FOR [Creador]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__MODELOPOR__Estad__1D072A30]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[MODELOPORCARGOS] ADD  DEFAULT ('') FOR [Estado]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__MODELOPOR__Cod_C__1EEF72A2]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[MODELOPORCARGOSEMP] ADD  DEFAULT ('') FOR [Cod_Cargo]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__MODELOPOR__Cod_P__1FE396DB]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[MODELOPORCARGOSEMP] ADD  DEFAULT ('') FOR [Cod_Pregunta]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__MODELOPORC__Peso__20D7BB14]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[MODELOPORCARGOSEMP] ADD  DEFAULT ('') FOR [Peso]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__MODELOPOR__Fec_C__21CBDF4D]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[MODELOPORCARGOSEMP] ADD  DEFAULT ('') FOR [Fec_Creada]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__MODELOPOR__Cread__22C00386]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[MODELOPORCARGOSEMP] ADD  DEFAULT ('') FOR [Creador]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__MODELOPOR__Estad__23B427BF]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[MODELOPORCARGOSEMP] ADD  DEFAULT ('') FOR [Estado]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__MODELOS__Cod_Mod__2690946A]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[MODELOS] ADD  DEFAULT ('') FOR [Cod_Modelo]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__MODELOS__Tipo_Mo__2784B8A3]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[MODELOS] ADD  DEFAULT ('') FOR [Tipo_Modelo]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__MODELOS__Descrip__2878DCDC]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[MODELOS] ADD  DEFAULT ('') FOR [Descripcion]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__MODELOS__Modelo__296D0115]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[MODELOS] ADD  DEFAULT ('') FOR [Modelo]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__MODELOS__Fec_Cre__2A61254E]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[MODELOS] ADD  DEFAULT ('') FOR [Fec_Creacion]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__MODELOS__Fec_Mod__2B554987]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[MODELOS] ADD  DEFAULT ('') FOR [Fec_Modificacion]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__MODELOS__Usuario__2C496DC0]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[MODELOS] ADD  DEFAULT ('') FOR [Usuario_Creo]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__MODELOS__Usuario__2D3D91F9]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[MODELOS] ADD  DEFAULT ('') FOR [Usuario_Modifico]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__NITALTERN__NitOr__4FA883ED]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[NITALTERNO] ADD  DEFAULT ('') FOR [NitOriginal]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__NITALTERN__NitAl__509CA826]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[NITALTERNO] ADD  DEFAULT ('') FOR [NitAlterno]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__NITALTERNO__Nit__54382EE0]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[NITALTERNO] ADD  DEFAULT ('N') FOR [Nit]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__NOMENCLAT__CodIn__1F997E18]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[NOMENCLATURAS] ADD  DEFAULT ('') FOR [CodInterno]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__NOMENCLAT__Codig__208DA251]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[NOMENCLATURAS] ADD  DEFAULT ('') FOR [Codigo]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__NOMENCLAT__Nombr__2181C68A]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[NOMENCLATURAS] ADD  DEFAULT ('') FOR [Nombre]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__NOVAUT__NumCompr__14FBF414]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[NOVAUT] ADD  DEFAULT ('') FOR [NumComprobante]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__NOVAUT__Horas__6D0DFE4B]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[NOVAUT] ADD  DEFAULT ((0)) FOR [Horas]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__NOVAUT__Prorroga__6F563970]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[NOVAUT] ADD  DEFAULT ((0)) FOR [Prorroga]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__NOVAUT__Descuent__18640752]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[NOVAUT] ADD  DEFAULT ('') FOR [DescuentaAuxilio]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__NOVEDADES__Porce__3BA0BFE9]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[NOVEDADES] ADD  DEFAULT ('') FOR [Porcentaje]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__NOVEDADES__C1__6C43F744]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[NOVEDADES] ADD  DEFAULT ('') FOR [C1]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__NOVEDADES__C2__6D381B7D]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[NOVEDADES] ADD  DEFAULT ('') FOR [C2]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__NOVEDADES__C3__6E2C3FB6]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[NOVEDADES] ADD  DEFAULT ('') FOR [C3]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__NOVEDADES__C4__6F2063EF]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[NOVEDADES] ADD  DEFAULT ('') FOR [C4]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__NOVEDADES__Cod_C__3691F209]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[NOVEDADES] ADD  DEFAULT ('') FOR [Cod_Cargo]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__NOVEDADES__Modul__63649880]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[NOVEDADES] ADD  DEFAULT ('') FOR [ModuloPago]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__NOVEDADES__NumAp__785FB566]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[NOVEDADES] ADD  DEFAULT ('') FOR [NumAprobacion]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__NOVEDADES__NumCo__7A47FDD8]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[NOVEDADES] ADD  DEFAULT ('') FOR [NumComprobante]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__NOVESCALA__Horas__443605EA]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[NOVESCALA] ADD  DEFAULT ('') FOR [Horas_Mes]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__NOVESCALA__Horas__6B4FD30B]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[NOVESCALA] ADD  DEFAULT ('') FOR [HorasTra_Mes]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__NOVESCALA__Dia_N__0FB81C0A]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[NOVESCALA] ADD  DEFAULT ((0)) FOR [Dia_Novedad]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__NOVESCALA__Mes_N__10AC4043]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[NOVESCALA] ADD  DEFAULT ((0)) FOR [Mes_Novedad]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__OBJETIVOS__Cod_O__3019FEA4]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[OBJETIVOS] ADD  DEFAULT ('') FOR [Cod_Objetivo]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__OBJETIVOS__Tipo___310E22DD]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[OBJETIVOS] ADD  DEFAULT ('') FOR [Tipo_Objetivo]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__OBJETIVOS__Nom_O__32024716]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[OBJETIVOS] ADD  DEFAULT ('') FOR [Nom_Objetivo]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__OBSERVACI__Cod_E__3ECB3E0A]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[OBSERVACIONES_EMPLEADO] ADD  DEFAULT ('') FOR [Cod_Empleado]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__OPCIONES__Icono__6FD889B9]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[OPCIONES] ADD  DEFAULT ((0)) FOR [Icono]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__OPCIONES__Opcion__70CCADF2]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[OPCIONES] ADD  DEFAULT ('') FOR [OpcionDependiente]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__OTRASNOV__Fec_In__420DC656]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[OTRASNOV] ADD  DEFAULT ('') FOR [Fec_Ing_Novedad]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__OTRASNOV__Tipo_E__03DC550A]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[OTRASNOV] ADD  DEFAULT ('0') FOR [Tipo_Especial]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__OTRASNOV__NumCta__04D07943]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[OTRASNOV] ADD  DEFAULT ('') FOR [NumCtaVoluntarios]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__OTRASNOV__Cuotas__17642ACA]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[OTRASNOV] ADD  DEFAULT ('') FOR [Cuotas]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__OTRASNOV__Vigenc__18584F03]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[OTRASNOV] ADD  DEFAULT ('') FOR [VigenciaDesde]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__OTRASNOV__Fuente__6603700E]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[OTRASNOV] ADD  DEFAULT ('') FOR [Fuente]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__OTRASNOV__Cod_Us__66F79447]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[OTRASNOV] ADD  DEFAULT ('') FOR [Cod_Usuario]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__PAGOS__MotivoPag__6B25B5D9]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[PAGOS] ADD  DEFAULT ('Z') FOR [MotivoPago]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__PARAMETRO__TipoL__3039FA35]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[PARAMETROS] ADD  DEFAULT ('') FOR [TipoLiqFestivos]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__PARAMETRO__Corte__312E1E6E]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[PARAMETROS] ADD  DEFAULT ('') FOR [Corte30Retefuente]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__PARAMETRO__Corte__322242A7]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[PARAMETROS] ADD  DEFAULT ('') FOR [Corte30SegSocial]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__PARAMETRO__Fec_A__331666E0]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[PARAMETROS] ADD  DEFAULT ('') FOR [Fec_Acumulado]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__PARAMETRO__Val_U__340A8B19]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[PARAMETROS] ADD  DEFAULT ('') FOR [Val_Uvt]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__PARAMETRO__PptoA__34FEAF52]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[PARAMETROS] ADD  DEFAULT ('') FOR [PptoAnualCap]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__PARAMETRO__Prome__35F2D38B]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[PARAMETROS] ADD  DEFAULT ('') FOR [Promedio_Cesantias]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__PARAMETRO__Corte__36E6F7C4]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[PARAMETROS] ADD  DEFAULT ('') FOR [Corte30Provisiones]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__PARAMETRO__BaseP__37DB1BFD]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[PARAMETROS] ADD  DEFAULT ('') FOR [BasePrimaSubsidio]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__PARAMETRO__Sal_M__38CF4036]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[PARAMETROS] ADD  DEFAULT ((20)) FOR [Sal_Max_AsegurRie]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__PARAMETRO__Calcu__39C3646F]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[PARAMETROS] ADD  DEFAULT ('N') FOR [Calculo_Anticipo]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__PARAMETRO__Pago___3AB788A8]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[PARAMETROS] ADD  DEFAULT ('') FOR [Pago_Vac_FecLlegada]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__PARAMETRO__LogoS__3BABACE1]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[PARAMETROS] ADD  DEFAULT ('N') FOR [LogoSucursal]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__PARAMETRO__DedFi__3C9FD11A]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[PARAMETROS] ADD  DEFAULT ('S') FOR [DedFiscales]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__PARAMETRO__CtaAc__3D93F553]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[PARAMETROS] ADD  DEFAULT ('') FOR [CtaActGasAnt]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__PARAMETRO__Gasto__3E88198C]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[PARAMETROS] ADD  DEFAULT ('N') FOR [GastoAnticipadoSueldos]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__PARAMETRO__DedFi__3F7C3DC5]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[PARAMETROS] ADD  DEFAULT ('N') FOR [DedFiscalSalud]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__PARAMETRO__Servi__407061FE]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[PARAMETROS] ADD  DEFAULT ('') FOR [Servidor]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__PARAMETRO__Usuar__41648637]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[PARAMETROS] ADD  DEFAULT ('') FOR [Usuario]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__PARAMETRO__Clave__4258AA70]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[PARAMETROS] ADD  DEFAULT ('') FOR [Clave]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__PARAMETRO__Puert__434CCEA9]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[PARAMETROS] ADD  DEFAULT ('') FOR [Puerto]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__PARAMETRO__Remit__4440F2E2]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[PARAMETROS] ADD  DEFAULT ('') FOR [Remitente]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__PARAMETRO__Mensa__4535171B]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[PARAMETROS] ADD  DEFAULT ('') FOR [Mensaje]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__PARAMETRO__Por_B__46293B54]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[PARAMETROS] ADD  DEFAULT ('') FOR [Por_Bonos]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__PARAMETRO__CtaPa__471D5F8D]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[PARAMETROS] ADD  DEFAULT ('') FOR [CtaPasBonificaciones]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__PARAMETRO__TopeS__481183C6]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[PARAMETROS] ADD  DEFAULT ('') FOR [TopeSalud]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__PARAMETRO__TopeP__4905A7FF]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[PARAMETROS] ADD  DEFAULT ('') FOR [TopePension]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__PARAMETRO__TopeR__49F9CC38]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[PARAMETROS] ADD  DEFAULT ('') FOR [TopeRiesgos]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__PARAMETRO__TopeC__4AEDF071]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[PARAMETROS] ADD  DEFAULT ('') FOR [TopeCaja]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__PARAMETRO__Vac10__4BE214AA]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[PARAMETROS] ADD  DEFAULT ('S') FOR [Vac100]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__PARAMETRO__TopeM__4CD638E3]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[PARAMETROS] ADD  DEFAULT ((0)) FOR [TopeMaximo]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__PARAMETRO__DiasL__4DCA5D1C]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[PARAMETROS] ADD  DEFAULT ('S') FOR [DiasLic]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__PARAMETRO__DiasC__4EBE8155]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[PARAMETROS] ADD  DEFAULT ((90)) FOR [DiasCesantias]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__PARAMETRO__Ley14__4FB2A58E]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[PARAMETROS] ADD  DEFAULT ('') FOR [Ley1429]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__PARAMETRO__UVTAc__50A6C9C7]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[PARAMETROS] ADD  DEFAULT ('') FOR [UVTActual]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__PARAMETRO__BaseC__519AEE00]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[PARAMETROS] ADD  DEFAULT ('') FOR [BaseCesantiaSubsidio]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__PARAMETRO__SubPa__528F1239]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[PARAMETROS] ADD  DEFAULT ('') FOR [SubParcial]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__PARAMETRO__SubCo__53833672]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[PARAMETROS] ADD  DEFAULT ('') FOR [SubCompleto]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__PARAMETRO__SubDi__54775AAB]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[PARAMETROS] ADD  DEFAULT ('') FOR [SubDiasParcial]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__PARAMETRO__SubDi__556B7EE4]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[PARAMETROS] ADD  DEFAULT ('') FOR [SubDiasCompleto]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__PARAMETRO__TopeM__565FA31D]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[PARAMETROS] ADD  DEFAULT ('') FOR [TopeMaxAportes]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__PARAMETRO__TopeM__5753C756]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[PARAMETROS] ADD  DEFAULT ('') FOR [TopeMaxSalud]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__PARAMETRO__TopeM__5847EB8F]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[PARAMETROS] ADD  DEFAULT ('') FOR [TopeMaxDependientes]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__PARAMETRO__Aport__593C0FC8]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[PARAMETROS] ADD  DEFAULT ('') FOR [AportanteExoneradoCajaSalud]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__PARAMETRO__Redon__5A303401]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[PARAMETROS] ADD  DEFAULT ('') FOR [RedoneaRetefuente]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__PARAMETRO__SubPr__5B24583A]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[PARAMETROS] ADD  DEFAULT ('') FOR [SubPrimeraVariables]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__PARAMETRO__DiasN__5C187C73]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[PARAMETROS] ADD  DEFAULT ('') FOR [DiasNoLabDerecho]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__PARAMETRO__DiasT__5D0CA0AC]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[PARAMETROS] ADD  DEFAULT ('') FOR [DiasTrans]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__PARAMETRO__Gasto__5E00C4E5]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[PARAMETROS] ADD  DEFAULT ('S') FOR [GastoVacacionesAnt]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__PARAMETRO__DedSa__5EF4E91E]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[PARAMETROS] ADD  DEFAULT ('S') FOR [DedSaludMesAct]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__PARAMETRO__Redon__5FE90D57]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[PARAMETROS] ADD  DEFAULT ('S') FOR [RedondeoSaludPension]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__PARAMETRO__UsaCo__60DD3190]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[PARAMETROS] ADD  DEFAULT ('S') FOR [UsaConceptosSena]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__PARAMETROS__SSL__61D155C9]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[PARAMETROS] ADD  DEFAULT ((0)) FOR [SSL]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__PARAMETRO__Liqui__11A0647C]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[PARAMETROS] ADD  DEFAULT ('') FOR [LiquidaDiasDerecho]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__PARAMETRO__Dia31__1506E10C]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[PARAMETROS] ADD  DEFAULT ('N') FOR [Dia31]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__PARAMETRO__IbcAn__7FC1AB63]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[PARAMETROS] ADD  DEFAULT ('N') FOR [IbcAnt]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__PARAMETRO__PorcM__71C0D22B]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[PARAMETROS] ADD  DEFAULT ('60') FOR [PorcMinBaseRet]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__PARAMETRO__Fec_A__72B4F664]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[PARAMETROS] ADD  DEFAULT ('20170101') FOR [Fec_Aplica_Reforma]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__PARAMETRO__Auten__73A91A9D]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[PARAMETROS] ADD  DEFAULT ((0)) FOR [Autenticar]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__PARAMETROSP__Ano__6F8056A2]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[PARAMETROSPROYECCIONES] ADD  DEFAULT ('') FOR [Ano]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__PARAMETRO__PorCe__725CC34D]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[PARAMETROSPROYECCIONES] ADD  DEFAULT ('') FOR [PorCesantias]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__PARAMETRO__PorPr__7350E786]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[PARAMETROSPROYECCIONES] ADD  DEFAULT ('') FOR [PorPrimas]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__PARAMETRO__PorVa__74450BBF]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[PARAMETROSPROYECCIONES] ADD  DEFAULT ('') FOR [PorVacaciones]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__PARAMETRO__PorCa__75392FF8]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[PARAMETROSPROYECCIONES] ADD  DEFAULT ('') FOR [PorCajaCompensacion]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__PARAMETRO__PorIC__762D5431]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[PARAMETROSPROYECCIONES] ADD  DEFAULT ('') FOR [PorICBF]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__PARAMETRO__PorSe__7721786A]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[PARAMETROSPROYECCIONES] ADD  DEFAULT ('') FOR [PorSena]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__PARAMETRO__PorSa__78159CA3]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[PARAMETROSPROYECCIONES] ADD  DEFAULT ('') FOR [PorSaludEmpresa]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__PARAMETRO__PorPe__7909C0DC]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[PARAMETROSPROYECCIONES] ADD  DEFAULT ('') FOR [PorPensionEmpresa]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__PARAMETRO__PorAR__79FDE515]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[PARAMETROSPROYECCIONES] ADD  DEFAULT ('') FOR [PorARL]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__PARAMETRO__Minim__7AF2094E]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[PARAMETROSPROYECCIONES] ADD  DEFAULT ('') FOR [MinimoLegal]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__PARAMETRO__Minim__7BE62D87]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[PARAMETROSPROYECCIONES] ADD  DEFAULT ('') FOR [MinimoIntegral]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__PARAMETRO__Subsi__7CDA51C0]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[PARAMETROSPROYECCIONES] ADD  DEFAULT ('') FOR [SubsidioTransporte]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__PARAMETRO__Ley14__7DCE75F9]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[PARAMETROSPROYECCIONES] ADD  DEFAULT ('') FOR [Ley1429]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__PARAMETRO__SalMi__7EC29A32]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[PARAMETROSPROYECCIONES] ADD  DEFAULT ('') FOR [SalMinAsegurables]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__PARAMETRO__Excel__33EA8F88]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[PARAMETROSRRHH] ADD  DEFAULT ('') FOR [Excelente]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__PARAMETRO__Bueno__34DEB3C1]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[PARAMETROSRRHH] ADD  DEFAULT ('') FOR [Bueno]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__PARAMETRO__Acept__35D2D7FA]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[PARAMETROSRRHH] ADD  DEFAULT ('') FOR [Aceptable]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__PARAMETRO__Regul__36C6FC33]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[PARAMETROSRRHH] ADD  DEFAULT ('') FOR [Regular]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__PARAMETRO__Defic__37BB206C]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[PARAMETROSRRHH] ADD  DEFAULT ('') FOR [Deficiente]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__PARAMETROS__Alto__38AF44A5]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[PARAMETROSRRHH] ADD  DEFAULT ('') FOR [Alto]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__PARAMETRO__Medio__39A368DE]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[PARAMETROSRRHH] ADD  DEFAULT ('') FOR [Medio]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__PARAMETROS__Bajo__3A978D17]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[PARAMETROSRRHH] ADD  DEFAULT ('') FOR [Bajo]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__PARAMETRO__Clave__6ED64B2C]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[PARAMETROSSEGURIDAD] ADD  DEFAULT ('') FOR [ClaveSegura]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__PARAMETRO__CaseS__6FCA6F65]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[PARAMETROSSEGURIDAD] ADD  DEFAULT ('') FOR [CaseSensitive]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__PARAMETRO__CantI__70BE939E]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[PARAMETROSSEGURIDAD] ADD  DEFAULT ('') FOR [CantIntentos]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__PARAMETRO__CantC__71B2B7D7]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[PARAMETROSSEGURIDAD] ADD  DEFAULT ('') FOR [CantClavesAnt]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__PARAMETRO__DiasA__72A6DC10]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[PARAMETROSSEGURIDAD] ADD  DEFAULT ('') FOR [DiasAviso]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__PARAMETRO__CambC__739B0049]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[PARAMETROSSEGURIDAD] ADD  DEFAULT ('') FOR [CambClave]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__PARAMETRO__MinCl__748F2482]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[PARAMETROSSEGURIDAD] ADD  DEFAULT ('') FOR [MinClave]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__PERFILCAR__Cod_C__3C7FD589]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[PERFILCARGO] ADD  DEFAULT ('') FOR [Cod_Cargo]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__PERFILCAR__Cod_P__3D73F9C2]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[PERFILCARGO] ADD  DEFAULT ('') FOR [Cod_Perfil]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__PERFILCAR__Cod_P__3E681DFB]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[PERFILCARGO] ADD  DEFAULT ('') FOR [Cod_Profesion]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__PERFILCAR__Cod_I__3F5C4234]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[PERFILCARGO] ADD  DEFAULT ('') FOR [Cod_Institucion]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__PERFILCAR__Cod_E__4050666D]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[PERFILCARGO] ADD  DEFAULT ('') FOR [Cod_Especialidad]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__PERFILCAR__Nivel__41448AA6]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[PERFILCARGO] ADD  DEFAULT ('') FOR [Nivel_Educativo]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__PERFILCAR__Asp_S__4238AEDF]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[PERFILCARGO] ADD  DEFAULT ('') FOR [Asp_Salarial]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__PERFILCAR__Idiom__432CD318]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[PERFILCARGO] ADD  DEFAULT ('') FOR [Idioma]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__PERFILCAR__Domin__4420F751]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[PERFILCARGO] ADD  DEFAULT ('') FOR [Dominio]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__PERFILCAR__Exp_L__45151B8A]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[PERFILCARGO] ADD  DEFAULT ('') FOR [Exp_Laboral]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__PERFILCARG__Sexo__46093FC3]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[PERFILCARGO] ADD  DEFAULT ('') FOR [Sexo]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__PERFILCARG__Edad__46FD63FC]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[PERFILCARGO] ADD  DEFAULT ('') FOR [Edad]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__PERFILCAR__Nacio__47F18835]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[PERFILCARGO] ADD  DEFAULT ('') FOR [Nacionalidad]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__PERFILCAR__Est_C__48E5AC6E]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[PERFILCARGO] ADD  DEFAULT ('') FOR [Est_Civil]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__PERFILCOM__Cod_P__4ACDF4E0]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[PERFILCOMPETENCIA] ADD  DEFAULT ('') FOR [Cod_Perfil]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__PERFILCOM__Cod_C__4BC21919]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[PERFILCOMPETENCIA] ADD  DEFAULT ('') FOR [Cod_Competencia]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__PERFILES__Cod_Pe__4E9E85C4]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[PERFILES] ADD  DEFAULT ('') FOR [Cod_Perfil]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__PERFILES__Descri__4F92A9FD]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[PERFILES] ADD  DEFAULT ('') FOR [Descripcion]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__PERFILESP__Cod_P__517AF26F]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[PERFILESPECIALIDAD] ADD  DEFAULT ('') FOR [Cod_Perfil]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__PERFILESP__Cod_E__526F16A8]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[PERFILESPECIALIDAD] ADD  DEFAULT ('') FOR [Cod_Especialidad]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__PERFILINS__Cod_P__54575F1A]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[PERFILINSTITUCION] ADD  DEFAULT ('') FOR [Cod_Perfil]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__PERFILINS__Cod_I__554B8353]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[PERFILINSTITUCION] ADD  DEFAULT ('') FOR [Cod_Institucion]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__PERFILNIV__Cod_P__5733CBC5]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[PERFILNIVELEDUCATIVO] ADD  DEFAULT ('') FOR [Cod_Perfil]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__PERFILNIV__Cod_N__5827EFFE]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[PERFILNIVELEDUCATIVO] ADD  DEFAULT ('') FOR [Cod_NivelEducativo]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__PERFILNIV__Nom_N__591C1437]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[PERFILNIVELEDUCATIVO] ADD  DEFAULT ('') FOR [Nom_NivelEducativo]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__PERFILPRO__Cod_P__5B045CA9]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[PERFILPROFESION] ADD  DEFAULT ('') FOR [Cod_Perfil]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__PERFILPRO__Cod_P__5BF880E2]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[PERFILPROFESION] ADD  DEFAULT ('') FOR [Cod_Profesion]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__PERMISOS___Usuar__19E0A4C2]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[PERMISOS_WEB] ADD  DEFAULT ('') FOR [Usuario]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__PERMISOS___Pagin__1AD4C8FB]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[PERMISOS_WEB] ADD  DEFAULT ('') FOR [Pagina]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__PERMISOS___Permi__1BC8ED34]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[PERMISOS_WEB] ADD  DEFAULT ('') FOR [Permiso]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__PERMISOS___Descr__1CBD116D]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[PERMISOS_WEB] ADD  DEFAULT ('') FOR [Descripcion]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__PERMISOS_W__Page__1DB135A6]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[PERMISOS_WEB] ADD  DEFAULT ('') FOR [Page]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__PERSONALI__Cod_P__5ED4ED8D]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[PERSONALIDADES] ADD  DEFAULT ('') FOR [Cod_Perfil]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__PERSONALI__Cod_P__5FC911C6]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[PERSONALIDADES] ADD  DEFAULT ('') FOR [Cod_Personalidad]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__PERSONALI__Descr__60BD35FF]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[PERSONALIDADES] ADD  DEFAULT ('') FOR [Descripcion]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__PLANTILLA__Nomb___4854A844]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[PLANTILLAS_CERTIFICADOS] ADD  DEFAULT ('') FOR [Nomb_Plantilla]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__PLANTILLA__Aprob__4948CC7D]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[PLANTILLAS_CERTIFICADOS] ADD  DEFAULT ((0)) FOR [Aprobacion]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__PPTOGASTO__Mes1P__7CEF6059]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[PPTOGASTOSDET] ADD  DEFAULT ('') FOR [Mes1Prov]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__PPTOGASTO__Mes2P__7DE38492]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[PPTOGASTOSDET] ADD  DEFAULT ('') FOR [Mes2Prov]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__PPTOGASTO__Mes3P__7ED7A8CB]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[PPTOGASTOSDET] ADD  DEFAULT ('') FOR [Mes3Prov]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__PPTOGASTO__Mes4P__7FCBCD04]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[PPTOGASTOSDET] ADD  DEFAULT ('') FOR [Mes4Prov]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__PPTOGASTO__Mes5P__00BFF13D]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[PPTOGASTOSDET] ADD  DEFAULT ('') FOR [Mes5Prov]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__PPTOGASTO__Mes6P__01B41576]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[PPTOGASTOSDET] ADD  DEFAULT ('') FOR [Mes6Prov]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__PPTOGASTO__Mes7P__02A839AF]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[PPTOGASTOSDET] ADD  DEFAULT ('') FOR [Mes7Prov]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__PPTOGASTO__Mes8P__039C5DE8]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[PPTOGASTOSDET] ADD  DEFAULT ('') FOR [Mes8Prov]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__PPTOGASTO__Mes9P__04908221]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[PPTOGASTOSDET] ADD  DEFAULT ('') FOR [Mes9Prov]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__PPTOGASTO__Mes10__0584A65A]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[PPTOGASTOSDET] ADD  DEFAULT ('') FOR [Mes10Prov]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__PPTOGASTO__Mes11__0678CA93]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[PPTOGASTOSDET] ADD  DEFAULT ('') FOR [Mes11Prov]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__PPTOGASTO__Mes12__076CEECC]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[PPTOGASTOSDET] ADD  DEFAULT ('') FOR [Mes12Prov]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__PPTOGASTO__Mes1S__08611305]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[PPTOGASTOSDET] ADD  DEFAULT ('') FOR [Mes1SS]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__PPTOGASTO__Mes2S__0955373E]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[PPTOGASTOSDET] ADD  DEFAULT ('') FOR [Mes2SS]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__PPTOGASTO__Mes3S__0A495B77]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[PPTOGASTOSDET] ADD  DEFAULT ('') FOR [Mes3SS]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__PPTOGASTO__Mes4S__0B3D7FB0]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[PPTOGASTOSDET] ADD  DEFAULT ('') FOR [Mes4SS]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__PPTOGASTO__Mes5S__0C31A3E9]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[PPTOGASTOSDET] ADD  DEFAULT ('') FOR [Mes5SS]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__PPTOGASTO__Mes6S__0D25C822]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[PPTOGASTOSDET] ADD  DEFAULT ('') FOR [Mes6SS]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__PPTOGASTO__Mes7S__0E19EC5B]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[PPTOGASTOSDET] ADD  DEFAULT ('') FOR [Mes7SS]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__PPTOGASTO__Mes8S__0F0E1094]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[PPTOGASTOSDET] ADD  DEFAULT ('') FOR [Mes8SS]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__PPTOGASTO__Mes9S__100234CD]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[PPTOGASTOSDET] ADD  DEFAULT ('') FOR [Mes9SS]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__PPTOGASTO__Mes10__10F65906]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[PPTOGASTOSDET] ADD  DEFAULT ('') FOR [Mes10SS]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__PPTOGASTO__Mes11__11EA7D3F]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[PPTOGASTOSDET] ADD  DEFAULT ('') FOR [Mes11SS]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__PPTOGASTO__Mes12__12DEA178]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[PPTOGASTOSDET] ADD  DEFAULT ('') FOR [Mes12SS]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__PPTOGASTO__TipoP__13D2C5B1]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[PPTOGASTOSDET] ADD  DEFAULT ('') FOR [TipoPP]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__PPTOGASTO__Conse__14C6E9EA]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[PPTOGASTOSDET] ADD  DEFAULT ('') FOR [Consecutivo]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__PPTOGASTO__TipoP__15BB0E23]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[PPTOGASTOSENC] ADD  DEFAULT ('') FOR [TipoPpto]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__PPTOGASTO__FecRo__16AF325C]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[PPTOGASTOSENC] ADD  DEFAULT ('') FOR [FecRolling]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__PPTOGASTO__Cod_A__139DBB87]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[PPTOGASTOSENC] ADD  DEFAULT ((0)) FOR [Cod_AccesoDatos]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__PREGUNTAS__Cod_P__6399A2AA]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[PREGUNTAS] ADD  DEFAULT ('') FOR [Cod_Pregunta]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__PREGUNTAS__Nom_P__648DC6E3]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[PREGUNTAS] ADD  DEFAULT ('') FOR [Nom_Pregunta]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__PREGUNTAS__Tipo___6581EB1C]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[PREGUNTAS] ADD  DEFAULT ('') FOR [Tipo_Pregunta]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__PREGUNTAS__Dirig__66760F55]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[PREGUNTAS] ADD  DEFAULT ('') FOR [Dirigida]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__PREGUNTAS__Defin__676A338E]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[PREGUNTAS] ADD  DEFAULT ('') FOR [Definicion]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__PRESTAMOS__Cod_E__02E830D1]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[PRESTAMOS] ADD  DEFAULT ((0)) FOR [Cod_Empleado]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__PRESTAMOS__Monto__05C49D7C]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[PRESTAMOS] ADD  DEFAULT ((0)) FOR [MontoInicial]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__PRESTAMOS__Monto__06B8C1B5]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[PRESTAMOS] ADD  DEFAULT ((0)) FOR [MontoFinal]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__PRESTAMOS__Perio__07ACE5EE]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[PRESTAMOS] ADD  DEFAULT ((0)) FOR [Periodos]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__PRESTAMOS__Efect__08A10A27]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[PRESTAMOS] ADD  DEFAULT ((0)) FOR [EfectivoAnual]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__PRESTAMOS__Fecha__09952E60]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[PRESTAMOS] ADD  DEFAULT ('') FOR [FechaInicial]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__PRESTAMOS__Cod_C__086BFFFD]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[PRESTAMOS] ADD  DEFAULT ((0)) FOR [Cod_ConceptoIntereses]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__PRESTAMOS__Cod_C__09602436]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[PRESTAMOS] ADD  DEFAULT ((0)) FOR [Cod_ConceptoCapital]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__PRESTAMOS__AutoN__1A8AB038]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[PRESTAMOS] ADD  DEFAULT ((0)) FOR [AutoNumNovedadesCap]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__PRESTAMOS__AutoN__1B7ED471]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[PRESTAMOS] ADD  DEFAULT ((0)) FOR [AutoNumNovedadesInt]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__PRESTAMOS__TipoI__288EB6CC]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[PRESTAMOS] ADD  DEFAULT ('C') FOR [TipoInteres]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__PRESTAMOS__Aplic__2982DB05]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[PRESTAMOS] ADD  DEFAULT ('2') FOR [Aplica]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__PROGRAMAS__Cod_P__6A46A039]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[PROGRAMAS] ADD  DEFAULT ('') FOR [Cod_Programa]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__PROGRAMAS__Tipo___6B3AC472]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[PROGRAMAS] ADD  DEFAULT ('') FOR [Tipo_Programa]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__PROGRAMAS__Nom_P__6C2EE8AB]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[PROGRAMAS] ADD  DEFAULT ('') FOR [Nom_Programa]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__PROGRAMAS__Costo__6D230CE4]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[PROGRAMAS] ADD  DEFAULT ('') FOR [Costo_Promedio_Programa]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__PROGRAMAS__Durac__6E17311D]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[PROGRAMAS] ADD  DEFAULT ('') FOR [Duracion]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__PROGRAMAS__Calif__6F0B5556]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[PROGRAMAS] ADD  DEFAULT ('') FOR [Calificacion]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__PROGRAMAS__Objet__6FFF798F]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[PROGRAMAS] ADD  DEFAULT ('') FOR [Objetivo]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__PROGRAMAS__Estad__70F39DC8]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[PROGRAMAS] ADD  DEFAULT ('') FOR [Estado]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__PROGRAMAS__Cod_P__72DBE63A]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[PROGRAMASSALUDOCUPACIONAL] ADD  DEFAULT ('') FOR [Cod_Programa]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__PROGRAMAS__Cod_P__73D00A73]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[PROGRAMASSALUDOCUPACIONAL] ADD  DEFAULT ('') FOR [Cod_Programa_Maestro]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__PROGRAMAS__Tipo___74C42EAC]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[PROGRAMASSALUDOCUPACIONAL] ADD  DEFAULT ('') FOR [Tipo_Programa]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__PROGRAMAS__Cod_C__75B852E5]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[PROGRAMASSALUDOCUPACIONAL] ADD  DEFAULT ('') FOR [Cod_Capacitador]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__PROGRAMAS__Costo__76AC771E]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[PROGRAMASSALUDOCUPACIONAL] ADD  DEFAULT ('') FOR [Costo_Aproximado_Programa]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__PROGRAMAS__Tiemp__77A09B57]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[PROGRAMASSALUDOCUPACIONAL] ADD  DEFAULT ('') FOR [Tiempo_Estimado_Por_Unidad]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__PROGRAMAS__Total__7894BF90]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[PROGRAMASSALUDOCUPACIONAL] ADD  DEFAULT ('') FOR [Total_Candidatos]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__PROGRAMAS__Total__7988E3C9]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[PROGRAMASSALUDOCUPACIONAL] ADD  DEFAULT ('') FOR [Total_Participantes]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__PROGRAMAS__Efect__7A7D0802]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[PROGRAMASSALUDOCUPACIONAL] ADD  DEFAULT ('') FOR [Efectividad]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__PROGRAMAS__Cod_U__7B712C3B]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[PROGRAMASSALUDOCUPACIONAL] ADD  DEFAULT ('') FOR [Cod_Usuario]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__PROGRAMAS__Fecha__7C655074]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[PROGRAMASSALUDOCUPACIONAL] ADD  DEFAULT ('') FOR [Fecha_Aprobado]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__PROGRAMAS__Fecha__7D5974AD]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[PROGRAMASSALUDOCUPACIONAL] ADD  DEFAULT ('') FOR [Fecha_Inicio]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__PROGRAMAS__Fecha__7E4D98E6]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[PROGRAMASSALUDOCUPACIONAL] ADD  DEFAULT ('') FOR [Fecha_Cierre]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__PROGRAMAS__Fecha__7F41BD1F]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[PROGRAMASSALUDOCUPACIONAL] ADD  DEFAULT ('') FOR [Fecha_Real_Inicio]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__PROGRAMAS__Fecha__0035E158]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[PROGRAMASSALUDOCUPACIONAL] ADD  DEFAULT ('') FOR [Fecha_Real_Cierre]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__PROGRAMAS__Estad__012A0591]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[PROGRAMASSALUDOCUPACIONAL] ADD  DEFAULT ('') FOR [Estado]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__PROGRAMAS__Fecha__021E29CA]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[PROGRAMASSALUDOCUPACIONAL] ADD  DEFAULT ('') FOR [Fecha_Req]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__PROGRAMAS__Hora___03124E03]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[PROGRAMASSALUDOCUPACIONAL] ADD  DEFAULT ('') FOR [Hora_Req]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__PROGRAMAS__Cober__749D3ED6]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[PROGRAMASSALUDOCUPACIONAL] ADD  DEFAULT ('') FOR [Cobertura]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__PUC__UtilizaSucu__3D89085B]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[PUC] ADD  DEFAULT ('') FOR [UtilizaSucursal]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__PUC__UtilizaTerc__75CD617E]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[PUC] ADD  DEFAULT ('') FOR [UtilizaTercero]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__PUC__TipoTercero__7D246A83]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[PUC] ADD  DEFAULT ('') FOR [TipoTercero]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__PUC__CodigoExter__459F2B6F]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[PUC] ADD  DEFAULT ('') FOR [CodigoExterno]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__PUC__CodigoLocal__46934FA8]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[PUC] ADD  DEFAULT ('') FOR [CodigoLocal]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__PUC__UtilizaProf__5E6AD939]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[PUC] ADD  DEFAULT ('') FOR [UtilizaProfit]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__PUC__UtilizaCost__5F5EFD72]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[PUC] ADD  DEFAULT ('') FOR [UtilizaCostCenter]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__PUC__SubCta__11D56EA6]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[PUC] ADD  DEFAULT ('') FOR [SubCta]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__RANGO_INC__PorcE__3BA18B40]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[RANGO_INCAPACIDADES] ADD  DEFAULT ('') FOR [PorcEmpresa]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__RANGOSPRI__Desde__16700691]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[RANGOSPRIMAS] ADD  DEFAULT ('') FOR [Desde]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__RANGOSPRI__Hasta__194C733C]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[RANGOSPRIMAS] ADD  DEFAULT ('') FOR [Hasta]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__RANGOSPRI__Por_A__1A409775]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[RANGOSPRIMAS] ADD  DEFAULT ('') FOR [Por_Aplicar]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__RANGOSPRI__Val_A__1B34BBAE]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[RANGOSPRIMAS] ADD  DEFAULT ('') FOR [Val_Aplicar]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__RANGOSPRI__Cod_V__1C28DFE7]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[RANGOSPRIMAS] ADD  DEFAULT ((0)) FOR [Cod_Variable]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__RANGOSPRI__Dias___552C5319]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[RANGOSPRIMAS] ADD  DEFAULT ((0)) FOR [Dias_Aplicar]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__REFERENCI__Cod_H__04FA9675]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[REFERENCIAS_PERSONALES] ADD  DEFAULT ('') FOR [Cod_HojaVida]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__REFERENCI__Nombr__05EEBAAE]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[REFERENCIAS_PERSONALES] ADD  DEFAULT ('') FOR [Nombre]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__REFERENCI__Ocupa__06E2DEE7]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[REFERENCIAS_PERSONALES] ADD  DEFAULT ('') FOR [Ocupacion]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__REFERENCI__Telef__07D70320]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[REFERENCIAS_PERSONALES] ADD  DEFAULT ('') FOR [Telefono]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__REFERENCI__Verif__08CB2759]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[REFERENCIAS_PERSONALES] ADD  DEFAULT ('') FOR [Verificado]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__REFERENCI__Obser__758348BB]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[REFERENCIAS_PERSONALES] ADD  DEFAULT ('') FOR [Observaciones]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__REFERENCI__Tipo___605321AB]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[REFERENCIAS_PERSONALES] ADD  DEFAULT ('') FOR [Tipo_Referencia]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__RELACIONB__Cod_E__45E24FED]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[RELACIONBANCOEMPLEADO] ADD  DEFAULT ('') FOR [Cod_Empleado]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__RELACIONB__Forma__7591630F]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[RELACIONBANCOEMPLEADO] ADD  DEFAULT ('') FOR [FormaPago]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__RELACIONB__Vigen__76858748]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[RELACIONBANCOEMPLEADO] ADD  DEFAULT ('') FOR [Vigencia]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__RELACIONB__Prior__7779AB81]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[RELACIONBANCOEMPLEADO] ADD  DEFAULT ('') FOR [Prioridad]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__RELACIONB__Tipo___786DCFBA]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[RELACIONBANCOEMPLEADO] ADD  DEFAULT ('') FOR [Tipo_Cta]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__RELACIONB__Banco__7961F3F3]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[RELACIONBANCOEMPLEADO] ADD  DEFAULT ('') FOR [Banco]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__RELACIONB__Num_C__7A56182C]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[RELACIONBANCOEMPLEADO] ADD  DEFAULT ('') FOR [Num_Cta]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__RELACIONB__Valor__7B4A3C65]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[RELACIONBANCOEMPLEADO] ADD  DEFAULT ('') FOR [ValorDivision]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__RELACIONC__Cod_C__0AB36FCB]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[RELACIONCAPACITADORESPROGRAMAS] ADD  DEFAULT ('') FOR [Cod_Capacitador]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__RELACIONC__Cod_P__0BA79404]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[RELACIONCAPACITADORESPROGRAMAS] ADD  DEFAULT ('') FOR [Cod_Programa]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__RELACIONC__Costo__0C9BB83D]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[RELACIONCAPACITADORESPROGRAMAS] ADD  DEFAULT ('') FOR [Costo_Programa]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__RELACIONC__Durac__0D8FDC76]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[RELACIONCAPACITADORESPROGRAMAS] ADD  DEFAULT ('') FOR [Duracion]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__RELACIONC__Calif__0E8400AF]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[RELACIONCAPACITADORESPROGRAMAS] ADD  DEFAULT ('') FOR [Calificacion]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__RELACIONC__Alcan__0F7824E8]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[RELACIONCAPACITADORESPROGRAMAS] ADD  DEFAULT ('') FOR [Alcance]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__RELACIONC__Estad__106C4921]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[RELACIONCAPACITADORESPROGRAMAS] ADD  DEFAULT ('') FOR [Estado]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__RELACIONC__Cober__7C3E609E]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[RELACIONCAPACITADORESPROGRAMAS] ADD  DEFAULT ('') FOR [Cobertura]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__RELACIONC__Cod_C__2255EF32]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[RELACIONCARGOSPROGRAMAS] ADD  DEFAULT ('') FOR [Cod_Cargo]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__RELACIONC__Cod_P__234A136B]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[RELACIONCARGOSPROGRAMAS] ADD  DEFAULT ('') FOR [Cod_Programa]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__RELACIONC__Justi__243E37A4]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[RELACIONCARGOSPROGRAMAS] ADD  DEFAULT ('') FOR [Justificacion]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__RELACIONC__Estad__25325BDD]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[RELACIONCARGOSPROGRAMAS] ADD  DEFAULT ('') FOR [Estado]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__RELACIONC__WBS_U__3568C3A6]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[RELACIONCARGOSWBS] ADD  DEFAULT ('') FOR [WBS_Usado]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__RELACIONC__Cod_E__0D10B989]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[RELACIONCONENTIDAD] ADD  DEFAULT ('') FOR [Cod_Entidad]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__RELACIONC__Cod_C__12C992DF]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[RELACIONCONENTIDAD] ADD  DEFAULT ('') FOR [Cod_Concepto]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__RELACIONC__Cod_D__13BDB718]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[RELACIONCONENTIDAD] ADD  DEFAULT ('') FOR [Cod_Detalle]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__RELACIONE__Cod_E__3C15C135]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[RELACIONEMPLEADOSWBS] ADD  DEFAULT ('') FOR [Cod_Empleado]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__RELACIONEMP__WBS__3D09E56E]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[RELACIONEMPLEADOSWBS] ADD  DEFAULT ('') FOR [WBS]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__RELACIONE__Codig__3EF22DE0]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[RELACIONEMPLEADOSWBS] ADD  DEFAULT ('') FOR [CodigoCcos]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__RELACIONE__Conse__3FE65219]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[RELACIONEMPLEADOSWBS] ADD  DEFAULT ('') FOR [Consecutivo]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__RELACIONE__Cod_D__2EBBC617]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[RELACIONEMPTAR] ADD  DEFAULT ('') FOR [Cod_Depto]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__RELACIONG__Cod_C__46D27B73]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[RELACIONGASTOCONPUC] ADD  DEFAULT ('') FOR [Cod_Clase]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__RELACIONG__Cod_T__47C69FAC]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[RELACIONGASTOCONPUC] ADD  DEFAULT ('') FOR [Cod_Tipo_Campo]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__RELACIONG__Cod_D__48BAC3E5]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[RELACIONGASTOCONPUC] ADD  DEFAULT ('') FOR [Cod_Detalle]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__RELACIONG__Cod_T__49AEE81E]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[RELACIONGASTOCONPUC] ADD  DEFAULT ('') FOR [Cod_Tipo_Gasto]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__RELACIONG__Cod_C__4AA30C57]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[RELACIONGASTOCONPUC] ADD  DEFAULT ('') FOR [Cod_Concepto]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__RELACIONG__Cod_C__4B973090]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[RELACIONGASTOCONPUC] ADD  DEFAULT ('') FOR [Cod_Cta]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__RELACIONP__Relac__47CA985F]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[RELACIONPAGOSASOCIADOS] ADD  DEFAULT ((0)) FOR [RelacionPagoDivision]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__RELACIONP__Relac__7D3284D7]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[RELACIONPAGOSASOCIADOS] ADD  DEFAULT ((0)) FOR [RelacionPagoDivisionSecundario]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__REQUERIMI__Cod_R__1348B5CC]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[REQUERIMIENTOS] ADD  DEFAULT ('') FOR [Cod_Requerimiento]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__REQUERIMI__Cod_U__143CDA05]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[REQUERIMIENTOS] ADD  DEFAULT ('') FOR [Cod_Usuario]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__REQUERIMI__Fecha__1530FE3E]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[REQUERIMIENTOS] ADD  DEFAULT ('') FOR [Fecha_Req]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__REQUERIMI__Hora___16252277]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[REQUERIMIENTOS] ADD  DEFAULT ('') FOR [Hora_Req]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__REQUERIMI__Cod_M__171946B0]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[REQUERIMIENTOS] ADD  DEFAULT ('') FOR [Cod_Motivo]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__REQUERIMI__Cod_C__180D6AE9]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[REQUERIMIENTOS] ADD  DEFAULT ('') FOR [Cod_Cargo]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__REQUERIMI__Cod_P__19018F22]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[REQUERIMIENTOS] ADD  DEFAULT ('') FOR [Cod_Perfil]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__REQUERIMI__Fecha__19F5B35B]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[REQUERIMIENTOS] ADD  DEFAULT ('') FOR [Fecha_Ing_Aprox]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__REQUERIMI__Punta__1AE9D794]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[REQUERIMIENTOS] ADD  DEFAULT ('') FOR [Puntaje1]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__REQUERIMI__Punta__1BDDFBCD]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[REQUERIMIENTOS] ADD  DEFAULT ('') FOR [Puntaje2]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__REQUERIMI__Cod_Z__1CD22006]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[REQUERIMIENTOS] ADD  DEFAULT ('') FOR [Cod_Zona]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__REQUERIMI__Cod_S__1DC6443F]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[REQUERIMIENTOS] ADD  DEFAULT ('') FOR [Cod_Sucursal]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__REQUERIMI__Cod_C__1EBA6878]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[REQUERIMIENTOS] ADD  DEFAULT ('') FOR [Cod_Ccosto]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__REQUERIMI__Cod_D__1FAE8CB1]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[REQUERIMIENTOS] ADD  DEFAULT ('') FOR [Cod_Depto]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__REQUERIMI__Fecha__20A2B0EA]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[REQUERIMIENTOS] ADD  DEFAULT ('') FOR [Fecha_Evento]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__REQUERIMI__Fecha__2196D523]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[REQUERIMIENTOS] ADD  DEFAULT ('') FOR [Fecha_Cierre]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__REQUERIMI__Estad__228AF95C]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[REQUERIMIENTOS] ADD  DEFAULT ('') FOR [Estado]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__REQUERIMI__Descr__7E188EBC]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[REQUERIMIENTOS] ADD  DEFAULT ('') FOR [Descripcion]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__REQUERIMI__Cod_S__614745E4]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[REQUERIMIENTOS] ADD  DEFAULT ('') FOR [Cod_Solicitante]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__RESUMENAP__Cod_E__49B2E0D1]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[RESUMENAPORTES] ADD  DEFAULT ('') FOR [Cod_Empleado]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__RESUMENAP__Cod_C__7E26A910]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[RESUMENAPORTES] ADD  DEFAULT ((0)) FOR [Cod_Concepto]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__RESUMENAP__Val_N__7F1ACD49]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[RESUMENAPORTES] ADD  DEFAULT ((0)) FOR [Val_Novedad]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__RESUMENAP__Cod_S__000EF182]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[RESUMENAPORTES] ADD  DEFAULT ((0)) FOR [Cod_Sucursal]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__RESUMENAP__Fec_N__010315BB]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[RESUMENAPORTES] ADD  DEFAULT ('') FOR [Fec_Nomina]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__RESUMENAP__Num_R__01F739F4]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[RESUMENAPORTES] ADD  DEFAULT ((0)) FOR [Num_Registro]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__RIESGOS__Cod_Rie__25676607]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[RIESGOS] ADD  DEFAULT ('') FOR [Cod_Riesgo]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__RIESGOS__Tipo_Ri__265B8A40]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[RIESGOS] ADD  DEFAULT ('') FOR [Tipo_Riesgo]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__RIESGOS__Nom_Rie__274FAE79]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[RIESGOS] ADD  DEFAULT ('') FOR [Nom_Riesgo]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__SALARIOS__Mot_Ca__4301EA8F]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[SALARIOS] ADD  DEFAULT ('') FOR [Mot_Cambio_Sal]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__SALARIOS__Por_Sa__691D71D6]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[SALARIOS] ADD  DEFAULT ((100)) FOR [Por_Salario]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__SALARIOS__Porc_S__01E91FA0]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[SALARIOS] ADD  DEFAULT ('') FOR [Porc_Salario]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__SALARIOS__FechaA__206DA6C0]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[SALARIOS] ADD  DEFAULT ('') FOR [FechaAplicaRetroactivo]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__SALARIOS__Benefi__2B754518]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[SALARIOS] ADD  DEFAULT ('') FOR [Beneficios]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__SALARIOS__Cod_Us__02EB5E2D]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[SALARIOS] ADD  DEFAULT ((0)) FOR [Cod_Usuario]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__SOLICITUD__Fecha__6CF8EFB2]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[SOLICITUD_APROBA] ADD  DEFAULT ('') FOR [Fecha_Solic]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__SOLICITUD__Cod_E__6DED13EB]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[SOLICITUD_APROBA] ADD  DEFAULT ((0)) FOR [Cod_Emple]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__SOLICITUD__Tipo___6EE13824]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[SOLICITUD_APROBA] ADD  DEFAULT ('') FOR [Tipo_Solic]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__SOLICITUD__Cant___6FD55C5D]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[SOLICITUD_APROBA] ADD  DEFAULT ((0)) FOR [Cant_Aprobar]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__SOLICITUD__Tipo___70C98096]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[SOLICITUD_APROBA] ADD  DEFAULT ('') FOR [Tipo_Cant]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__SOLICITUD__Id_Ap__71BDA4CF]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[SOLICITUD_APROBA] ADD  DEFAULT ((0)) FOR [Id_Aprobador]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__SOLICITUD__Aprob__72B1C908]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[SOLICITUD_APROBA] ADD  DEFAULT ((0)) FOR [Aprobado]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__SOLICITUD__Anula__73A5ED41]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[SOLICITUD_APROBA] ADD  DEFAULT ((0)) FOR [Anulado]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__SOLICITUD__Depto__749A117A]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[SOLICITUD_APROBA] ADD  DEFAULT ((0)) FOR [Depto_Sol]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__SOLICITUD__Canti__03DF8266]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[SOLICITUDES] ADD  DEFAULT ((0)) FOR [Cantidad]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__SOLICITUD__Cod_C__4A3CF0B6]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[SOLICITUDES] ADD  DEFAULT ((0)) FOR [Cod_Concepto]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__SUBPREGUN__Cod_S__2937F6EB]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[SUBPREGUNTAS] ADD  DEFAULT ('') FOR [Cod_SubPregunta]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__SUBPREGUN__Cod_P__2A2C1B24]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[SUBPREGUNTAS] ADD  DEFAULT ('') FOR [Cod_Pregunta]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__SUBPREGUN__Nom_S__2B203F5D]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[SUBPREGUNTAS] ADD  DEFAULT ('') FOR [Nom_SubPregunta]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__SUCURSALE__Cod_C__424DBD78]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[SUCURSALES] ADD  DEFAULT ('') FOR [Cod_CajaComp]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__SUCURSALE__Sucur__617C500E]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[SUCURSALES] ADD  DEFAULT ('') FOR [Sucursal_Sec]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__SUCURSALE__EsEmp__0A895299]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[SUCURSALES] ADD  DEFAULT ('') FOR [EsEmpresa]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__SUCURSALE__Nit_S__0B7D76D2]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[SUCURSALES] ADD  DEFAULT ('') FOR [Nit_Sucursal]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__SUCURSALE__Digit__0C719B0B]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[SUCURSALES] ADD  DEFAULT ('') FOR [Digito_Verificacion]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__SUCURSALE__Unifi__04D3A69F]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[SUCURSALES] ADD  DEFAULT ('') FOR [Unificado]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__SUCURSALE__Cod_A__05C7CAD8]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[SUCURSALES] ADD  DEFAULT ((0)) FOR [Cod_Agencia]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__TABLA_TEM__Codig__632F8E56]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[TABLA_TEMP] ADD  DEFAULT ('') FOR [Codigo]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__TABLA_TEM__Nom_T__6423B28F]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[TABLA_TEMP] ADD  DEFAULT ('') FOR [Nom_Tabla]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__TABLAS_TM__Codig__68E867AC]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[TABLAS_TMP] ADD  DEFAULT ('') FOR [Codigo]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__TABLAS_TM__Nom_T__69DC8BE5]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[TABLAS_TMP] ADD  DEFAULT ('') FOR [Nom_Tabla]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__TABLAS_TM__Cod_C__6AD0B01E]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[TABLAS_TMP] ADD  DEFAULT ('') FOR [Cod_Consecutivo]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__TARIFA_PL__Cod_D__2FAFEA50]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[TARIFA_PLENA] ADD  DEFAULT ('') FOR [Cod_Depto]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__TARIFA_PL__Cod_C__2819B580]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[TARIFA_PLENA] ADD  DEFAULT ((0)) FOR [Cod_Concepto]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__TARIFA_RE__Cod_D__319832C2]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[TARIFA_REDUCIDA] ADD  DEFAULT ('') FOR [Cod_Depto]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__TERCEROS__Cod_Te__4B9B2943]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[TERCEROS] ADD  DEFAULT ('') FOR [Cod_Tercero]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__TERCEROS__Docume__06BBEF11]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[TERCEROS] ADD  DEFAULT ('') FOR [Documento]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__TERCEROS__Dv__07B0134A]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[TERCEROS] ADD  DEFAULT ('') FOR [Dv]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__TERCEROS__Tipo_D__08A43783]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[TERCEROS] ADD  DEFAULT ('') FOR [Tipo_Documento]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__TERCEROS__Tipo_T__09985BBC]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[TERCEROS] ADD  DEFAULT ('') FOR [Tipo_Tercero]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__TERCEROS__PNombr__0A8C7FF5]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[TERCEROS] ADD  DEFAULT ('') FOR [PNombre]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__TERCEROS__SNombr__0B80A42E]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[TERCEROS] ADD  DEFAULT ('') FOR [SNombre]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__TERCEROS__PApell__0C74C867]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[TERCEROS] ADD  DEFAULT ('') FOR [PApellido]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__TERCEROS__SApell__0D68ECA0]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[TERCEROS] ADD  DEFAULT ('') FOR [SApellido]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__TERCEROS__Tercer__0E5D10D9]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[TERCEROS] ADD  DEFAULT ('') FOR [Tercero]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__TERCEROS__Dir_El__0F513512]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[TERCEROS] ADD  DEFAULT ('') FOR [Dir_Elec]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__TERCEROS__Cargo__1045594B]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[TERCEROS] ADD  DEFAULT ('') FOR [Cargo]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__TITULOSAC__Cod_T__2DFCAC08]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[TITULOSACADEMICOS] ADD  DEFAULT ('') FOR [Cod_Titulo]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__TITULOSAC__Descr__2EF0D041]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[TITULOSACADEMICOS] ADD  DEFAULT ('') FOR [Descripcion]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__TURNOS__Cod_Turn__00AAE2A4]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[TURNOS] ADD  DEFAULT ('') FOR [Cod_Turno]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__TURNOS__Nom_Turn__02932B16]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[TURNOS] ADD  DEFAULT ('') FOR [Nom_Turno]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__TURNOS__Hora_Ent__03874F4F]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[TURNOS] ADD  DEFAULT ('') FOR [Hora_Ent]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__TURNOS__Hora_Sal__047B7388]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[TURNOS] ADD  DEFAULT ('') FOR [Hora_Sal]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__TURNOS__Tiempo_A__056F97C1]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[TURNOS] ADD  DEFAULT ('') FOR [Tiempo_Alm]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__TURNOS__Estado_T__0663BBFA]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[TURNOS] ADD  DEFAULT ('') FOR [Estado_Tur]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__TURNOS__Tipo__0757E033]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[TURNOS] ADD  DEFAULT ('') FOR [Tipo]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__TURNOS__Recargo__14B1DB51]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[TURNOS] ADD  DEFAULT ('') FOR [Recargo]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__TURNOS__Cod_Dept__0EC3F7D1]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[TURNOS] ADD  DEFAULT ('') FOR [Cod_Depto]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__USUARIOS__Autori__60882BD5]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[USUARIOS] ADD  DEFAULT ('') FOR [AutorizaPagos]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__USUARIOS__Cedula__03D16812]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[USUARIOS] ADD  DEFAULT ('') FOR [Cedula]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__USUARIOS__Ajusta__19C0A931]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[USUARIOS] ADD  DEFAULT ('') FOR [AjustaProvisiones]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__USUARIOS__Tipous__17A35695]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[USUARIOS] ADD  DEFAULT ('') FOR [Tipousuario]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__USUARIOS__Val_As__18977ACE]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[USUARIOS] ADD  DEFAULT ('') FOR [Val_Asignado]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__USUARIOS__Visual__198B9F07]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[USUARIOS] ADD  DEFAULT ('') FOR [VisualizaSalarios]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__USUARIOS__TipoUs__2C696951]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[USUARIOS] ADD  DEFAULT ('') FOR [TipoUsuario]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__USUARIOS__Perfil__11397D84]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[USUARIOS] ADD  DEFAULT ((0)) FOR [PerfilAsignado]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__USUARIOS__Dir_El__62698002]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[USUARIOS] ADD  DEFAULT ('') FOR [Dir_Elec]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__USUARIOS__Analis__635DA43B]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[USUARIOS] ADD  DEFAULT ('') FOR [Analista]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__USUARIOS___Usuar__10C14EDC]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[USUARIOS_WEB] ADD  DEFAULT ('') FOR [Usuario]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__USUARIOS___Clave__1491DFC0]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[USUARIOS_WEB] ADD  DEFAULT ('') FOR [Clave]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__UsuWeb_Em__Usuar__1A4AB916]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[UsuWeb_Empresas] ADD  DEFAULT ('') FOR [Usuario]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__UsuWeb_Em__Empre__2D5D8D8A]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[UsuWeb_Empresas] ADD  DEFAULT ('') FOR [Empresa]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__VACACIONE__Norma__40257DE4]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[VACACIONES] ADD  DEFAULT ('') FOR [Normales]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__VACACIONE__Descu__4119A21D]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[VACACIONES] ADD  DEFAULT ('') FOR [Descuentos]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__VACACIONE__Fec_C__04CFADEC]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[VACACIONES] ADD  DEFAULT ('') FOR [Fec_Cierre]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__VACACIONE__Noved__4203A4B5]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[VACACIONES] ADD  DEFAULT ('') FOR [Novedades]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__VACACIONE__Propo__560A9D62]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[VACACIONES] ADD  DEFAULT ('') FOR [ProporcionalesP]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__VACACIONE__NumCo__2E51B1C3]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[VACACIONES] ADD  DEFAULT ('') FOR [NumComprobante]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__VACACIONE__Estad__7FCD63B2]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[VACACIONES] ADD  DEFAULT ('') FOR [EstadoRec]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__VACACIONE__PagaS__122DA1BD]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[VACACIONES] ADD  DEFAULT ('S') FOR [PagaSueldo]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__VACACIONE__Util___4760840B]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[VACACIONES] ADD  DEFAULT ('S') FOR [Util_A]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__VARIABLES__Cod_V__6B9AB725]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[VARIABLES] ADD  DEFAULT ('') FOR [Cod_Variable]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__VARIABLES__Descr__7247B4B4]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[VARIABLES] ADD  DEFAULT ('') FOR [Descripcion]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__VARIABLES__Tipo___733BD8ED]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[VARIABLES] ADD  DEFAULT ('') FOR [Tipo_Dato]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__VARIABLES__Taman__742FFD26]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[VARIABLES] ADD  DEFAULT ((0)) FOR [Tamano]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__VARIABLES__Uso__7524215F]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[VARIABLES] ADD  DEFAULT ((0)) FOR [Uso]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__VARIABLES__UsaCo__6C59D134]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[VARIABLES] ADD  DEFAULT ('N') FOR [UsaConcepto]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__VARIABLES__Cod_C__6D4DF56D]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[VARIABLES] ADD  DEFAULT ((0)) FOR [Cod_Concepto]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__VARIABLES__Oblig__62A7151F]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[VARIABLES] ADD  DEFAULT ((0)) FOR [Obligatoria]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__VARIABLES__Cod_E__69B26EB3]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[VARIABLESEMPLEADO] ADD  DEFAULT ('') FOR [Cod_Empleado]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__VARIABLES__Cod_V__6F6B4809]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[VARIABLESEMPLEADO] ADD  DEFAULT ('') FOR [Cod_Variable]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__VARIABLES__Valor__705F6C42]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[VARIABLESEMPLEADO] ADD  DEFAULT ('') FOR [Valor]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__VARIABLES__Vigen__7153907B]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[VARIABLESEMPLEADO] ADD  DEFAULT ('') FOR [Vigencia]
END
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_ACCESODATOS_USUARIOS]') AND parent_object_id = OBJECT_ID(N'[dbo].[ACCESODATOS]'))
ALTER TABLE [dbo].[ACCESODATOS]  WITH CHECK ADD  CONSTRAINT [FK_ACCESODATOS_USUARIOS] FOREIGN KEY([Cod_Usuario])
REFERENCES [dbo].[USUARIOS] ([Cod_Usuario])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_ACCESODATOS_USUARIOS]') AND parent_object_id = OBJECT_ID(N'[dbo].[ACCESODATOS]'))
ALTER TABLE [dbo].[ACCESODATOS] CHECK CONSTRAINT [FK_ACCESODATOS_USUARIOS]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_dbo.ApplicationRoleGroups_dbo.ApplicationGroup_GroupId]') AND parent_object_id = OBJECT_ID(N'[dbo].[ApplicationRoleGroups]'))
ALTER TABLE [dbo].[ApplicationRoleGroups]  WITH CHECK ADD  CONSTRAINT [FK_dbo.ApplicationRoleGroups_dbo.ApplicationGroup_GroupId] FOREIGN KEY([GroupId])
REFERENCES [dbo].[ApplicationGroup] ([Id])
ON DELETE CASCADE
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_dbo.ApplicationRoleGroups_dbo.ApplicationGroup_GroupId]') AND parent_object_id = OBJECT_ID(N'[dbo].[ApplicationRoleGroups]'))
ALTER TABLE [dbo].[ApplicationRoleGroups] CHECK CONSTRAINT [FK_dbo.ApplicationRoleGroups_dbo.ApplicationGroup_GroupId]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_dbo.ApplicationRoleGroups_dbo.AspNetRoles_RoleId]') AND parent_object_id = OBJECT_ID(N'[dbo].[ApplicationRoleGroups]'))
ALTER TABLE [dbo].[ApplicationRoleGroups]  WITH CHECK ADD  CONSTRAINT [FK_dbo.ApplicationRoleGroups_dbo.AspNetRoles_RoleId] FOREIGN KEY([RoleId])
REFERENCES [dbo].[AspNetRoles] ([Id])
ON DELETE CASCADE
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_dbo.ApplicationRoleGroups_dbo.AspNetRoles_RoleId]') AND parent_object_id = OBJECT_ID(N'[dbo].[ApplicationRoleGroups]'))
ALTER TABLE [dbo].[ApplicationRoleGroups] CHECK CONSTRAINT [FK_dbo.ApplicationRoleGroups_dbo.AspNetRoles_RoleId]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_dbo.ApplicationUserGroups_dbo.ApplicationGroup_GroupId]') AND parent_object_id = OBJECT_ID(N'[dbo].[ApplicationUserGroups]'))
ALTER TABLE [dbo].[ApplicationUserGroups]  WITH CHECK ADD  CONSTRAINT [FK_dbo.ApplicationUserGroups_dbo.ApplicationGroup_GroupId] FOREIGN KEY([GroupId])
REFERENCES [dbo].[ApplicationGroup] ([Id])
ON DELETE CASCADE
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_dbo.ApplicationUserGroups_dbo.ApplicationGroup_GroupId]') AND parent_object_id = OBJECT_ID(N'[dbo].[ApplicationUserGroups]'))
ALTER TABLE [dbo].[ApplicationUserGroups] CHECK CONSTRAINT [FK_dbo.ApplicationUserGroups_dbo.ApplicationGroup_GroupId]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_dbo.ApplicationUserGroups_dbo.AspNetUsers_UserId]') AND parent_object_id = OBJECT_ID(N'[dbo].[ApplicationUserGroups]'))
ALTER TABLE [dbo].[ApplicationUserGroups]  WITH CHECK ADD  CONSTRAINT [FK_dbo.ApplicationUserGroups_dbo.AspNetUsers_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])
ON DELETE CASCADE
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_dbo.ApplicationUserGroups_dbo.AspNetUsers_UserId]') AND parent_object_id = OBJECT_ID(N'[dbo].[ApplicationUserGroups]'))
ALTER TABLE [dbo].[ApplicationUserGroups] CHECK CONSTRAINT [FK_dbo.ApplicationUserGroups_dbo.AspNetUsers_UserId]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_dbo.AspNetUserLogins_dbo.AspNetUsers_IdentityUser_Id]') AND parent_object_id = OBJECT_ID(N'[dbo].[AspNetUserLogins]'))
ALTER TABLE [dbo].[AspNetUserLogins]  WITH CHECK ADD  CONSTRAINT [FK_dbo.AspNetUserLogins_dbo.AspNetUsers_IdentityUser_Id] FOREIGN KEY([IdentityUser_Id])
REFERENCES [dbo].[AspNetUsers] ([Id])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_dbo.AspNetUserLogins_dbo.AspNetUsers_IdentityUser_Id]') AND parent_object_id = OBJECT_ID(N'[dbo].[AspNetUserLogins]'))
ALTER TABLE [dbo].[AspNetUserLogins] CHECK CONSTRAINT [FK_dbo.AspNetUserLogins_dbo.AspNetUsers_IdentityUser_Id]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_dbo.AspNetUserRoles_dbo.AspNetRoles_IdentityRole_Id]') AND parent_object_id = OBJECT_ID(N'[dbo].[AspNetUserRoles]'))
ALTER TABLE [dbo].[AspNetUserRoles]  WITH CHECK ADD  CONSTRAINT [FK_dbo.AspNetUserRoles_dbo.AspNetRoles_IdentityRole_Id] FOREIGN KEY([IdentityRole_Id])
REFERENCES [dbo].[AspNetRoles] ([Id])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_dbo.AspNetUserRoles_dbo.AspNetRoles_IdentityRole_Id]') AND parent_object_id = OBJECT_ID(N'[dbo].[AspNetUserRoles]'))
ALTER TABLE [dbo].[AspNetUserRoles] CHECK CONSTRAINT [FK_dbo.AspNetUserRoles_dbo.AspNetRoles_IdentityRole_Id]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_dbo.AspNetUserRoles_dbo.AspNetUsers_IdentityUser_Id]') AND parent_object_id = OBJECT_ID(N'[dbo].[AspNetUserRoles]'))
ALTER TABLE [dbo].[AspNetUserRoles]  WITH CHECK ADD  CONSTRAINT [FK_dbo.AspNetUserRoles_dbo.AspNetUsers_IdentityUser_Id] FOREIGN KEY([IdentityUser_Id])
REFERENCES [dbo].[AspNetUsers] ([Id])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_dbo.AspNetUserRoles_dbo.AspNetUsers_IdentityUser_Id]') AND parent_object_id = OBJECT_ID(N'[dbo].[AspNetUserRoles]'))
ALTER TABLE [dbo].[AspNetUserRoles] CHECK CONSTRAINT [FK_dbo.AspNetUserRoles_dbo.AspNetUsers_IdentityUser_Id]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_dbo.IdentityUserClaims_dbo.AspNetUsers_IdentityUser_Id]') AND parent_object_id = OBJECT_ID(N'[dbo].[IdentityUserClaims]'))
ALTER TABLE [dbo].[IdentityUserClaims]  WITH CHECK ADD  CONSTRAINT [FK_dbo.IdentityUserClaims_dbo.AspNetUsers_IdentityUser_Id] FOREIGN KEY([IdentityUser_Id])
REFERENCES [dbo].[AspNetUsers] ([Id])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_dbo.IdentityUserClaims_dbo.AspNetUsers_IdentityUser_Id]') AND parent_object_id = OBJECT_ID(N'[dbo].[IdentityUserClaims]'))
ALTER TABLE [dbo].[IdentityUserClaims] CHECK CONSTRAINT [FK_dbo.IdentityUserClaims_dbo.AspNetUsers_IdentityUser_Id]
GO
