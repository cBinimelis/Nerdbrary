USE [master]
GO
/****** Object:  Database [bd_biblioteca]    Script Date: 13/06/2018 21:23:56 ******/
CREATE DATABASE [bd_biblioteca]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'bd_biblioteca', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL13.MSSQLSERVER\MSSQL\DATA\bd_biblioteca.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'bd_biblioteca_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL13.MSSQLSERVER\MSSQL\DATA\bd_biblioteca_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [bd_biblioteca].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [bd_biblioteca] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [bd_biblioteca] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [bd_biblioteca] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [bd_biblioteca] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [bd_biblioteca] SET ARITHABORT OFF 
GO
ALTER DATABASE [bd_biblioteca] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [bd_biblioteca] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [bd_biblioteca] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [bd_biblioteca] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [bd_biblioteca] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [bd_biblioteca] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [bd_biblioteca] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [bd_biblioteca] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [bd_biblioteca] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [bd_biblioteca] SET  ENABLE_BROKER 
GO
ALTER DATABASE [bd_biblioteca] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [bd_biblioteca] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [bd_biblioteca] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [bd_biblioteca] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [bd_biblioteca] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [bd_biblioteca] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [bd_biblioteca] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [bd_biblioteca] SET RECOVERY FULL 
GO
ALTER DATABASE [bd_biblioteca] SET  MULTI_USER 
GO
ALTER DATABASE [bd_biblioteca] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [bd_biblioteca] SET DB_CHAINING OFF 
GO
ALTER DATABASE [bd_biblioteca] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [bd_biblioteca] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
EXEC sys.sp_db_vardecimal_storage_format N'bd_biblioteca', N'ON'
GO
USE [bd_biblioteca]
GO
/****** Object:  Table [dbo].[Anime]    Script Date: 13/06/2018 21:23:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Anime](
	[id_Anime] [int] IDENTITY(1,1) NOT NULL,
	[Nombre] [varchar](max) NOT NULL,
	[Sinopsis] [text] NOT NULL,
	[Lanzamiento] [date] NOT NULL,
	[Temporadas] [int] NOT NULL,
	[CapitulosTotales] [int] NOT NULL,
	[Imagen] [varchar](max) NULL,
	[id_GeneroAnime] [int] NOT NULL,
	[Otros_Generos] [text] NOT NULL,
	[id_EstadoSerie] [int] NOT NULL,
	[Activo] [bit] NOT NULL,
 CONSTRAINT [PK_Anime] PRIMARY KEY CLUSTERED 
(
	[id_Anime] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Anime_Usuario]    Script Date: 13/06/2018 21:23:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Anime_Usuario](
	[id_AnimeUsuario] [bigint] IDENTITY(1,1) NOT NULL,
	[id_Usuario] [int] NOT NULL,
	[id_Anime] [int] NOT NULL,
	[id_AvanceAnime] [int] NOT NULL,
	[Nota] [varchar](max) NULL,
 CONSTRAINT [PK_Anime_Usuario] PRIMARY KEY CLUSTERED 
(
	[id_AnimeUsuario] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Autor]    Script Date: 13/06/2018 21:23:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Autor](
	[id_Autor] [int] IDENTITY(1,1) NOT NULL,
	[Nombre] [varchar](150) NOT NULL,
	[Detalles] [text] NOT NULL,
	[Imagen] [varchar](150) NOT NULL,
 CONSTRAINT [PK_Sagas] PRIMARY KEY CLUSTERED 
(
	[id_Autor] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Avance_Anime]    Script Date: 13/06/2018 21:23:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Avance_Anime](
	[id_AvanceAnime] [int] IDENTITY(1,1) NOT NULL,
	[Descripcion] [varchar](50) NOT NULL,
 CONSTRAINT [PK_Estado_Anime_Usuario] PRIMARY KEY CLUSTERED 
(
	[id_AvanceAnime] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Avance_Juego]    Script Date: 13/06/2018 21:23:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Avance_Juego](
	[id_AvanceJuego] [int] IDENTITY(1,1) NOT NULL,
	[Descripcion] [varchar](max) NOT NULL,
 CONSTRAINT [PK_Avance_Juego] PRIMARY KEY CLUSTERED 
(
	[id_AvanceJuego] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Avance_Libro]    Script Date: 13/06/2018 21:23:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Avance_Libro](
	[id_AvanceLibro] [int] IDENTITY(1,1) NOT NULL,
	[Descripcion] [varchar](50) NOT NULL,
 CONSTRAINT [PK_Avance_Libro] PRIMARY KEY CLUSTERED 
(
	[id_AvanceLibro] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Avance_Manga]    Script Date: 13/06/2018 21:23:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Avance_Manga](
	[id_AvanceManga] [int] IDENTITY(1,1) NOT NULL,
	[Descripcion] [varchar](100) NOT NULL,
 CONSTRAINT [PK_Avance_Manga] PRIMARY KEY CLUSTERED 
(
	[id_AvanceManga] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Avance_Pelicula]    Script Date: 13/06/2018 21:23:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Avance_Pelicula](
	[id_AvancePelicula] [int] IDENTITY(1,1) NOT NULL,
	[Descripcion] [varchar](max) NOT NULL,
 CONSTRAINT [PK_Avance_Pelicula] PRIMARY KEY CLUSTERED 
(
	[id_AvancePelicula] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Avance_Serie]    Script Date: 13/06/2018 21:23:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Avance_Serie](
	[id_AvanceSerie] [int] IDENTITY(1,1) NOT NULL,
	[Descripcion] [varchar](max) NOT NULL,
 CONSTRAINT [PK_Avance_Serie] PRIMARY KEY CLUSTERED 
(
	[id_AvanceSerie] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Desarrollador]    Script Date: 13/06/2018 21:23:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Desarrollador](
	[id_Desarrollador] [int] IDENTITY(1,1) NOT NULL,
	[Nombre] [varchar](100) NOT NULL,
	[Detalles] [text] NULL,
	[Imagen] [varchar](100) NOT NULL,
 CONSTRAINT [PK_Desarrollador] PRIMARY KEY CLUSTERED 
(
	[id_Desarrollador] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Estado_Juegos]    Script Date: 13/06/2018 21:23:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Estado_Juegos](
	[id_EstadoJuegos] [int] IDENTITY(1,1) NOT NULL,
	[Descripcion] [varchar](50) NOT NULL,
 CONSTRAINT [PK_Estado_Juegos] PRIMARY KEY CLUSTERED 
(
	[id_EstadoJuegos] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Estado_Libro]    Script Date: 13/06/2018 21:23:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Estado_Libro](
	[id_EstadoLibro] [int] IDENTITY(1,1) NOT NULL,
	[Descripcion] [varchar](50) NOT NULL,
 CONSTRAINT [PK_Estado_Libro] PRIMARY KEY CLUSTERED 
(
	[id_EstadoLibro] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Estado_Manga]    Script Date: 13/06/2018 21:23:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Estado_Manga](
	[id_EstadoManga] [int] IDENTITY(1,1) NOT NULL,
	[Descripcion] [varchar](max) NOT NULL,
 CONSTRAINT [PK_Estado_Manga] PRIMARY KEY CLUSTERED 
(
	[id_EstadoManga] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Estado_Mensaje]    Script Date: 13/06/2018 21:23:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Estado_Mensaje](
	[id_EstadoMensaje] [int] IDENTITY(1,1) NOT NULL,
	[EstadoMensaje] [varchar](50) NOT NULL,
 CONSTRAINT [PK_Estado_Mensaje] PRIMARY KEY CLUSTERED 
(
	[id_EstadoMensaje] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Estado_Pelicula]    Script Date: 13/06/2018 21:23:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Estado_Pelicula](
	[id_EstadoPelicula] [int] IDENTITY(1,1) NOT NULL,
	[Descripcion] [varchar](50) NOT NULL,
 CONSTRAINT [PK_Estado_Pelicula] PRIMARY KEY CLUSTERED 
(
	[id_EstadoPelicula] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Estado_Serie]    Script Date: 13/06/2018 21:23:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Estado_Serie](
	[id_EstadoSerie] [int] NOT NULL,
	[Descripcion] [varchar](50) NOT NULL,
 CONSTRAINT [PK_Estado] PRIMARY KEY CLUSTERED 
(
	[id_EstadoSerie] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Estado_Usuario]    Script Date: 13/06/2018 21:23:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Estado_Usuario](
	[id_EstadoUsuario] [int] IDENTITY(1,1) NOT NULL,
	[Descripcion] [varchar](50) NOT NULL,
 CONSTRAINT [PK_Estado_Usuario] PRIMARY KEY CLUSTERED 
(
	[id_EstadoUsuario] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Genero_Anime]    Script Date: 13/06/2018 21:23:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Genero_Anime](
	[id_GeneroAnime] [int] IDENTITY(1,1) NOT NULL,
	[Descripcion] [varchar](50) NOT NULL,
 CONSTRAINT [PK_Genero_Anime] PRIMARY KEY CLUSTERED 
(
	[id_GeneroAnime] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Genero_Juegos]    Script Date: 13/06/2018 21:23:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Genero_Juegos](
	[id_GeneroJuego] [int] IDENTITY(1,1) NOT NULL,
	[Descripcion] [varchar](50) NOT NULL,
 CONSTRAINT [PK_Juegos_Genero] PRIMARY KEY CLUSTERED 
(
	[id_GeneroJuego] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Genero_Libro]    Script Date: 13/06/2018 21:23:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Genero_Libro](
	[id_GeneroLibro] [int] IDENTITY(1,1) NOT NULL,
	[Descripcion] [varchar](50) NOT NULL,
 CONSTRAINT [PK_Genero] PRIMARY KEY CLUSTERED 
(
	[id_GeneroLibro] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Genero_Mangas]    Script Date: 13/06/2018 21:23:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Genero_Mangas](
	[id_GeneroManga] [int] IDENTITY(1,1) NOT NULL,
	[Descripcion] [varchar](50) NOT NULL,
 CONSTRAINT [PK_Genero_Mangas] PRIMARY KEY CLUSTERED 
(
	[id_GeneroManga] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Genero_Pelicula]    Script Date: 13/06/2018 21:23:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Genero_Pelicula](
	[id_GeneroPelicula] [int] IDENTITY(1,1) NOT NULL,
	[Descripcion] [varchar](50) NOT NULL,
 CONSTRAINT [PK_Genero_Pelicula] PRIMARY KEY CLUSTERED 
(
	[id_GeneroPelicula] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Genero_Serie]    Script Date: 13/06/2018 21:23:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Genero_Serie](
	[id_GeneroSerie] [int] IDENTITY(1,1) NOT NULL,
	[Descripcion] [varchar](250) NOT NULL,
 CONSTRAINT [PK_Genero_Serie] PRIMARY KEY CLUSTERED 
(
	[id_GeneroSerie] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Juegos]    Script Date: 13/06/2018 21:23:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Juegos](
	[id_Juego] [int] IDENTITY(1,1) NOT NULL,
	[Nombre] [varchar](50) NOT NULL,
	[Sinopsis] [text] NOT NULL,
	[id_Desarrollador] [int] NOT NULL,
	[Lanzamiento] [date] NOT NULL,
	[Imagen] [varchar](max) NOT NULL,
	[id_GeneroJuego] [int] NOT NULL,
	[Otros_Generos] [varchar](max) NOT NULL,
	[id_EstadoJuego] [int] NOT NULL,
	[Activo] [bit] NOT NULL,
 CONSTRAINT [PK_Juegos] PRIMARY KEY CLUSTERED 
(
	[id_Juego] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Juegos_Usuario]    Script Date: 13/06/2018 21:23:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Juegos_Usuario](
	[id_JuegoUsuario] [int] IDENTITY(1,1) NOT NULL,
	[id_Juego] [int] NOT NULL,
	[id_Usuario] [int] NOT NULL,
	[id_AvanceJuego] [int] NOT NULL,
	[Nota] [varchar](max) NOT NULL,
 CONSTRAINT [PK_Juegos_Usuario] PRIMARY KEY CLUSTERED 
(
	[id_JuegoUsuario] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Libro_Usuario]    Script Date: 13/06/2018 21:23:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Libro_Usuario](
	[id_LibroUsuario] [int] IDENTITY(1,1) NOT NULL,
	[id_Usuario] [int] NOT NULL,
	[id_Libro] [int] NOT NULL,
	[id_AvanceLibro] [int] NOT NULL,
	[Nota] [varchar](max) NOT NULL,
 CONSTRAINT [PK_Libro_Usuario] PRIMARY KEY CLUSTERED 
(
	[id_LibroUsuario] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Libros]    Script Date: 13/06/2018 21:23:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Libros](
	[id_Libro] [int] IDENTITY(1,1) NOT NULL,
	[Nombre] [varchar](max) NOT NULL,
	[Sinopsis] [text] NOT NULL,
	[Paginas] [int] NOT NULL,
	[Lanzamiento] [date] NOT NULL,
	[Imagen] [varchar](250) NOT NULL,
	[id_Autor] [int] NOT NULL,
	[id_GeneroLibro] [int] NOT NULL,
	[Otros_Generos] [varchar](max) NULL,
	[id_EstadoLibro] [int] NOT NULL,
	[Activo] [bit] NOT NULL,
 CONSTRAINT [PK_Libros] PRIMARY KEY CLUSTERED 
(
	[id_Libro] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Manga]    Script Date: 13/06/2018 21:23:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Manga](
	[id_Manga] [int] IDENTITY(1,1) NOT NULL,
	[Nombre] [varchar](max) NOT NULL,
	[Sinopsis] [text] NOT NULL,
	[Lanzamiento] [date] NOT NULL,
	[Tomos] [int] NOT NULL,
	[Imagen] [varchar](max) NOT NULL,
	[id_GeneroManga] [int] NOT NULL,
	[Otros_Generos] [text] NOT NULL,
	[id_EstadoManga] [int] NOT NULL,
	[Activo] [bit] NULL,
 CONSTRAINT [PK_Manga] PRIMARY KEY CLUSTERED 
(
	[id_Manga] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Manga_Usuario]    Script Date: 13/06/2018 21:23:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Manga_Usuario](
	[id_MangaUsuario] [int] IDENTITY(1,1) NOT NULL,
	[id_Usuario] [int] NOT NULL,
	[id_Manga] [int] NOT NULL,
	[id_AvanceManga] [int] NOT NULL,
	[Nota] [varchar](max) NOT NULL,
 CONSTRAINT [PK_Manga_Usuario] PRIMARY KEY CLUSTERED 
(
	[id_MangaUsuario] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Mensajes]    Script Date: 13/06/2018 21:23:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Mensajes](
	[id_Mensaje] [int] IDENTITY(1,1) NOT NULL,
	[id_Usuario] [int] NOT NULL,
	[Descripcion] [text] NOT NULL,
	[id_EstadoMensaje] [int] NOT NULL,
 CONSTRAINT [PK_Notas] PRIMARY KEY CLUSTERED 
(
	[id_Mensaje] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Pelicula_Usuario]    Script Date: 13/06/2018 21:23:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Pelicula_Usuario](
	[id_PeliculaUsuario] [int] IDENTITY(1,1) NOT NULL,
	[id_Usuario] [int] NOT NULL,
	[id_Pelicula] [int] NOT NULL,
	[id_AvancePelicula] [int] NOT NULL,
	[Nota] [text] NOT NULL,
 CONSTRAINT [PK_Pelicula_Usuario] PRIMARY KEY CLUSTERED 
(
	[id_PeliculaUsuario] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Peliculas]    Script Date: 13/06/2018 21:23:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Peliculas](
	[id_Pelicula] [int] IDENTITY(1,1) NOT NULL,
	[Nombre] [varchar](50) NOT NULL,
	[Sinopsis] [text] NOT NULL,
	[Duracion] [varchar](50) NOT NULL,
	[Lanzamiento] [date] NOT NULL,
	[Imagen] [varchar](50) NOT NULL,
	[id_GeneroPelicula] [int] NOT NULL,
	[Otros_Generos] [varchar](max) NOT NULL,
	[id_EstadoPelicula] [int] NOT NULL,
	[Activo] [bit] NOT NULL,
 CONSTRAINT [PK_Peliculas] PRIMARY KEY CLUSTERED 
(
	[id_Pelicula] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Pendientes]    Script Date: 13/06/2018 21:23:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Pendientes](
	[id_Pendiente] [int] IDENTITY(1,1) NOT NULL,
	[Nombre] [varchar](max) NOT NULL,
	[id_Usuario] [int] NOT NULL,
	[id_TipoPendiente] [int] NOT NULL,
 CONSTRAINT [PK_Pendientes] PRIMARY KEY CLUSTERED 
(
	[id_Pendiente] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Serie_Usuario]    Script Date: 13/06/2018 21:23:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Serie_Usuario](
	[id_SerieUsuario] [int] IDENTITY(1,1) NOT NULL,
	[id_Usuario] [int] NOT NULL,
	[id_Serie] [int] NOT NULL,
	[id_AvanceSerie] [int] NOT NULL,
	[Nota] [varchar](max) NOT NULL,
 CONSTRAINT [PK_Serie_Usuario] PRIMARY KEY CLUSTERED 
(
	[id_SerieUsuario] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Series]    Script Date: 13/06/2018 21:23:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Series](
	[id_Serie] [int] IDENTITY(1,1) NOT NULL,
	[Nombre] [varchar](50) NOT NULL,
	[Sinopsis] [text] NOT NULL,
	[Lanzamiento] [date] NOT NULL,
	[Temporadas] [int] NOT NULL,
	[CapitulosTotales] [int] NOT NULL,
	[Imagen] [varchar](250) NOT NULL,
	[id_GeneroSerie] [int] NOT NULL,
	[Otros_Generos] [varchar](max) NOT NULL,
	[id_EstadoSerie] [int] NOT NULL,
	[id_Usuario] [int] NOT NULL,
	[Activo] [bit] NOT NULL,
 CONSTRAINT [PK_Series] PRIMARY KEY CLUSTERED 
(
	[id_Serie] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Tipo_Pendiente]    Script Date: 13/06/2018 21:23:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Tipo_Pendiente](
	[id_TipoPendiente] [int] IDENTITY(1,1) NOT NULL,
	[Descripcion] [varchar](max) NOT NULL,
 CONSTRAINT [PK_Tipo_Pendiente] PRIMARY KEY CLUSTERED 
(
	[id_TipoPendiente] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Tipo_Usuario]    Script Date: 13/06/2018 21:23:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Tipo_Usuario](
	[id_TipoUsuario] [int] IDENTITY(1,1) NOT NULL,
	[Descripción] [varchar](50) NOT NULL,
 CONSTRAINT [PK_Tipo_Usuario] PRIMARY KEY CLUSTERED 
(
	[id_TipoUsuario] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Usuario]    Script Date: 13/06/2018 21:23:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Usuario](
	[id_Usuario] [int] NOT NULL,
	[Nick] [varchar](50) NOT NULL,
	[Password] [varchar](50) NOT NULL,
	[id_EstadoUsuario] [int] NOT NULL,
	[id_TipoUsuario] [int] NOT NULL,
	[Imagen] [varchar](250) NOT NULL,
	[Fondo] [varchar](250) NULL,
 CONSTRAINT [PK_Usuario] PRIMARY KEY CLUSTERED 
(
	[id_Usuario] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[vAnime]    Script Date: 13/06/2018 21:23:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[vAnime] as
SELECT A.id_Anime, A.Nombre, A.Sinopsis, CONVERT(varchar, A.Lanzamiento, 103) AS 'Lanzamiento' , A.Temporadas, 
A.CapitulosTotales 'Capitulos',A.Imagen, GA.Descripcion 'Genero', A.Otros_Generos 'Otros Generos', ES.Descripcion 'Estado'
FROM Anime A
INNER JOIN Genero_Anime GA ON A.id_GeneroAnime = ga.id_GeneroAnime
INNER JOIN Estado_Serie ES ON A.id_EstadoSerie = ES.id_EstadoSerie
WHERE A.Activo =  1
GO
/****** Object:  View [dbo].[vJuegos]    Script Date: 13/06/2018 21:23:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[vJuegos] AS
SELECT J.id_Juego, J.Nombre, J.Sinopsis, D.id_Desarrollador, D.Nombre 'Desarrollador',  CONVERT(varchar, J.Lanzamiento, 103) AS 'Lanzamiento',
J.Imagen, GJ.Descripcion 'Genero', J.Otros_Generos, EJ.Descripcion 'Estado'
FROM Juegos J
INNER JOIN Genero_Juegos GJ ON J.id_GeneroJuego = GJ.id_GeneroJuego
INNER JOIN Estado_Juegos EJ ON J.id_EstadoJuego = EJ.id_EstadoJuegos
INNER JOIN Desarrollador D ON J.id_Desarrollador = D.id_Desarrollador
WHERE J.Activo = 1
GO
/****** Object:  View [dbo].[vLibros]    Script Date: 13/06/2018 21:23:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[vLibros] AS
SELECT L.id_Libro, L.Nombre, L.Sinopsis, L.Paginas, A.id_Autor, A.Nombre 'Autor',  CONVERT(varchar, L.Lanzamiento, 103) AS 'Lanzamiento',
L.Imagen, GL.Descripcion 'Genero', L.Otros_Generos ,EL.Descripcion 'Estado'
FROM Libros L
INNER JOIN Genero_Libro GL ON L.id_GeneroLibro = GL.id_GeneroLibro
INNER JOIN Estado_Libro EL ON L.id_EstadoLibro = EL.id_EstadoLibro
INNER JOIN Autor A ON L.id_Autor = A.id_Autor
WHERE L.Activo = 1
GO
/****** Object:  View [dbo].[vManga]    Script Date: 13/06/2018 21:23:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[vManga] AS
SELECT M.id_Manga, M.Nombre, M.Sinopsis, M.Tomos, CONVERT(varchar, M.Lanzamiento, 103) AS 'Lanzamiento', 
M.Imagen, GM.Descripcion 'Genero', M.Otros_Generos, EM.Descripcion 'Estado'
FROM Manga M
INNER JOIN Genero_Mangas GM ON M.id_GeneroManga = GM.id_GeneroManga
INNER JOIN Estado_Manga EM ON M.id_EstadoManga = EM.id_EstadoManga
WHERE M.Activo = 1
GO
/****** Object:  View [dbo].[vPelicula]    Script Date: 13/06/2018 21:23:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[vPelicula] AS
SELECT P.id_Pelicula, P.Nombre, P.Sinopsis, P.Duracion, CONVERT(varchar, P.Lanzamiento, 103) AS 'Lanzamiento', 
P.Imagen, GP.Descripcion 'Genero', P.Otros_Generos, EP.Descripcion 'Estado'
FROM Peliculas P
INNER JOIN Genero_Pelicula GP ON P.id_GeneroPelicula = GP.id_GeneroPelicula
INNER JOIN Estado_Pelicula EP ON P.id_EstadoPelicula = EP.id_EstadoPelicula
WHERE P.Activo = 1
GO
/****** Object:  View [dbo].[vPendientes]    Script Date: 13/06/2018 21:23:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE VIEW [dbo].[vPendientes] AS 
SELECT P.id_Pendiente, P.Nombre, U.Nick 'Usuario', TP.Descripcion 'Tipo', TP.id_TipoPendiente
FROM Pendientes P
INNER JOIN Usuario U ON U.id_Usuario = P.id_Usuario
INNER JOIN Tipo_Pendiente TP ON TP.id_TipoPendiente = P.id_TipoPendiente
GO
/****** Object:  View [dbo].[vSeries]    Script Date: 13/06/2018 21:23:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[vSeries] as
SELECT S.id_Serie, S.Nombre, S.Sinopsis, CONVERT(varchar, S.Lanzamiento, 103) AS 'Lanzamiento' , S.Temporadas, 
S.CapitulosTotales 'Capitulos',S.Imagen, GS.Descripcion 'Genero', S.Otros_Generos 'Otros Generos', ES.Descripcion 'Estado'
FROM Series S
INNER JOIN Genero_Serie GS ON S.id_GeneroSerie = GS.id_GeneroSerie
INNER JOIN Estado_Serie ES ON S.id_EstadoSerie = ES.id_EstadoSerie
WHERE S.Activo =  1
GO
ALTER TABLE [dbo].[Anime]  WITH CHECK ADD  CONSTRAINT [FK_Anime_Estado] FOREIGN KEY([id_EstadoSerie])
REFERENCES [dbo].[Estado_Serie] ([id_EstadoSerie])
GO
ALTER TABLE [dbo].[Anime] CHECK CONSTRAINT [FK_Anime_Estado]
GO
ALTER TABLE [dbo].[Anime]  WITH CHECK ADD  CONSTRAINT [FK_Anime_Genero_Anime] FOREIGN KEY([id_GeneroAnime])
REFERENCES [dbo].[Genero_Anime] ([id_GeneroAnime])
GO
ALTER TABLE [dbo].[Anime] CHECK CONSTRAINT [FK_Anime_Genero_Anime]
GO
ALTER TABLE [dbo].[Anime_Usuario]  WITH CHECK ADD  CONSTRAINT [FK_Anime_Usuario_Anime] FOREIGN KEY([id_Anime])
REFERENCES [dbo].[Anime] ([id_Anime])
GO
ALTER TABLE [dbo].[Anime_Usuario] CHECK CONSTRAINT [FK_Anime_Usuario_Anime]
GO
ALTER TABLE [dbo].[Anime_Usuario]  WITH CHECK ADD  CONSTRAINT [FK_Anime_Usuario_Estado_Anime_Usuario] FOREIGN KEY([id_AvanceAnime])
REFERENCES [dbo].[Avance_Anime] ([id_AvanceAnime])
GO
ALTER TABLE [dbo].[Anime_Usuario] CHECK CONSTRAINT [FK_Anime_Usuario_Estado_Anime_Usuario]
GO
ALTER TABLE [dbo].[Anime_Usuario]  WITH CHECK ADD  CONSTRAINT [FK_Anime_Usuario_Usuario] FOREIGN KEY([id_Usuario])
REFERENCES [dbo].[Usuario] ([id_Usuario])
GO
ALTER TABLE [dbo].[Anime_Usuario] CHECK CONSTRAINT [FK_Anime_Usuario_Usuario]
GO
ALTER TABLE [dbo].[Juegos]  WITH CHECK ADD  CONSTRAINT [FK_Juegos_Desarrollador] FOREIGN KEY([id_Desarrollador])
REFERENCES [dbo].[Desarrollador] ([id_Desarrollador])
GO
ALTER TABLE [dbo].[Juegos] CHECK CONSTRAINT [FK_Juegos_Desarrollador]
GO
ALTER TABLE [dbo].[Juegos]  WITH CHECK ADD  CONSTRAINT [FK_Juegos_Estado_Juegos] FOREIGN KEY([id_EstadoJuego])
REFERENCES [dbo].[Estado_Juegos] ([id_EstadoJuegos])
GO
ALTER TABLE [dbo].[Juegos] CHECK CONSTRAINT [FK_Juegos_Estado_Juegos]
GO
ALTER TABLE [dbo].[Juegos]  WITH CHECK ADD  CONSTRAINT [FK_Juegos_Juegos_Genero] FOREIGN KEY([id_GeneroJuego])
REFERENCES [dbo].[Genero_Juegos] ([id_GeneroJuego])
GO
ALTER TABLE [dbo].[Juegos] CHECK CONSTRAINT [FK_Juegos_Juegos_Genero]
GO
ALTER TABLE [dbo].[Juegos_Usuario]  WITH CHECK ADD  CONSTRAINT [FK_Juegos_Usuario_Avance_Juego] FOREIGN KEY([id_AvanceJuego])
REFERENCES [dbo].[Avance_Juego] ([id_AvanceJuego])
GO
ALTER TABLE [dbo].[Juegos_Usuario] CHECK CONSTRAINT [FK_Juegos_Usuario_Avance_Juego]
GO
ALTER TABLE [dbo].[Juegos_Usuario]  WITH CHECK ADD  CONSTRAINT [FK_Juegos_Usuario_Juegos] FOREIGN KEY([id_Juego])
REFERENCES [dbo].[Juegos] ([id_Juego])
GO
ALTER TABLE [dbo].[Juegos_Usuario] CHECK CONSTRAINT [FK_Juegos_Usuario_Juegos]
GO
ALTER TABLE [dbo].[Juegos_Usuario]  WITH CHECK ADD  CONSTRAINT [FK_Juegos_Usuario_Usuario] FOREIGN KEY([id_Usuario])
REFERENCES [dbo].[Usuario] ([id_Usuario])
GO
ALTER TABLE [dbo].[Juegos_Usuario] CHECK CONSTRAINT [FK_Juegos_Usuario_Usuario]
GO
ALTER TABLE [dbo].[Libro_Usuario]  WITH CHECK ADD  CONSTRAINT [FK_Libro_Usuario_Avance_Libro] FOREIGN KEY([id_AvanceLibro])
REFERENCES [dbo].[Avance_Libro] ([id_AvanceLibro])
GO
ALTER TABLE [dbo].[Libro_Usuario] CHECK CONSTRAINT [FK_Libro_Usuario_Avance_Libro]
GO
ALTER TABLE [dbo].[Libro_Usuario]  WITH CHECK ADD  CONSTRAINT [FK_Libro_Usuario_Libros] FOREIGN KEY([id_Libro])
REFERENCES [dbo].[Libros] ([id_Libro])
GO
ALTER TABLE [dbo].[Libro_Usuario] CHECK CONSTRAINT [FK_Libro_Usuario_Libros]
GO
ALTER TABLE [dbo].[Libro_Usuario]  WITH CHECK ADD  CONSTRAINT [FK_Libro_Usuario_Usuario] FOREIGN KEY([id_Usuario])
REFERENCES [dbo].[Usuario] ([id_Usuario])
GO
ALTER TABLE [dbo].[Libro_Usuario] CHECK CONSTRAINT [FK_Libro_Usuario_Usuario]
GO
ALTER TABLE [dbo].[Libros]  WITH CHECK ADD  CONSTRAINT [FK_Libros_Autor] FOREIGN KEY([id_Autor])
REFERENCES [dbo].[Autor] ([id_Autor])
GO
ALTER TABLE [dbo].[Libros] CHECK CONSTRAINT [FK_Libros_Autor]
GO
ALTER TABLE [dbo].[Libros]  WITH CHECK ADD  CONSTRAINT [FK_Libros_Estado_Libro] FOREIGN KEY([id_EstadoLibro])
REFERENCES [dbo].[Estado_Libro] ([id_EstadoLibro])
GO
ALTER TABLE [dbo].[Libros] CHECK CONSTRAINT [FK_Libros_Estado_Libro]
GO
ALTER TABLE [dbo].[Libros]  WITH CHECK ADD  CONSTRAINT [FK_Libros_Genero] FOREIGN KEY([id_EstadoLibro])
REFERENCES [dbo].[Genero_Libro] ([id_GeneroLibro])
GO
ALTER TABLE [dbo].[Libros] CHECK CONSTRAINT [FK_Libros_Genero]
GO
ALTER TABLE [dbo].[Manga]  WITH CHECK ADD  CONSTRAINT [FK_Manga_Estado_Manga] FOREIGN KEY([id_EstadoManga])
REFERENCES [dbo].[Estado_Manga] ([id_EstadoManga])
GO
ALTER TABLE [dbo].[Manga] CHECK CONSTRAINT [FK_Manga_Estado_Manga]
GO
ALTER TABLE [dbo].[Manga]  WITH CHECK ADD  CONSTRAINT [FK_Manga_Genero_Mangas] FOREIGN KEY([id_GeneroManga])
REFERENCES [dbo].[Genero_Mangas] ([id_GeneroManga])
GO
ALTER TABLE [dbo].[Manga] CHECK CONSTRAINT [FK_Manga_Genero_Mangas]
GO
ALTER TABLE [dbo].[Manga_Usuario]  WITH CHECK ADD  CONSTRAINT [FK_Manga_Usuario_Avance_Manga] FOREIGN KEY([id_AvanceManga])
REFERENCES [dbo].[Avance_Manga] ([id_AvanceManga])
GO
ALTER TABLE [dbo].[Manga_Usuario] CHECK CONSTRAINT [FK_Manga_Usuario_Avance_Manga]
GO
ALTER TABLE [dbo].[Manga_Usuario]  WITH CHECK ADD  CONSTRAINT [FK_Manga_Usuario_Manga] FOREIGN KEY([id_Manga])
REFERENCES [dbo].[Manga] ([id_Manga])
GO
ALTER TABLE [dbo].[Manga_Usuario] CHECK CONSTRAINT [FK_Manga_Usuario_Manga]
GO
ALTER TABLE [dbo].[Manga_Usuario]  WITH CHECK ADD  CONSTRAINT [FK_Manga_Usuario_Usuario] FOREIGN KEY([id_Usuario])
REFERENCES [dbo].[Usuario] ([id_Usuario])
GO
ALTER TABLE [dbo].[Manga_Usuario] CHECK CONSTRAINT [FK_Manga_Usuario_Usuario]
GO
ALTER TABLE [dbo].[Mensajes]  WITH CHECK ADD  CONSTRAINT [FK_Mensajes_Estado_Mensaje] FOREIGN KEY([id_EstadoMensaje])
REFERENCES [dbo].[Estado_Mensaje] ([id_EstadoMensaje])
GO
ALTER TABLE [dbo].[Mensajes] CHECK CONSTRAINT [FK_Mensajes_Estado_Mensaje]
GO
ALTER TABLE [dbo].[Mensajes]  WITH CHECK ADD  CONSTRAINT [FK_Notas_Usuario] FOREIGN KEY([id_Usuario])
REFERENCES [dbo].[Usuario] ([id_Usuario])
GO
ALTER TABLE [dbo].[Mensajes] CHECK CONSTRAINT [FK_Notas_Usuario]
GO
ALTER TABLE [dbo].[Pelicula_Usuario]  WITH CHECK ADD  CONSTRAINT [FK_Pelicula_Usuario_Avance_Pelicula] FOREIGN KEY([id_AvancePelicula])
REFERENCES [dbo].[Avance_Pelicula] ([id_AvancePelicula])
GO
ALTER TABLE [dbo].[Pelicula_Usuario] CHECK CONSTRAINT [FK_Pelicula_Usuario_Avance_Pelicula]
GO
ALTER TABLE [dbo].[Pelicula_Usuario]  WITH CHECK ADD  CONSTRAINT [FK_Pelicula_Usuario_Peliculas] FOREIGN KEY([id_Pelicula])
REFERENCES [dbo].[Peliculas] ([id_Pelicula])
GO
ALTER TABLE [dbo].[Pelicula_Usuario] CHECK CONSTRAINT [FK_Pelicula_Usuario_Peliculas]
GO
ALTER TABLE [dbo].[Pelicula_Usuario]  WITH CHECK ADD  CONSTRAINT [FK_Pelicula_Usuario_Usuario] FOREIGN KEY([id_Usuario])
REFERENCES [dbo].[Usuario] ([id_Usuario])
GO
ALTER TABLE [dbo].[Pelicula_Usuario] CHECK CONSTRAINT [FK_Pelicula_Usuario_Usuario]
GO
ALTER TABLE [dbo].[Peliculas]  WITH CHECK ADD  CONSTRAINT [FK_Peliculas_Estado_Pelicula1] FOREIGN KEY([id_EstadoPelicula])
REFERENCES [dbo].[Estado_Pelicula] ([id_EstadoPelicula])
GO
ALTER TABLE [dbo].[Peliculas] CHECK CONSTRAINT [FK_Peliculas_Estado_Pelicula1]
GO
ALTER TABLE [dbo].[Peliculas]  WITH CHECK ADD  CONSTRAINT [FK_Peliculas_Genero_Pelicula] FOREIGN KEY([id_GeneroPelicula])
REFERENCES [dbo].[Genero_Pelicula] ([id_GeneroPelicula])
GO
ALTER TABLE [dbo].[Peliculas] CHECK CONSTRAINT [FK_Peliculas_Genero_Pelicula]
GO
ALTER TABLE [dbo].[Pendientes]  WITH CHECK ADD  CONSTRAINT [FK_Pendientes_Tipo_Pendiente] FOREIGN KEY([id_TipoPendiente])
REFERENCES [dbo].[Tipo_Pendiente] ([id_TipoPendiente])
GO
ALTER TABLE [dbo].[Pendientes] CHECK CONSTRAINT [FK_Pendientes_Tipo_Pendiente]
GO
ALTER TABLE [dbo].[Pendientes]  WITH CHECK ADD  CONSTRAINT [FK_Pendientes_Usuario] FOREIGN KEY([id_Usuario])
REFERENCES [dbo].[Usuario] ([id_Usuario])
GO
ALTER TABLE [dbo].[Pendientes] CHECK CONSTRAINT [FK_Pendientes_Usuario]
GO
ALTER TABLE [dbo].[Serie_Usuario]  WITH CHECK ADD  CONSTRAINT [FK_Serie_Usuario_Avance_Serie] FOREIGN KEY([id_AvanceSerie])
REFERENCES [dbo].[Avance_Serie] ([id_AvanceSerie])
GO
ALTER TABLE [dbo].[Serie_Usuario] CHECK CONSTRAINT [FK_Serie_Usuario_Avance_Serie]
GO
ALTER TABLE [dbo].[Serie_Usuario]  WITH CHECK ADD  CONSTRAINT [FK_Serie_Usuario_Series] FOREIGN KEY([id_Serie])
REFERENCES [dbo].[Series] ([id_Serie])
GO
ALTER TABLE [dbo].[Serie_Usuario] CHECK CONSTRAINT [FK_Serie_Usuario_Series]
GO
ALTER TABLE [dbo].[Serie_Usuario]  WITH CHECK ADD  CONSTRAINT [FK_Serie_Usuario_Usuario] FOREIGN KEY([id_Usuario])
REFERENCES [dbo].[Usuario] ([id_Usuario])
GO
ALTER TABLE [dbo].[Serie_Usuario] CHECK CONSTRAINT [FK_Serie_Usuario_Usuario]
GO
ALTER TABLE [dbo].[Series]  WITH CHECK ADD  CONSTRAINT [FK_Series_Estado] FOREIGN KEY([id_EstadoSerie])
REFERENCES [dbo].[Estado_Serie] ([id_EstadoSerie])
GO
ALTER TABLE [dbo].[Series] CHECK CONSTRAINT [FK_Series_Estado]
GO
ALTER TABLE [dbo].[Series]  WITH CHECK ADD  CONSTRAINT [FK_Series_Genero_Serie] FOREIGN KEY([id_GeneroSerie])
REFERENCES [dbo].[Genero_Serie] ([id_GeneroSerie])
GO
ALTER TABLE [dbo].[Series] CHECK CONSTRAINT [FK_Series_Genero_Serie]
GO
ALTER TABLE [dbo].[Usuario]  WITH CHECK ADD  CONSTRAINT [FK_Usuario_Estado_Usuario] FOREIGN KEY([id_EstadoUsuario])
REFERENCES [dbo].[Estado_Usuario] ([id_EstadoUsuario])
GO
ALTER TABLE [dbo].[Usuario] CHECK CONSTRAINT [FK_Usuario_Estado_Usuario]
GO
ALTER TABLE [dbo].[Usuario]  WITH CHECK ADD  CONSTRAINT [FK_Usuario_Tipo_Usuario] FOREIGN KEY([id_TipoUsuario])
REFERENCES [dbo].[Tipo_Usuario] ([id_TipoUsuario])
GO
ALTER TABLE [dbo].[Usuario] CHECK CONSTRAINT [FK_Usuario_Tipo_Usuario]
GO
/****** Object:  StoredProcedure [dbo].[vAnimeUsuario]    Script Date: 13/06/2018 21:23:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[vAnimeUsuario] @User VARCHAR(50)
AS
BEGIN
SELECT A.id_Anime, A.Nombre, A.Sinopsis, CONVERT(varchar, A.Lanzamiento, 103) AS 'Lanzamiento' , A.Temporadas, 
A.CapitulosTotales 'Capitulos',A.Imagen, GA.Descripcion 'Genero', ES.Descripcion 'Estado'
FROM Anime_Usuario AU
INNER JOIN Anime A ON AU.id_Anime = A.id_Anime
INNER JOIN Usuario U ON AU.id_Usuario = U.id_Usuario
INNER JOIN Genero_Anime GA ON A.id_GeneroAnime = ga.id_GeneroAnime
INNER JOIN Estado_Serie ES ON A.id_EstadoSerie = ES.id_EstadoSerie
WHERE U.id_Usuario = (SELECT id_Usuario FROM Usuario WHERE Nick = @User) AND A.Activo =  1
ORDER BY A.Nombre ASC
END
GO
/****** Object:  StoredProcedure [dbo].[vDetalleAnime]    Script Date: 13/06/2018 21:23:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[vDetalleAnime] @User VARCHAR(50), @Anime INT = 0
AS
BEGIN
SELECT AU.id_AnimeUsuario , A.Nombre, A.Sinopsis, CONVERT(varchar, A.Lanzamiento, 103) AS 'Lanzamiento' , A.Temporadas, A.CapitulosTotales 'Capitulos',
 A.Imagen, GA.Descripcion 'Genero', A.Otros_Generos 'Otros Generos', ES.Descripcion 'Estado', AA.Descripcion 'Avance', AU.Nota
FROM Anime_Usuario AU
INNER JOIN Anime A ON AU.id_Anime = A.id_Anime
INNER JOIN Usuario U ON AU.id_Usuario = U.id_Usuario
INNER JOIN Genero_Anime GA ON A.id_GeneroAnime = ga.id_GeneroAnime
INNER JOIN Estado_Serie ES ON A.id_EstadoSerie = ES.id_EstadoSerie
INNER JOIN Avance_Anime AA ON AA.id_AvanceAnime = AU.id_AvanceAnime
WHERE AU.id_Usuario = (SELECT id_Usuario FROM Usuario WHERE Nick = @User) AND AU.id_Anime = @Anime AND A.Activo =  1
ORDER BY A.Nombre ASC
END
GO
/****** Object:  StoredProcedure [dbo].[vDetalleJuego]    Script Date: 13/06/2018 21:23:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[vDetalleJuego] @User VARCHAR(50), @Juego INT = 0
AS
BEGIN
SELECT JU.id_JuegoUsuario, J.Nombre, J.Sinopsis,D.id_Desarrollador, D.Nombre 'Desarrollador', CONVERT(varchar, J.Lanzamiento, 103) AS 'Lanzamiento',
J.Imagen, GJ.Descripcion 'Genero', J.Otros_Generos 'Otros Generos', EJ.Descripcion 'Estado', AJ.Descripcion 'Avance', JU.Nota
FROM Juegos_Usuario JU
INNER JOIN Juegos J ON JU.id_Juego = J.id_Juego
INNER JOIN Usuario U ON JU.id_Usuario = U.id_Usuario
INNER JOIN Desarrollador D ON J.id_Desarrollador = D.id_Desarrollador
INNER JOIN Genero_Juegos GJ ON J.id_GeneroJuego = GJ.id_GeneroJuego
INNER JOIN Estado_Juegos EJ ON J.id_EstadoJuego = EJ.id_EstadoJuegos
INNER JOIN Avance_Juego AJ ON JU.id_AvanceJuego = AJ.id_AvanceJuego
WHERE JU.id_Usuario = (SELECT id_Usuario FROM Usuario WHERE Nick = @User) AND JU.id_Juego = @Juego AND J.Activo =  1
ORDER BY J.Nombre ASC
END
GO
/****** Object:  StoredProcedure [dbo].[vDetalleLibro]    Script Date: 13/06/2018 21:23:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[vDetalleLibro] @User VARCHAR(50), @Libro INT = 0
AS
BEGIN
SELECT LU.id_LibroUsuario, L.Nombre, L.Sinopsis, L.Paginas, A.id_Autor, A.Nombre 'Autor',  CONVERT(varchar, L.Lanzamiento, 103) AS 'Lanzamiento',
L.Imagen, GL.Descripcion 'Genero', L.Otros_Generos 'Otros Generos', EL.Descripcion 'Estado', AL.Descripcion 'Avance', LU.Nota
FROM Libro_Usuario LU
INNER JOIN Libros L ON LU.id_Libro = L.id_Libro
INNER JOIN Usuario U ON LU.id_Usuario = U.id_Usuario
INNER JOIN Autor A ON L.id_Autor = A.id_Autor
INNER JOIN Genero_Libro GL ON L.id_GeneroLibro = GL.id_GeneroLibro
INNER JOIN Estado_Libro EL ON L.id_EstadoLibro = EL.id_EstadoLibro
INNER JOIN Avance_Libro AL ON LU.id_AvanceLibro = AL.id_AvanceLibro
WHERE LU.id_Usuario = (SELECT id_Usuario FROM Usuario WHERE Nick = @User) AND LU.id_Libro = @Libro AND L.Activo =  1
ORDER BY L.Nombre ASC
END
GO
/****** Object:  StoredProcedure [dbo].[vDetalleManga]    Script Date: 13/06/2018 21:23:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[vDetalleManga] @User VARCHAR(50), @Manga INT = 0
AS
BEGIN
SELECT MU.id_MangaUsuario, M.Nombre, M.Sinopsis, M.Tomos, CONVERT(varchar, M.Lanzamiento, 103) AS 'Lanzamiento', M.Imagen,
 GM.Descripcion 'Genero', M.Otros_Generos 'Otros Generos', EM.Descripcion 'Estado', AM.Descripcion 'Avance', MU.Nota
FROM Manga_Usuario MU
INNER JOIN Manga M ON MU.id_Manga = M.id_Manga
INNER JOIN Usuario U ON MU.id_Usuario = U.id_Usuario
INNER JOIN Genero_Mangas GM ON M.id_GeneroManga = GM.id_GeneroManga
INNER JOIN Estado_Manga EM ON M.id_EstadoManga = EM.id_EstadoManga
INNER JOIN Avance_Manga AM ON MU.id_AvanceManga = AM.id_AvanceManga
WHERE MU.id_Usuario = (SELECT id_Usuario FROM Usuario WHERE Nick = @User) AND MU.id_Manga = @Manga AND M.Activo =  1
ORDER BY M.Nombre ASC
END
GO
/****** Object:  StoredProcedure [dbo].[vDetallePelicula]    Script Date: 13/06/2018 21:23:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[vDetallePelicula] @User VARCHAR(50), @Pelicula INT = 0
AS
BEGIN
SELECT PU.id_PeliculaUsuario, P.Nombre, P.Sinopsis, P.Duracion, CONVERT(varchar, P.Lanzamiento, 103) AS 'Lanzamiento', P.Imagen,
 GP.Descripcion 'Genero', P.Otros_Generos 'Otros Generos', EP.Descripcion 'Estado', AP.Descripcion 'Avance', PU.Nota
FROM Pelicula_Usuario PU
INNER JOIN Peliculas P ON PU.id_Pelicula = P.id_Pelicula
INNER JOIN Usuario U ON PU.id_Usuario = U.id_Usuario
INNER JOIN Genero_Pelicula GP ON P.id_GeneroPelicula = GP.id_GeneroPelicula
INNER JOIN Estado_Pelicula EP ON P.id_EstadoPelicula = EP.id_EstadoPelicula
INNER JOIN Avance_Pelicula AP ON PU.id_AvancePelicula = AP.id_AvancePelicula
WHERE PU.id_Usuario = (SELECT id_Usuario FROM Usuario WHERE Nick = @User) AND PU.id_Pelicula = @Pelicula AND P.Activo =  1
ORDER BY P.Nombre ASC
END
GO
/****** Object:  StoredProcedure [dbo].[vDetalleSerie]    Script Date: 13/06/2018 21:23:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[vDetalleSerie] @User VARCHAR(50), @Serie INT = 0
AS
BEGIN
SELECT SU.id_SerieUsuario , S.Nombre, S.Sinopsis, CONVERT(varchar, S.Lanzamiento, 103) AS 'Lanzamiento' , S.Temporadas, S.CapitulosTotales 'Capitulos',
 S.Imagen, GS.Descripcion 'Genero', S.Otros_Generos 'Otros Generos', ES.Descripcion 'Estado', SS.Descripcion 'Avance', SU.Nota
FROM Serie_Usuario SU
INNER JOIN Series S ON SU.id_Serie = S.id_Serie
INNER JOIN Usuario U ON SU.id_Usuario = U.id_Usuario
INNER JOIN Genero_Serie GS ON S.id_GeneroSerie = GS.id_GeneroSerie
INNER JOIN Estado_Serie ES ON S.id_EstadoSerie = ES.id_EstadoSerie
INNER JOIN Avance_Serie SS ON SU.id_AvanceSerie = SS.id_AvanceSerie
WHERE SU.id_Usuario = (SELECT id_Usuario FROM Usuario WHERE Nick = @User) AND SU.id_Serie = @Serie AND S.Activo =  1
ORDER BY S.Nombre ASC
END
GO
/****** Object:  StoredProcedure [dbo].[vJuegoUsuario]    Script Date: 13/06/2018 21:23:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[vJuegoUsuario] @User VARCHAR(50)
AS
BEGIN
SELECT J.id_Juego, J.Nombre, J.Sinopsis,D.id_Desarrollador, D.Nombre 'Desarrollador', CONVERT(varchar, J.Lanzamiento, 103) AS 'Lanzamiento',
J.Imagen, GJ.Descripcion 'Genero', J.Otros_Generos 'Otros Generos', EJ.Descripcion 'Estado'
FROM Juegos_Usuario JU
INNER JOIN Juegos J ON JU.id_Juego = J.id_Juego
INNER JOIN Usuario U ON JU.id_Usuario = U.id_Usuario
INNER JOIN Desarrollador D ON J.id_Desarrollador = D.id_Desarrollador
INNER JOIN Genero_Juegos GJ ON J.id_GeneroJuego = GJ.id_GeneroJuego
INNER JOIN Estado_Juegos EJ ON J.id_EstadoJuego = EJ.id_EstadoJuegos
WHERE JU.id_Usuario = (SELECT id_Usuario FROM Usuario WHERE Nick = @User) AND J.Activo =  1
ORDER BY J.Nombre ASC
END
GO
/****** Object:  StoredProcedure [dbo].[vLibroUsuario]    Script Date: 13/06/2018 21:23:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[vLibroUsuario] @User VARCHAR(50)
AS
BEGIN
SELECT L.id_Libro, L.Nombre, L.Sinopsis, L.Paginas, A.id_Autor, A.Nombre 'Autor',  CONVERT(varchar, L.Lanzamiento, 103) AS 'Lanzamiento',
L.Imagen, GL.Descripcion 'Genero', L.Otros_Generos 'Otros Generos',EL.Descripcion 'Estado'
FROM Libro_Usuario LU
INNER JOIN Libros L ON LU.id_Libro = L.id_Libro
INNER JOIN Usuario U ON LU.id_Usuario = U.id_Usuario
INNER JOIN Autor A ON L.id_Autor = A.id_Autor
INNER JOIN Genero_Libro GL ON L.id_GeneroLibro = GL.id_GeneroLibro
INNER JOIN Estado_Libro EL ON L.id_EstadoLibro = EL.id_EstadoLibro
WHERE LU.id_Usuario = (SELECT id_Usuario FROM Usuario WHERE Nick = @User) AND L.Activo =  1
ORDER BY L.Nombre ASC
END
GO
/****** Object:  StoredProcedure [dbo].[vMangaUsuario]    Script Date: 13/06/2018 21:23:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[vMangaUsuario] @User VARCHAR(50)
AS
BEGIN
SELECT M.id_Manga, M.Nombre, M.Sinopsis, M.Tomos , CONVERT(varchar, M.Lanzamiento, 103) AS 'Lanzamiento',
M.Imagen, GM.Descripcion 'Genero', M.Otros_Generos 'Otros Generos', EM.Descripcion 'Estado'
FROM Manga_Usuario MU
INNER JOIN Manga M ON MU.id_Manga = M.id_Manga
INNER JOIN Usuario U ON MU.id_Usuario = U.id_Usuario
INNER JOIN Genero_Mangas GM ON M.id_GeneroManga = GM.id_GeneroManga
INNER JOIN Estado_Manga EM ON M.id_EstadoManga = EM.id_EstadoManga
WHERE MU.id_Usuario = (SELECT id_Usuario FROM Usuario WHERE Nick = @User) AND M.Activo =  1
ORDER BY M.Nombre ASC
END
GO
/****** Object:  StoredProcedure [dbo].[vPeliculaUsuario]    Script Date: 13/06/2018 21:23:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROC [dbo].[vPeliculaUsuario] @User VARCHAR(50)
AS
BEGIN
SELECT PU.id_Pelicula, P.Nombre, P.Sinopsis, P.Duracion, CONVERT(varchar, P.Lanzamiento, 103) AS 'Lanzamiento', P.Imagen,
 GP.Descripcion 'Genero', P.Otros_Generos 'Otros Generos', EP.Descripcion 'Estado'
FROM Pelicula_Usuario PU
INNER JOIN Peliculas P ON PU.id_Pelicula = P.id_Pelicula
INNER JOIN Usuario U ON PU.id_Usuario = U.id_Usuario
INNER JOIN Genero_Pelicula GP ON P.id_GeneroPelicula = GP.id_GeneroPelicula
INNER JOIN Estado_Pelicula EP ON P.id_EstadoPelicula = EP.id_EstadoPelicula
WHERE PU.id_Usuario = (SELECT id_Usuario FROM Usuario WHERE Nick = @User) AND P.Activo =  1
ORDER BY P.Nombre ASC
END
GO
/****** Object:  StoredProcedure [dbo].[vSerieUsuario]    Script Date: 13/06/2018 21:23:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[vSerieUsuario] @User VARCHAR(50)
AS
BEGIN
SELECT S.id_Serie, S.Nombre, S.Sinopsis, CONVERT(varchar, S.Lanzamiento, 103) AS 'Lanzamiento' , S.Temporadas, 
S.CapitulosTotales 'Capitulos',S.Imagen, GS.Descripcion 'Genero', ES.Descripcion 'Estado'
FROM Serie_Usuario SU
INNER JOIN Series S ON SU.id_Serie = S.id_Serie
INNER JOIN Usuario U ON SU.id_Usuario = U.id_Usuario
INNER JOIN Genero_Serie GS ON S.id_GeneroSerie = GS.id_GeneroSerie
INNER JOIN Estado_Serie ES ON S.id_EstadoSerie = ES.id_EstadoSerie
WHERE SU.id_Usuario = (SELECT id_Usuario FROM Usuario WHERE Nick = @User) AND S.Activo =  1
ORDER BY S.Nombre ASC
END
GO
USE [master]
GO
ALTER DATABASE [bd_biblioteca] SET  READ_WRITE 
GO
