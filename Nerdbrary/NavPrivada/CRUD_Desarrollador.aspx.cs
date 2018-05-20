using System;
using System.Collections.Generic;
using System.Linq;
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

    protected void btn_crear_Click(object sender, EventArgs e)
    {

    }
}