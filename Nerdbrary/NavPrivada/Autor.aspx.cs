using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class NavPrivada_Autor : System.Web.UI.Page
{
    Conexion sql = new Conexion();
    ConexionLQDataContext cdc;
    int idAutor = 0;
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            idAutor = Convert.ToInt32(Request.QueryString["Id"]);
            LlenarLista();
            LlenaDetalles();
        }
    }

    private void LlenaDetalles()
    {
        if (idAutor == 0 || idAutor.Equals(""))
        {
            Mensaje("Aviso", "Hubo un error al cargar la pagina", "info");
        }
        else
        {
            String Desarrollador = "";
            String Detalles = "";
            String RutaImagen = "";
            bool datosok = true;
            SqlDataReader Dev = sql.consulta("SELECT * FROM Autor WHERE id_Autor ='" + idAutor + "'");
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
                DetallesAut.Text = Detalles;
                MainCover.Attributes["Style"] = "background-image: url(../img/books/author/" + RutaImagen + "); height: 70vh";
            }
        }
    }

    private void LlenarLista()
    {
        cdc = new ConexionLQDataContext();
        BookList.DataSource = cdc.vLibros.Where(x => x.id_Autor == idAutor).OrderBy(x => x.Nombre);
        BookList.DataBind();
    }

    protected void BookList_ItemCommand(object sender, ListViewCommandEventArgs e)
    {
        if (e.CommandName == "Select")
        {
            int ID = Convert.ToInt32(e.CommandArgument);
            Response.Redirect("Detalles_Libros.aspx?Id=" + ID);
        }
    }

    private void Mensaje(String Tit, String Msg, String Stat)
    {
        ScriptManager.RegisterStartupScript(this, GetType(), "Popup", "Alerta('" + Tit + "','" + Msg + "','" + Stat + "');", true);
    }
}