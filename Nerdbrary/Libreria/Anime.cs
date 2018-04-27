using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data.SqlClient;

/// <summary>
/// Descripción breve de Animes
/// </summary>
public class Anime
{
    Conexion sql = new Conexion();

    public int Id { get; set; }
    public String Nombre { get; set; }
    public String Sinopsis { get; set; }
    public String Lanzamiento { get; set; }
    public int Temporadas { get; set; }
    public int Capitulos { get; set; }
    public String Imagen { get; set; }
    public int idGeneroAnime { get; set; }
    public String OtrosGeneros { get; set; }
    public int idEstadoSerie { get; set; }

    public Anime(int AnimeId)
    {
        SqlDataReader Anime = sql.consulta("SELECT * FROM Productos WHERE IdProducto = '" + AnimeId + "'");
        if (Anime.Read())
        {
            Id = Convert.ToInt32(Anime[0].ToString());
            Nombre = Anime[1].ToString();
            Sinopsis = Anime[2].ToString();
            Lanzamiento = Anime[3].ToString();
            Temporadas = Convert.ToInt32(Anime[4].ToString());
            Capitulos = Convert.ToInt32(Anime[4].ToString());
            Imagen = Anime[3].ToString();
            idGeneroAnime = Convert.ToInt32(Anime[4].ToString());
            OtrosGeneros = Anime[3].ToString();
            idEstadoSerie = Convert.ToInt32(Anime[4].ToString());
        }
    }
}