using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Data.SqlClient;
using System.Web.UI.WebControls;

public partial class NavPrivada_Desarrollador : System.Web.UI.Page
{
    Conexion sql = new Conexion();
    ConexionLQDataContext cdc;
    int idDesarrollador = 0;
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            idDesarrollador = Convert.ToInt32(Request.QueryString["Id"]);
            LlenarLista();
            LlenaDetalles();
        }
    }

    private void LlenaDetalles()
    {
        if (idDesarrollador == 0 || idDesarrollador.Equals(""))
        {
            Mensaje("Aviso", "Hubo un error al cargar la pagina", "info");
        }
        else
        {
            String Desarrollador = "";
            String Detalles = "";
            String RutaImagen = "";
            bool datosok = true;
            SqlDataReader Dev = sql.consulta("SELECT * FROM Desarrollador WHERE id_Desarrollador ='" + idDesarrollador + "'");
            if (Dev.Read())
            {
                Desarrollador = Dev[1].ToString();
                Detalles = Dev[2].ToString();
                RutaImagen = Dev[3].ToString();
            }
            else
            {
                datosok = false;
            }

            if (datosok)
            {
                Page.Title = "Detalles de " + Desarrollador;
                Titulo.Text = Desarrollador;
                DetallesDev.Text = Detalles;
                MainCover.Attributes["Style"] = "background-image: url(../img/games/developer/" + RutaImagen + "); height: 70vh";
            }
        }
    }

    private void LlenarLista()
    {
        cdc = new ConexionLQDataContext();
        GameList.DataSource = cdc.vJuegos.Where(x => x.id_Desarrollador == idDesarrollador).OrderBy(x => x.Nombre);
        GameList.DataBind();
    }

    protected void GameList_ItemCommand(object sender, ListViewCommandEventArgs e)
    {
        if (e.CommandName == "Select")
        {
            int ID = Convert.ToInt32(e.CommandArgument);
            Response.Redirect("Detalles_Juegos.aspx?Id=" + ID);
        }
    }

    private void Mensaje(String Tit, String Msg, String Stat)
    {
        ScriptManager.RegisterStartupScript(this, GetType(), "Popup", "Alerta('" + Tit + "','" + Msg + "','" + Stat + "');", true);
    }
}