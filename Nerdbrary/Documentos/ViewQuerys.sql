--------------------------------------------------------PENDIENTES--------------------------------------------------------

--ALTER VIEW vPendientes AS 
--SELECT P.id_Pendiente, P.Nombre, U.Nick 'Usuario', TP.Descripcion 'Tipo', TP.id_TipoPendiente
--FROM Pendientes P
--INNER JOIN Usuario U ON U.id_Usuario = P.id_Usuario
--INNER JOIN Tipo_Pendiente TP ON TP.id_TipoPendiente = P.id_TipoPendiente

--SELECT * FROM vPendientes

--------------------------------------------------------ANIME--------------------------------------------------------

--ALTER VIEW vAnime as
--SELECT A.id_Anime, A.Nombre, A.Sinopsis, CONVERT(varchar, A.Lanzamiento, 103) AS 'Lanzamiento' , A.Temporadas, 
--A.CapitulosTotales 'Capitulos',A.Imagen, GA.Descripcion 'Genero', A.Otros_Generos 'Otros Generos', ES.Descripcion 'Estado'
--FROM Anime A
--INNER JOIN Genero_Anime GA ON A.id_GeneroAnime = ga.id_GeneroAnime
--INNER JOIN Estado_Serie ES ON A.id_EstadoSerie = ES.id_EstadoSerie
--WHERE A.Activo =  1

--SELECT * from vAnime where id_anime = 1



--ALTER PROC vDetalleAnime @User VARCHAR(50), @Anime INT = 0
--AS
--BEGIN
--SELECT AU.id_AnimeUsuario , A.Nombre, A.Sinopsis, CONVERT(varchar, A.Lanzamiento, 103) AS 'Lanzamiento' , A.Temporadas, A.CapitulosTotales 'Capitulos',
-- A.Imagen, GA.Descripcion 'Genero', A.Otros_Generos 'Otros Generos', ES.Descripcion 'Estado', AA.Descripcion 'Avance', AU.Nota
--FROM Anime_Usuario AU
--INNER JOIN Anime A ON AU.id_Anime = A.id_Anime
--INNER JOIN Usuario U ON AU.id_Usuario = U.id_Usuario
--INNER JOIN Genero_Anime GA ON A.id_GeneroAnime = ga.id_GeneroAnime
--INNER JOIN Estado_Serie ES ON A.id_EstadoSerie = ES.id_EstadoSerie
--INNER JOIN Avance_Anime AA ON AA.id_AvanceAnime = AU.id_AvanceAnime
--WHERE AU.id_Usuario = (SELECT id_Usuario FROM Usuario WHERE Nick = @User) AND AU.id_Anime = @Anime AND A.Activo =  1
--ORDER BY A.Nombre ASC
--END

--EXEC vDetalleAnime 'ivichan', 4



--ALTER PROC vAnimeUsuario @User VARCHAR(50)
--AS
--BEGIN
--SELECT A.id_Anime, A.Nombre, A.Sinopsis, CONVERT(varchar, A.Lanzamiento, 103) AS 'Lanzamiento' , A.Temporadas, 
--A.CapitulosTotales 'Capitulos',A.Imagen, GA.Descripcion 'Genero', ES.Descripcion 'Estado'
--FROM Anime_Usuario AU
--INNER JOIN Anime A ON AU.id_Anime = A.id_Anime
--INNER JOIN Usuario U ON AU.id_Usuario = U.id_Usuario
--INNER JOIN Genero_Anime GA ON A.id_GeneroAnime = ga.id_GeneroAnime
--INNER JOIN Estado_Serie ES ON A.id_EstadoSerie = ES.id_EstadoSerie
--WHERE AU.id_Usuario = (SELECT id_Usuario FROM Usuario WHERE Nick = @User) AND A.Activo =  1
--ORDER BY A.Nombre ASC
--END

--EXEC vAnimeUsuario 'ivichan'


ALTER PROC vAnimeUsuarioNA @User VARCHAR(50)
AS
BEGIN

	DECLARE @USERID AS INT
	SET @USERID = (SELECT id_Usuario FROM [Usuario] WHERE Nick = @User)

