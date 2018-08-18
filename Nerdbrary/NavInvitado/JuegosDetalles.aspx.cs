using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class NavInvitado_Juegos : System.Web.UI.Page
{
    Conexion sql = new Conexion();
    ConexionLQDataContext cdc;
    String idJuego = "";
    protected void Page_Load(object sender, EventArgs e)
    {
        idJuego = Request.QueryString["Id"];
        if (!IsPostBack)
        {
            LlenaDetalles();
        }
    }


    private void LlenaDetalles()
    {
        if (idJuego == null || idJuego.Equals(0))
        {
            Mensaje("Aviso", "Hubo un error al cargar la pagina", "info");
        }
        else
        {
            String Nombre = "";
            String Sinopsis = "";
            String Desarrollador = "";
            String Lanzamiento = "";
            String RutaImagen = "";
            String GeneroAnime = "";
            String OtrosGeneros = "";
            String Estado = "";
            String Avance = "";
            bool DatosOK = true;

            SqlDataReader Juego = sql.consulta("SELECT * FROM vJuegos WHERE id_Juego = " + idJuego);
            if (Juego.Read())
            {
                Nombre = Juego[1].ToString();
                Sinopsis = Juego[2].ToString();
                Desarrollador = Juego[4].ToString();
                Lanzamiento = Juego[5].ToString();
                RutaImagen = Juego[6].ToString();
                GeneroAnime = Juego[7].ToString();
                OtrosGeneros = Juego[8].ToString();
                Estado = Juego[9].ToString();
                DatosOK = true;
            }
            else
            {
                DatosOK = false;
            }

            if (DatosOK)
            {
                Page.Title = "Detalles: " + Nombre;
                TituloJ.Text = Nombre;
                DescripcionJ.Text = Sinopsis;
                LanzamientoJ.Text = Lanzamiento;
                DesarrolladorJ.Text = Desarrollador.ToString();
                imagen.Src = "../img/games/" + RutaImagen;
                GeneroJ.Text = GeneroAnime;
                OGenerosJ.Text = OtrosGeneros;
                EstadoJ.Text = Estado;
                APersonalJ.Text = Avance;
                Cover.Attributes["Style"] = "background-image: url(../img/games/" + RutaImagen + ")";
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