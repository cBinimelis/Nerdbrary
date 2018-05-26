using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;

public partial class NavPrivada_Detalles_Libros : System.Web.UI.Page
{
    Conexion sql = new Conexion();
    ConexionLQDataContext cdc;
    String Nick = "";
    String idLibro = "";
    int idDesarrollador = 0;
    protected void Page_Load(object sender, EventArgs e)
    {
        Nick = Convert.ToString(Session["Admin"]);
        idLibro = Request.QueryString["Id"];
        if (!IsPostBack)
        {
            LlenaDetalles();
            llenarGrilla();
        }
    }
    private void LlenaDetalles()
    {
        if (idLibro == null || idLibro.Equals(0))
        {
            Mensaje("Aviso", "Hubo un error al cargar la pagina", "info");
        }
        else
        {
            String Nombre = "";
            String Sinopsis = "";
            String Autor = "";
            String Lanzamiento = "";
            String RutaImagen = "";
            String GeneroLibro = "";
            String Paginas = "";
            String OGeneros = "";
            String Estado = "";
            String Avance = "";
            bool DatosOK = true;

            if (Nick == "" || Nick == null)
            {
                SqlDataReader Libro = sql.consulta("SELECT * FROM vLibros WHERE id_Libro = " + idLibro);
                if (Libro.Read())
                {
                    Nombre = Libro[1].ToString();
                    Sinopsis = Libro[2].ToString();
                    Paginas = Libro[3].ToString();
                    lnk_autor.Attributes["href"] = "Autor.aspx?Id=" + Libro[4].ToString();
                    Autor = Libro[5].ToString();
                    Lanzamiento = Libro[6].ToString();
                    RutaImagen = Libro[7].ToString();
                    GeneroLibro = Libro[8].ToString();
                    OGeneros = Libro[9].ToString();
                    Estado = Libro[10].ToString();
                    DatosOK = true;
                }
                else
                {
                    DatosOK = false;
                }
            }
            else
            {
                SqlDataReader LibroUsuario = sql.consulta("EXEC vDetalleLibro '" + Nick + "'," + idLibro);
                if (LibroUsuario.Read())
                {
                    Nombre = LibroUsuario[1].ToString();
                    Sinopsis = LibroUsuario[2].ToString();
                    Paginas = LibroUsuario[3].ToString();
                    lnk_autor.Attributes["href"] = "Autor.aspx?Id=" + LibroUsuario[4].ToString();
                    Autor = LibroUsuario[5].ToString();
                    Lanzamiento = LibroUsuario[6].ToString();
                    RutaImagen = LibroUsuario[7].ToString();
                    GeneroLibro = LibroUsuario[8].ToString();
                    OGeneros = LibroUsuario[9].ToString();
                    Estado = LibroUsuario[10].ToString();
                    Avance = LibroUsuario[11].ToString();
                    DatosOK = true;
                    llenarGrilla();
                }
                else
                {
                    SqlDataReader Libro = sql.consulta("SELECT * FROM vLibros WHERE id_Libro = " + idLibro);
                    if (Libro.Read())
                    {
                        Nombre = Libro[1].ToString();
                        Sinopsis = Libro[2].ToString();
                        Paginas = Libro[3].ToString();
                        lnk_autor.Attributes["href"] = "Autor.aspx?Id=" + Libro[4].ToString();
                        Autor = Libro[5].ToString();
                        Lanzamiento = Libro[6].ToString();
                        RutaImagen = Libro[7].ToString();
                        GeneroLibro = Libro[8].ToString();
                        OGeneros = Libro[9].ToString();
                        Estado = Libro[10].ToString();
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
                DescripcionL.Text = Sinopsis;
                LanzamientoL.Text = Lanzamiento;
                AutorL.Text = Autor;
                imagen.Src = "../img/books/" + RutaImagen;
                GeneroL.Text = GeneroLibro;
                PaginasL.Text = Paginas;
                EstadoL.Text = Estado;
                OGenerosL.Text = OGeneros;
                APersonalL.Text = Avance;
                Cover.Attributes["Style"] = "background-image: url(../img/books/" + RutaImagen + ")";
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
        GrillaLibrosUsuario.DataSource = cdc.vDetalleJuego(Nick, Convert.ToInt32(idLibro));
        GrillaLibrosUsuario.DataBind();
    }

    protected void GrillaLibrosUsuario_RowDataBound(object sender, GridViewRowEventArgs e)
    {
        if (e.Row.RowType == DataControlRowType.DataRow && e.Row.RowIndex != GrillaLibrosUsuario.EditIndex)
        {
            (e.Row.Cells[3].Controls[2] as LinkButton).Attributes["onclick"] = "return Delete(this, event);";
        }
    }

    protected void GrillaLibrosUsuario_RowEditing(object sender, GridViewEditEventArgs e)
    {
        GrillaLibrosUsuario.EditIndex = e.NewEditIndex;
        this.llenarGrilla();
    }

    protected void GrillaLibrosUsuario_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
    {
        GrillaLibrosUsuario.EditIndex = -1;
        this.llenarGrilla();
    }

    protected void GrillaLibrosUsuario_RowUpdating(object sender, GridViewUpdateEventArgs e)
    {
        try
        {
            GridViewRow row = GrillaLibrosUsuario.Rows[e.RowIndex];
            int idJuegoUsuario = Convert.ToInt32(GrillaLibrosUsuario.DataKeys[e.RowIndex].Values[0]);
            int Avance = (row.FindControl("dd_AJuego") as DropDownList).SelectedIndex;
            String Nota = (row.FindControl("txt_nota") as TextBox).Text.Trim();

            cdc = new ConexionLQDataContext();
            Juegos_Usuario ju = (from a in cdc.Juegos_Usuario where a.id_JuegoUsuario == idJuegoUsuario select a).FirstOrDefault();
            ju.id_AvanceJuego = Avance + 1;
            ju.Nota = Nota;
            cdc.SubmitChanges();
            GrillaLibrosUsuario.EditIndex = -1;
            Mensaje("Completado con exito", "Se han actualizado los datos", "success");
            this.llenarGrilla();
            this.LlenaDetalles();

        }
        catch
        {
            Mensaje("Sin juegos", "Debes ingresar datos validos", "error");
        }
    }

    protected void GrillaLibrosUsuario_RowDeleting(object sender, GridViewDeleteEventArgs e)
    {
        int idJuegoUsuario = Convert.ToInt32(GrillaLibrosUsuario.DataKeys[e.RowIndex].Values[0]);
        cdc = new ConexionLQDataContext();
        Juegos_Usuario ju = (from a in cdc.Juegos_Usuario where a.id_JuegoUsuario == idJuegoUsuario select a).FirstOrDefault();
        cdc.Juegos_Usuario.DeleteOnSubmit(ju);
        cdc.SubmitChanges();
        Mensaje("Bye bye!", "Se ha eliminado el juego de tu lista", "success");
        this.LlenaDetalles();
    }

    private void Mensaje(String Tit, String Msg, String Stat)
    {
        ScriptManager.RegisterStartupScript(this, GetType(), "Popup", "Alerta('" + Tit + "','" + Msg + "','" + Stat + "');", true);
    }
}