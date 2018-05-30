using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class NavPrivada_Lista_Autores : System.Web.UI.Page
{
    ConexionLQDataContext cdc;
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            Llenar();
        }
    }

    protected void Button1_Click(object sender, EventArgs e)
    {
        cdc = new ConexionLQDataContext();
        AutList.DataSource = cdc.Autor.Where(x => x.Nombre.Contains(txt_buscar.Text.Trim())).OrderBy(x => x.Nombre);
        AutList.DataBind();
    }

    protected void DevList_ItemCommand(object sender, ListViewCommandEventArgs e)
    {
        if (e.CommandName == "Select")
        {
            int ID = Convert.ToInt32(e.CommandArgument);
            Response.Redirect("Autor.aspx?Id=" + ID);
        }
    }

    private void Llenar()
    {
        cdc = new ConexionLQDataContext();
        AutList.DataSource = cdc.Autor.OrderBy(x => x.Nombre);
        AutList.DataBind();
    }
}