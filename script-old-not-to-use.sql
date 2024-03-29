CREATE DATABASE [escola_idioma_db]
GO
USE [escola_idioma_db]
GO
/****** Object:  Table [dbo].[Aluno]    Script Date: 10/31/2015 2:26:16 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Aluno](
	[IdAluno] [int] NOT NULL,
	[Nome] [varchar](70) NOT NULL,
	[Endereco] [varchar](255) NOT NULL,
	[CPF] [char](11) NOT NULL,
	[RG] [varchar](15) NULL,
	[Email] [varchar](25) NOT NULL,
	[FormaPagamento] [varchar](15) NOT NULL,
 CONSTRAINT [PK_Aluno] PRIMARY KEY CLUSTERED 
(
	[IdAluno] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[AlunoCompraPacote]    Script Date: 10/31/2015 2:26:16 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AlunoCompraPacote](
	[IdAluno] [int] NOT NULL,
	[IdPacote] [int] NOT NULL,
	[PacoteQuitado] [bit] NOT NULL,
	[Mensalidade] [numeric](10, 2) NOT NULL,
	[QuantidadeTotalDeMensalidades] [int] NULL,
	[QuantidadeDeMensalidadeRestantes] [int] NULL,
	[IdAlunoComparaPacote] [int] NOT NULL,
 CONSTRAINT [PK_AlunoCompraPacote] PRIMARY KEY CLUSTERED 
(
	[IdAlunoComparaPacote] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Curso]    Script Date: 10/31/2015 2:26:16 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Curso](
	[IdCurso] [int] IDENTITY(1,1) NOT NULL,
	[Nome] [varchar](20) NOT NULL,
	[Idioma] [varchar](50) NOT NULL,
	[Duracao] [int] NOT NULL,
	[DataInicio] [datetime] NULL,
	[DataTermino] [datetime] NULL,
	[PrecoCurso] [numeric](10, 2) NULL,
 CONSTRAINT [PK_Curso] PRIMARY KEY CLUSTERED 
(
	[IdCurso] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Pacote]    Script Date: 10/31/2015 2:26:16 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Pacote](
	[IdPacote] [int] IDENTITY(1,1) NOT NULL,
	[NomePacote] [varchar](30) NOT NULL,
	[Descricao] [varchar](255) NULL,
	[PrecoTotalPacote] [numeric](10, 2) NULL,
 CONSTRAINT [PK_Pacote] PRIMARY KEY CLUSTERED 
(
	[IdPacote] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[PacoteTemCurso]    Script Date: 10/31/2015 2:26:16 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PacoteTemCurso](
	[IdPacote] [int] NOT NULL,
	[IdCurso] [int] NOT NULL,
	[IdPacoteTemCurso] [int] NOT NULL,
 CONSTRAINT [PK_PacoteTemCurso] PRIMARY KEY CLUSTERED 
(
	[IdPacoteTemCurso] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Usuario]    Script Date: 10/31/2015 2:26:16 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Usuario](
	[Login] [varchar](10) NOT NULL,
	[NomeUsuario] [varchar](50) NOT NULL,
	[Senha] [varchar](8) NOT NULL,
 CONSTRAINT [PK_Usuario] PRIMARY KEY CLUSTERED 
(
	[Login] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
ALTER TABLE [dbo].[AlunoCompraPacote]  WITH CHECK ADD  CONSTRAINT [FK_AlunoCompraPacote_Aluno] FOREIGN KEY([IdAluno])
REFERENCES [dbo].[Aluno] ([IdAluno])
GO
ALTER TABLE [dbo].[AlunoCompraPacote] CHECK CONSTRAINT [FK_AlunoCompraPacote_Aluno]
GO
ALTER TABLE [dbo].[AlunoCompraPacote]  WITH CHECK ADD  CONSTRAINT [FK_AlunoCompraPacote_Pacote] FOREIGN KEY([IdPacote])
REFERENCES [dbo].[Pacote] ([IdPacote])
GO
ALTER TABLE [dbo].[AlunoCompraPacote] CHECK CONSTRAINT [FK_AlunoCompraPacote_Pacote]
GO
ALTER TABLE [dbo].[PacoteTemCurso]  WITH CHECK ADD  CONSTRAINT [FK_PacoteTemCurso_Curso] FOREIGN KEY([IdCurso])
REFERENCES [dbo].[Curso] ([IdCurso])
GO
ALTER TABLE [dbo].[PacoteTemCurso] CHECK CONSTRAINT [FK_PacoteTemCurso_Curso]
GO
ALTER TABLE [dbo].[PacoteTemCurso]  WITH CHECK ADD  CONSTRAINT [FK_PacoteTemCurso_Pacote] FOREIGN KEY([IdPacote])
REFERENCES [dbo].[Pacote] ([IdPacote])
GO
ALTER TABLE [dbo].[PacoteTemCurso] CHECK CONSTRAINT [FK_PacoteTemCurso_Pacote]
GO