SELECT A.id_Anime, A.Nombre, A.Sinopsis, CONVERT(varchar, A.Lanzamiento, 103) AS 'Lanzamiento' , A.Temporadas, 
A.CapitulosTotales 'Capitulos',A.Imagen, GA.Descripcion 'Genero', ES.Descripcion 'Estado'
FROM Anime A
INNER JOIN Genero_Anime GA ON A.id_GeneroAnime = ga.id_GeneroAnime
INNER JOIN Estado_Serie ES ON A.id_EstadoSerie = ES.id_EstadoSerie
WHERE A.id_Anime NOT IN (SELECT id_Anime FROM Anime_Usuario WHERE id_Usuario = @USERID) AND A.Activo =  1
ORDER BY A.Nombre ASC
END


--EXEC vAnimeUsuarioNA 'iviitan'



--------------------------------------------------------JUEGOS--------------------------------------------------------

--ALTER VIEW vJuegos AS
--SELECT J.id_Juego, J.Nombre, J.Sinopsis, D.id_Desarrollador, D.Nombre 'Desarrollador',  CONVERT(varchar, J.Lanzamiento, 103) AS 'Lanzamiento',
--J.Imagen, GJ.Descripcion 'Genero', J.Otros_Generos, EJ.Descripcion 'Estado'
--FROM Juegos J
--INNER JOIN Genero_Juegos GJ ON J.id_GeneroJuego = GJ.id_GeneroJuego
--INNER JOIN Estado_Juegos EJ ON J.id_EstadoJuego = EJ.id_EstadoJuegos
--INNER JOIN Desarrollador D ON J.id_Desarrollador = D.id_Desarrollador
--WHERE J.Activo = 1

--SELECT * FROM vJuegos WHERE id_Juego = 1


--ALTER PROC vDetalleJuego @User VARCHAR(50), @Juego INT = 0
--AS
--BEGIN
--SELECT JU.id_JuegoUsuario, J.Nombre, J.Sinopsis,D.id_Desarrollador, D.Nombre 'Desarrollador', CONVERT(varchar, J.Lanzamiento, 103) AS 'Lanzamiento',
--J.Imagen, GJ.Descripcion 'Genero', J.Otros_Generos 'Otros Generos', EJ.Descripcion 'Estado', AJ.Descripcion 'Avance', JU.Nota
--FROM Juegos_Usuario JU
--INNER JOIN Juegos J ON JU.id_Juego = J.id_Juego
--INNER JOIN Usuario U ON JU.id_Usuario = U.id_Usuario
--INNER JOIN Desarrollador D ON J.id_Desarrollador = D.id_Desarrollador
--INNER JOIN Genero_Juegos GJ ON J.id_GeneroJuego = GJ.id_GeneroJuego
--INNER JOIN Estado_Juegos EJ ON J.id_EstadoJuego = EJ.id_EstadoJuegos
--INNER JOIN Avance_Juego AJ ON JU.id_AvanceJuego = AJ.id_AvanceJuego
--WHERE JU.id_Usuario = (SELECT id_Usuario FROM Usuario WHERE Nick = @User) AND JU.id_Juego = @Juego AND J.Activo =  1
--ORDER BY J.Nombre ASC
--END

--EXEC vDetalleJuego 'geekriszx', 1



--ALTER PROC vJuegoUsuario @User VARCHAR(50)
--AS
--BEGIN
--SELECT J.id_Juego, J.Nombre, J.Sinopsis,D.id_Desarrollador, D.Nombre 'Desarrollador', CONVERT(varchar, J.Lanzamiento, 103) AS 'Lanzamiento',
--J.Imagen, GJ.Descripcion 'Genero', J.Otros_Generos 'Otros Generos', EJ.Descripcion 'Estado'
--FROM Juegos_Usuario JU
--INNER JOIN Juegos J ON JU.id_Juego = J.id_Juego
--INNER JOIN Usuario U ON JU.id_Usuario = U.id_Usuario
--INNER JOIN Desarrollador D ON J.id_Desarrollador = D.id_Desarrollador
--INNER JOIN Genero_Juegos GJ ON J.id_GeneroJuego = GJ.id_GeneroJuego
--INNER JOIN Estado_Juegos EJ ON J.id_EstadoJuego = EJ.id_EstadoJuegos
--WHERE JU.id_Usuario = (SELECT id_Usuario FROM Usuario WHERE Nick = @User) AND J.Activo =  1
--ORDER BY J.Nombre ASC
--END

