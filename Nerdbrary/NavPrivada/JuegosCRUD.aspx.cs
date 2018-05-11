using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Text.RegularExpressions;

public partial class NavPrivada_JuegosCRUD : System.Web.UI.Page
{
    ConexionLQDataContext cdc;
    protected void Page_Load(object sender, EventArgs e)
    {
        this.Page.Form.Enctype = "multipart/form-data";
        if (!IsPostBack)
        {
            this.llenar();
            llenaEstado();
            llenaGenero();
            llenaDesarrollador();
            Clean();
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
                            cdc.Juegos.InsertOnSubmit(j);
                            cdc.SubmitChanges();
                            subir_imagen.PostedFile.SaveAs(path + NewFileName + fileExtension);
                            Mensaje("¡Felicidades!", "Se ha creado exitosamente el registro", "success");
                            Clean();
                            llenar();
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

        }
    }

    protected void GrillaJuegos_RowDataBound(object sender, GridViewRowEventArgs e)
    {
        if (e.Row.RowType == DataControlRowType.DataRow && e.Row.RowIndex != GrillaJuegos.EditIndex)
        {
            //(e.Row.Cells[9].Controls[2] as LinkButton).Attributes["onclick"] = "return Delete(this, event);";
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

    }

    protected void GrillaJuegos_RowUpdating(object sender, GridViewUpdateEventArgs e)
    {

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