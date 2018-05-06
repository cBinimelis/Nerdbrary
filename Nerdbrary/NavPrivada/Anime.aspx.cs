using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class NavPrivada_Anime : System.Web.UI.Page
{
    ConexionLQDataContext cdc;
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["Admin"] == null)
        {

        }

        if (!IsPostBack)
        {
            llenado();
        }
    }
    int IdGrilla = 0;

    private void llenado()
    {
        cdc = new ConexionLQDataContext();
        GrillaAnime.DataSource = cdc.vAnime;
        GrillaAnime.DataBind();
    }

    protected void GrillaAnime_RowCommand(object sender, GridViewCommandEventArgs e)
    {
        if (e.CommandName == "Select")
        {
            int rowIndex = Convert.ToInt32(e.CommandArgument);
            GridViewRow row = GrillaAnime.Rows[rowIndex];
            string ID = (row.FindControl("lbl_id") as Label).Text;
            IdGrilla = Convert.ToInt32(ID);
            Response.Redirect("AnimeDetalles.aspx?Id=" + ID);
        }
        else if (e.CommandName == "Add")
        {

        }
    }
}