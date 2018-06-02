﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class NavPrivada_MisSeries : System.Web.UI.Page
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
        SerieList.DataSource = cdc.vSerieUsuario(Nick);
        SerieList.DataBind();
    }

    protected void SerieList_ItemCommand(object sender, ListViewCommandEventArgs e)
    {
        if (e.CommandName == "Select")
        {
            int ID = Convert.ToInt32(e.CommandArgument);
            Response.Redirect("Detalles_Serie.aspx?Id=" + ID);
        }
    }
}