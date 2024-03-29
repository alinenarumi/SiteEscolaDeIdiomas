USE [master]
GO
/****** Object:  Database [escola_idioma_db]    Script Date: 11/2/2015 3:01:02 PM ******/
CREATE DATABASE [escola_idioma_db]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'escola_idioma_db', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.SQLEXPRESS\MSSQL\DATA\escola_idioma_db.mdf' , SIZE = 5120KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'escola_idioma_db_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.SQLEXPRESS\MSSQL\DATA\escola_idioma_db_log.ldf' , SIZE = 1024KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [escola_idioma_db] SET COMPATIBILITY_LEVEL = 120
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [escola_idioma_db].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [escola_idioma_db] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [escola_idioma_db] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [escola_idioma_db] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [escola_idioma_db] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [escola_idioma_db] SET ARITHABORT OFF 
GO
ALTER DATABASE [escola_idioma_db] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [escola_idioma_db] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [escola_idioma_db] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [escola_idioma_db] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [escola_idioma_db] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [escola_idioma_db] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [escola_idioma_db] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [escola_idioma_db] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [escola_idioma_db] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [escola_idioma_db] SET  DISABLE_BROKER 
GO
ALTER DATABASE [escola_idioma_db] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [escola_idioma_db] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [escola_idioma_db] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [escola_idioma_db] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [escola_idioma_db] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [escola_idioma_db] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [escola_idioma_db] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [escola_idioma_db] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [escola_idioma_db] SET  MULTI_USER 
GO
ALTER DATABASE [escola_idioma_db] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [escola_idioma_db] SET DB_CHAINING OFF 
GO
ALTER DATABASE [escola_idioma_db] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [escola_idioma_db] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
ALTER DATABASE [escola_idioma_db] SET DELAYED_DURABILITY = DISABLED 
GO
USE [escola_idioma_db]
GO
/****** Object:  Table [dbo].[Aluno]    Script Date: 11/2/2015 3:01:03 PM ******/
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
/****** Object:  Table [dbo].[AlunoCompraPacote]    Script Date: 11/2/2015 3:01:03 PM ******/
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
/****** Object:  Table [dbo].[Curso]    Script Date: 11/2/2015 3:01:03 PM ******/
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
/****** Object:  Table [dbo].[Pacote]    Script Date: 11/2/2015 3:01:03 PM ******/
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
/****** Object:  Table [dbo].[PacoteTemCurso]    Script Date: 11/2/2015 3:01:03 PM ******/
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
/****** Object:  Table [dbo].[Usuario]    Script Date: 11/2/2015 3:01:03 PM ******/
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
	[Imagem] [varbinary](max) NULL,
	[ImagemTipo] [nchar](50) NULL,
 CONSTRAINT [PK_Usuario] PRIMARY KEY CLUSTERED 
(
	[Login] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

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
USE [master]
GO
ALTER DATABASE [escola_idioma_db] SET  READ_WRITE 
GO
