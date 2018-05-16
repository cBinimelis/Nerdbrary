using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Text.RegularExpressions;

public partial class NavPrivada_Anime : System.Web.UI.Page
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
        GrillaAnime.DataSource = cdc.vAnime.OrderBy(x => x.Nombre);
        GrillaAnime.DataBind();
    }

    protected void btn_buscar_Click(object sender, EventArgs e)
    {
        cdc = new ConexionLQDataContext();
        GrillaAnime.DataSource = cdc.vAnime.Where(x => x.Nombre.Contains(txt_buscar.Text.Trim())).OrderBy(x => x.Nombre);
        GrillaAnime.DataBind();
    }

    protected void GrillaAnime_RowCommand(object sender, GridViewCommandEventArgs e)
    {
        try
        {
            String Nick = Convert.ToString(Session["Admin"]);
            int rowIndex = Convert.ToInt32(e.CommandArgument);
            GridViewRow row = GrillaAnime.Rows[rowIndex];
            string ID = (row.FindControl("lbl_id") as Label).Text;
            IdGrilla = Convert.ToInt32(ID);
            if (e.CommandName == "Select")
            {
                Response.Redirect("Detalles_Anime.aspx?Id=" + ID);
            }
            else if (e.CommandName == "Add")
            {
                SqlDataReader AnimeUser = sql.consulta("EXEC vDetalleAnime '" + Nick + "'," + ID);
                if (AnimeUser.Read())
                {
                    Mensaje("Sin duplicados", "Este anime ya está en tu lista", "info");
                }
                else
                {
                    cdc = new ConexionLQDataContext();
                    Anime_Usuario au = new Anime_Usuario();
                    au.id_Anime = Convert.ToInt32(ID);
                    au.id_Usuario = (from u in cdc.Usuario where u.Nick == Nick select u.id_Usuario).FirstOrDefault();
                    au.id_AvanceAnime = 1;
                    au.Nota = "Sin notas adjuntas";
                    cdc.Anime_Usuario.InsertOnSubmit(au);
                    cdc.SubmitChanges();
                    Mensaje("¡Felicidades!", "Agregado a tu lista exitosamente", "success");
                }
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