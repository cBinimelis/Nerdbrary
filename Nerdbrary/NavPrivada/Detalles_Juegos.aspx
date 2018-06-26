<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage/MP_Central.master" AutoEventWireup="true" CodeFile="Detalles_Juegos.aspx.cs" Inherits="NavPrivada_JuegosDetalles" %>

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
                            <b>Desarrollador: </b>
                            <asp:Label ID="DesarrolladorJ" runat="server" Text="Beelzebooz"></asp:Label>
                            <a href="#" id="lnk_Desarrollador" runat="server" class="uk-icon-button" uk-tooltip='title: Ver más de este desarrollador' uk-icon="search"></a>
                        </p>
                        <p>
                            <b>Lanzamiento: </b>
                            <asp:Label ID="LanzamientoJ" runat="server" Text="Año 0"></asp:Label>
                        </p>
                        <p>
                            <b>Genero: </b>
                            <asp:Label ID="GeneroJ" runat="server" Text="Hentai"></asp:Label>
                        </p>
                        <p>
                            <b>Otros Generos: </b>
                            <asp:Label ID="OGenerosJ" runat="server" Text="Lolicon, Eroguro, Shonen, Kodomo"></asp:Label>
                        </p>
                        <p>
                            <b>Estado: </b>
                            <asp:Label ID="EstadoJ" runat="server" Text="En Emisión"></asp:Label>
                        </p>
                    </div>
                    <asp:Label ID="APersonalJ" CssClass="uk-card-badge uk-text-justify uk-label uk-width-auto" runat="server" Text="Detalles"></asp:Label>
                    <div>
                        <asp:Label ID="DescripcionJ" CssClass="uk-text-justify uk-align-center" runat="server" Text="Descripcion del Anime"></asp:Label>
                    </div>
                </div>
                <div class="uk-section-small">
                    <asp:GridView ID="GrillaJuegosUsuario" DataKeyNames="id_JuegoUsuario" CssClass="uk-table uk-table-divider uk-table-small" AutoGenerateColumns="false"
                        GridLines="None" runat="server" OnRowDataBound="GrillaJuegosUsuario_RowDataBound" OnRowEditing="GrillaJuegosUsuario_RowEditing" OnRowCancelingEdit="GrillaJuegosUsuario_RowCancelingEdit"
                        OnRowUpdating="GrillaJuegosUsuario_RowUpdating" OnRowDeleting="GrillaJuegosUsuario_RowDeleting">
                        <Columns>
                                <asp:TemplateField HeaderText="ID Juego" Visible="false">
                                    <ItemTemplate>
                                        <asp:Label ID="lbl_id" runat="server" Text='<%# Eval("id_JuegoUsuario") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                            <asp:TemplateField ControlStyle-CssClass="uk-form-width-small">
                                <EditItemTemplate>
                                    <asp:DropDownList ID="dd_AJuego" CssClass="uk-select  uk-form-width-large" runat="server" DataSourceID="AJuegos_DS" DataTextField="Descripcion" DataValueField="id_AvanceJuego"></asp:DropDownList>
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

    <asp:LinqDataSource ID="AJuegos_DS" runat="server" ContextTypeName="ConexionLQDataContext" EntityTypeName="" TableName="Avance_Juego">
    </asp:LinqDataSource>
</asp:Content>

