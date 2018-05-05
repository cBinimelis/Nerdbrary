using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Text.RegularExpressions;

public partial class NavPrivada_AnimeCRUD : System.Web.UI.Page
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
            Clean();
        }
    }

    private void llenar()
    {
        cdc = new ConexionLQDataContext();
        GrillaAnime.DataSource = cdc.vAnime;
        GrillaAnime.DataBind();

    }

    private void llenaEstado()
    {
        cdc = new ConexionLQDataContext();
        dd_estadoN.DataSource = cdc.Estado_Serie;
        dd_estadoN.DataTextField = "Descripcion";
        dd_estadoN.DataValueField = "id_EstadoSerie";
        dd_estadoN.DataBind();
    }

    private void llenaGenero()
    {
        cdc = new ConexionLQDataContext();
        dd_generoN.DataSource = cdc.Genero_Anime;
        dd_generoN.DataTextField = "Descripcion";
        dd_generoN.DataValueField = "id_GeneroAnime";
        dd_generoN.DataBind();
    }

    protected void btn_crear_Click(object sender, EventArgs e)
    {
        try
        {
            if (txt_nombreN.Text.Trim().Equals("") || txt_sinopsisN.Text.Trim().Equals("") ||
                txt_capitulosN.Text.Trim().Equals("") || txt_temporadasN.Text.Trim().Equals("") || txt_OGenerosN.Text.Trim().Equals(""))
            {
                Mensaje("¡No tan rápido!", "No puedes dejar campos vacíos", "warning");
            }
            else
            {
                if (IsPostBack)
                {
                    Boolean fileOK = false;
                    String NewFileName = Regex.Replace(txt_nombreN.Text.ToLower(), @"\s", "");
                    String path = Server.MapPath("~/img/anime/");
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
                            Anime a = new Anime();
                            a.Nombre = txt_nombreN.Text;
                            a.Sinopsis = txt_sinopsisN.Text;
                            a.Lanzamiento = Convert.ToDateTime(txt_lanzamientoN.Text);
                            a.CapitulosTotales = Convert.ToInt32(txt_capitulosN.Text);
                            a.Temporadas = Convert.ToInt32(txt_temporadasN.Text);
                            a.Imagen = NewFileName + fileExtension;
                            a.id_GeneroAnime = (dd_generoN.SelectedIndex + 1);
                            a.Otros_Generos = txt_OGenerosN.Text;
                            a.id_EstadoSerie = (dd_estadoN.SelectedIndex + 1);
                            cdc.Anime.InsertOnSubmit(a);
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

    protected void GrillaAnime_RowDataBound(object sender, GridViewRowEventArgs e)
    {
        if (e.Row.RowType == DataControlRowType.DataRow && e.Row.RowIndex != GrillaAnime.EditIndex)
        {
            (e.Row.Cells[9].Controls[2] as LinkButton).Attributes["onclick"] = "return Delete(this, event);";
        }
    }

    protected void GrillaAnime_RowEditing(object sender, GridViewEditEventArgs e)
    {
        GrillaAnime.EditIndex = e.NewEditIndex;
        this.llenar();
    }

    protected void GrillaAnime_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
    {
        GrillaAnime.EditIndex = -1;
        this.llenar();

    }

    protected void GrillaAnime_RowDeleting(object sender, GridViewDeleteEventArgs e)
    {

    }

    protected void GrillaAnime_RowUpdating(object sender, GridViewUpdateEventArgs e)
    {

    }

    private void Clean()
    {
        txt_nombreN.Text = "";
        txt_sinopsisN.Text = "";
        txt_capitulosN.Text = "";
        txt_temporadasN.Text = "";
        txt_OGenerosN.Text = "";
        dd_estadoN.SelectedIndex = 0;
        dd_generoN.SelectedIndex = 0;
    }

    private void Mensaje(String Tit, String Msg, String Stat)
    {
        ScriptManager.RegisterStartupScript(this, GetType(), "Popup", "Alerta('" + Tit + "','" + Msg + "','" + Stat + "');", true);
    }
}