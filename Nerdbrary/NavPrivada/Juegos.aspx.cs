using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class NavPrivada_Juegos : System.Web.UI.Page
{
    ConexionLQDataContext cdc;
    Conexion sql = new Conexion();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            Llenado();
        }
    }
    int IdGrilla = 0;

    private void Llenado()
    {

    }
    protected void GrillaJuegos_RowCommand(object sender, GridViewCommandEventArgs e)
    {

    }
}