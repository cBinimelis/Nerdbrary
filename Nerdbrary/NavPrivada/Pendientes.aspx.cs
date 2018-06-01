using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class NavPrivada_Pendientes : System.Web.UI.Page
{
    ConexionLQDataContext cdc;
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!this.IsPostBack)
        {
            llenar();
        }
    }

    private void llenar()
    {
        cdc = new ConexionLQDataContext();
        GrillaPendiente.DataSource = cdc.vPendientes.OrderBy(x => x.Nombre);
        GrillaPendiente.DataBind();
    }

    protected void GrillaPendiente_RowCommand(object sender, GridViewCommandEventArgs e)
    {
        if (e.CommandName == "Select")
        {
            int rowIndex = Convert.ToInt32(e.CommandArgument);
            GridViewRow row = GrillaPendiente.Rows[rowIndex];
            String Tipo = (row.FindControl("lbl_idTP") as Label).Text;
            String ID = (row.FindControl("lbl_id") as Label).Text;
            switch (Convert.ToInt32(Tipo))
            {
                case 1:
                    Response.Redirect("CRUD_Anime.aspx?Id=" + ID);
                    break;
                case 2:
                    Response.Redirect("CRUD_Juegos.aspx?Id=" + ID);
                    break;
                case 3:
                    Response.Redirect("CRUD_Manga.aspx?Id=" + ID);
                    break;
                case 4:
                    Response.Redirect("CRUD_Libros.aspx?Id=" + ID);
                    break;
                case 5:
                    Response.Redirect("CRUD_Peliculas.aspx?Id=" + ID);
                    break;
                case 6:
                    Response.Redirect("CRUD_Series.aspx?Id=" + ID);
                    break;
            }
        }
    }

    protected void GrillaPendiente_RowDataBound(object sender, GridViewRowEventArgs e)
    {
        if (e.Row.RowType == DataControlRowType.DataRow && e.Row.RowIndex != GrillaPendiente.EditIndex)
        {
            (e.Row.Cells[5].Controls[2] as LinkButton).Attributes["onclick"] = "return Delete(this, event);";
        }
    }

    protected void GrillaPendiente_RowEditing(object sender, GridViewEditEventArgs e)
    {
        GrillaPendiente.EditIndex = e.NewEditIndex;
        this.llenar();
    }

    protected void GrillaPendiente_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
    {
        GrillaPendiente.EditIndex = -1;
        this.llenar();

    }

    protected void GrillaPendiente_RowUpdating(object sender, GridViewUpdateEventArgs e)
    {
        try
        {
            GridViewRow row = GrillaPendiente.Rows[e.RowIndex];
            int idPendiente = Convert.ToInt32(GrillaPendiente.DataKeys[e.RowIndex].Values[0]);
            int Tipo = (row.FindControl("dd_TPendiente") as DropDownList).SelectedIndex;

            cdc = new ConexionLQDataContext();
            Pendientes p = (from a in cdc.Pendientes where a.id_Pendiente == idPendiente select a).FirstOrDefault();
            p.id_TipoPendiente = Tipo + 1;
            cdc.SubmitChanges();
            GrillaPendiente.EditIndex = -1;
            Mensaje("Completado con exito", "Se han actualizado los datos", "success");
            this.llenar();

        }
        catch
        {
            Mensaje("Sin jugueteos", "Debes ingresar datos validos", "error");
        }
    }

    protected void GrillaPendiente_RowDeleting(object sender, GridViewDeleteEventArgs e)
    {
        int idPendiente = Convert.ToInt32(GrillaPendiente.DataKeys[e.RowIndex].Values[0]);
        cdc = new ConexionLQDataContext();
        Pendientes p = (from a in cdc.Pendientes where a.id_Pendiente == idPendiente select a).FirstOrDefault();
        cdc.Pendientes.DeleteOnSubmit(p);
        cdc.SubmitChanges();
        Mensaje("Bye bye!", "Se ha eliminado el elemento de tu lista", "success");
        this.llenar();
    }

    protected void btn_buscar_Click(object sender, EventArgs e)
    {
        cdc = new ConexionLQDataContext();
        GrillaPendiente.DataSource = cdc.vPendientes.Where(x => x.Nombre.Contains(txt_buscar.Text.Trim()) || x.Usuario.Contains(txt_buscar.Text.Trim())).OrderBy(x => x.Nombre);
        GrillaPendiente.DataBind();
    }

    private void Mensaje(String Tit, String Msg, String Stat)
    {
        ScriptManager.RegisterStartupScript(this, GetType(), "Popup", "Alerta('" + Tit + "','" + Msg + "','" + Stat + "');", true);
    }
}