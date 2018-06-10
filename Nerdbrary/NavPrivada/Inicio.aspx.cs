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
        if (!this.IsPostBack)
        {
            llenarPerfil();
            LlenarSlides();
            LlenarDD();
        }
    }

    private void llenarPerfil()
    {
        try
        {
            cdc = new ConexionLQDataContext();
            String UserNick = Session["Admin"].ToString();
            SqlDataReader Usuario = sql.consulta("SELECT * FROM Usuario Where Nick = '" + UserNick + "'");
            if (Usuario.Read())
            {
                PPicture.Src = "../img/users/" + Usuario[5].ToString();
                Username.Text = Usuario[1].ToString().ToUpperInvariant();
                FondoPrincipal.Attributes["Style"] = "background-image: url(../img/users/" + Usuario[6].ToString() + "); height: 50vh";

                //LLENAR CONTADORES
                int Animes = (from a in cdc.Anime select a.id_Anime).Count();
                int Juegos = (from a in cdc.Juegos select a.id_Juego).Count();
                int Mangas = (from a in cdc.Manga select a.id_Manga).Count();
                int Series = (from a in cdc.Series select a.id_Serie).Count();
                int Peliculas = (from a in cdc.Peliculas select a.id_Pelicula).Count();
                int Libros = (from a in cdc.Libros select a.id_Libro).Count();

                lbl_Anime.Text = Animes.ToString();
                lbl_Juegos.Text = Juegos.ToString();
                lbl_Mangas.Text = Mangas.ToString();
                lbl_Series.Text = Series.ToString();
                lbl_Peliculas.Text = Peliculas.ToString();
                lbl_Libros.Text = Libros.ToString();
            }
        }
        catch
        {

        }
    }

    private void LlenarDD()
    {
        cdc = new ConexionLQDataContext();
        dd_tipoP.DataSource = cdc.Tipo_Pendiente;
        dd_tipoP.DataTextField = "Descripcion";
        dd_tipoP.DataValueField = "id_TipoPendiente";
        dd_tipoP.DataBind();
    }


    protected void btn_crear_Click(object sender, EventArgs e)
    {
        try
        {
            if (txt_pendiente.Text.Trim().Equals(""))
            {
                Mensaje("Así no se puede trabajar", "No puedes dejar el campo vacío", "warning");
            }
            else
            {
                String UserNick = Session["Admin"].ToString();
                cdc = new ConexionLQDataContext();
                Pendientes p = new Pendientes();
                p.id_Usuario = (from a in cdc.Usuario where a.Nick == UserNick select a.id_Usuario).FirstOrDefault();
                p.Nombre = txt_pendiente.Text;
                p.id_TipoPendiente = (dd_tipoP.SelectedIndex + 1);
                cdc.Pendientes.InsertOnSubmit(p);
                cdc.SubmitChanges();
                Mensaje("Felicidades", "Se ha creado el regristro", "success");
                Clean();
            }
        }
        catch
        {

        }
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
        }

        SqlDataReader Serie = sql.consulta("SELECT TOP 5 id_Serie, Nombre, Imagen FROM Series ORDER BY NEWID()");
        if (Serie.Read())
        {
            lnk_serie1.Attributes["href"] = "Detalles_Serie.aspx?Id=" + Serie[0].ToString();
            tit_serie1.InnerText = Serie[1].ToString();
            img_Serie1.Attributes["src"] = "../img/series/" + Serie[2].ToString();
            Serie.Read();
            lnk_serie2.Attributes["href"] = "Detalles_Serie.aspx?Id=" + Serie[0].ToString();
            tit_serie2.InnerText = Serie[1].ToString();
            img_Serie2.Attributes["src"] = "../img/series/" + Serie[2].ToString();
            Serie.Read();
            lnk_serie3.Attributes["href"] = "Detalles_Serie.aspx?Id=" + Serie[0].ToString();
            tit_serie3.InnerText = Serie[1].ToString();
            img_Serie3.Attributes["src"] = "../img/series/" + Serie[2].ToString();
            Serie.Read();
            lnk_serie4.Attributes["href"] = "Detalles_Serie.aspx?Id=" + Serie[0].ToString();
            tit_serie4.InnerText = Serie[1].ToString();
            img_Serie4.Attributes["src"] = "../img/series/" + Serie[2].ToString();
            Serie.Read();
            lnk_serie5.Attributes["href"] = "Detalles_Serie.aspx?Id=" + Serie[0].ToString();
            tit_serie5.InnerText = Serie[1].ToString();
            img_Serie5.Attributes["src"] = "../img/series/" + Serie[2].ToString();
        }

        SqlDataReader Pelicula = sql.consulta("SELECT TOP 5 id_Pelicula, Nombre, Imagen FROM Peliculas ORDER BY NEWID()");
        if (Pelicula.Read())
        {
            lnk_Pelicula1.Attributes["href"] = "Detalles_Pelicula.aspx?Id=" + Pelicula[0].ToString();
            tit_Pelicula1.InnerText = Pelicula[1].ToString();
            img_Pelicula1.Attributes["src"] = "../img/movies/" + Pelicula[2].ToString();
            Pelicula.Read();
            lnk_Pelicula2.Attributes["href"] = "Detalles_Pelicula.aspx?Id=" + Pelicula[0].ToString();
            tit_Pelicula2.InnerText = Pelicula[1].ToString();
            img_Pelicula2.Attributes["src"] = "../img/movies/" + Pelicula[2].ToString();
            Pelicula.Read();
            lnk_Pelicula3.Attributes["href"] = "Detalles_Pelicula.aspx?Id=" + Pelicula[0].ToString();
            tit_Pelicula3.InnerText = Pelicula[1].ToString();
            img_Pelicula3.Attributes["src"] = "../img/movies/" + Pelicula[2].ToString();
            Pelicula.Read();
            lnk_Pelicula4.Attributes["href"] = "Detalles_Pelicula.aspx?Id=" + Pelicula[0].ToString();
            tit_Pelicula4.InnerText = Pelicula[1].ToString();
            img_Pelicula4.Attributes["src"] = "../img/movies/" + Pelicula[2].ToString();
            Pelicula.Read();
            lnk_Pelicula5.Attributes["href"] = "Detalles_Pelicula.aspx?Id=" + Pelicula[0].ToString();
            tit_Pelicula5.InnerText = Pelicula[1].ToString();
            img_Pelicula5.Attributes["src"] = "../img/movies/" + Pelicula[2].ToString();
        }

        SqlDataReader Libro = sql.consulta("SELECT TOP 5 id_Libro, Nombre, Imagen FROM Libros ORDER BY NEWID()");
        if (Libro.Read())
        {
            lnk_Libro1.Attributes["href"] = "Detalles_Libros.aspx?Id=" + Libro[0].ToString();
            tit_Libro1.InnerText = Libro[1].ToString();
            img_Libro1.Attributes["src"] = "../img/books/" + Libro[2].ToString();
            Libro.Read();
            lnk_Libro2.Attributes["href"] = "Detalles_Libros.aspx?Id=" + Libro[0].ToString();
            tit_Libro2.InnerText = Libro[1].ToString();
            img_Libro2.Attributes["src"] = "../img/books/" + Libro[2].ToString();
            Libro.Read();
            lnk_Libro3.Attributes["href"] = "Detalles_Libros.aspx?Id=" + Libro[0].ToString();
            tit_Libro3.InnerText = Libro[1].ToString();
            img_Libro3.Attributes["src"] = "../img/books/" + Libro[2].ToString();
            Libro.Read();
            lnk_Libro4.Attributes["href"] = "Detalles_Libros.aspx?Id=" + Libro[0].ToString();
            tit_Libro4.InnerText = Libro[1].ToString();
            img_Libro4.Attributes["src"] = "../img/books/" + Libro[2].ToString();
            Libro.Read();
            lnk_Libro5.Attributes["href"] = "Detalles_Libros.aspx?Id=" + Libro[0].ToString();
            tit_Libro5.InnerText = Libro[1].ToString();
            img_Libro5.Attributes["src"] = "../img/books/" + Libro[2].ToString();
        }
    }

    private void Clean()
    {
        txt_pendiente.Text = "";
    }
    private void Mensaje(String Tit, String Msg, String Stat)
    {
        ScriptManager.RegisterStartupScript(this, GetType(), "Popup", "Alerta('" + Tit + "','" + Msg + "','" + Stat + "');", true);
    }
}