--EXEC vJuegoUsuario 'geekriszx'



--ALTER PROC vJuegoUsuarioNA @User VARCHAR(50)
--AS
--BEGIN

--	DECLARE @USERID AS INT
--	SET @USERID = (SELECT id_Usuario FROM [Usuario] WHERE Nick = @User)

--SELECT J.id_Juego, J.Nombre, J.Sinopsis,D.id_Desarrollador, D.Nombre 'Desarrollador', CONVERT(varchar, J.Lanzamiento, 103) AS 'Lanzamiento',
--J.Imagen, GJ.Descripcion 'Genero', J.Otros_Generos 'Otros Generos', EJ.Descripcion 'Estado'
--FROM Juegos J
--INNER JOIN Desarrollador D ON J.id_Desarrollador = D.id_Desarrollador
--INNER JOIN Genero_Juegos GJ ON J.id_GeneroJuego = GJ.id_GeneroJuego
--INNER JOIN Estado_Juegos EJ ON J.id_EstadoJuego = EJ.id_EstadoJuegos
--WHERE J.id_Juego NOT IN (SELECT id_Juego FROM Juegos_Usuario WHERE id_Usuario = @USERID ) AND J.Activo =  1
--ORDER BY J.Nombre ASC
--END

--EXEC vJuegoUsuarioNA 'geekriszx'


--------------------------------------------------------Manga--------------------------------------------------------

--ALTER VIEW vManga AS
--SELECT M.id_Manga, M.Nombre, M.Sinopsis, M.Tomos, CONVERT(varchar, M.Lanzamiento, 103) AS 'Lanzamiento', 
--M.Imagen, GM.Descripcion 'Genero', M.Otros_Generos, EM.Descripcion 'Estado'
--FROM Manga M
--INNER JOIN Genero_Mangas GM ON M.id_GeneroManga = GM.id_GeneroManga
--INNER JOIN Estado_Manga EM ON M.id_EstadoManga = EM.id_EstadoManga
--WHERE M.Activo = 1

--SELECT * FROM vManga WHERE id_Manga = 1



--ALTER PROC vDetalleManga @User VARCHAR(50), @Manga INT = 0
--AS
--BEGIN
--SELECT MU.id_MangaUsuario, M.Nombre, M.Sinopsis, M.Tomos, CONVERT(varchar, M.Lanzamiento, 103) AS 'Lanzamiento', M.Imagen,
-- GM.Descripcion 'Genero', M.Otros_Generos 'Otros Generos', EM.Descripcion 'Estado', AM.Descripcion 'Avance', MU.Nota
--FROM Manga_Usuario MU
--INNER JOIN Manga M ON MU.id_Manga = M.id_Manga
--INNER JOIN Usuario U ON MU.id_Usuario = U.id_Usuario
--INNER JOIN Genero_Mangas GM ON M.id_GeneroManga = GM.id_GeneroManga
--INNER JOIN Estado_Manga EM ON M.id_EstadoManga = EM.id_EstadoManga
--INNER JOIN Avance_Manga AM ON MU.id_AvanceManga = AM.id_AvanceManga
--WHERE MU.id_Usuario = (SELECT id_Usuario FROM Usuario WHERE Nick = @User) AND MU.id_Manga = @Manga AND M.Activo =  1
--ORDER BY M.Nombre ASC
--END

--EXEC vDetalleManga'geekriszx', 2



