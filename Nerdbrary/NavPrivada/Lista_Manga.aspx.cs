using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class NavPrivada_Manga : System.Web.UI.Page
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
        GrillaManga.DataSource = cdc.vManga.OrderBy(x => x.Nombre);
        GrillaManga.DataBind();
    }

    protected void GrillaManga_RowCommand(object sender, GridViewCommandEventArgs e)
    {
        try
        {
            String Nick = Convert.ToString(Session["Admin"]);
            int rowIndex = Convert.ToInt32(e.CommandArgument);
            GridViewRow row = GrillaManga.Rows[rowIndex];
            string ID = (row.FindControl("lbl_id") as Label).Text;
            IdGrilla = Convert.ToInt32(ID);
            if (e.CommandName == "Select")
            {
                Response.Redirect("Detalles_Manga.aspx?Id=" + ID);
            }
            else if (e.CommandName == "Add")
            {
                SqlDataReader MangaUser = sql.consulta("EXEC vDetalleManga '" + Nick + "'," + ID);
                if (MangaUser.Read())
                {
                    Mensaje("Sin duplicados", "Este manga ya está en tu lista", "info");
                }
                else
                {
                    cdc = new ConexionLQDataContext();
                    Manga_Usuario m = new Manga_Usuario();
                    m.id_Manga = Convert.ToInt32(ID);
                    m.id_Usuario = (from u in cdc.Usuario where u.Nick == Nick select u.id_Usuario).FirstOrDefault();
                    m.id_AvanceManga = 1;
                    m.Nota = "Sin notas adjuntas";
                    cdc.Manga_Usuario.InsertOnSubmit(m);
                    cdc.SubmitChanges();
                    Mensaje("¡Felicidades!", "Agregado a tu lista exitosamente", "success");
                }
            }
        }
        catch
        {
            Mensaje("Surgió un problema", "No se ha podido agregar el manga a tu lista", "error");
        }
    }

    protected void btn_buscar_Click(object sender, EventArgs e)
    {
        cdc = new ConexionLQDataContext();
        GrillaManga.DataSource = cdc.vManga.Where(x => x.Nombre.Contains(txt_buscar.Text.Trim())).OrderBy(x => x.Nombre);
        GrillaManga.DataBind();
    }

    private void Mensaje(String Tit, String Msg, String Stat)
    {
        ScriptManager.RegisterStartupScript(this, GetType(), "Popup", "Alerta('" + Tit + "','" + Msg + "','" + Stat + "');", true);
    }
}