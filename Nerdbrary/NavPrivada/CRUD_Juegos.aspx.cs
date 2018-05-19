using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Text.RegularExpressions;
using System.Data.SqlClient;

public partial class NavPrivada_JuegosCRUD : System.Web.UI.Page
{
    Conexion sql = new Conexion();
    ConexionLQDataContext cdc;
    int idPendiente = 0;
    protected void Page_Load(object sender, EventArgs e)
    {
        this.Page.Form.Enctype = "multipart/form-data";
        if (!IsPostBack)
        {
            idPendiente = Convert.ToInt32(Request.QueryString["Id"]);
            ConfirmarPendiente();
            this.llenar();
            llenaEstado();
            llenaGenero();
            llenaDesarrollador();
            Clean();
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
        GrillaJuegos.DataSource = cdc.vJuegos.OrderBy(X => X.Nombre);
        GrillaJuegos.DataBind();

    }

    private void llenaEstado()
    {
        cdc = new ConexionLQDataContext();
        dd_estadoN.DataSource = cdc.Estado_Juegos;
        dd_estadoN.DataTextField = "Descripcion";
        dd_estadoN.DataValueField = "id_EstadoJuegos";
        dd_estadoN.DataBind();
    }

    private void llenaDesarrollador()
    {
        cdc = new ConexionLQDataContext();
        dd_desarrolladorN.DataSource = cdc.Desarrollador;
        dd_desarrolladorN.DataTextField = "Nombre";
        dd_desarrolladorN.DataValueField = "id_Desarrollador";
        dd_desarrolladorN.DataBind();
    }

    private void llenaGenero()
    {
        cdc = new ConexionLQDataContext();
        dd_generoN.DataSource = cdc.Genero_Juegos;
        dd_generoN.DataTextField = "Descripcion";
        dd_generoN.DataValueField = "id_GeneroJuego";
        dd_generoN.DataBind();
    }

    protected void btn_crear_Click(object sender, EventArgs e)
    {
        try
        {
            if (txt_nombreN.Text.Trim().Equals("") || txt_lanzamientoN.Text == null || txt_sinopsisN.Text.Trim().Equals("") || txt_OGenerosN.Text.Trim().Equals(""))
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
                            Juegos j = new Juegos();
                            j.Nombre = txt_nombreN.Text;
                            j.Sinopsis = txt_sinopsisN.Text;
                            j.id_Desarrollador = dd_desarrolladorN.SelectedIndex + 1;
                            j.Lanzamiento = Convert.ToDateTime(txt_lanzamientoN.Text);
                            j.Imagen = NewFileName + fileExtension;
                            j.id_GeneroJuego = (dd_generoN.SelectedIndex + 1);
                            j.Otros_Generos = txt_OGenerosN.Text;
                            j.id_EstadoJuego = (dd_estadoN.SelectedIndex + 1);
                            j.Activo = true;
                            subir_imagen.PostedFile.SaveAs(path + NewFileName + fileExtension);
                            cdc.Juegos.InsertOnSubmit(j);
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

    protected void GrillaJuegos_RowDataBound(object sender, GridViewRowEventArgs e)
    {
        if (e.Row.RowType == DataControlRowType.DataRow && e.Row.RowIndex != GrillaJuegos.EditIndex)
        {
            (e.Row.Cells[8].Controls[2] as LinkButton).Attributes["onclick"] = "return Delete(this, event);";
        }
    }

    protected void GrillaJuegos_RowEditing(object sender, GridViewEditEventArgs e)
    {
        GrillaJuegos.EditIndex = e.NewEditIndex;
        this.llenar();
    }

    protected void GrillaJuegos_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
    {
        GrillaJuegos.EditIndex = -1;
        this.llenar();
    }

    protected void GrillaJuegos_RowDeleting(object sender, GridViewDeleteEventArgs e)
    {
        GridViewRow row = GrillaJuegos.Rows[e.RowIndex];
        int idJuego = Convert.ToInt32(GrillaJuegos.DataKeys[e.RowIndex].Values[0]);
        cdc = new ConexionLQDataContext();
        Juegos j = (from a in cdc.Juegos where a.id_Juego == idJuego select a).FirstOrDefault();
        j.Activo = false;
        cdc.SubmitChanges();
        GrillaJuegos.EditIndex = -1;
        Mensaje("Eliminado con exito", "Se han eliminado los datos", "success");
        this.llenar();
    }

    protected void GrillaJuegos_RowUpdating(object sender, GridViewUpdateEventArgs e)
    {
        try
        {
            GridViewRow row = GrillaJuegos.Rows[e.RowIndex];
            int idJuego = Convert.ToInt32(GrillaJuegos.DataKeys[e.RowIndex].Values[0]);
            String Nombre = (row.FindControl("txt_nombre") as TextBox).Text.Trim();
            String Lanzamiento = (row.FindControl("txt_lanzamiento") as TextBox).Text.Trim();
            int Desarrollador = (row.FindControl("dd_dev") as DropDownList).SelectedIndex;
            int Estado = (row.FindControl("dd_estado") as DropDownList).SelectedIndex;
            int Genero = (row.FindControl("dd_genero") as DropDownList).SelectedIndex;
            String OG = (row.FindControl("txt_OGeneros") as TextBox).Text.Trim();
            if (Nombre.Equals("") || Lanzamiento.Equals("") || OG.Equals("") || Lanzamiento == null)
            {
                Mensaje("¡No tan rápido!", "No puedes dejar campos vacíos", "warning");
            }
            else
            {
                cdc = new ConexionLQDataContext();
                Juegos j = (from a in cdc.Juegos where a.id_Juego == idJuego select a).FirstOrDefault();
                j.Nombre = Nombre;
                j.Lanzamiento = Convert.ToDateTime(Lanzamiento);
                j.id_Desarrollador = Desarrollador + 1;
                j.id_EstadoJuego = Estado + 1;
                j.id_GeneroJuego = Genero + 1;
                j.Otros_Generos = OG;
                cdc.SubmitChanges();
                GrillaJuegos.EditIndex = -1;
                Mensaje("Completado con exito", "Se han actualizado los datos", "success");
                this.llenar();
            }
        }
        catch
        {
            Mensaje("¡Sin prisas!", "Debes ingresar datos validos", "error");
        }
    }

    private void Clean()
    {
        txt_nombreN.Text = "";
        txt_sinopsisN.Text = "";
        dd_desarrolladorN.SelectedIndex = 0;
        txt_OGenerosN.Text = "";
        dd_estadoN.SelectedIndex = 0;
        dd_generoN.SelectedIndex = 0;
    }

    private void Mensaje(String Tit, String Msg, String Stat)
    {
        ScriptManager.RegisterStartupScript(this, GetType(), "Popup", "Alerta('" + Tit + "','" + Msg + "','" + Stat + "');", true);
    }

}