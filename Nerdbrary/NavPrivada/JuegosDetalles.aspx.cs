using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;

public partial class NavPrivada_JuegosDetalles : System.Web.UI.Page
{
    Conexion sql = new Conexion();
    ConexionLQDataContext cdc;
    String Nick = "";
    String idJuego = "";
    int idDesarrollador = 0;
    protected void Page_Load(object sender, EventArgs e)
    {
        Nick = Convert.ToString(Session["Admin"]);
        idJuego = Request.QueryString["Id"];
        if (!IsPostBack)
        {
            LlenaDetalles();
            llenarGrilla();
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

            if (Nick == "" || Nick == null)
            {
                SqlDataReader Juego = sql.consulta("SELECT * FROM vJuegos WHERE id_Juego = " + idJuego);
                if (Juego.Read())
                {
                    Nombre = Juego[1].ToString();
                    Sinopsis = Juego[2].ToString();
                    lnk_Desarrollador.Attributes["href"] = "Desarrollador.aspx?Id=" + Juego[3].ToString();
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
            }
            else
            {
                SqlDataReader JuegoUsuario = sql.consulta("EXEC vDetalleJuego '" + Nick + "'," + idJuego);
                if (JuegoUsuario.Read())
                {
                    Nombre = JuegoUsuario[1].ToString();
                    Sinopsis = JuegoUsuario[2].ToString();
                    lnk_Desarrollador.Attributes["href"] = "Desarrollador.aspx?Id=" + JuegoUsuario[3].ToString();
                    Desarrollador = JuegoUsuario[4].ToString();
                    Lanzamiento = JuegoUsuario[5].ToString();
                    RutaImagen = JuegoUsuario[6].ToString();
                    GeneroAnime = JuegoUsuario[7].ToString();
                    OtrosGeneros = JuegoUsuario[8].ToString();
                    Estado = JuegoUsuario[9].ToString();
                    Avance = JuegoUsuario[10].ToString();
                    DatosOK = true;
                    llenarGrilla();
                }
                else
                {
                    SqlDataReader Juego = sql.consulta("SELECT * FROM vJuegos WHERE id_Juego = " + idJuego);
                    if (Juego.Read())
                    {
                        Nombre = Juego[1].ToString();
                        Sinopsis = Juego[2].ToString();
                        lnk_Desarrollador.Attributes["href"] = "Desarrollador.aspx?Id=" + Juego[3].ToString();
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
                }
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

    private void llenarGrilla()
    {
        cdc = new ConexionLQDataContext();
        GrillaJuegosUsuario.DataSource = cdc.vDetalleJuego(Nick, Convert.ToInt32(idJuego));
        GrillaJuegosUsuario.DataBind();
    }

    protected void GrillaJuegosUsuario_RowDataBound(object sender, GridViewRowEventArgs e)
    {

    }

    protected void GrillaJuegosUsuario_RowEditing(object sender, GridViewEditEventArgs e)
    {

    }

    protected void GrillaJuegosUsuario_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
    {

    }

    protected void GrillaJuegosUsuario_RowUpdating(object sender, GridViewUpdateEventArgs e)
    {

    }

    protected void GrillaJuegosUsuario_RowDeleting(object sender, GridViewDeleteEventArgs e)
    {

    }

    private void Mensaje(String Tit, String Msg, String Stat)
    {
        ScriptManager.RegisterStartupScript(this, GetType(), "Popup", "Alerta('" + Tit + "','" + Msg + "','" + Stat + "');", true);
    }
}