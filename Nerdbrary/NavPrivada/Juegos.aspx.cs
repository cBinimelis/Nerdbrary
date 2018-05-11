﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;

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
        cdc = new ConexionLQDataContext();
        GrillaJuegos.DataSource = cdc.vJuegos.OrderBy(x => x.Nombre);
        GrillaJuegos.DataBind();
    }

    protected void GrillaJuegos_RowCommand(object sender, GridViewCommandEventArgs e)
    {
        try
        {
            String Nick = Convert.ToString(Session["Admin"]);
            int rowIndex = Convert.ToInt32(e.CommandArgument);
            GridViewRow row = GrillaJuegos.Rows[rowIndex];
            string ID = (row.FindControl("lbl_id") as Label).Text;
            IdGrilla = Convert.ToInt32(ID);
            if (e.CommandName == "Select")
            {
                Response.Redirect("JuegosDetalles.aspx?Id=" + ID);
            }
            else if (e.CommandName == "Add")
            {
                SqlDataReader JuegoUser = sql.consulta("EXEC vDetalleJuegos '" + Nick + "'," + ID);
                if (JuegoUser.Read())
                {
                    Mensaje("Sin duplicados", "Este juego ya está en tu lista", "info");
                }
                else
                {
                    cdc = new ConexionLQDataContext();
                    Juegos_Usuario ju = new Juegos_Usuario();
                    ju.id_Juego = Convert.ToInt32(ID);
                    ju.id_Usuario = (from u in cdc.Usuario where u.Nick == Nick select u.id_Usuario).FirstOrDefault();
                    ju.id_AvanceJuego = 1;
                    ju.Nota = "Sin notas adjuntas";
                    cdc.Juegos_Usuario.InsertOnSubmit(ju);
                    cdc.SubmitChanges();
                    Mensaje("¡Felicidades!", "Agregado a tu lista exitosamente", "success");
                }
            }
        }
        catch
        {
            Mensaje("Surgió un problema", "No se ha podido agregar el juego a tu lista", "error");
        }
    }

    private void Mensaje(String Tit, String Msg, String Stat)
    {
        ScriptManager.RegisterStartupScript(this, GetType(), "Popup", "Alerta('" + Tit + "','" + Msg + "','" + Stat + "');", true);
    }
}