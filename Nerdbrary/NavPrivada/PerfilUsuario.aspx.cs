using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;

public partial class NavPrivada_PerfilUsuario : System.Web.UI.Page
{
    String Nick = "";
    ConexionLQDataContext cdc;
    Conexion sql = new Conexion();
    protected void Page_Load(object sender, EventArgs e)
    {
        Nick = Convert.ToString(Session["Admin"]);
        Page.Title = Nick.ToUpper();
        llenar();
    }

    private void llenar()
    {
        SqlDataReader Usuario = sql.consulta("SELECT * FROM Usuario WHERE Nick = '" + Nick + "'");
        if (Usuario.Read())
        {
            cdc = new ConexionLQDataContext();
            int IdUsuario = Convert.ToInt32(Usuario[0].ToString());
            User.Text = Usuario[1].ToString();
            imagen.Src = "../img/users/" + Usuario[5].ToString();
            Cover.Attributes["Style"] = "background-image: url(../img/users/" + Usuario[6].ToString() + ")";

            int Animes = (from a in cdc.Anime_Usuario where a.id_Usuario == IdUsuario select a).Count();
            int Juegos = (from a in cdc.Juegos_Usuario where a.id_Usuario == IdUsuario select a).Count();
            int Mangas = (from a in cdc.Manga_Usuario where a.id_Usuario == IdUsuario select a).Count();
            lbl_Anime.Text = Animes.ToString();
            lbl_Juegos.Text = Juegos.ToString();
            lbl_Mangas.Text = Mangas.ToString();
        }
    }
}