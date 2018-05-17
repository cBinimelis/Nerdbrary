using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class NavPrivada_Inicio : System.Web.UI.Page
{
    ConexionLQDataContext cdc;
    protected void Page_Load(object sender, EventArgs e)
    {
        Llenar();
    }

    private void Llenar()
    {
        cdc = new ConexionLQDataContext();
        dd_tipopendiente.DataSource = cdc.Tipo_Pendiente;
        dd_tipopendiente.DataValueField = "id_TipoPendiente";
        dd_tipopendiente.DataTextField = "Descripcion";
        dd_tipopendiente.DataBind();
    }
}