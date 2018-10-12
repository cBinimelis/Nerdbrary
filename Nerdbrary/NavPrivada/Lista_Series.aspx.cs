using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class NavPrivada_Series_Lista_Series : System.Web.UI.Page
{
    ConexionLQDataContext cdc;
    Conexion sql = new Conexion();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!this.IsPostBack)
        {
            this.llenado();
        }
    }
    int IdGrilla = 0;

    private void llenado()
    {
        cdc = new ConexionLQDataContext();
        String Nick = Convert.ToString(Session["Admin"]);
        GrillaSeries.DataSource = cdc.vSeries.OrderBy(x => x.Nombre);
        GrillaSeries.DataBind();

        GrillaSeriesNA.DataSource = cdc.vSerieUsuarioNA(Nick).OrderBy(x => x.Nombre);
        GrillaSeriesNA.DataBind();
    }

    protected void btn_buscar_Click(object sender, EventArgs e)
    {
        cdc = new ConexionLQDataContext();
        GrillaSeries.DataSource = cdc.vSeries.Where(x => x.Nombre.Contains(txt_buscar.Text.Trim())).OrderBy(x => x.Nombre);
        GrillaSeries.DataBind();
    }

    protected void GrillaSeries_RowCommand(object sender, GridViewCommandEventArgs e)
    {
        try
        {
            int rowIndex = Convert.ToInt32(e.CommandArgument);
            GridViewRow row = GrillaSeries.Rows[rowIndex];
            string ID = (row.FindControl("lbl_id") as Label).Text;
            IdGrilla = Convert.ToInt32(ID);
            if (e.CommandName == "Select")
            {
                Response.Redirect("Detalles_Serie.aspx?Id=" + ID);
            }
        }
        catch
        {
            Mensaje("Surgió un problema", "No se ha podido agregar la serie a tu lista", "error");
        }
    }
    protected void GrillaSeriesNA_RowCommand(object sender, GridViewCommandEventArgs e)
    {
        try
        {
            String Nick = Convert.ToString(Session["Admin"]);
            int rowIndex = Convert.ToInt32(e.CommandArgument);
            GridViewRow row = GrillaSeriesNA.Rows[rowIndex];
            string ID = (row.FindControl("lbl_id") as Label).Text;
            IdGrilla = Convert.ToInt32(ID);
            if (e.CommandName == "Select")
            {
                Response.Redirect("Detalles_Serie.aspx?Id=" + ID);
            }
            else if (e.CommandName == "Add")
            {
                SqlDataReader AnimeUser = sql.consulta("EXEC vDetalleSerie '" + Nick + "'," + ID);
                if (AnimeUser.Read())
                {
                    Mensaje("Sin duplicados", "Esta serie ya está en tu lista", "info");
                }
                else
                {
                    cdc = new ConexionLQDataContext();
                    Serie_Usuario su = new Serie_Usuario();
                    su.id_Serie = Convert.ToInt32(ID);
                    su.id_Usuario = (from u in cdc.Usuario where u.Nick == Nick select u.id_Usuario).FirstOrDefault();
                    su.id_AvanceSerie = 1;
                    su.Nota = "Sin notas adjuntas";
                    cdc.Serie_Usuario.InsertOnSubmit(su);
                    cdc.SubmitChanges();
                    Mensaje("¡Felicidades!", "Agregado a tu lista exitosamente", "success");
                    this.llenado();
                }
            }
        }
        catch
        {
            Mensaje("Surgió un problema", "No se ha podido agregar la serie a tu lista", "error");
        }
    }

    private void Mensaje(String Tit, String Msg, String Stat)
    {
        ScriptManager.RegisterStartupScript(this, GetType(), "Popup", "Alerta('" + Tit + "','" + Msg + "','" + Stat + "');", true);
    }
}