--ALTER PROC vMangaUsuario @User VARCHAR(50)
--AS
--BEGIN
--SELECT M.id_Manga, M.Nombre, M.Sinopsis, M.Tomos , CONVERT(varchar, M.Lanzamiento, 103) AS 'Lanzamiento',
--M.Imagen, GM.Descripcion 'Genero', M.Otros_Generos 'Otros Generos', EM.Descripcion 'Estado'
--FROM Manga_Usuario MU
--INNER JOIN Manga M ON MU.id_Manga = M.id_Manga
--INNER JOIN Usuario U ON MU.id_Usuario = U.id_Usuario
--INNER JOIN Genero_Mangas GM ON M.id_GeneroManga = GM.id_GeneroManga
--INNER JOIN Estado_Manga EM ON M.id_EstadoManga = EM.id_EstadoManga
--WHERE MU.id_Usuario = (SELECT id_Usuario FROM Usuario WHERE Nick = @User) AND M.Activo =  1
--ORDER BY M.Nombre ASC
--END

--EXEC vMangaUsuario 'geekriszx'



--ALTER PROC vMangaUsuarioNA @User VARCHAR(50)
--AS
--BEGIN

--	DECLARE @USERID AS INT
--	SET @USERID = (SELECT id_Usuario FROM [Usuario] WHERE Nick = @User)

--SELECT M.id_Manga, M.Nombre, M.Sinopsis, M.Tomos , CONVERT(varchar, M.Lanzamiento, 103) AS 'Lanzamiento',
--M.Imagen, GM.Descripcion 'Genero', M.Otros_Generos 'Otros Generos', EM.Descripcion 'Estado'
--FROM Manga M
--INNER JOIN Genero_Mangas GM ON M.id_GeneroManga = GM.id_GeneroManga
--INNER JOIN Estado_Manga EM ON M.id_EstadoManga = EM.id_EstadoManga
--WHERE M.id_Manga NOT IN (SELECT id_Manga FROM Manga_Usuario WHERE id_Usuario = @USERID ) AND M.Activo = 1
--ORDER BY M.Nombre ASC
--END

--EXEC vMangaUsuarioNA 'geekriszx'


--------------------------------------------------------LIBROS--------------------------------------------------------
--ALTER VIEW vLibros AS
--SELECT L.id_Libro, L.Nombre, L.Sinopsis, L.Paginas, A.id_Autor, A.Nombre 'Autor',  CONVERT(varchar, L.Lanzamiento, 103) AS 'Lanzamiento',
--L.Imagen, GL.Descripcion 'Genero', L.Otros_Generos ,EL.Descripcion 'Estado'
--FROM Libros L
--INNER JOIN Genero_Libro GL ON L.id_GeneroLibro = GL.id_GeneroLibro
--INNER JOIN Estado_Libro EL ON L.id_EstadoLibro = EL.id_EstadoLibro
--INNER JOIN Autor A ON L.id_Autor = A.id_Autor
--WHERE L.Activo = 1

--SELECT * FROM vLibros WHERE id_Libro = 1



--ALTER PROC vDetalleLibro @User VARCHAR(50), @Libro INT = 0
--AS
--BEGIN
--SELECT LU.id_LibroUsuario, L.Nombre, L.Sinopsis, L.Paginas, A.id_Autor, A.Nombre 'Autor',  CONVERT(varchar, L.Lanzamiento, 103) AS 'Lanzamiento',
--L.Imagen, GL.Descripcion 'Genero', L.Otros_Generos 'Otros Generos', EL.Descripcion 'Estado', AL.Descripcion 'Avance', LU.Nota
--FROM Libro_Usuario LU
--INNER JOIN Libros L ON LU.id_Libro = L.id_Libro
--INNER JOIN Usuario U ON LU.id_Usuario = U.id_Usuario
--INNER JOIN Autor A ON L.id_Autor = A.id_Autor
--INNER JOIN Genero_Libro GL ON L.id_GeneroLibro = GL.id_GeneroLibro
--INNER JOIN Estado_Libro EL ON L.id_EstadoLibro = EL.id_EstadoLibro
--INNER JOIN Avance_Libro AL ON LU.id_AvanceLibro = AL.id_AvanceLibro
--WHERE LU.id_Usuario = (SELECT id_Usuario FROM Usuario WHERE Nick = @User) AND LU.id_Libro = @Libro AND L.Activo =  1
--ORDER BY L.Nombre ASC
--END

