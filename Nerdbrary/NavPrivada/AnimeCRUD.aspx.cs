using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class NavPrivada_AnimeCRUD : System.Web.UI.Page
{
    ConexionLQDataContext cdc;
    protected void Page_Load(object sender, EventArgs e)
    {
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
        GrillaAnime.DataSource = cdc.vAnime;
        GrillaAnime.DataBind();

    }
    
    private void llenaEstado()
    {
        cdc = new  ConexionLQDataContext();
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

    private void Mensaje(String Tit, String Msg, String Stat)
    {
        ScriptManager.RegisterStartupScript(this, GetType(), "Popup", "Alerta('" + Tit + "','" + Msg + "','" + Stat + "');", true);
    }
}