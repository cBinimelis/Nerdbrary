﻿<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage/MP_Central.master" AutoEventWireup="true" CodeFile="MisMangas.aspx.cs" Inherits="NavPrivada_MisMangas" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div class="uk-section-default">
        <div id="test-filter" class="uk-section uk-light uk-background-cover uk-overflow-hidden uk-flex uk-flex-top" uk-parallax="bgyu: -200; sepia: 100;" style="background-image: url(../img/MyAnimeBG.jpg); height: 70vh">
            <div class="uk-width-1-2@m uk-text-center uk-margin-auto uk-margin-auto-vertical" uk-parallax="target: #test-filter; blur: 0,10;">
                <div class="uk-overlay uk-overlay-primary uk-width-medium">
                    <h1>Anime</h1>
                </div>
            </div>
        </div>
    </div>

    <div class="uk-section-default uk-margin">
        <div class="uk-section">
            <div class=" uk-container-expand">
                <h1 class="uk-article-title uk-text-center uk-heading-bullet">Mi Anime</h1>
                <div class="uk-flex uk-flex-center" uk-grid>
                    <asp:ListView ID="MangaList" DataKeyNames="id_Manga" runat="server" OnItemCommand="MangaList_ItemCommand">
                        <GroupTemplate>
                            <div id="itemPlaceholderContainer" class="uk-child-width-1-4@m" runat="server">
                                <div id="itemPlaceholder" runat="server">
                                </div>
                            </div>
                        </GroupTemplate>
                        <ItemTemplate>
                            <div class="uk-card uk-card-default uk-width-medium uk-height-medium">
                                <div class="uk-card-media-top uk-width-medium">
                                    <img src="../img/manga/<%# Eval("Imagen") %>" alt="">
                                </div>
                                <div class="uk-card-body uk-padding-small">
                                    <h3 class="uk-card-title">
                                        <asp:Label ID="lbl_nombre" runat="server" Text='<%# Eval("Nombre") %>'></asp:Label>
                                    </h3>
                                    <asp:Button ID="btn_ver" CssClass="uk-button uk-text-truncate uk-button-primary uk-button-small" runat="server" Text="Ver" CommandName="Select" CommandArgument='<%# Eval("id_manga") %>' />
                                </div>
                            </div>
                        </ItemTemplate>
                    </asp:ListView>
                </div>

            </div>

        </div>
    </div>
</asp:Content>

