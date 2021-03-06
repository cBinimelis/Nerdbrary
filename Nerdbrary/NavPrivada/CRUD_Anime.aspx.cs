﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Text.RegularExpressions;
using System.Web.Services;

public partial class NavPrivada_AnimeCRUD : System.Web.UI.Page
{
    Conexion sql = new Conexion();
    ConexionLQDataContext cdc;
    static int idPendiente = 0;
    bool Exist = false;
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
        GrillaAnime.DataSource = cdc.vAnime.OrderBy(X => X.Nombre);
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
            if (txt_nombreN.Text.Trim().Equals("") || txt_sinopsisN.Text.Trim().Equals("") || txt_lanzamientoN.Text == null ||
                txt_capitulosN.Text.Trim().Equals("") || txt_temporadasN.Text.Trim().Equals("") || txt_OGenerosN.Text.Trim().Equals(""))
            {
                Mensaje("¡No tan rápido!", "No puedes dejar campos vacíos", "warning");
            }
            else
            {
                Comprobar();
                if (Exist)
                {
                    Mensaje("Tenemos un problema", "Este Anime ya existe en el sistema", "error");
                }
                else
                {
                    if (IsPostBack)
                    {
                        Boolean fileOK = false;
                        String NewFileName = Regex.Replace(txt_nombreN.Text.ToLower(), @"[^0-9a-zA-Z_]+", "");
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
                                a.Activo = true;
                                EliminarPendiente();
                                subir_imagen.PostedFile.SaveAs(path + NewFileName + fileExtension);
                                cdc.Anime.InsertOnSubmit(a);
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
        }
        catch
        {
            Mensaje("Ups", "Algo ha salido mal", "warning");
        }
    }


    private void Comprobar()
    {
        SqlDataReader Comp = sql.consulta("SELECT * FROM Anime WHERE Nombre = '" + txt_nombreN.Text + "'");
        if (Comp.Read())
        {
            Exist = true;
        }
    }

    protected void GrillaAnime_RowCommand(object sender, GridViewCommandEventArgs e)
    {
        int rowIndex = Convert.ToInt32(e.CommandArgument);
        GridViewRow row = GrillaAnime.Rows[rowIndex];
        string ID = (row.FindControl("lbl_id") as Label).Text;
        int IdGrilla = Convert.ToInt32(ID);
        if (e.CommandName == "Select")
        {
            Response.Redirect("Detalles_Anime.aspx?Id=" + ID);
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

    protected void GrillaAnime_RowDataBound(object sender, GridViewRowEventArgs e)
    {
        if (e.Row.RowType == DataControlRowType.DataRow && e.Row.RowIndex != GrillaAnime.EditIndex)
        {
            (e.Row.Cells[8].Controls[2] as LinkButton).Attributes["onclick"] = "return Delete(this, event);";
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
        GridViewRow row = GrillaAnime.Rows[e.RowIndex];
        int idAnime = Convert.ToInt32(GrillaAnime.DataKeys[e.RowIndex].Values[0]);
        cdc = new ConexionLQDataContext();
        Anime aup = (from a in cdc.Anime where a.id_Anime == idAnime select a).FirstOrDefault();
        aup.Activo = false;
        cdc.SubmitChanges();
        GrillaAnime.EditIndex = -1;
        Mensaje("Eliminado con exito", "Se han eliminado los datos", "success");
        this.llenar();
    }

    protected void GrillaAnime_RowUpdating(object sender, GridViewUpdateEventArgs e)
    {
        try
        {
            GridViewRow row = GrillaAnime.Rows[e.RowIndex];
            int idAnime = Convert.ToInt32(GrillaAnime.DataKeys[e.RowIndex].Values[0]);
            String Nombre = (row.FindControl("txt_nombre") as TextBox).Text.Trim();
            String Caps = (row.FindControl("txt_capitulos") as TextBox).Text.Trim();
            String Temps = (row.FindControl("txt_temporadas") as TextBox).Text.Trim();
            String Lanzamiento = (row.FindControl("txt_lanzamiento") as TextBox).Text.Trim();
            int Estado = (row.FindControl("dd_estado") as DropDownList).SelectedIndex;
            int Genero = (row.FindControl("dd_genero") as DropDownList).SelectedIndex;
            String OG = (row.FindControl("txt_OGeneros") as TextBox).Text.Trim();
            if (Nombre.Equals("") || Caps.Equals("") || Temps.Equals("") || Lanzamiento.Equals("") || OG.Equals("") || Lanzamiento == null)
            {
                Mensaje("¡No tan rápido!", "No puedes dejar campos vacíos", "warning");
            }
            else
            {
                cdc = new ConexionLQDataContext();
                Anime aup = (from a in cdc.Anime where a.id_Anime == idAnime select a).FirstOrDefault();
                aup.Nombre = Nombre;
                aup.CapitulosTotales = Convert.ToInt32(Caps);
                aup.Temporadas = Convert.ToInt32(Temps);
                aup.Lanzamiento = Convert.ToDateTime(Lanzamiento);
                aup.id_EstadoSerie = Estado + 1;
                aup.id_GeneroAnime = Genero + 1;
                aup.Otros_Generos = OG;
                cdc.SubmitChanges();
                GrillaAnime.EditIndex = -1;
                Mensaje("Completado con exito", "Se han actualizado los datos", "success");
                this.llenar();
            }
        }
        catch
        {
            Mensaje("Sin juegos", "Debes ingresar datos validos", "error");
        }
    }

    private void Clean()
    {
        txt_nombreN.Text = "";
        txt_sinopsisN.Text = "";
        txt_capitulosN.Text = "";
        txt_lanzamientoN.Text = "";
        txt_temporadasN.Text = "";
        txt_OGenerosN.Text = "";
        dd_estadoN.SelectedIndex = 0;
        dd_generoN.SelectedIndex = 0;
    }

    [WebMethod]
    public static string CrearEstado(String Genero)
    {
        string constr = "Data Source=VLADIMIR;Initial Catalog=bd_biblioteca;Persist Security Info=True;User ID=sa;Password=crislyn;MultipleActiveResultSets=True";
        using (SqlConnection con = new SqlConnection(constr))
        {
            using (SqlCommand cmd = new SqlCommand("INSERT INTO Genero_Anime VALUES(@Descripcion)"))
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


    private void Mensaje(String Tit, String Msg, String Stat)
    {
        ScriptManager.RegisterStartupScript(this, GetType(), "Popup", "Alerta('" + Tit + "','" + Msg + "','" + Stat + "');", true);
    }
}