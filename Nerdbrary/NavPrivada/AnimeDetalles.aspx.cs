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
    ConexionLQDataContext cdc;
    String Nick = "";
    String idAnime = "";
    protected void Page_Load(object sender, EventArgs e)
    {
        Nick = Convert.ToString(Session["Admin"]);
        idAnime = Request.QueryString["Id"];
        if (!IsPostBack)
        {
            LlenaDetalles();
            llenarGrilla();
        }
    }


    private void LlenaDetalles()
    {
        if (idAnime == null || idAnime.Equals(0))
        {
            Mensaje("Aviso", "Hubo un error al cargar la pagina", "info");
        }
        else
        {
            String Nombre = "";
            String Sinopsis = "";
            String Lanzamiento = "";
            int Temporadas = 0;
            String Capitulos = "";
            String RutaImagen = "";
            String GeneroAnime = "";
            String OtrosGeneros = "";
            String Estado = "";
            String Avance = "";
            bool DatosOK = true;

            if (Nick == "" || Nick == null)
            {
                SqlDataReader Anime = sql.consulta("SELECT* FROM vAnime WHERE id_Anime =" + idAnime);
                if (Anime.Read())
                {
                    Nombre = Anime[1].ToString();
                    Sinopsis = Anime[2].ToString();
                    Lanzamiento = Anime[3].ToString();
                    Temporadas = Convert.ToInt32(Anime[4].ToString());
                    Capitulos = Anime[5].ToString();
                    RutaImagen = Anime[6].ToString();
                    GeneroAnime = Anime[7].ToString();
                    OtrosGeneros = Anime[8].ToString();
                    Estado = Anime[9].ToString();
                    DatosOK = true;
                }
                else
                {
                    DatosOK = false;
                }
            }
            else
            {
                SqlDataReader AnimeUser = sql.consulta("EXEC vDetalleAnime '" + Nick + "'," + idAnime);
                if (AnimeUser.Read())
                {
                    Nombre = AnimeUser[1].ToString();
                    Sinopsis = AnimeUser[2].ToString();
                    Lanzamiento = AnimeUser[3].ToString();
                    Temporadas = Convert.ToInt32(AnimeUser[4].ToString());
                    Capitulos = AnimeUser[5].ToString();
                    RutaImagen = AnimeUser[6].ToString();
                    GeneroAnime = AnimeUser[7].ToString();
                    OtrosGeneros = AnimeUser[8].ToString();
                    Estado = AnimeUser[9].ToString();
                    Avance = AnimeUser[10].ToString();
                    DatosOK = true;
                    llenarGrilla();
                }
                else
                {
                    SqlDataReader Anime = sql.consulta("SELECT* FROM vAnime WHERE id_Anime =" + idAnime);
                    if (Anime.Read())
                    {
                        Nombre = Anime[1].ToString();
                        Sinopsis = Anime[2].ToString();
                        Lanzamiento = Anime[3].ToString();
                        Temporadas = Convert.ToInt32(Anime[4].ToString());
                        Capitulos = Anime[5].ToString();
                        RutaImagen = Anime[6].ToString();
                        GeneroAnime = Anime[7].ToString();
                        OtrosGeneros = Anime[8].ToString();
                        Estado = Anime[9].ToString();
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
                TituloA.Text = Nombre;
                DescripcionA.Text = Sinopsis;
                LanzamientoA.Text = Lanzamiento;
                if (Temporadas == 0)
                {
                    TemporadasA.Text = "N/A";
                }
                else
                {
                    TemporadasA.Text = Temporadas.ToString();
                }
                CapitulosA.Text = Capitulos.ToString();
                imagen.Src = "../img/anime/" + RutaImagen;
                GeneroA.Text = GeneroAnime;
                OGenerosA.Text = OtrosGeneros;
                EstadoA.Text = Estado;
                APersonalA.Text = Avance;
                Cover.Attributes["Style"] = "background-image: url(../img/anime/" + RutaImagen + ")";
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
        GrillaAnimeUsuario.DataSource = cdc.vDetalleAnime(Nick, Convert.ToInt32(idAnime));
        GrillaAnimeUsuario.DataBind();
    }


    protected void GrillaAnimeUsuario_RowDataBound(object sender, GridViewRowEventArgs e)
    {
        if (e.Row.RowType == DataControlRowType.DataRow && e.Row.RowIndex != GrillaAnimeUsuario.EditIndex)
        {
            (e.Row.Cells[3].Controls[2] as LinkButton).Attributes["onclick"] = "return Delete(this, event);";
        }
    }

    protected void GrillaAnimeUsuario_RowEditing(object sender, GridViewEditEventArgs e)
    {
        GrillaAnimeUsuario.EditIndex = e.NewEditIndex;
        this.llenarGrilla();
    }

    protected void GrillaAnimeUsuario_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
    {
        GrillaAnimeUsuario.EditIndex = -1;
        this.llenarGrilla();
    }

    protected void GrillaAnimeUsuario_RowUpdating(object sender, GridViewUpdateEventArgs e)
    {
        try
        {
            GridViewRow row = GrillaAnimeUsuario.Rows[e.RowIndex];
            int idAnimeUsuario = Convert.ToInt32(GrillaAnimeUsuario.DataKeys[e.RowIndex].Values[0]);
            int Avance = (row.FindControl("dd_AAnime") as DropDownList).SelectedIndex;
            String Nota = (row.FindControl("txt_nota")as TextBox).Text.Trim();

            cdc = new ConexionLQDataContext();
            Anime_Usuario au = (from a in cdc.Anime_Usuario where a.id_AnimeUsuario == idAnimeUsuario select a).FirstOrDefault();
            au.id_AvanceAnime = Avance + 1;
            au.Nota = Nota;
            cdc.SubmitChanges();
            GrillaAnimeUsuario.EditIndex = -1;
            Mensaje("Completado con exito", "Se han actualizado los datos", "success");
            this.llenarGrilla();
            this.LlenaDetalles();

        }
        catch
        {
            Mensaje("Sin juegos", "Debes ingresar datos validos", "error");
        }
    }

    protected void GrillaAnimeUsuario_RowDeleting(object sender, GridViewDeleteEventArgs e)
    {
        int IdAnimeU = Convert.ToInt32(GrillaAnimeUsuario.DataKeys[e.RowIndex].Values[0]);
        cdc = new ConexionLQDataContext();
        Anime_Usuario au = (from a in cdc.Anime_Usuario where a.id_AnimeUsuario == IdAnimeU select a).FirstOrDefault();
        cdc.Anime_Usuario.DeleteOnSubmit(au);
        cdc.SubmitChanges();
        Mensaje("Bye bye!", "Se ha eliminado el anime de tu lista", "success");
        this.LlenaDetalles();
    }

    private void Mensaje(String Tit, String Msg, String Stat)
    {
        ScriptManager.RegisterStartupScript(this, GetType(), "Popup", "Alerta('" + Tit + "','" + Msg + "','" + Stat + "');", true);
    }
}