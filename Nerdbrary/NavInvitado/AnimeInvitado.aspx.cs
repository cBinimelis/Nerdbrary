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
        cdc = new ConexionLQDataContext();
        GrillaAnime.DataSource = cdc.vAnime.OrderBy(x => x.Nombre);
        GrillaAnime.DataBind();
    }

    protected void GrillaAnime_RowCommand(object sender, GridViewCommandEventArgs e)
    {
        try
        {
            int rowIndex = Convert.ToInt32(e.CommandArgument);
            GridViewRow row = GrillaAnime.Rows[rowIndex];
            string ID = (row.FindControl("lbl_id") as Label).Text;
            IdGrilla = Convert.ToInt32(ID);
            if (e.CommandName == "Select")
            {
                Response.Redirect("AnimeInvitadoDetalles.aspx?Id=" + ID);
            }
        }
        catch
        {
            Mensaje("Surgió un problema", "No se ha podido agregar el anime a tu lista", "error");
        }
    }

    private void Mensaje(String Tit, String Msg, String Stat)
    {
        ScriptManager.RegisterStartupScript(this, GetType(), "Popup", "Alerta('" + Tit + "','" + Msg + "','" + Stat + "');", true);
    }
}