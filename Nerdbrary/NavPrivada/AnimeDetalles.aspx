<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage/MP_Central.master" AutoEventWireup="true" CodeFile="AnimeDetalles.aspx.cs" Inherits="NavPrivada_AnimeDetalles" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div class="uk-section-default">
        <div id="Cover" runat="server" class="background uk-position-absolute uk-background-fixed"></div>
        <div class="uk-container uk-card uk-card-default uk-align-center uk-animation-slide-left">
            <div class="uk-card-body uk-card-medium">
                <h1 class="uk-text-center uk-heading-line ">
                    <asp:Label ID="TituloA" runat="server" Text="Waifu para rellenar"></asp:Label></h1>
                <img id="imagen" class="uk-align-center uk-height-medium@m uk-margin-remove-adjacent" runat="server" src="../img/anime/default.jpg" alt="Imagen del anime" />
                <div class="uk-child-width-1-2@m" uk-grid>
                    <div>
                        <p>
                            <b>Temporadas: </b>
                            <asp:Label ID="TemporadasA" runat="server" Text="Más temporadas que Conan"></asp:Label>
                        </p>
                        <p>
                            <b>Capitulos: </b>
                            <asp:Label ID="CapitulosA" runat="server" Text="Chorrocientos mil"></asp:Label>
                        </p>
                        <p>
                            <b>Lanzamiento: </b>
                            <asp:Label ID="LanzamientoA" runat="server" Text="Año 0"></asp:Label>
                        </p>
                        <p>
                            <b>Genero: </b>
                            <asp:Label ID="GeneroA" runat="server" Text="Hentai"></asp:Label>
                        </p>
                        <p>
                            <b>Otros Generos: </b>
                            <asp:Label ID="OGenerosA" runat="server" Text="Lolicon, Eroguro, Shonen, Kodomo"></asp:Label>
                        </p>
                        <p>
                            <b>Estado: </b>
                            <asp:Label ID="EstadoA" runat="server" Text="En Emisión"></asp:Label>
                        </p>
                    </div>
                    <asp:Label ID="APersonalA" CssClass="uk-card-badge uk-text-justify uk-label uk-width-auto" runat="server" Text="Detalles"></asp:Label>
                    <div>
                        <asp:Label ID="DescripcionA" CssClass="uk-text-justify uk-align-center" runat="server" Text="Descripcion del Anime"></asp:Label>
                    </div>
                </div>
                <div class="uk-section-small">
                    <asp:GridView ID="GrillaAnimeUsuario" DataKeyNames="id_Anime, id_Usuario" CssClass="uk-table uk-table-divider uk-table-small" AutoGenerateColumns="false"
                        GridLines="None" runat="server" Visible="false">
                        <Columns>
                            <asp:TemplateField ControlStyle-CssClass="uk-form-width-small">
                                <EditItemTemplate>
                                    <asp:DropDownList ID="dd_AAnime" runat="server" DataSourceID="AAnime_DS" DataTextField="Descripcion" DataValueField="id_AvanceAnime"></asp:DropDownList>
                                </EditItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Nota">
                                <ItemTemplate>
                                    <asp:Label ID="lbl_Nota" CssClass="uk-form-width-large" runat="server" Text='<%# Eval("Nota") %>'></asp:Label>
                                </ItemTemplate>
                                <EditItemTemplate>
                                    <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>
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

    <asp:LinqDataSource ID="AAnime_DS" runat="server" ContextTypeName="ConexionLQDataContext" EntityTypeName="" TableName="Avance_Anime">
    </asp:LinqDataSource>
</asp:Content>

