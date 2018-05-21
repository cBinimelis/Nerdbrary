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
        GrillaDev.DataSource = cdc.Desarrollador;
        GrillaDev.DataBind();
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
            Response.Redirect("../NavPrivada/CRUD_Juegos.aspx?Redir=true");
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

    protected void GrillaDev_RowEditing(object sender, GridViewEditEventArgs e)
    {
        GrillaDev.EditIndex = e.NewEditIndex;
        this.Llenar();
    }

    protected void GrillaDev_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
    {
        GrillaDev.EditIndex = -1;
        this.Llenar();
    }

    protected void GrillaDev_RowUpdating(object sender, GridViewUpdateEventArgs e)
    {
        try
        {
            GridViewRow row = GrillaDev.Rows[e.RowIndex];
            int idDev = Convert.ToInt32(GrillaDev.DataKeys[e.RowIndex].Values[0]);
            String Nombre = (row.FindControl("txt_nombre") as TextBox).Text.Trim();
            if (Nombre.Equals(""))
            {
                Mensaje("¡No tan rápido!", "No puedes dejar campos vacíos", "warning");
            }
            else
            {
                cdc = new ConexionLQDataContext();
                Desarrollador d = (from a in cdc.Desarrollador where a.id_Desarrollador == idDev select a).FirstOrDefault();
                d.Nombre = Nombre;
                cdc.SubmitChanges();
                GrillaDev.EditIndex = -1;
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