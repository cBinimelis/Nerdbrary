using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class NavPrivada_Detalles_Serie : System.Web.UI.Page
{
    Conexion sql = new Conexion();
    ConexionLQDataContext cdc;
    String Nick = "";
    String idSerie = "";
    protected void Page_Load(object sender, EventArgs e)
    {
        Nick = Convert.ToString(Session["Admin"]);
        idSerie = Request.QueryString["Id"];
        if (!IsPostBack)
        {
            LlenaDetalles();
            llenarGrilla();
        }
    }


    private void LlenaDetalles()
    {
        if (idSerie == null || idSerie.Equals(0))
        {
            Mensaje("Aviso", "Hubo un error al cargar la pagina", "info");
        }
        else
        {
            String Nombre = "";
            String Sinopsis = "";
            String Lanzamiento = "";
            int Temporadas = 0;
            String Capitulos = "";
            String RutaImagen = "";
            String GeneroSerie = "";
            String OtrosGeneros = "";
            String Estado = "";
            String Avance = "";
            bool DatosOK = true;

            if (Nick == "" || Nick == null)
            {
                SqlDataReader Serie = sql.consulta("SELECT* FROM vSeries WHERE id_Serie =" + idSerie);
                if (Serie.Read())
                {
                    Nombre = Serie[1].ToString();
                    Sinopsis = Serie[2].ToString();
                    Lanzamiento = Serie[3].ToString();
                    Temporadas = Convert.ToInt32(Serie[4].ToString());
                    Capitulos = Serie[5].ToString();
                    RutaImagen = Serie[6].ToString();
                    GeneroSerie = Serie[7].ToString();
                    OtrosGeneros = Serie[8].ToString();
                    Estado = Serie[9].ToString();
                    DatosOK = true;
                }
                else
                {
                    DatosOK = false;
                }
            }
            else
            {
                SqlDataReader SerieUser = sql.consulta("EXEC vDetalleSerie '" + Nick + "'," + idSerie);
                if (SerieUser.Read())
                {
                    Nombre = SerieUser[1].ToString();
                    Sinopsis = SerieUser[2].ToString();
                    Lanzamiento = SerieUser[3].ToString();
                    Temporadas = Convert.ToInt32(SerieUser[4].ToString());
                    Capitulos = SerieUser[5].ToString();
                    RutaImagen = SerieUser[6].ToString();
                    GeneroSerie = SerieUser[7].ToString();
                    OtrosGeneros = SerieUser[8].ToString();
                    Estado = SerieUser[9].ToString();
                    Avance = SerieUser[10].ToString();
                    DatosOK = true;
                    llenarGrilla();
                }
                else
                {
                    SqlDataReader Serie = sql.consulta("SELECT* FROM vSeries WHERE id_Serie =" + idSerie);
                    if (Serie.Read())
                    {
                        Nombre = Serie[1].ToString();
                        Sinopsis = Serie[2].ToString();
                        Lanzamiento = Serie[3].ToString();
                        Temporadas = Convert.ToInt32(Serie[4].ToString());
                        Capitulos = Serie[5].ToString();
                        RutaImagen = Serie[6].ToString();
                        GeneroSerie = Serie[7].ToString();
                        OtrosGeneros = Serie[8].ToString();
                        Estado = Serie[9].ToString();
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
                TituloA.Text = Nombre;
                DescripcionA.Text = Sinopsis;
                LanzamientoS.Text = Lanzamiento;
                if (Temporadas == 0)
                {
                    TemporadasS.Text = "N/A";
                }
                else
                {
                    TemporadasS.Text = Temporadas.ToString();
                }
                CapitulosS.Text = Capitulos.ToString();
                imagen.Src = "../img/series/" + RutaImagen;
                GeneroS.Text = GeneroSerie;
                OGenerosS.Text = OtrosGeneros;
                EstadoA.Text = Estado;
                APersonalS.Text = Avance;
                Cover.Attributes["Style"] = "background-image: url(../img/series/" + RutaImagen + ")";
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
        GrillaSerieUsuario.DataSource = cdc.vDetalleSerie(Nick, Convert.ToInt32(idSerie));
        GrillaSerieUsuario.DataBind();
    }


    protected void GrillaSerieUsuario_RowDataBound(object sender, GridViewRowEventArgs e)
    {
        if (e.Row.RowType == DataControlRowType.DataRow && e.Row.RowIndex != GrillaSerieUsuario.EditIndex)
        {
            (e.Row.Cells[3].Controls[2] as LinkButton).Attributes["onclick"] = "return Delete(this, event);";
        }
    }

    protected void GrillaSerieUsuario_RowEditing(object sender, GridViewEditEventArgs e)
    {
        GrillaSerieUsuario.EditIndex = e.NewEditIndex;
        this.llenarGrilla();
    }

    protected void GrillaSerieUsuario_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
    {
        GrillaSerieUsuario.EditIndex = -1;
        this.llenarGrilla();
    }

    protected void GrillaSerieUsuario_RowUpdating(object sender, GridViewUpdateEventArgs e)
    {
        try
        {
            GridViewRow row = GrillaSerieUsuario.Rows[e.RowIndex];
            int idSerieUsuario = Convert.ToInt32(GrillaSerieUsuario.DataKeys[e.RowIndex].Values[0]);
            int Avance = (row.FindControl("dd_ASerie") as DropDownList).SelectedIndex;
            String Nota = (row.FindControl("txt_nota") as TextBox).Text.Trim();

            cdc = new ConexionLQDataContext();
            Serie_Usuario au = (from a in cdc.Serie_Usuario where a.id_SerieUsuario == idSerieUsuario select a).FirstOrDefault();
            au.id_AvanceSerie = Avance + 1;
            au.Nota = Nota;
            cdc.SubmitChanges();
            GrillaSerieUsuario.EditIndex = -1;
            Mensaje("Completado con exito", "Se han actualizado los datos", "success");
            this.llenarGrilla();
            this.LlenaDetalles();

        }
        catch
        {
            Mensaje("Sin jugueteos", "Debes ingresar datos validos", "error");
        }
    }

    protected void GrillaSerieUsuario_RowDeleting(object sender, GridViewDeleteEventArgs e)
    {
        int IdSerieU = Convert.ToInt32(GrillaSerieUsuario.DataKeys[e.RowIndex].Values[0]);
        cdc = new ConexionLQDataContext();
        Serie_Usuario au = (from a in cdc.Serie_Usuario where a.id_SerieUsuario == IdSerieU select a).FirstOrDefault();
        cdc.Serie_Usuario.DeleteOnSubmit(au);
        cdc.SubmitChanges();
        Mensaje("Bye bye!", "Se ha eliminado la serie de tu lista", "success");
        GrillaSerieUsuario.Visible = false;
        APersonalS.Visible = false;
    }

    private void Mensaje(String Tit, String Msg, String Stat)
    {
        ScriptManager.RegisterStartupScript(this, GetType(), "Popup", "Alerta('" + Tit + "','" + Msg + "','" + Stat + "');", true);
    }
}