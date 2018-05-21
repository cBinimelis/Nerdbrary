<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage/MP_Central.master" AutoEventWireup="true" CodeFile="Lista_Desarrolladores.aspx.cs" Inherits="NavPrivada_Lista_Desarrolladores" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div class="uk-section-default">
        <div id="test-filter" class="uk-section uk-light uk-background-cover uk-overflow-hidden uk-flex uk-flex-top" uk-parallax="bgyu: -200; sepia: 100;" style="background-image: url(../img/DevListBG.jpg); height: 70vh">
            <div class="uk-width-1-2@m uk-text-center uk-margin-auto uk-margin-auto-vertical" uk-parallax="target: #test-filter; blur: 0,10;">
                <div class="uk-overlay uk-overlay-primary uk-width-large">
                    <h1>Desarrolladores</h1>
                </div>
            </div>
        </div>
    </div>
    <div class="uk-section-default uk-margin">
        <div class="uk-section">
            <div class="uk-container">
                <h1 class="uk-article-title uk-text-center uk-heading-bullet">Lista de desarrolladores</h1>
                <div class="uk-margin">
                    <div class="uk-inline">
                        <asp:TextBox ID="txt_buscar" CssClass="uk-input uk-width-large" runat="server"></asp:TextBox>
                        <asp:Button ID="Button1" CssClass="uk-button uk-position-right uk-button-default" runat="server" Text="Buscar" OnClick="Button1_Click" />
                    </div>
                </div>
                <div class="uk-flex uk-flex-center" uk-grid>
                    <asp:ListView ID="DevList" DataKeyNames="id_Desarrollador" runat="server" OnItemCommand="DevList_ItemCommand">
                        <GroupTemplate>
                            <div id="itemPlaceholderContainer" class="uk-child-width-1-4@m" runat="server">
                                <div id="itemPlaceholder" runat="server">
                                </div>
                            </div>
                        </GroupTemplate>
                        <ItemTemplate>
                            <div class="uk-card uk-card-default uk-width-medium uk-height-medium uk-box-shadow-xlarge uk-box-shadow-hover-small">
                                <div class="uk-card-media-top uk-width-medium">
                                    <img src="../img/games/developer/<%# Eval("Imagen") %>" alt="">
                                </div>
                                <div class="uk-card-body uk-padding-small">
                                    <h3 class="uk-card-title">
                                        <asp:Label ID="lbl_nombre" runat="server" CssClass="uk-card-title uk-align-center uk-text-truncate" Text='<%# Eval("Nombre") %>'></asp:Label>
                                    </h3>
                                    <asp:Button ID="btn_ver" CssClass="uk-button uk-button-primary boton-ver uk-light uk-position-bottom uk-width-1-1 uk-margin-medium" runat="server" Text="Ver Juegos" CommandName="Select" CommandArgument='<%# Eval("id_Desarrollador") %>' />
                                </div>
                            </div>
                        </ItemTemplate>
                    </asp:ListView>
                </div>
            </div>
        </div>
    </div>
</asp:Content>

