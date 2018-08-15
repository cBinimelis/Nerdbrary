<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage/MP_Central.master" AutoEventWireup="true" CodeFile="Lista_Anime.aspx.cs" Inherits="NavPrivada_Anime" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div class="uk-section-default">
        <div id="test-filter" class="uk-section uk-light uk-background-cover uk-overflow-hidden uk-flex uk-flex-top" uk-parallax="bgyu: -200; sepia: 100;" style="background-image: url(../img/AnimeBG.jpg); height: 70vh">
            <div class="uk-width-1-2@m uk-text-center uk-margin-auto uk-margin-auto-vertical" uk-parallax="target: #test-filter; blur: 0,10;">
                <div class="uk-overlay uk-overlay-primary uk-width-medium">
                    <h1>Anime</h1>
                </div>
            </div>
        </div>
    </div>

    <div class="uk-section-default uk-margin">
        <div class="uk-section">
            <div class="uk-container">
                <h1 class=" uk-heading-primary uk-text-center">Lista de Anime</h1>
                <div class="uk-margin">
                    <div class="uk-inline">
                        <asp:TextBox ID="txt_buscar" autocomplete="off" CssClass="uk-input uk-width-large" runat="server"></asp:TextBox>
                        <asp:Button ID="btn_buscar" CssClass="uk-button uk-position-right uk-button-default" runat="server" Text="Buscar" OnClick="btn_buscar_Click" />
                    </div>
                </div>
                <ul  uk-switcher="animation: uk-animation-fade" uk-tab>
                    <li><a href="#">Todos</a></li>
                    <li><a href="#">No agregados</a></li>
                </ul>

                <ul class="uk-switcher uk-margin">
                    <li>
                        <div class="uk-card uk-card-default">
                            <div class="uk-card-body uk-overflow-auto">
                                <asp:GridView ID="GrillaAnime" DataKeyNames="id_Anime" CssClass="uk-table uk-table-divider uk-table-small" AutoGenerateColumns="False"
                                    BorderStyle="None" GridLines="None" runat="server" OnRowCommand="GrillaAnime_RowCommand">
                                    <Columns>
                                        <asp:TemplateField HeaderText="ID Anime" Visible="false">
                                            <ItemTemplate>
                                                <asp:Label ID="lbl_id" runat="server" Text='<%# Eval("id_Anime") %>'></asp:Label>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Nombre de la serie" ItemStyle-CssClass="uk-text-truncate">
                                            <ItemTemplate>
                                                <asp:Label ID="lbl_nombre" CssClass="uk-width-expand" runat="server" Text='<%# Eval("Nombre") %>'></asp:Label>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Lanzamiento" ItemStyle-CssClass="uk-form-width-small">
                                            <ItemTemplate>
                                                <asp:Label ID="lbl_lanzamiento" runat="server" Text='<%# Eval("Lanzamiento") %>'></asp:Label>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Capitulos" ItemStyle-CssClass="uk-form-width-small">
                                            <ItemTemplate>
                                                <asp:Label ID="lbl_capitulos" runat="server" Text='<%# Eval("Capitulos") %>'></asp:Label>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Genero" ItemStyle-CssClass="uk-form-width-small">
                                            <ItemTemplate>
                                                <asp:Label ID="lbl_genero" runat="server" Text='<%# Eval("Genero") %>'></asp:Label>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Estado" ItemStyle-CssClass="uk-form-width-small">
                                            <ItemTemplate>
                                                <asp:Label ID="lbl_Estado" runat="server" Text='<%# Eval("Estado") %>'></asp:Label>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField>
                                            <ItemTemplate>
                                                <asp:Button ID="btn_ver" CssClass="uk-button uk-button-primary uk-button-small" runat="server" Text="Ver" CommandName="Select" CommandArgument="<%# Container.DataItemIndex %>" />
                                                <asp:Button ID="btn_agregar" CssClass="uk-button uk-button-primary uk-button-small" runat="server" Text="Agregar" CommandName="Add" CommandArgument="<%# Container.DataItemIndex %>" />
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                    </Columns>
                                </asp:GridView>
                            </div>
                        </div>
                    </li>
                    <li>
                        <div class="uk-card uk-card-default">
                            <div class="uk-card-body uk-overflow-auto">
                                <asp:GridView ID="GrillaAnimeNA" DataKeyNames="id_Anime" CssClass="uk-table uk-table-divider uk-table-small" AutoGenerateColumns="False"
                                    BorderStyle="None" GridLines="None" runat="server" OnRowCommand="GrillaAnime_RowCommand">
                                    <Columns>
                                        <asp:TemplateField HeaderText="ID Anime" Visible="false">
                                            <ItemTemplate>
                                                <asp:Label ID="lbl_id" runat="server" Text='<%# Eval("id_Anime") %>'></asp:Label>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Nombre de la serie" ItemStyle-CssClass="uk-text-truncate">
                                            <ItemTemplate>
                                                <asp:Label ID="lbl_nombre" CssClass="uk-width-expand" runat="server" Text='<%# Eval("Nombre") %>'></asp:Label>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Lanzamiento" ItemStyle-CssClass="uk-form-width-small">
                                            <ItemTemplate>
                                                <asp:Label ID="lbl_lanzamiento" runat="server" Text='<%# Eval("Lanzamiento") %>'></asp:Label>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Capitulos" ItemStyle-CssClass="uk-form-width-small">
                                            <ItemTemplate>
                                                <asp:Label ID="lbl_capitulos" runat="server" Text='<%# Eval("Capitulos") %>'></asp:Label>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Genero" ItemStyle-CssClass="uk-form-width-small">
                                            <ItemTemplate>
                                                <asp:Label ID="lbl_genero" runat="server" Text='<%# Eval("Genero") %>'></asp:Label>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Estado" ItemStyle-CssClass="uk-form-width-small">
                                            <ItemTemplate>
                                                <asp:Label ID="lbl_Estado" runat="server" Text='<%# Eval("Estado") %>'></asp:Label>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField>
                                            <ItemTemplate>
                                                <asp:Button ID="btn_ver" CssClass="uk-button uk-button-primary uk-button-small" runat="server" Text="Ver" CommandName="Select" CommandArgument="<%# Container.DataItemIndex %>" />
                                                <asp:Button ID="btn_agregar" CssClass="uk-button uk-button-primary uk-button-small" runat="server" Text="Agregar" CommandName="Add" CommandArgument="<%# Container.DataItemIndex %>" />
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                    </Columns>
                                </asp:GridView>
                            </div>
                        </div></li>
                    <li>Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur, sed do eiusmod.</li>
                </ul>
            </div>
        </div>
    </div>
</asp:Content>

