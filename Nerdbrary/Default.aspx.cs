using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class _Default : System.Web.UI.Page
{
    ConexionLQDataContext cdc;
    protected void Page_Load(object sender, EventArgs e)
    {
        llenar();
        Session.RemoveAll();
    }

    private void llenar()
    {
        try
        {
            cdc = new ConexionLQDataContext();
            int Animes = (from a in cdc.Anime select a.id_Anime).Count();
            int Juegos = (from a in cdc.Juegos select a.id_Juego).Count();
            int Mangas = (from a in cdc.Manga select a.id_Manga).Count();
            int Series = (from a in cdc.Series select a.id_Serie).Count();
            int Peliculas = (from a in cdc.Peliculas select a.id_Pelicula).Count();
            int Libros = (from a in cdc.Libros select a.id_Libro).Count();

            lbl_Anime.Text = Animes.ToString();
            lbl_Juegos.Text = Juegos.ToString();
            lbl_Mangas.Text = Mangas.ToString();
            lbl_Series.Text = Series.ToString();
            lbl_Peliculas.Text = Peliculas.ToString();
            lbl_Libros.Text = Libros.ToString();
        }
        catch
        {

        }
    }
}