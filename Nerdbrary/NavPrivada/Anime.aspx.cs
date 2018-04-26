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


    private void LlenarGrilla()
    {
        String Nick = Convert.ToString(Session["Admin"]);
        cdc = new ConexionLQDataContext();
        GrillaAnime.DataSource = cdc.vAnime("ivichan");
        //GrillaAnime.DataSource = cdc.vAnime(Nick);
        GrillaAnime.DataBind();
    }
}