--EXEC vDetalleLibro 'ivichan', 1



--ALTER PROC vLibroUsuario @User VARCHAR(50)
--AS
--BEGIN
--SELECT L.id_Libro, L.Nombre, L.Sinopsis, L.Paginas, A.id_Autor, A.Nombre 'Autor',  CONVERT(varchar, L.Lanzamiento, 103) AS 'Lanzamiento',
--L.Imagen, GL.Descripcion 'Genero', L.Otros_Generos 'Otros Generos',EL.Descripcion 'Estado'
--FROM Libro_Usuario LU
--INNER JOIN Libros L ON LU.id_Libro = L.id_Libro
--INNER JOIN Usuario U ON LU.id_Usuario = U.id_Usuario
--INNER JOIN Autor A ON L.id_Autor = A.id_Autor
--INNER JOIN Genero_Libro GL ON L.id_GeneroLibro = GL.id_GeneroLibro
--INNER JOIN Estado_Libro EL ON L.id_EstadoLibro = EL.id_EstadoLibro
--WHERE LU.id_Usuario = (SELECT id_Usuario FROM Usuario WHERE Nick = @User) AND L.Activo =  1
--ORDER BY L.Nombre ASC
--END

--EXEC vLibroUsuario 'ivichan'




--------------------------------------------------------SERIES--------------------------------------------------------
--CREATE VIEW vSeries as
--SELECT S.id_Serie, S.Nombre, S.Sinopsis, CONVERT(varchar, S.Lanzamiento, 103) AS 'Lanzamiento' , S.Temporadas, 
--S.CapitulosTotales 'Capitulos',S.Imagen, GS.Descripcion 'Genero', S.Otros_Generos 'Otros Generos', ES.Descripcion 'Estado'
--FROM Series S
--INNER JOIN Genero_Serie GS ON S.id_GeneroSerie = GS.id_GeneroSerie
--INNER JOIN Estado_Serie ES ON S.id_EstadoSerie = ES.id_EstadoSerie
--WHERE S.Activo =  1

--SELECT * from vSeries where id_Serie = 1



--CREATE PROC vDetalleSerie @User VARCHAR(50), @Serie INT = 0
--AS
--BEGIN
--SELECT SU.id_SerieUsuario , S.Nombre, S.Sinopsis, CONVERT(varchar, S.Lanzamiento, 103) AS 'Lanzamiento' , S.Temporadas, S.CapitulosTotales 'Capitulos',
-- S.Imagen, GS.Descripcion 'Genero', S.Otros_Generos 'Otros Generos', ES.Descripcion 'Estado', SS.Descripcion 'Avance', SU.Nota
--FROM Serie_Usuario SU
--INNER JOIN Series S ON SU.id_Serie = S.id_Serie
--INNER JOIN Usuario U ON SU.id_Usuario = U.id_Usuario
--INNER JOIN Genero_Serie GS ON S.id_GeneroSerie = GS.id_GeneroSerie
--INNER JOIN Estado_Serie ES ON S.id_EstadoSerie = ES.id_EstadoSerie
--INNER JOIN Avance_Serie SS ON SU.id_AvanceSerie = SS.id_AvanceSerie
--WHERE SU.id_Usuario = (SELECT id_Usuario FROM Usuario WHERE Nick = @User) AND SU.id_Serie = @Serie AND S.Activo =  1
--ORDER BY S.Nombre ASC
--END

--EXEC vDetalleSerie 'ivichan', 4



