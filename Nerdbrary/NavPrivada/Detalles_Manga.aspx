<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage/MP_Central.master" AutoEventWireup="true" CodeFile="Detalles_Manga.aspx.cs" Inherits="NavPrivada_MangaDetalles" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div class="uk-section-default">
        <div id="Cover" runat="server" class="background"></div>
        <div class="uk-container uk-card uk-card-default uk-align-center uk-animation-slide-left">
            <div class="uk-card-body uk-card-medium">
                <h1 class="uk-text-center uk-heading-line uk-padding-small">
                    <asp:Label ID="TituloA" runat="server" Text="Waifu para rellenar"></asp:Label></h1>
                <img id="imagen" class="uk-align-center uk-height-medium@m uk-margin-remove-adjacent" runat="server" src="../img/anime/default.jpg" alt="Imagen del anime" />
                <div class="uk-child-width-1-2@m" uk-grid>
                    <div>
                        <p>
                            <b>Tomos: </b>
                            <asp:Label ID="TomosM" runat="server" Text="Más temporadas que Conan"></asp:Label>
                        </p>
                        <p>
                            <b>Lanzamiento: </b>
                            <asp:Label ID="LanzamientoM" runat="server" Text="Año 0"></asp:Label>
                        </p>
                        <p>
                            <b>Genero: </b>
                            <asp:Label ID="GeneroM" runat="server" Text="Hentai"></asp:Label>
                        </p>
                        <p>
                            <b>Otros Generos: </b>
                            <asp:Label ID="OGenerosM" runat="server" Text="Lolicon, Eroguro, Shonen, Kodomo"></asp:Label>
                        </p>
                        <p>
                            <b>Estado: </b>
                            <asp:Label ID="EstadoM" runat="server" Text="En Emisión"></asp:Label>
                        </p>
                    </div>
                    <asp:Label ID="APersonalM" CssClass="uk-card-badge uk-text-justify uk-label uk-width-auto" runat="server" Text="Detalles"></asp:Label>
                    <div>
                        <asp:Label ID="DescripcionM" CssClass="uk-text-justify uk-align-center" runat="server" Text="Descripcion del Anime"></asp:Label>
                    </div>
                </div>
                <div class="uk-section-small">
                    <asp:GridView ID="GrillaMangaUsuario" DataKeyNames="id_MangaUsuario" CssClass="uk-table uk-table-divider uk-table-small" AutoGenerateColumns="false"
                        GridLines="None" runat="server" OnRowDataBound="GrillaMangaUsuario_RowDataBound" OnRowEditing="GrillaMangaUsuario_RowEditing" OnRowCancelingEdit="GrillaMangaUsuario_RowCancelingEdit"
                        OnRowUpdating="GrillaMangaUsuario_RowUpdating" OnRowDeleting="GrillaMangaUsuario_RowDeleting">
                        <Columns>
                                <asp:TemplateField HeaderText="ID Anime" Visible="false">
                                    <ItemTemplate>
                                        <asp:Label ID="lbl_id" runat="server" Text='<%# Eval("id_MangaUsuario") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                            <asp:TemplateField ControlStyle-CssClass="uk-form-width-small">
                                <EditItemTemplate>
                                    <asp:DropDownList ID="dd_AManga" CssClass="uk-select  uk-form-width-large" runat="server" DataSourceID="AMManga_DS" DataTextField="Descripcion" DataValueField="id_AvanceManga"></asp:DropDownList>
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

    <asp:LinqDataSource ID="AMManga_DS" runat="server" ContextTypeName="ConexionLQDataContext" EntityTypeName="" TableName="Avance_Manga">
    </asp:LinqDataSource>
</asp:Content>

