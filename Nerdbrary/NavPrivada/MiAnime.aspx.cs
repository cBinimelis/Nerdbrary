using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;

public partial class NavPrivada_Anime : System.Web.UI.Page
{
    ConexionLQDataContext cdc;
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            this.LlenarGrilla();
        }
    }

    int IdGrilla = 0;

    private void LlenarGrilla()
    {
        String Nick = Convert.ToString(Session["Admin"]);
        cdc = new ConexionLQDataContext();
        GrillaAnime.DataSource = cdc.vAnime("ivichan");
        //GrillaAnime.DataSource = cdc.vAnime(Nick);
        GrillaAnime.DataBind();
    }

    protected void GrillaAnime_RowDataBound(object sender, GridViewRowEventArgs e)
    {

    }


    protected void GrillaAnime_RowCommand(object sender, GridViewCommandEventArgs e)
    {
        if (e.CommandName == "Select")
        {
            //Determine the RowIndex of the Row whose Button was clicked.
            int rowIndex = Convert.ToInt32(e.CommandArgument);

            //Reference the GridView Row.
            GridViewRow row = GrillaAnime.Rows[rowIndex];

            //Fetch value of Name.
            string ID = (row.FindControl("lbl_id") as Label).Text;
            IdGrilla = Convert.ToInt32(ID);
            Response.Redirect("AnimeDetalles.aspx?Id="+ID);
        }
    }
}