using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

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
            Clean();
        }
    }
    private void llenar()
    {
        cdc = new ConexionLQDataContext();
        GrillaJuegos.DataSource = cdc.vAnime;
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
        dd_estadoN.DataSource = cdc.des;
        dd_estadoN.DataTextField = "Descripcion";
        dd_estadoN.DataValueField = "id_EstadoSerie";
        dd_estadoN.DataBind();
    }

    private void llenaGenero()
    {
        cdc = new ConexionLQDataContext();
        dd_generoN.DataSource = cdc.Genero_Juegos;
        dd_generoN.DataTextField = "Descripcion";
        dd_generoN.DataValueField = "id_GeneroJuego";
        dd_generoN.DataBind();
    }

    protected void GrillaJuegos_RowDataBound(object sender, GridViewRowEventArgs e)
    {

    }

    protected void GrillaJuegos_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
    {

    }

    protected void GrillaJuegos_RowEditing(object sender, GridViewEditEventArgs e)
    {

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