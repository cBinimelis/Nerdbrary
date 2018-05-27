using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Data.SqlClient;
using System.Web.UI.WebControls;

public partial class NavPrivada_Lista_Peliculas : System.Web.UI.Page
{
    ConexionLQDataContext cdc;
    Conexion sql = new Conexion();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!this.IsPostBack)
        {
            llenado();
        }
    }
    int IdGrilla = 0;

    private void llenado()
    {
        cdc = new ConexionLQDataContext();
        GrillaLibros.DataSource = cdc.vLibros;
        GrillaLibros.DataBind();
    }

    protected void GrillaLibros_RowCommand(object sender, GridViewCommandEventArgs e)
    {
        try
        {
            String Nick = Convert.ToString(Session["Admin"]);
            int rowIndex = Convert.ToInt32(e.CommandArgument);
            GridViewRow row = GrillaLibros.Rows[rowIndex];
            string ID = (row.FindControl("lbl_id") as Label).Text;
            IdGrilla = Convert.ToInt32(ID);
            if (e.CommandName == "Select")
            {
                Response.Redirect("Detalles_Libros.aspx?Id=" + ID);
            }
            else if (e.CommandName == "Add")
            {
                SqlDataReader MangaUser = sql.consulta("EXEC vDetalleLibro '" + Nick + "'," + ID);
                if (MangaUser.Read())
                {
                    Mensaje("Sin duplicados", "Este libro ya está en tu lista", "info");
                }
                else
                {
                    cdc = new ConexionLQDataContext();
                    Libro_Usuario l = new Libro_Usuario();
                    l.id_Libro = Convert.ToInt32(ID);
                    l.id_Usuario = (from u in cdc.Usuario where u.Nick == Nick select u.id_Usuario).FirstOrDefault();
                    l.id_AvanceLibro = 1;
                    l.Nota = "Sin notas adjuntas";
                    cdc.Libro_Usuario.InsertOnSubmit(l);
                    cdc.SubmitChanges();
                    Mensaje("¡Felicidades!", "Agregado a tu lista exitosamente", "success");
                }
            }
        }
        catch
        {
            Mensaje("Surgió un problema", "No se ha podido agregar el libro a tu lista", "error");
        }
    }

    protected void btn_buscar_Click(object sender, EventArgs e)
    {
        cdc = new ConexionLQDataContext();
        GrillaLibros.DataSource = cdc.vLibros.Where(x => x.Nombre.Contains(txt_buscar.Text.Trim()));
        GrillaLibros.DataBind();
    }
    private void Mensaje(String Tit, String Msg, String Stat)
    {
        ScriptManager.RegisterStartupScript(this, GetType(), "Popup", "Alerta('" + Tit + "','" + Msg + "','" + Stat + "');", true);
    }
}