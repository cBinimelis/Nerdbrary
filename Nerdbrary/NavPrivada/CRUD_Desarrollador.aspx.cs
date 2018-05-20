using System;
using System.Collections.Generic;
using System.Linq;
using System.Text.RegularExpressions;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class NavPrivada_CRUD_Desarrollador : System.Web.UI.Page
{
    ConexionLQDataContext cdc;
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!this.IsPostBack)
        {
            Llenar();
        }
    }

    private void Llenar()
    {
        cdc = new ConexionLQDataContext();
        GrillaDev.DataSource = cdc.Desarrollador;
        GrillaDev.DataBind();
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
                    String path = Server.MapPath("~/img/games/developer/");
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
                            Desarrollador d = new Desarrollador();
                            d.Nombre = txt_nombreN.Text;
                            d.Detalles = txt_sinopsisN.Text;
                            d.Imagen = NewFileName + fileExtension;
                            subir_imagen.PostedFile.SaveAs(path + NewFileName + fileExtension);
                            cdc.Desarrollador.InsertOnSubmit(d);
                            cdc.SubmitChanges();
                            Mensaje("¡Felicidades!", "Se ha creado exitosamente el registro", "success");
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

    protected void GrillaDev_RowCommand(object sender, GridViewCommandEventArgs e)
    {
        int rowIndex = Convert.ToInt32(e.CommandArgument);
        GridViewRow row = GrillaDev.Rows[rowIndex];
        string ID = (row.FindControl("lbl_id") as Label).Text;
        int IdGrilla = Convert.ToInt32(ID);
        if (e.CommandName == "Select")
        {
            Response.Redirect("Desarrollador.aspx?Id=" + ID);
        }
    }

    protected void GrillaDev_RowDataBound(object sender, GridViewRowEventArgs e)
    {

    }

    protected void GrillaDev_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
    {

    }

    protected void GrillaDev_RowEditing(object sender, GridViewEditEventArgs e)
    {

    }

    protected void GrillaDev_RowDeleting(object sender, GridViewDeleteEventArgs e)
    {

    }

    protected void GrillaDev_RowUpdating(object sender, GridViewUpdateEventArgs e)
    {

    }

    private void Mensaje(String Tit, String Msg, String Stat)
    {
        ScriptManager.RegisterStartupScript(this, GetType(), "Popup", "Alerta('" + Tit + "','" + Msg + "','" + Stat + "');", true);
    }
}