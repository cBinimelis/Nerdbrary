using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;

public partial class NavPrivada_MangaDetalles : System.Web.UI.Page
{
    Conexion sql = new Conexion();
    ConexionLQDataContext cdc;
    String Nick = "";
    String idManga = "";
    protected void Page_Load(object sender, EventArgs e)
    {
        Nick = Convert.ToString(Session["Admin"]);
        idManga = Request.QueryString["Id"];
        if (!IsPostBack)
        {
            LlenaDetalles();
            llenarGrilla();
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
            String Tomos = "";
            String Lanzamiento = "";
            String RutaImagen = "";
            String GeneroManga = "";
            String OtrosGeneros = "";
            String Estado = "";
            String Avance = "";
            bool DatosOK = true;

            if (Nick == "" || Nick == null)
            {
                SqlDataReader Manga = sql.consulta("SELECT* FROM vManga WHERE id_Manga =" + idManga);
                if (Manga.Read())
                {
                    Nombre = Manga[1].ToString();
                    Sinopsis = Manga[2].ToString();
                    Tomos = Manga[3].ToString();
                    Lanzamiento = Manga[4].ToString();
                    RutaImagen = Manga[5].ToString();
                    GeneroManga = Manga[6].ToString();
                    OtrosGeneros = Manga[7].ToString();
                    Estado = Manga[8].ToString();
                    DatosOK = true;
                }
                else
                {
                    DatosOK = false;
                }
            }
            else
            {
                SqlDataReader MangaUser = sql.consulta("EXEC vDetalleManga '" + Nick + "'," + idManga);
                if (MangaUser.Read())
                {
                    Nombre = MangaUser[1].ToString();
                    Sinopsis = MangaUser[2].ToString();
                    Tomos = MangaUser[3].ToString();
                    Lanzamiento = MangaUser[4].ToString();
                    RutaImagen = MangaUser[5].ToString();
                    GeneroManga = MangaUser[6].ToString();
                    OtrosGeneros = MangaUser[7].ToString();
                    Estado = MangaUser[8].ToString();
                    Avance = MangaUser[9].ToString();
                    DatosOK = true;
                    llenarGrilla();
                }
                else
                {
                    SqlDataReader Manga = sql.consulta("SELECT* FROM vManga WHERE id_Manga =" + idManga);
                    if (Manga.Read())
                    {
                        Nombre = Manga[1].ToString();
                        Sinopsis = Manga[2].ToString();
                        Tomos = Manga[3].ToString();
                        Lanzamiento = Manga[4].ToString();
                        RutaImagen = Manga[5].ToString();
                        GeneroManga = Manga[6].ToString();
                        OtrosGeneros = Manga[7].ToString();
                        Estado = Manga[8].ToString();
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
                DescripcionM.Text = Sinopsis;
                LanzamientoM.Text = Lanzamiento;
                TomosM.Text = Tomos.ToString();
                imagen.Src = "../img/manga/" + RutaImagen;
                GeneroM.Text = GeneroManga;
                OGenerosM.Text = OtrosGeneros;
                EstadoM.Text = Estado;
                APersonalM.Text = Avance;
                Cover.Attributes["Style"] = "background-image: url(../img/manga/" + RutaImagen + ")";
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
        GrillaMangaUsuario.DataSource = cdc.vDetalleManga(Nick, Convert.ToInt32(idManga));
        GrillaMangaUsuario.DataBind();
    }


    protected void GrillaMangaUsuario_RowDataBound(object sender, GridViewRowEventArgs e)
    {
        if (e.Row.RowType == DataControlRowType.DataRow && e.Row.RowIndex != GrillaMangaUsuario.EditIndex)
        {
            (e.Row.Cells[3].Controls[2] as LinkButton).Attributes["onclick"] = "return Delete(this, event);";
        }
    }

    protected void GrillaMangaUsuario_RowEditing(object sender, GridViewEditEventArgs e)
    {
        GrillaMangaUsuario.EditIndex = e.NewEditIndex;
        this.llenarGrilla();
    }

    protected void GrillaMangaUsuario_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
    {
        GrillaMangaUsuario.EditIndex = -1;
        this.llenarGrilla();
    }

    protected void GrillaMangaUsuario_RowUpdating(object sender, GridViewUpdateEventArgs e)
    {
        try
        {
            GridViewRow row = GrillaMangaUsuario.Rows[e.RowIndex];
            int idMangaUsuario = Convert.ToInt32(GrillaMangaUsuario.DataKeys[e.RowIndex].Values[0]);
            int Avance = (row.FindControl("dd_AManga") as DropDownList).SelectedIndex;
            String Nota = (row.FindControl("txt_nota") as TextBox).Text.Trim();

            cdc = new ConexionLQDataContext();
            Manga_Usuario mu = (from a in cdc.Manga_Usuario where a.id_MangaUsuario == idMangaUsuario select a).FirstOrDefault();
            mu.id_AvanceManga = Avance + 1;
            mu.Nota = Nota;
            cdc.SubmitChanges();
            GrillaMangaUsuario.EditIndex = -1;
            Mensaje("Completado con exito", "Se han actualizado los datos", "success");
            this.llenarGrilla();
            this.LlenaDetalles();

        }
        catch
        {
            Mensaje("Sin juegos", "Debes ingresar datos validos", "error");
        }
    }

    protected void GrillaMangaUsuario_RowDeleting(object sender, GridViewDeleteEventArgs e)
    {
        int IdMangaU = Convert.ToInt32(GrillaMangaUsuario.DataKeys[e.RowIndex].Values[0]);
        cdc = new ConexionLQDataContext();
        Manga_Usuario mu = (from a in cdc.Manga_Usuario where a.id_MangaUsuario == IdMangaU select a).FirstOrDefault();
        cdc.Manga_Usuario.DeleteOnSubmit(mu);
        cdc.SubmitChanges();
        Mensaje("Bye bye!", "Se ha eliminado el manga de tu lista", "success");
        this.LlenaDetalles();
    }

    private void Mensaje(String Tit, String Msg, String Stat)
    {
        ScriptManager.RegisterStartupScript(this, GetType(), "Popup", "Alerta('" + Tit + "','" + Msg + "','" + Stat + "');", true);
    }
}