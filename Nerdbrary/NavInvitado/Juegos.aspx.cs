using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class NavInvitado_Juegos : System.Web.UI.Page
{
    ConexionLQDataContext cdc;
    Conexion sql = new Conexion();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            llenado();
        }
    }

    int IdGrilla = 0;

    private void llenado()
    {
        cdc = new ConexionLQDataContext();
        GameList.DataSource = cdc.vJuegos.OrderBy(x => x.Nombre);
        GameList.DataBind();
    }

    protected void GameList_ItemCommand(object sender, ListViewCommandEventArgs e)
    {
        if (e.CommandName == "Select")
        {
            int ID = Convert.ToInt32(e.CommandArgument);
            Response.Redirect("JuegosDetalles.aspx?Id=" + ID);
        }
    }
}