--CREATE PROC vSerieUsuario @User VARCHAR(50)
--AS
--BEGIN
--SELECT S.id_Serie, S.Nombre, S.Sinopsis, CONVERT(varchar, S.Lanzamiento, 103) AS 'Lanzamiento' , S.Temporadas, 
--S.CapitulosTotales 'Capitulos',S.Imagen, GS.Descripcion 'Genero', ES.Descripcion 'Estado'
--FROM Serie_Usuario SU
--INNER JOIN Series S ON SU.id_Serie = S.id_Serie
--INNER JOIN Usuario U ON SU.id_Usuario = U.id_Usuario
--INNER JOIN Genero_Serie GS ON S.id_GeneroSerie = GS.id_GeneroSerie
--INNER JOIN Estado_Serie ES ON S.id_EstadoSerie = ES.id_EstadoSerie
--WHERE SU.id_Usuario = (SELECT id_Usuario FROM Usuario WHERE Nick = @User) AND S.Activo =  1
--ORDER BY S.Nombre ASC
--END

----EXEC vSerieUsuario 'ivichan'



--------------------------------------------------------PELICULAS--------------------------------------------------------

--ALTER VIEW vPelicula AS
--SELECT P.id_Pelicula, P.Nombre, P.Sinopsis, P.Duracion, CONVERT(varchar, P.Lanzamiento, 103) AS 'Lanzamiento', 
--P.Imagen, GP.Descripcion 'Genero', P.Otros_Generos, EP.Descripcion 'Estado'
--FROM Peliculas P
--INNER JOIN Genero_Pelicula GP ON P.id_GeneroPelicula = GP.id_GeneroPelicula
--INNER JOIN Estado_Pelicula EP ON P.id_EstadoPelicula = EP.id_EstadoPelicula
--WHERE P.Activo = 1

--SELECT * FROM vPelicula WHERE id_Pelicula = 1



--CREATE PROC vDetallePelicula @User VARCHAR(50), @Pelicula INT = 0
--AS
--BEGIN
--SELECT PU.id_PeliculaUsuario, P.Nombre, P.Sinopsis, P.Duracion, CONVERT(varchar, P.Lanzamiento, 103) AS 'Lanzamiento', P.Imagen,
-- GP.Descripcion 'Genero', P.Otros_Generos 'Otros Generos', EP.Descripcion 'Estado', AP.Descripcion 'Avance', PU.Nota
--FROM Pelicula_Usuario PU
--INNER JOIN Peliculas P ON PU.id_Pelicula = P.id_Pelicula
--INNER JOIN Usuario U ON PU.id_Usuario = U.id_Usuario
--INNER JOIN Genero_Pelicula GP ON P.id_GeneroPelicula = GP.id_GeneroPelicula
--INNER JOIN Estado_Pelicula EP ON P.id_EstadoPelicula = EP.id_EstadoPelicula
--INNER JOIN Avance_Pelicula AP ON PU.id_AvancePelicula = AP.id_AvancePelicula
--WHERE PU.id_Usuario = (SELECT id_Usuario FROM Usuario WHERE Nick = @User) AND PU.id_Pelicula = @Pelicula AND P.Activo =  1
--ORDER BY P.Nombre ASC
--END

--EXEC vDetallePelicula'geekriszx', 1



--ALTER PROC vPeliculaUsuario @User VARCHAR(50)
--AS
--BEGIN
--SELECT PU.id_Pelicula, P.Nombre, P.Sinopsis, P.Duracion, CONVERT(varchar, P.Lanzamiento, 103) AS 'Lanzamiento', P.Imagen,
-- GP.Descripcion 'Genero', P.Otros_Generos 'Otros Generos', EP.Descripcion 'Estado'
--FROM Pelicula_Usuario PU
--INNER JOIN Peliculas P ON PU.id_Pelicula = P.id_Pelicula
--INNER JOIN Usuario U ON PU.id_Usuario = U.id_Usuario
--INNER JOIN Genero_Pelicula GP ON P.id_GeneroPelicula = GP.id_GeneroPelicula
--INNER JOIN Estado_Pelicula EP ON P.id_EstadoPelicula = EP.id_EstadoPelicula
--WHERE PU.id_Usuario = (SELECT id_Usuario FROM Usuario WHERE Nick = @User) AND P.Activo =  1
--ORDER BY P.Nombre ASC
--END

--EXEC vPeliculaUsuario'geekriszx'