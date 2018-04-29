
CREATE VIEW vAnime as
SELECT A.id_Anime, A.Nombre, A.Sinopsis, CONVERT(varchar, A.Lanzamiento, 103) AS 'Lanzamiento' , A.Temporadas, 
A.CapitulosTotales 'Capitulos',A.Imagen, GA.Descripcion 'Genero', A.Otros_Generos 'Otros Generos', ES.Descripcion 'Estado'
FROM Anime A
INNER JOIN Genero_Anime GA ON A.id_GeneroAnime = ga.id_GeneroAnime
INNER JOIN Estado_Serie ES ON A.id_EstadoSerie = ES.id_EstadoSerie

EXEC vAnime where id_Anime =1


--ALTER PROC vDetalleAnime @User VARCHAR(50), @Anime INT = 0
--AS
--BEGIN
--SELECT A.id_Anime, A.Nombre, A.Sinopsis, CONVERT(varchar, A.Lanzamiento, 103) AS 'Lanzamiento' , A.Temporadas, A.CapitulosTotales 'Capitulos',
-- A.Imagen, GA.Descripcion 'Genero', A.Otros_Generos 'Otros Generos', ES.Descripcion 'Estado', AA.Descripcion 'Avance'
--FROM Anime_Usuario AU
--INNER JOIN Anime A ON AU.id_Anime = A.id_Anime
--INNER JOIN Usuario U ON AU.id_Usuario = U.id_Usuario
--INNER JOIN Genero_Anime GA ON A.id_GeneroAnime = ga.id_GeneroAnime
--INNER JOIN Estado_Serie ES ON A.id_EstadoSerie = ES.id_EstadoSerie
--INNER JOIN Avance_Anime AA ON AA.id_AvanceAnime = AU.id_AvanceAnime
--WHERE AU.id_Usuario = (SELECT id_Usuario FROM Usuario WHERE Nick = @User) AND AU.id_Anime = @Anime
--END

--EXEC vDetalleAnime 'ivichan', 1



--CREATE PROC vAnimeUsuario @User VARCHAR(50)
--AS
--BEGIN
--SELECT A.id_Anime, A.Nombre, A.Sinopsis, CONVERT(varchar, A.Lanzamiento, 103) AS 'Lanzamiento' , A.Temporadas, 
--A.CapitulosTotales 'Capitulos',A.Imagen, GA.Descripcion 'Genero', ES.Descripcion 'Estado'
--FROM Anime_Usuario AU
--INNER JOIN Anime A ON AU.id_Anime = A.id_Anime
--INNER JOIN Usuario U ON AU.id_Usuario = U.id_Usuario
--INNER JOIN Genero_Anime GA ON A.id_GeneroAnime = ga.id_GeneroAnime
--INNER JOIN Estado_Serie ES ON A.id_EstadoSerie = ES.id_EstadoSerie
--WHERE U.id_Usuario = (SELECT id_Usuario FROM Usuario WHERE Nick = @User)
--END

--EXEC vAnimeUsuario 'ivichan'