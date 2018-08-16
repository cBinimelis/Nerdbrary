using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class NavInvitado_MangaDetalles : System.Web.UI.Page
{
    Conexion sql = new Conexion();
    ConexionLQDataContext cdc;
    String idManga = "";
    protected void Page_Load(object sender, EventArgs e)
    {
        idManga = Request.QueryString["Id"];
        if (!IsPostBack)
        {
            LlenaDetalles();
        }
    }

    private void LlenaDetalles()
    {
        if (idManga == null || idManga.Equals(0))
        {
            Mensaje("Aviso", "Hubo un error al cargar la pagina", "info");
        }
        else
        {
            String Nombre = "";
            String Sinopsis = "";
            String Lanzamiento = "";
            String Tomos = "";
            String RutaImagen = "";
            String GeneroAnime = "";
            String OtrosGeneros = "";
            String Estado = "";
            String Avance = "";
            bool DatosOK = true;

            SqlDataReader Manga = sql.consulta("SELECT* FROM vManga WHERE id_Manga =" + idManga);
            if (Manga.Read())
            {
                Nombre = Manga[1].ToString();
                Sinopsis = Manga[2].ToString();
                Tomos = Manga[3].ToString();
                Lanzamiento = Manga[4].ToString();
                RutaImagen = Manga[5].ToString();
                GeneroAnime = Manga[6].ToString();
                OtrosGeneros = Manga[7].ToString();
                Estado = Manga[8].ToString();
                DatosOK = true;
            }
            else
            {
                DatosOK = false;
            }

            if (DatosOK)
            {
                Page.Title = "Detalles: " + Nombre;
                TituloA.Text = Nombre;
                DescripcionA.Text = Sinopsis;
                LanzamientoA.Text = Lanzamiento;
                TomosA.Text = Tomos.ToString();
                imagen.Src = "../img/manga/" + RutaImagen;
                GeneroA.Text = GeneroAnime;
                OGenerosA.Text = OtrosGeneros;
                EstadoA.Text = Estado;
                APersonalA.Text = Avance;
                Cover.Attributes["Style"] = "background-image: url(../img/manga/" + RutaImagen + ")";
            }
            else
            {
                Mensaje("Aviso", "Hubo un error al cargar la pagina", "info");
            }
        }
    }

    private void Mensaje(String Tit, String Msg, String Stat)
    {
        ScriptManager.RegisterStartupScript(this, GetType(), "Popup", "Alerta('" + Tit + "','" + Msg + "','" + Stat + "');", true);
    }
}