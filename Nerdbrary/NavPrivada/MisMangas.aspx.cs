using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class NavPrivada_MisMangas : System.Web.UI.Page
{
    ConexionLQDataContext cdc;
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            this.Llenar();
        }
    }

    int IdGrilla = 0;

    private void Llenar()
    {
        String Nick = Convert.ToString(Session["Admin"]);
        cdc = new ConexionLQDataContext();
        MangaList.DataSource = cdc.vMangaUsuario(Nick);
        MangaList.DataBind();
    }

    protected void MangaList_ItemCommand(object sender, ListViewCommandEventArgs e)
    {
        if (e.CommandName == "Select")
        {
            int ID = Convert.ToInt32(e.CommandArgument);
            Response.Redirect("Detalles_Manga.aspx?Id=" + ID);
        }
    }
}