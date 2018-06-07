using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class NavPrivada_Detalles_Pelicula : System.Web.UI.Page
{
    Conexion sql = new Conexion();
    ConexionLQDataContext cdc;
    String Nick = "";
    String idPelicula = "";
    protected void Page_Load(object sender, EventArgs e)
    {
        Nick = Convert.ToString(Session["Admin"]);
        idPelicula = Request.QueryString["Id"];
        if (!IsPostBack)
        {
            LlenaDetalles();
            llenarGrilla();
        }
    }
    private void LlenaDetalles()
    {
        if (idPelicula == null || idPelicula.Equals(0))
        {
            Mensaje("Aviso", "Hubo un error al cargar la pagina", "info");
        }
        else
        {
            String Nombre = "";
            String Sinopsis = "";
            String Lanzamiento = "";
            String Duracion = "";
            String RutaImagen = "";
            String GeneroPelicula = "";
            String OGeneros = "";
            String Estado = "";
            String Avance = "";
            bool DatosOK = true;

            if (Nick == "" || Nick == null)
            {
                SqlDataReader Pelicula = sql.consulta("SELECT * FROM vPelicula WHERE id_Pelicula = " + idPelicula);
                if (Pelicula.Read())
                {
                    Nombre = Pelicula[1].ToString();
                    Sinopsis = Pelicula[2].ToString();
                    Duracion = Pelicula[3].ToString();
                    Lanzamiento = Pelicula[6].ToString();
                    RutaImagen = Pelicula[7].ToString();
                    GeneroPelicula = Pelicula[8].ToString();
                    OGeneros = Pelicula[9].ToString();
                    Estado = Pelicula[10].ToString();
                    DatosOK = true;
                }
                else
                {
                    DatosOK = false;
                }
            }
            else
            {
                SqlDataReader PeliculaUsuario = sql.consulta("EXEC vDetallePelicula '" + Nick + "'," + idPelicula);
                if (PeliculaUsuario.Read())
                {
                    Nombre = PeliculaUsuario[1].ToString();
                    Sinopsis = PeliculaUsuario[2].ToString();
                    Duracion = PeliculaUsuario[3].ToString();
                    Lanzamiento = PeliculaUsuario[6].ToString();
                    RutaImagen = PeliculaUsuario[7].ToString();
                    GeneroPelicula = PeliculaUsuario[8].ToString();
                    OGeneros = PeliculaUsuario[9].ToString();
                    Estado = PeliculaUsuario[10].ToString();
                    Avance = PeliculaUsuario[11].ToString();
                    DatosOK = true;
                    llenarGrilla();
                }
                else
                {
                    SqlDataReader Pelicula = sql.consulta("SELECT * FROM vPelicula WHERE id_Pelicula = " + idPelicula);
                    if (Pelicula.Read())
                    {
                        Nombre = Pelicula[1].ToString();
                        Sinopsis = Pelicula[2].ToString();
                        Duracion = Pelicula[3].ToString();
                        Lanzamiento = Pelicula[6].ToString();
                        RutaImagen = Pelicula[7].ToString();
                        GeneroPelicula = Pelicula[8].ToString();
                        OGeneros = Pelicula[9].ToString();
                        Estado = Pelicula[10].ToString();
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
                DescripcionP.Text = Sinopsis;
                LanzamientoP.Text = Lanzamiento;
                DuracionP.Text = Duracion;
                imagen.Src = "../img/movies/" + RutaImagen;
                GeneroP.Text = GeneroPelicula;
                EstadoP.Text = Estado;
                OGenerosP.Text = OGeneros;
                APersonalP.Text = Avance;
                Cover.Attributes["Style"] = "background-image: url(../img/movies/" + RutaImagen + ")";
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
        GrillaPeliculaUsuario.DataSource = cdc.vDetallePelicula(Nick, Convert.ToInt32(idPelicula));
        GrillaPeliculaUsuario.DataBind();
    }

    protected void GrillaPeliculaUsuario_RowDataBound(object sender, GridViewRowEventArgs e)
    {
        if (e.Row.RowType == DataControlRowType.DataRow && e.Row.RowIndex != GrillaPeliculaUsuario.EditIndex)
        {
            (e.Row.Cells[3].Controls[2] as LinkButton).Attributes["onclick"] = "return Delete(this, event);";
        }
    }

    protected void GrillaPeliculaUsuario_RowEditing(object sender, GridViewEditEventArgs e)
    {
        GrillaPeliculaUsuario.EditIndex = e.NewEditIndex;
        this.llenarGrilla();
    }

    protected void GrillaPeliculaUsuario_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
    {
        GrillaPeliculaUsuario.EditIndex = -1;
        this.llenarGrilla();
    }

    protected void GrillaPeliculaUsuario_RowUpdating(object sender, GridViewUpdateEventArgs e)
    {
        try
        {
            GridViewRow row = GrillaPeliculaUsuario.Rows[e.RowIndex];
            int idPeliculaUsuario = Convert.ToInt32(GrillaPeliculaUsuario.DataKeys[e.RowIndex].Values[0]);
            int Avance = (row.FindControl("dd_APelicula") as DropDownList).SelectedIndex;
            String Nota = (row.FindControl("txt_nota") as TextBox).Text.Trim();

            cdc = new ConexionLQDataContext();
            Pelicula_Usuario lu = (from a in cdc.Pelicula_Usuario where a.id_PeliculaUsuario == idPeliculaUsuario select a).FirstOrDefault();
            lu.id_AvancePelicula = Avance + 1;
            lu.Nota = Nota;
            cdc.SubmitChanges();
            GrillaPeliculaUsuario.EditIndex = -1;
            Mensaje("Completado con exito", "Se han actualizado los datos", "success");
            this.llenarGrilla();
            this.LlenaDetalles();

        }
        catch
        {
            Mensaje("Sin jugueteos", "Debes ingresar datos validos", "error");
        }
    }

    protected void GrillaPeliculaUsuario_RowDeleting(object sender, GridViewDeleteEventArgs e)
    {
        int idPeliculaUsuario = Convert.ToInt32(GrillaPeliculaUsuario.DataKeys[e.RowIndex].Values[0]);
        cdc = new ConexionLQDataContext();
        Pelicula_Usuario lu = (from a in cdc.Pelicula_Usuario where a.id_PeliculaUsuario == idPeliculaUsuario select a).FirstOrDefault();
        cdc.Pelicula_Usuario.DeleteOnSubmit(lu);
        cdc.SubmitChanges();
        Mensaje("Bye bye!", "Se ha eliminado el Pelicula de tu lista", "success");
        GrillaPeliculaUsuario.Visible = false;
        APersonalL.Visible = false;
    }

    private void Mensaje(String Tit, String Msg, String Stat)
    {
        ScriptManager.RegisterStartupScript(this, GetType(), "Popup", "Alerta('" + Tit + "','" + Msg + "','" + Stat + "');", true);
    }
}