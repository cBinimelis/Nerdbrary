using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class NavPrivada_Pendientes : System.Web.UI.Page
{
    ConexionLQDataContext cdc;
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!this.IsPostBack)
        {
            llenar();
        }
    }

    private void llenar()
    {
        cdc = new ConexionLQDataContext();
        GrillaPendiente.DataSource = cdc.vPendientes.OrderBy(x => x.Nombre);
        GrillaPendiente.DataBind();
    }

    protected void GrillaPendiente_RowCommand(object sender, GridViewCommandEventArgs e)
    {
        if (e.CommandName == "Select")
        {
            GridViewRow row = (GridViewRow)(((Control)e.CommandSource).NamingContainer);
            String Tipo = (row.FindControl("lbl_idTP") as Label).Text;
            int ID = Convert.ToInt32(e.CommandArgument);
            switch (Convert.ToInt32(Tipo))
            {
                case 1:
                    Response.Redirect("CRUD_Anime.aspx?Id=" + ID);
                    break;
                case 2:
                    Response.Redirect("CRUD_Juegos.aspx?Id=" + ID);
                    break;
                case 3:
                    Response.Redirect("CRUD_Manga.aspx?Id=" + ID);
                    break;
                case 4:
                    Response.Redirect("CRUD_Anime.aspx?Id=" + ID);
                    break;
                case 5:
                    Response.Redirect("CRUD_Anime.aspx?Id=" + ID);
                    break;
                case 6:
                    Response.Redirect("CRUD_Anime.aspx?Id=" + ID);
                    break;
            }
        }
    }

    protected void btn_buscar_Click(object sender, EventArgs e)
    {
        cdc = new ConexionLQDataContext();
        GrillaPendiente.DataSource = cdc.vPendientes.Where(x => x.Nombre.Contains(txt_buscar.Text.Trim()) || x.Usuario.Contains(txt_buscar.Text.Trim())).OrderBy(x => x.Nombre);
        GrillaPendiente.DataBind();
    }
}