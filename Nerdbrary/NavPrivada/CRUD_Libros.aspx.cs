using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Services;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Text.RegularExpressions;

public partial class NavPrivada_CRUD_Libros : System.Web.UI.Page
{
    Conexion sql = new Conexion();
    ConexionLQDataContext cdc;
    int idPendiente = 0;
    protected void Page_Load(object sender, EventArgs e)
    {
        this.Page.Form.Enctype = "multipart/form-data";
        if (!IsPostBack)
        {
            if (Request.QueryString["Redir"] != null)
            {
                Mensaje("¡Felicidades!", "Se ha creado exitosamente el desarrollaor", "success");
            }
            idPendiente = Convert.ToInt32(Request.QueryString["Id"]);
            ConfirmarPendiente();
            this.llenar();
            llenaEstado();
            llenaGenero();
            llenaDesarrollador();
        }
    }


    [WebMethod]
    public static string CrearGenero(String Genero)
    {
        string constr = "Data Source=VLADIMIR;Initial Catalog=bd_biblioteca;Persist Security Info=True;User ID=sa;Password=crislyn;MultipleActiveResultSets=True";
        using (SqlConnection con = new SqlConnection(constr))
        {
            using (SqlCommand cmd = new SqlCommand("INSERT INTO Genero_Libro VALUES(@Descripcion)"))
            {
                cmd.Parameters.AddWithValue("@Descripcion", Genero);
                cmd.Connection = con;
                con.Open();
                cmd.ExecuteNonQuery();
                con.Close();
                return Genero;
            }
        }
    }
    private void ConfirmarPendiente()
    {
        if (idPendiente.Equals("") || idPendiente.Equals(null) || idPendiente == 0)
        {
            lbl_hayPendientes.Text = "false";
        }
        else
        {
            cdc = new ConexionLQDataContext();
            SqlDataReader Pendiente = sql.consulta("SELECT * FROM Pendientes WHERE id_Pendiente = " + idPendiente);
            if (Pendiente.Read())
            {
                txt_nombreN.Text = Pendiente[1].ToString();
                txt_nombreN.Enabled = false;
                txt_nombreN.Attributes["uk-tooltip"] = "title: No puedes editar este campo";
                lbl_hayPendientes.Text = "true";
                lbl_idPendiente.Text = idPendiente.ToString();
            }
        }
    }

    private void llenar()
    {
        cdc = new ConexionLQDataContext();
        GrillaLibros.DataSource = cdc.vLibros;
        GrillaLibros.DataBind();

    }

    private void llenaEstado()
    {
        cdc = new ConexionLQDataContext();
        dd_estadoN.DataSource = cdc.Estado_Libro;
        dd_estadoN.DataTextField = "Descripcion";
        dd_estadoN.DataValueField = "id_EstadoLibro";
        dd_estadoN.DataBind();
    }

    private void llenaDesarrollador()
    {
        cdc = new ConexionLQDataContext();
        dd_autorN.DataSource = cdc.Autor;
        dd_autorN.DataTextField = "Nombre";
        dd_autorN.DataValueField = "id_Autor";
        dd_autorN.DataBind();
    }

    private void llenaGenero()
    {
        cdc = new ConexionLQDataContext();
        dd_generoN.DataSource = cdc.Genero_Libro;
        dd_generoN.DataTextField = "Descripcion";
        dd_generoN.DataValueField = "id_GeneroLibro";
        dd_generoN.DataBind();
    }

