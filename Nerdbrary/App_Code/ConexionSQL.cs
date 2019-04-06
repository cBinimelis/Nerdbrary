using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Data.SqlClient;
using System.Data;
using System.ComponentModel;
using System.Drawing;
using System.Web.UI.WebControls;

public class Conexion
{
    //Conexion Local
    String conexion = "Data Source=localhost;Initial Catalog=bd_biblioteca;Persist Security Info=True;User ID=sa;Password=crislyn;MultipleActiveResultSets=True";

    SqlConnection con;

    public Conexion()
    {
        con = new SqlConnection(conexion);

    }


    public void conectar()
    {
        try
        {

            con.Open();
        }
        catch (Exception e)
        {

        }

    }


    public void desconectar()
    {
        try
        {
            con.Close();
        }
        catch (Exception e)
        {

        }
    }
    public SqlDataReader consulta(String sentencia)
    {
        conectar();
        try
        {
            SqlCommand comando = new SqlCommand(sentencia, con);
            return comando.ExecuteReader();
        }
        catch (Exception e)
        {
            return null;
        }
    }
    public int ejecutar(String sentencia)
    {
        try
        {
            conectar();
            SqlCommand comando = new SqlCommand(sentencia, con);
            return comando.ExecuteNonQuery();
        }
        catch (Exception e)
        {
            return -1;
        }
    }
    public Boolean validar(String sentencia)
    {
        if (consulta(sentencia).Read())
        {
            return true;
        }
        else
        {
            return false;
        }
    }


    public void llenaGrid(GridView dg, String sentencia)
    {
        try
        {
            con.Close();
            con.Open();
            SqlDataAdapter adapt = new SqlDataAdapter(sentencia, con);
            DataSet ds = new DataSet();
            adapt.Fill(ds);
            dg.DataSource = ds.Tables[0];
            dg.DataBind();
            con.Close();
        }
        catch { }
    }

    private void LlenaListas( ListView lv, String sentencia)
    {
        try
        {
            con.Close();
            con.Open();
            SqlDataAdapter adapt = new SqlDataAdapter(sentencia, con);
            DataSet ds = new DataSet();
            adapt.Fill(ds);
            lv.DataSource = ds;
            lv.DataBind();
        }
        catch { }
    }

    public void llenacombo(DropDownList cb, String sentencia, String display, String value)
    {
        try
        {
            con.Close();
            con.Open();
            SqlDataAdapter da = new SqlDataAdapter(sentencia, con);
            DataSet ds = new DataSet();
            da.Fill(ds);
            cb.DataSource = ds;
            cb.DataTextField = display;
            cb.DataValueField = value;
            cb.DataBind();
            cb.Items.Insert(0, new ListItem("--Seleccionar--", "0"));
            con.Close();
        }
        catch (Exception ex)
        {

        }
    }
}