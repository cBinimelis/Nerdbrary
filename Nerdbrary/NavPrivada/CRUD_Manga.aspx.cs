using System;
using System.Collections.Generic;
using System.Linq;
using System.Text.RegularExpressions;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class NavPrivada_MangaCRUD : System.Web.UI.Page
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
        }
    }

    private void llenar()
    {
        cdc = new ConexionLQDataContext();
        GrillaMangas.DataSource = cdc.vManga.OrderBy(X => X.Nombre);
        GrillaMangas.DataBind();

    }

    private void llenaEstado()
    {
        cdc = new ConexionLQDataContext();
        dd_estadoN.DataSource = cdc.Estado_Manga;
        dd_estadoN.DataTextField = "Descripcion";
        dd_estadoN.DataValueField = "id_EstadoManga";
        dd_estadoN.DataBind();
    }
    

    private void llenaGenero()
    {
        cdc = new ConexionLQDataContext();
        dd_generoN.DataSource = cdc.Genero_Mangas;
        dd_generoN.DataTextField = "Descripcion";
        dd_generoN.DataValueField = "id_GeneroManga";
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
                    String path = Server.MapPath("~/img/manga/");
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
                            Manga m = new Manga();
                            m.Nombre = txt_nombreN.Text;
                            m.Sinopsis = txt_sinopsisN.Text;
                            m.Tomos = Convert.ToInt32(txt_Tomos.Text);
                            m.Lanzamiento = Convert.ToDateTime(txt_lanzamientoN.Text);
                            m.Imagen = NewFileName + fileExtension;
                            m.id_GeneroManga = (dd_generoN.SelectedIndex + 1);
                            m.Otros_Generos = txt_OGenerosN.Text;
                            m.id_EstadoManga = (dd_estadoN.SelectedIndex + 1);
                            m.Activo = true;
                            subir_imagen.PostedFile.SaveAs(path + NewFileName + fileExtension);
                            cdc.Manga.InsertOnSubmit(m);
                            cdc.SubmitChanges();
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
            Mensaje("Ups", "Algo ha salido mal", "error");
        }
    }

    protected void GrillaMangas_RowDataBound(object sender, GridViewRowEventArgs e)
    {
        if (e.Row.RowType == DataControlRowType.DataRow && e.Row.RowIndex != GrillaMangas.EditIndex)
        {
            (e.Row.Cells[8].Controls[2] as LinkButton).Attributes["onclick"] = "return Delete(this, event);";
        }
    }

    protected void GrillaMangas_RowEditing(object sender, GridViewEditEventArgs e)
    {
        GrillaMangas.EditIndex = e.NewEditIndex;
        this.llenar();
    }

    protected void GrillaMangas_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
    {
        GrillaMangas.EditIndex = -1;
        this.llenar();
    }

    protected void GrillaMangas_RowDeleting(object sender, GridViewDeleteEventArgs e)
    {
        GridViewRow row = GrillaMangas.Rows[e.RowIndex];
        int idManga = Convert.ToInt32(GrillaMangas.DataKeys[e.RowIndex].Values[0]);
        cdc = new ConexionLQDataContext();
        Manga m = (from a in cdc.Manga where a.id_Manga == idManga select a).FirstOrDefault();
        m.Activo = false;
        cdc.SubmitChanges();
        GrillaMangas.EditIndex = -1;
        Mensaje("Eliminado con exito", "Se han eliminado los datos", "success");
        this.llenar();
    }

    protected void GrillaMangas_RowUpdating(object sender, GridViewUpdateEventArgs e)
    {
        try
        {
            GridViewRow row = GrillaMangas.Rows[e.RowIndex];
            int idManga = Convert.ToInt32(GrillaMangas.DataKeys[e.RowIndex].Values[0]);
            String Nombre = (row.FindControl("txt_nombre") as TextBox).Text.Trim();
            String Lanzamiento = (row.FindControl("txt_lanzamiento") as TextBox).Text.Trim();
            String Tomos = (row.FindControl("dd_dev") as TextBox).Text.Trim();
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
                Manga m = (from a in cdc.Manga where a.id_Manga == idManga select a).FirstOrDefault();
                m.Nombre = Nombre;
                m.Lanzamiento = Convert.ToDateTime(Lanzamiento);
                m.Tomos = Convert.ToInt32(Tomos);
                m.id_EstadoManga = Estado + 1;
                m.id_GeneroManga = Genero + 1;
                m.Otros_Generos = OG;
                cdc.SubmitChanges();
                GrillaMangas.EditIndex = -1;
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
        txt_Tomos.Text = "";
        txt_OGenerosN.Text = "";
        dd_estadoN.SelectedIndex = 0;
        dd_generoN.SelectedIndex = 0;
    }

    private void Mensaje(String Tit, String Msg, String Stat)
    {
        ScriptManager.RegisterStartupScript(this, GetType(), "Popup", "Alerta('" + Tit + "','" + Msg + "','" + Stat + "');", true);
    }
}