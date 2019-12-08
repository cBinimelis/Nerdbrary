using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class NavPrivada_Lista_Peliculas : System.Web.UI.Page
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
        String Nick = Convert.ToString(Session["Admin"]);
        GrillaPelicula.DataSource = cdc.vPelicula.OrderBy(x => x.Nombre);
        GrillaPelicula.DataBind();

        GrillaPeliculaNA.DataSource = cdc.vPeliculaUsuarioNA(Nick).OrderBy(x => x.Nombre);
        GrillaPeliculaNA.DataBind();
    }

    protected void GrillaPelicula_RowCommand(object sender, GridViewCommandEventArgs e)
    {
        try
        {
            String Nick = Convert.ToString(Session["Admin"]);
            int rowIndex = Convert.ToInt32(e.CommandArgument);
            GridViewRow row = GrillaPelicula.Rows[rowIndex];
            string ID = (row.FindControl("lbl_id") as Label).Text;
            IdGrilla = Convert.ToInt32(ID);
            if (e.CommandName == "Select")
            {
                Response.Redirect("Detalles_Pelicula.aspx?Id=" + ID);
            }
        }
        catch
        {
            Mensaje("Surgió un problema", "No se ha podido mostrar la Pelicula de tu lista", "error");
        }
    }

    protected void GrillaPeliculaNA_RowCommand(object sender, GridViewCommandEventArgs e)
    {
        try
        {
            String Nick = Convert.ToString(Session["Admin"]);
            int rowIndex = Convert.ToInt32(e.CommandArgument);
            GridViewRow row = GrillaPeliculaNA.Rows[rowIndex];
            string ID = (row.FindControl("lbl_id") as Label).Text;
            IdGrilla = Convert.ToInt32(ID);
            if (e.CommandName == "Select")
            {
                Response.Redirect("Detalles_Pelicula.aspx?Id=" + ID);
            }
            else if (e.CommandName == "Add")
            {
                SqlDataReader PeliculaUser = sql.consulta("EXEC vDetallePelicula '" + Nick + "'," + ID);
                if (PeliculaUser.Read())
                {
                    Mensaje("Sin duplicados", "Este Pelicula ya está en tu lista", "info");
                }
                else
                {
                    cdc = new ConexionLQDataContext();
                    Pelicula_Usuario m = new Pelicula_Usuario();
                    m.id_Pelicula = Convert.ToInt32(ID);
                    m.id_Usuario = (from u in cdc.Usuario where u.Nick == Nick select u.id_Usuario).FirstOrDefault();
                    m.id_AvancePelicula = 2;
                    m.Nota = "Sin notas adjuntas";
                    cdc.Pelicula_Usuario.InsertOnSubmit(m);
                    cdc.SubmitChanges();
                    Mensaje("¡Felicidades!", "Agregado a tu lista exitosamente", "success");
                    this.llenado();
                }
            }
        }
        catch
        {
            Mensaje("Surgió un problema", "No se ha podido mostrar la Pelicula de tu lista", "error");
        }

    }

    protected void btn_buscar_Click(object sender, EventArgs e)
    {
        cdc = new ConexionLQDataContext();
        GrillaPelicula.DataSource = cdc.vPelicula.Where(x => x.Nombre.Contains(txt_buscar.Text.Trim()));
        GrillaPelicula.DataBind();
    }

    private void Mensaje(String Tit, String Msg, String Stat)
    {
        ScriptManager.RegisterStartupScript(this, GetType(), "Popup", "Alerta('" + Tit + "','" + Msg + "','" + Stat + "');", true);
    }
}