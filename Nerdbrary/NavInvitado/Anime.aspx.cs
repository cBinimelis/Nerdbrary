using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class NavVisitas_AnimeVisitas : System.Web.UI.Page
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

        String Nick = Convert.ToString(Session["Admin"]);
        cdc = new ConexionLQDataContext();
        AnimeList.DataSource = cdc.vAnime.OrderBy(x => x.Nombre);
        AnimeList.DataBind();
    }

    protected void AnimeList_ItemCommand(object sender, ListViewCommandEventArgs e)
    {
        if (e.CommandName == "Select")
        {
            int ID = Convert.ToInt32(e.CommandArgument);
            Response.Redirect("AnimeDetalles.aspx?Id=" + ID);
        }
    }

    private void Mensaje(String Tit, String Msg, String Stat)
    {
        ScriptManager.RegisterStartupScript(this, GetType(), "Popup", "Alerta('" + Tit + "','" + Msg + "','" + Stat + "');", true);
    }
}