using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class MasterPage_MP_Central : System.Web.UI.MasterPage
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["Admin"] == null)
        {
            Response.Redirect("../Default.aspx");
        }
        else
        {
            String img = Convert.ToString(Session["Img"]);
            String Nick = Convert.ToString(Session["Admin"]);
            PPIcon.Attributes["Style"] = "background-image: url(../img/users/" + img + ")";
            PPNavMovil.Src = "../img/users/" + img;
            PPLi.Attributes["uk-tooltip"] = "title: Ir al perfil de " + Nick + "; pos: bottom";
            Session.Timeout = 35;
        }


    }
}
