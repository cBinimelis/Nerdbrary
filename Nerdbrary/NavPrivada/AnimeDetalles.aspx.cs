using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;

public partial class NavPrivada_AnimeDetalles : System.Web.UI.Page
{
    Conexion sql = new Conexion();
    ConexionLQDataContext cdc;
    protected void Page_Load(object sender, EventArgs e)
    {
        LlenaDetalles();
    }

    private void LlenaDetalles()
    {
        String idAnime = Request.QueryString["Id"];
        if (idAnime == null || idAnime.Equals(0))
        {
            Mensaje("Aviso", "Hubo un error al cargar la pagina", "info");
        }
        else
        {
            String Nick = Convert.ToString(Session["Admin"]);
            String Nombre = "";
            String Sinopsis = "";
            String Lanzamiento = "";
            int Temporadas = 0;
            String Capitulos = "";
            String RutaImagen = "";
            String GeneroAnime = "";
            String OtrosGeneros = "";
            String Estado = "";
            String Avance = "";
            bool DatosOK=true;

            if (Nick == "" || Nick == null)
            {
                SqlDataReader Anime = sql.consulta("SELECT* FROM vAnime WHERE id_Anime =" + idAnime);
                if (Anime.Read())
                {
                    Nombre = Anime[1].ToString();
                    Sinopsis = Anime[2].ToString();
                    Lanzamiento = Anime[3].ToString();
                    Temporadas = Convert.ToInt32(Anime[4].ToString());
                    Capitulos = Anime[5].ToString();
                    RutaImagen = Anime[6].ToString();
                    GeneroAnime = Anime[7].ToString();
                    OtrosGeneros = Anime[8].ToString();
                    Estado = Anime[9].ToString();
                    DatosOK = true;
                }
                else
                {
                    DatosOK = false;
                }
            }
            else
            {
                SqlDataReader AnimeUser = sql.consulta("EXEC vDetalleAnime '" + Nick + "'," + idAnime);
                if (AnimeUser.Read())
                {
                    Nombre = AnimeUser[1].ToString();
                    Sinopsis = AnimeUser[2].ToString();
                    Lanzamiento = AnimeUser[3].ToString();
                    Temporadas = Convert.ToInt32(AnimeUser[4].ToString());
                    Capitulos = AnimeUser[5].ToString();
                    RutaImagen = AnimeUser[6].ToString();
                    GeneroAnime = AnimeUser[7].ToString();
                    OtrosGeneros = AnimeUser[8].ToString();
                    Estado = AnimeUser[9].ToString();
                    Avance = AnimeUser[10].ToString();
                    DatosOK = true;

                    //Llenar grilla adicional
                    cdc = new ConexionLQDataContext();
                    GrillaAnimeUsuario.DataSource = cdc.vDetalleAnime(Nick, Convert.ToInt32(idAnime));
                    GrillaAnimeUsuario.DataBind();
                    GrillaAnimeUsuario.Visible = true;
                }
                else
                {
                    SqlDataReader Anime = sql.consulta("SELECT* FROM vAnime WHERE id_Anime =" + idAnime);
                    if (Anime.Read())
                    {
                        Nombre = Anime[1].ToString();
                        Sinopsis = Anime[2].ToString();
                        Lanzamiento = Anime[3].ToString();
                        Temporadas = Convert.ToInt32(Anime[4].ToString());
                        Capitulos = Anime[5].ToString();
                        RutaImagen = Anime[6].ToString();
                        GeneroAnime = Anime[7].ToString();
                        OtrosGeneros = Anime[8].ToString();
                        Estado = Anime[9].ToString();
                        DatosOK = true;
                    }
                    else
                    {
                        DatosOK = false;
                    }
                }
            }

            if (DatosOK)
            {
                TituloA.Text = Nombre;
                DescripcionA.Text = Sinopsis;
                LanzamientoA.Text = Lanzamiento;
                if (Temporadas == 0)
                {
                    TemporadasA.Text = "N/A";
                }
                else
                {
                    TemporadasA.Text = Temporadas.ToString();
                }
                CapitulosA.Text = Capitulos.ToString();
                imagen.Src = "../img/anime/" + RutaImagen;
                GeneroA.Text = GeneroAnime;
                OGenerosA.Text = OtrosGeneros;
                EstadoA.Text = Estado;
                APersonalA.Text = Avance;
                Cover.Attributes["Style"] = "background-image: url(../img/anime/" + RutaImagen + ")";
            }
            else
            {
                Mensaje("Aviso", "Hubo un error al cargar la pagina", "info");
            }
        }
    }
    
    private void Mensaje(String Tit, String Msg, String Stat)
    {
        ScriptManager.RegisterStartupScript(this, GetType(), "Popup", "Alerta('" + Tit + "','" + Msg + "','" + Stat + "');", true);
    }

}