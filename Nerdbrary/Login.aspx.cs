using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Login : System.Web.UI.Page
{
    Conexion sql = new Conexion();
    protected void Page_Load(object sender, EventArgs e)
    {
    }

    protected void btn_login_Click(object sender, EventArgs e)
    {
        if (txt_username.Text.Trim().Equals("") || txt_password.Text.Trim().Equals(""))
        {
            Mensaje("Sin prisas", "No puedes dejar campos vacios.", "warning");
        }
        else
        {
            SqlDataReader usuario = sql.consulta("SELECT * FROM Usuario where Nick ='" + txt_username.Text + "'");
            if (usuario.Read())
            {
                if (usuario[2].ToString().Equals(txt_password.Text))
                {
                    switch (Convert.ToInt32(usuario[3].ToString()))
                    {
                        case 1:
                            Session["Admin"] = txt_username.Text;
                            Session["Img"] = usuario[5].ToString();
                            Response.Redirect("NavPrivada/Inicio.aspx");
                            break;
                        case 2:
                            Mensaje("Hay un detalle", "Tu cuenta esta temporalmente inactiva", "info");
                            break;
                        case 3:
                            Mensaje("Ouch", "Tu cuenta ha sido eliminada", "error");
                            break;
                    }
                }
                else
                {
                    Mensaje("Un Momento", "Contraseña incorrecta", "error");
                }
            }
            else
            {
                Mensaje("No lo encontré", "El correo no se encuentra registrado", "warning");
            }
        }
    }

    private void Mensaje(String Tit, String Msg, String Stat)
    {
        ScriptManager.RegisterStartupScript(this, GetType(), "Popup", "Alerta('" + Tit + "','" + Msg + "','" + Stat + "');", true);
    }
}