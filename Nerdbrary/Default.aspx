﻿<%@ Page Title="" Language="C#" MasterPageFile="MasterPage/MP_Inicial.master" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="_Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">

    <div class="uk-overflow-hidden">
        <div class="uk-background-cover uk-height-viewport" style="background-image: url(img/ÑoñoBG.jpg);">
        </div>
    </div>
    <div class="uk-section-muted uk-padding">
        <div class="uk-container">
            <h1 class="uk-text-center uk-heading-line uk-padding-small">Elementos en el sistema</h1>

            <!--Elemento para evitar problemas con el counter-->
            <h1 class="count" style="display:none">2222</h1>

            <div class="uk-child-width-1-2 uk-child-width-1-3@m uk-text-center uk-flex-center" uk-grid>
                <div>
                    <a href="NavInvitado/Anime.aspx" class="uk-link-reset">
                        <div class="uk-card uk-card-hover uk-card-body uk-text-center">
                            <asp:Label ID="lbl_Anime" CssClass="count uk-heading-primary" runat="server" Text="1111"></asp:Label>
                            <p>Animes</p>
                        </div>
                    </a>
                </div>
                <div>
                    <a href="NavInvitado/Juegos.aspx" class="uk-link-reset">
                        <div class="uk-card uk-card-hover uk-card-body uk-text-center">
                            <asp:Label ID="lbl_Juegos" CssClass="count uk-heading-primary" runat="server" Text="2222"></asp:Label>
                            <p>Juegos</p>
                        </div>
                    </a>
                </div>
                <div>
                    <a href="NavInvitado/Manga.aspx" class="uk-link-reset">
                        <div class="uk-card uk-card-hover uk-card-body uk-text-center">
                            <asp:Label ID="lbl_Mangas" CssClass="count uk-heading-primary" runat="server" Text="3333"></asp:Label>
                            <p>Mangas</p>
                        </div>
                    </a>
                </div>
                <div>
                    <a href="Lista_Series.aspx" class="uk-link-reset">
                        <div class="uk-card uk-card-hover uk-card-body uk-text-center">
                            <asp:Label ID="lbl_Series" CssClass="count uk-heading-primary" runat="server" Text="3333"></asp:Label>
                            <p>Series</p>
                        </div>
                    </a>
                </div>
                <div>
                    <a href="Lista_Peliculas.aspx" class="uk-link-reset">
                        <div class="uk-card uk-card-hover uk-card-body uk-text-center">
                            <asp:Label ID="lbl_Peliculas" CssClass="count uk-heading-primary" runat="server" Text="3333"></asp:Label>
                            <p>Peliculas</p>
                        </div>
                    </a>
                </div>
                <div>
                    <a href="Lista_Libros.aspx" class="uk-link-reset">
                        <div class="uk-card uk-card-hover uk-card-body uk-text-center">
                            <asp:Label ID="lbl_Libros" CssClass="count uk-heading-primary" runat="server" Text="3333"></asp:Label>
                            <p>Libros</p>
                        </div>
                    </a>
                </div>
            </div>
        </div>
    </div>
</asp:Content>

