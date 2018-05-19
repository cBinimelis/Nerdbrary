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
--WHERE U.id_Usuario = (SELECT id_Usuario FROM Usuario WHERE Nick = @User) AND A.Activo =  1
--ORDER BY A.Nombre ASC
--END

--EXEC vAnimeUsuario 'ivichan'





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
--J.Imagen, GJ.Descripcion 'Genero', J.Otros_Generos 'Otros Generos', EJ.Descripcion 'Estado', AJ.Descripción 'Avance', JU.Nota
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