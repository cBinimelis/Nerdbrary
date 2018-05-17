using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;

public partial class NavPrivada_Inicio : System.Web.UI.Page
{
    ConexionLQDataContext cdc;
    Conexion sql = new Conexion();
    protected void Page_Load(object sender, EventArgs e)
    {
        LlenarDD();
        LlenarSlides();
    }

    private void LlenarDD()
    {
        cdc = new ConexionLQDataContext();
        dd_tipopendiente.DataSource = cdc.Tipo_Pendiente;
        dd_tipopendiente.DataValueField = "id_TipoPendiente";
        dd_tipopendiente.DataTextField = "Descripcion";
        dd_tipopendiente.DataBind();
    }

    private void LlenarSlides()
    {
        SqlDataReader Anime = sql.consulta("SELECT TOP 5 id_Anime, Nombre, Imagen FROM Anime ORDER BY NEWID()");
        if (Anime.Read())
        {
            lnk_anime1.Attributes["href"] = "Detalles_Anime.aspx?Id=" + Anime[0].ToString();
            tit_anime1.InnerText = Anime[1].ToString();
            img_Anime1.Attributes["src"] = "../img/anime/" + Anime[2].ToString();
            Anime.Read();
            lnk_anime2.Attributes["href"] = "Detalles_Anime.aspx?Id=" + Anime[0].ToString();
            tit_anime2.InnerText = Anime[1].ToString();
            img_Anime2.Attributes["src"] = "../img/anime/" + Anime[2].ToString();
            Anime.Read();
            lnk_anime3.Attributes["href"] = "Detalles_Anime.aspx?Id=" + Anime[0].ToString();
            tit_anime3.InnerText = Anime[1].ToString();
            img_Anime3.Attributes["src"] = "../img/anime/" + Anime[2].ToString();
            Anime.Read();
            lnk_anime4.Attributes["href"] = "Detalles_Anime.aspx?Id=" + Anime[0].ToString();
            tit_anime4.InnerText = Anime[1].ToString();
            img_Anime4.Attributes["src"] = "../img/anime/" + Anime[2].ToString();
            Anime.Read();
            lnk_anime5.Attributes["href"] = "Detalles_Anime.aspx?Id=" + Anime[0].ToString();
            tit_anime5.InnerText = Anime[1].ToString();
            img_Anime5.Attributes["src"] = "../img/anime/" + Anime[2].ToString();
        }


        SqlDataReader Juego = sql.consulta("SELECT TOP 5 id_Juego, Nombre, Imagen FROM Juegos ORDER BY NEWID()");
        if (Juego.Read())
        {
            lnk_juego1.Attributes["href"] = "Detalles_Juegos.aspx?Id=" + Juego[0].ToString();
            tit_juego1.InnerText = Juego[1].ToString();
            img_Juego1.Attributes["src"] = "../img/games/" + Juego[2].ToString();
            Juego.Read();
            lnk_juego2.Attributes["href"] = "Detalles_Juegos.aspx?Id=" + Juego[0].ToString();
            tit_juego2.InnerText = Juego[1].ToString();
            img_Juego2.Attributes["src"] = "../img/games/" + Juego[2].ToString();
            Juego.Read();
            lnk_juego3.Attributes["href"] = "Detalles_Juegos.aspx?Id=" + Juego[0].ToString();
            tit_juego3.InnerText = Juego[1].ToString();
            img_Juego3.Attributes["src"] = "../img/games/" + Juego[2].ToString();
            Juego.Read();
            lnk_juego4.Attributes["href"] = "Detalles_Juegos.aspx?Id=" + Juego[0].ToString();
            tit_juego4.InnerText = Juego[1].ToString();
            img_Juego4.Attributes["src"] = "../img/games/" + Juego[2].ToString();
            Juego.Read();
            lnk_juego5.Attributes["href"] = "Detalles_Juegos.aspx?Id=" + Juego[0].ToString();
            tit_juego5.InnerText = Juego[1].ToString();
            img_Juego5.Attributes["src"] = "../img/games/" + Juego[2].ToString();
            Juego.Read();
        }


        SqlDataReader Manga = sql.consulta("SELECT TOP 5 id_Manga, Nombre, Imagen FROM Manga ORDER BY NEWID()");
        if (Manga.Read())
        {
            lnk_manga1.Attributes["href"] = "Detalles_Manga.aspx?Id=" + Manga[0].ToString();
            tit_manga1.InnerText = Manga[1].ToString();
            img_manga1.Attributes["src"] = "../img/manga/" + Manga[2].ToString();
            Manga.Read();
            lnk_manga2.Attributes["href"] = "Detalles_Manga.aspx?Id=" + Manga[0].ToString();
            tit_manga2.InnerText = Manga[1].ToString();
            img_manga2.Attributes["src"] = "../img/manga/" + Manga[2].ToString();
            Manga.Read();
            lnk_manga3.Attributes["href"] = "Detalles_Manga.aspx?Id=" + Manga[0].ToString();
            tit_manga3.InnerText = Manga[1].ToString();
            img_manga3.Attributes["src"] = "../img/manga/" + Manga[2].ToString();
            Manga.Read();
            lnk_manga4.Attributes["href"] = "Detalles_Manga.aspx?Id=" + Manga[0].ToString();
            tit_manga4.InnerText = Manga[1].ToString();
            img_manga4.Attributes["src"] = "../img/manga/" + Manga[2].ToString();
            Manga.Read();
            lnk_manga5.Attributes["href"] = "Detalles_Manga.aspx?Id=" + Manga[0].ToString();
            tit_manga5.InnerText = Manga[1].ToString();
            img_manga5.Attributes["src"] = "../img/manga/" + Manga[2].ToString();
            Manga.Read();
        }
    }
}