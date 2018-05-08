<%@ Page Title="Lista de Anime" Language="C#" MasterPageFile="~/MasterPage/MP_Inicial.master" AutoEventWireup="true" CodeFile="AnimeInvitado.aspx.cs" Inherits="NavVisitas_AnimeVisitas" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div class="uk-section-default">
        <div id="test-filter" class="uk-section uk-light uk-background-cover uk-overflow-hidden uk-flex uk-flex-top" uk-parallax="bgyu: -200; sepia: 100;" style="background-image: url(../img/AnimeGuestBG.jpg); height: 70vh">
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
                                <asp:TemplateField HeaderText="Nombre">
                                    <ItemTemplate>
                                        <asp:Label ID="lbl_nombre" runat="server" Text='<%# Eval("Nombre") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Lanzamiento">
                                    <ItemTemplate>
                                        <asp:Label ID="lbl_lanzamiento" runat="server" Text='<%# Eval("Lanzamiento") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Total Capítulos">
                                    <ItemTemplate>
                                        <asp:Label ID="lbl_capitulos" runat="server" Text='<%# Eval("Capitulos") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Genero">
                                    <ItemTemplate>
                                        <asp:Label ID="lbl_genero" runat="server" Text='<%# Eval("Genero") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Estado">
                                    <ItemTemplate>
                                        <asp:Label ID="lbl_Estado" runat="server" Text='<%# Eval("Estado") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField>
                                    <ItemTemplate>
                                        <asp:Button ID="btn_ver" CssClass="uk-button uk-button-primary uk-button-small" runat="server" Text="Ver" CommandName="Select" CommandArgument="<%# Container.DataItemIndex %>" />
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <%--<asp:CommandField ButtonType="Link" ShowDeleteButton="true" DeleteText="<span uk-icon='icon: trash'></span>" />--%>
                            </Columns>
                        </asp:GridView>
                    </div>
                </div>
            </div>
        </div>
    </div>
</asp:Content>

