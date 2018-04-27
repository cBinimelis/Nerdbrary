using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;

public partial class NavPrivada_AnimeDetalles : System.Web.UI.Page
{
    Conexion sql = new Conexion();
    protected void Page_Load(object sender, EventArgs e)
    {
        LlenaDetalles();
    }

    private void LlenaDetalles()
    {
        String idAnime = Request.QueryString["Id"];
        String Nombre = "";
        String Sinopsis = "";
        String Lanzamiento = "";
        int Temporadas = 0;
        int Capitulos = 0;
        String RutaImagen = "";
        int idGeneroAnime = 0;
        String OtrosGeneros = "";
        int idEstadoSerie = 0;

        SqlDataReader Anime = sql.consulta("SELECT * FROM Anime WHERE id_Anime = '" + idAnime + "'");
        if (Anime.Read())
        {
            Nombre = Anime[1].ToString();
            Sinopsis = Anime[2].ToString();
            Lanzamiento = Anime[3].ToString();
            Temporadas = Convert.ToInt32(Anime[4].ToString());
            Capitulos = Convert.ToInt32(Anime[5].ToString());
            RutaImagen = Anime[6].ToString();
            idGeneroAnime = Convert.ToInt32(Anime[7].ToString());
            OtrosGeneros = Anime[8].ToString();
            idEstadoSerie = Convert.ToInt32(Anime[9].ToString());
        }

        TituloA.Text = Nombre;
        imagen.Src = "../img/anime/" + RutaImagen;
        DescripcionA.Text = Sinopsis;
        TemporadasA.Text = Temporadas.ToString();
        CapitulosA.Text = Capitulos.ToString();

    }
    
}