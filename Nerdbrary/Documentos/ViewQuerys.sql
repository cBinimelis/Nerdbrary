ALTER PROC vAnime @User VARCHAR(50)
AS
BEGIN
SELECT A.id_Anime, A.Nombre, A.Sinopsis, CONVERT(varchar, A.Lanzamiento, 103) AS 'Lanzamiento' , A.Temporadas, 
A.CapitulosTotales 'Capitulos', GA.Descripcion 'Genero', ES.Descripcion 'Estado'
FROM Anime_Usuario AU
INNER JOIN Anime A ON AU.id_Anime = A.id_Anime
INNER JOIN Usuario U ON AU.id_Usuario = U.id_Usuario
INNER JOIN Genero_Anime GA ON A.id_GeneroAnime = ga.id_GeneroAnime
INNER JOIN Estado_Serie ES ON A.id_EstadoSerie = ES.id_EstadoSerie
WHERE U.id_Usuario = (SELECT id_Usuario FROM Usuario WHERE Nick = @User)
END

EXEC vAnime 'ivichan'