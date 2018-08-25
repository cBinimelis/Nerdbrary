<%@ Page Title="" Language="C#" MaintainScrollPositionOnPostback="true" MasterPageFile="~/MasterPage/MP_Central.master" AutoEventWireup="true" CodeFile="Detalles_Pelicula.aspx.cs" Inherits="NavPrivada_Detalles_Pelicula" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div class="uk-section uk-section-default">
        <div id="Cover" runat="server" class="background"></div>
        <div class="uk-container uk-card uk-card-default uk-align-center uk-animation-slide-left">
            <div class="uk-card-body uk-card-medium">
                <h1 class="uk-text-center uk-heading-line uk-padding-small">
                    <asp:Label ID="TituloJ" runat="server" Text="Waifu para rellenar"></asp:Label></h1>
                <img id="imagen" class="uk-align-center uk-height-medium@m uk-margin-remove-adjacent" runat="server" src="../img/anime/default.jpg" alt="Imagen del juego" />
                <div class="uk-child-width-1-2@m" uk-grid>
                    <div>
                        <p>
                            <b>Lanzamiento: </b>
                            <asp:Label ID="LanzamientoP" runat="server" Text="Año 0"></asp:Label>
                        </p>
                        <p>
                            <b>Genero: </b>
                            <asp:Label ID="GeneroP" runat="server" Text="Hentai"></asp:Label>
                        </p>
                        <p>
                            <b>Otros Generos: </b>
                            <asp:Label ID="OGenerosP" runat="server" Text="Lolicon, Eroguro, Shonen, Kodomo"></asp:Label>
                        </p>
                        <p>
                            <b>Duracion: </b>
                            <asp:Label ID="DuracionP" runat="server" Text="Una eternidad"></asp:Label>
                        </p>
                        <p>
                            <b>Estado: </b>
                            <asp:Label ID="EstadoP" runat="server" Text="En Emisión"></asp:Label>
                        </p>
                    </div>
                    <asp:Label ID="APersonalP" CssClass="uk-card-badge uk-text-justify uk-label uk-width-auto" runat="server" Text="Detalles"></asp:Label>
                    <div>
                        <asp:Label ID="DescripcionP" CssClass="uk-text-justify uk-align-center" runat="server" Text="Descripcion del Pelicula"></asp:Label>
                    </div>
                </div>
                <div class="uk-section-small">
                    <asp:GridView ID="GrillaPeliculaUsuario" DataKeyNames="id_PeliculaUsuario" CssClass="uk-table uk-table-divider uk-table-small" AutoGenerateColumns="false"
                        GridLines="None" runat="server" OnRowDataBound="GrillaPeliculaUsuario_RowDataBound" OnRowEditing="GrillaPeliculaUsuario_RowEditing" OnRowCancelingEdit="GrillaPeliculaUsuario_RowCancelingEdit"
                        OnRowUpdating="GrillaPeliculaUsuario_RowUpdating" OnRowDeleting="GrillaPeliculaUsuario_RowDeleting">
                        <Columns>
                                <asp:TemplateField HeaderText="ID Juego" Visible="false">
                                    <ItemTemplate>
                                        <asp:Label ID="lbl_id" runat="server" Text='<%# Eval("id_PeliculaUsuario") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                            <asp:TemplateField ControlStyle-CssClass="uk-form-width-small">
                                <EditItemTemplate>
                                    <asp:DropDownList ID="dd_APelicula" CssClass="uk-select  uk-form-width-large" runat="server" DataSourceID="APelicula_DS" DataTextField="Descripcion" DataValueField="id_AvancePelicula"></asp:DropDownList>
                                </EditItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Nota">
                                <ItemTemplate>
                                    <asp:Label ID="lbl_Nota" CssClass="uk-form-width-large" Text='<%# Eval("Nota") %>' runat="server"></asp:Label>
                                </ItemTemplate>
                                <EditItemTemplate>
                                    <asp:TextBox ID="txt_nota" Text='<%# Eval("Nota") %>' CssClass="uk-input" runat="server"></asp:TextBox>
                                </EditItemTemplate>
                            </asp:TemplateField>
                            <asp:CommandField ButtonType="Link" ShowEditButton="true" EditText="<span uk-icon='icon: pencil' uk-tooltip='title: Editar'></span>"
                                    CancelText="<span uk-icon='icon: close'></span>" UpdateText="<span uk-icon='icon: check'></span>"
                                    ShowDeleteButton="true" DeleteText="<span uk-icon='icon: trash' uk-tooltip='title: Eliminar de mi lista'></span>" />
                        </Columns>
                    </asp:GridView>
                </div>
            </div>
        </div>
    </div>

    <asp:LinqDataSource ID="APelicula_DS" runat="server" ContextTypeName="ConexionLQDataContext" EntityTypeName="" TableName="Avance_Pelicula">
    </asp:LinqDataSource>
</asp:Content>