    protected void btn_crear_Click(object sender, EventArgs e)
    {
        try
        {
            if (txt_nombreN.Text.Trim().Equals("") || txt_lanzamientoN.Text == null || txt_sinopsisN.Text.Trim().Equals("") || txt_Paginas.Text.Trim().Equals(""))
            {
                Mensaje("¡No tan rápido!", "No puedes dejar campos vacíos", "warning");
            }
            else
            {
                if (IsPostBack)
                {
                    Boolean fileOK = false;
                    String NewFileName = Regex.Replace(txt_nombreN.Text.ToLower(), @"\s", "");
                    String path = Server.MapPath("~/img/games/");
                    String fileExtension = System.IO.Path.GetExtension(subir_imagen.FileName).ToLower();
                    String[] allowedExtensions = { ".jpeg", ".jpg" };
                    if (subir_imagen.HasFiles)
                    {
                        for (int i = 0; i < allowedExtensions.Length; i++)
                        {
                            if (fileExtension == allowedExtensions[i])
                            {
                                fileOK = true;
                            }
                        }
                    }
                    else
                    {
                        Mensaje("¡Alto ahí!", "Debes seleccionar una imagen", "warning");
                    }
                    if (fileOK)
                    {
                        try
                        {
                            cdc = new ConexionLQDataContext();
                            Libros l = new Libros();
                            l.Nombre = txt_nombreN.Text;
                            l.Sinopsis = txt_sinopsisN.Text;
                            l.id_Autor = dd_autorN.SelectedIndex + 1;
                            l.Lanzamiento = Convert.ToDateTime(txt_lanzamientoN.Text);
                            l.Imagen = NewFileName + fileExtension;
                            l.id_GeneroLibro = dd_generoN.SelectedIndex + 1;
                            l.Paginas = Convert.ToInt32(txt_Paginas.Text);
                            l.id_EstadoLibro = dd_estadoN.SelectedIndex + 1;
                            l.Activo = true;
                            subir_imagen.PostedFile.SaveAs(path + NewFileName + fileExtension);
                            cdc.Libros.InsertOnSubmit(l);
                            cdc.SubmitChanges();
                            Mensaje("¡Felicidades!", "Se ha creado exitosamente el registro", "success");
                            Clean();
                            llenar();
                            EliminarPendiente();
                        }
                        catch (Exception ex)
                        {
                            Mensaje("Archivo no pudo ser subido", ex.Message, "Error");
                        }
                    }
                    else
                    {
                        Mensaje("Ups", "No se aceptan archivos de este tipo", "warning");
                    }
                }
            }
        }
        catch
        {
            Mensaje("Ups", "Algo ha salido mal", "error");
        }
    }

    private void EliminarPendiente()
    {
        if (lbl_hayPendientes.Text.Equals("true"))
        {
            int ID = Convert.ToInt32(lbl_idPendiente.Text);
            cdc = new ConexionLQDataContext();
            Pendientes p = (from a in cdc.Pendientes where a.id_Pendiente == ID select a).FirstOrDefault();
            cdc.Pendientes.DeleteOnSubmit(p);
            cdc.SubmitChanges();
        }
    }
    protected void GrillaLibros_RowDataBound(object sender, GridViewRowEventArgs e)
    {

    }

    protected void GrillaLibros_RowEditing(object sender, GridViewEditEventArgs e)
    {

    }

    protected void GrillaLibros_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
    {

    }

    protected void GrillaLibros_RowDeleting(object sender, GridViewDeleteEventArgs e)
    {

    }

    protected void GrillaLibros_RowUpdating(object sender, GridViewUpdateEventArgs e)
    {

    }

    protected void GrillaLibros_RowCommand(object sender, GridViewCommandEventArgs e)
    {
        int rowIndex = Convert.ToInt32(e.CommandArgument);
        GridViewRow row = GrillaLibros.Rows[rowIndex];
        string ID = (row.FindControl("lbl_id") as Label).Text;
        int IdGrilla = Convert.ToInt32(ID);
        if (e.CommandName == "Select")
        {
            Response.Redirect("Detalles_Libros.aspx?Id=" + ID);
        }
    }

    private void Clean()
    {
        txt_nombreN.Text = "";
        txt_sinopsisN.Text = "";
        dd_autorN.SelectedIndex = 0;
        txt_Paginas.Text = "";
        dd_estadoN.SelectedIndex = 0;
        dd_generoN.SelectedIndex = 0;
    }

    private void Mensaje(String Tit, String Msg, String Stat)
    {
        ScriptManager.RegisterStartupScript(this, GetType(), "Popup", "Alerta('" + Tit + "','" + Msg + "','" + Stat + "');", true);
    }
}