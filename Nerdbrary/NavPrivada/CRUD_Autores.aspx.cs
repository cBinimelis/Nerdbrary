using System;
using System.Collections.Generic;
using System.Linq;
using System.Text.RegularExpressions;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class NavPrivada_CRUD_Autores : System.Web.UI.Page
{
    ConexionLQDataContext cdc;
    int redirect = 0;
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!this.IsPostBack)
        {
            redirect = Convert.ToInt32(Request.QueryString["Redir"]);
            comprobarOrigen();
            Llenar();
        }
    }

    private void Llenar()
    {
        cdc = new ConexionLQDataContext();
        GrillaAut.DataSource = cdc.Autor;
        GrillaAut.DataBind();
    }

    private void comprobarOrigen()
    {
        if (redirect.Equals("") || redirect.Equals(null) || redirect == 0)
        {
            lbl_redirect.Text = "false";
        }
        else
        {
            lbl_redirect.Text = "true";
        }
    }

    private void Volver()
    {
        if (lbl_redirect.Text.Equals("true"))
        {
            Response.Redirect("../NavPrivada/CRUD_Libros.aspx?Redir=true");
        }
    }

    private void Clean()
    {
        txt_nombreN.Text = "";
        txt_sinopsisN.Text = "";
    }

    protected void btn_crear_Click(object sender, EventArgs e)
    {
        try
        {
            if (txt_nombreN.Text.Trim().Equals("") || txt_sinopsisN.Text.Trim().Equals(""))
            {
                Mensaje("¡No tan rápido!", "No puedes dejar campos vacíos", "warning");
            }
            else
            {
                if (IsPostBack)
                {
                    Boolean fileOK = false;
                    String NewFileName = Regex.Replace(txt_nombreN.Text.ToLower(), @"\s", "");
                    String path = Server.MapPath("~/img/books/author/");
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
                            Autor a = new Autor();
                            a.Nombre = txt_nombreN.Text;
                            a.Detalles = txt_sinopsisN.Text;
                            a.Imagen = NewFileName + fileExtension;
                            subir_imagen.PostedFile.SaveAs(path + NewFileName + fileExtension);
                            cdc.Autor.InsertOnSubmit(a);
                            cdc.SubmitChanges();
                            Mensaje("¡Felicidades!", "Se ha creado exitosamente el registro", "success");
                            Volver();
                            Clean();
                            Llenar();
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

    protected void GrillaAut_RowCommand(object sender, GridViewCommandEventArgs e)
    {
        int rowIndex = Convert.ToInt32(e.CommandArgument);
        GridViewRow row = GrillaAut.Rows[rowIndex];
        string ID = (row.FindControl("lbl_id") as Label).Text;
        int IdGrilla = Convert.ToInt32(ID);
        if (e.CommandName == "Select")
        {
            Response.Redirect("Autor.aspx?Id=" + ID);
        }
    }

    protected void GrillaAut_RowEditing(object sender, GridViewEditEventArgs e)
    {
        GrillaAut.EditIndex = e.NewEditIndex;
        this.Llenar();
    }

    protected void GrillaAut_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
    {
        GrillaAut.EditIndex = -1;
        this.Llenar();
    }

    protected void GrillaAut_RowUpdating(object sender, GridViewUpdateEventArgs e)
    {
        try
        {
            GridViewRow row = GrillaAut.Rows[e.RowIndex];
            int idAut = Convert.ToInt32(GrillaAut.DataKeys[e.RowIndex].Values[0]);
            String Nombre = (row.FindControl("txt_nombre") as TextBox).Text.Trim();
            if (Nombre.Equals(""))
            {
                Mensaje("¡No tan rápido!", "No puedes dejar campos vacíos", "warning");
            }
            else
            {
                cdc = new ConexionLQDataContext();
                Autor au = (from a in cdc.Autor where a.id_Autor == idAut select a).FirstOrDefault();
                au.Nombre = Nombre;
                cdc.SubmitChanges();
                GrillaAut.EditIndex = -1;
                Mensaje("Completado con exito", "Se han actualizado los datos", "success");
                this.Llenar();
            }
        }
        catch
        {
            Mensaje("¡Sin prisas!", "Debes ingresar datos validos", "error");
        }
    }

    private void Mensaje(String Tit, String Msg, String Stat)
    {
        ScriptManager.RegisterStartupScript(this, GetType(), "Popup", "Alerta('" + Tit + "','" + Msg + "','" + Stat + "');", true);
    }
}