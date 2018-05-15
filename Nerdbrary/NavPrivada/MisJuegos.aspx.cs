using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class NavPrivada_MiJuego : System.Web.UI.Page
{
    ConexionLQDataContext cdc;
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            Llenar();
        }
    }
    private void Llenar()
    {
        String Nick = Convert.ToString(Session["Admin"]);
        cdc = new ConexionLQDataContext();
        GameList.DataSource = cdc.vJuegoUsuario(Nick);
        GameList.DataBind();
    }

    protected void GameList_ItemCommand(object sender, ListViewCommandEventArgs e)
    {
        if (e.CommandName == "Select")
        {
            int ID = Convert.ToInt32(e.CommandArgument);
            Response.Redirect("Detalles_Juegos.aspx?Id=" + ID);
        }
    }
}