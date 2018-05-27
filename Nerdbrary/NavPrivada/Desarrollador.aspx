<%@ Page Title="Desarrollador" Language="C#" MasterPageFile="~/MasterPage/MP_Central.master" AutoEventWireup="true" CodeFile="Desarrollador.aspx.cs" Inherits="NavPrivada_Desarrollador" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">

    <div class="uk-section-default">
        <div id="MainCover" runat="server" class="uk-section uk-light uk-background-cover uk-flex uk-flex-top" uk-parallax="bgyu: -200; sepia: 100;" style="background-image: url(../img/MyGamesBG.jpg); height: 70vh">
        </div>
    </div>

    <div class="uk-section-default uk-margin">
        <div class="uk-section">
            <div class="uk-container-expand">
                <div class="uk-container">
                    <article class="uk-article uk-padding">
                        <h1 class="uk-article-title uk-text-center uk-heading-bullet">
                            <asp:Label ID="Titulo" runat="server" Text="Developer"></asp:Label></h1>
                        <p class="uk-dropcap">
                            <asp:Label ID="DetallesDev" CssClass="uk-text-justify" runat="server" Text="Label"></asp:Label></p>
                    </article>
                </div>
                <div class="uk-flex uk-flex-center" uk-grid>
                    <asp:ListView ID="GameList" DataKeyNames="id_Juego" runat="server" OnItemCommand="GameList_ItemCommand">
                        <GroupTemplate>
                            <div id="itemPlaceholderContainer" class="uk-child-width-1-4@m" runat="server">
                                <div id="itemPlaceholder" runat="server">
                                </div>
                            </div>
                        </GroupTemplate>
                        <ItemTemplate>
                            <div class="uk-card uk-card-default uk-width-medium uk-height-medium">
                                <div class="uk-card-media-top uk-width-medium">
                                    <img src="../img/games/<%# Eval("Imagen") %>" alt="">
                                </div>
                                <div class="uk-card-body uk-padding-small">
                                    <h3 class="uk-card-title">
                                        <asp:Label ID="lbl_nombre" CssClass="uk-text-truncate" runat="server" Text='<%# Eval("Nombre") %>'></asp:Label>
                                    </h3>
                                    <asp:Button ID="btn_ver" CssClass="uk-button uk-button-primary uk-align-center uk-button-small" runat="server" Text="Ver" CommandName="Select" CommandArgument='<%# Eval("id_Juego") %>' />
                                </div>
                            </div>
                        </ItemTemplate>
                    </asp:ListView>
                </div>

            </div>

        </div>
    </div>
</asp:Content>

