﻿<%@ Page Title="Listado de Juegos" Language="C#" MasterPageFile="~/MasterPage/MP_Inicial.master" AutoEventWireup="true" CodeFile="Juegos.aspx.cs" Inherits="NavInvitado_Juegos" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div class="uk-section-default">
        <div id="test-filter" class="uk-section uk-light uk-background-cover uk-overflow-hidden uk-flex uk-flex-top" uk-parallax="bgy: -100; sepia: 100;" style="background-image: url(../img/GameGuestBG.jpg); height: 70vh">
            <div class="uk-width-1-2@m uk-text-center uk-margin-auto uk-margin-auto-vertical" uk-parallax="target: #test-filter; blur: 0,10;">
                <div class="uk-overlay uk-overlay-primary uk-width-medium">
                    <h1>Juegos</h1>
                </div>
            </div>
        </div>
    </div>

    <div class="uk-section-default uk-margin">
        <div class="uk-section">
            <div class=" uk-container-expand">
                <h1 class="uk-article-title uk-text-center uk-heading">Lista de Juegos</h1>
                <br />
                <div class="uk-flex uk-flex-center" uk-grid>
                    <asp:listview id="GameList" datakeynames="id_Juego" runat="server" onitemcommand="GameList_ItemCommand">
                        <GroupTemplate>
                            <div id="itemPlaceholderContainer" class="uk-child-width-1-4@m" runat="server">
                                <div id="itemPlaceholder" runat="server">
                                </div>
                            </div>
                        </GroupTemplate>
                        <ItemTemplate>
                            <div class="uk-card uk-card-default uk-width-medium uk-height-medium uk-box-shadow-xlarge uk-box-shadow-hover-small">
                                <div class="uk-card-media-top image-wrapper">
                                    <img class="card-img" src="../img/games/<%# Eval("Imagen") %>" alt="">
                                </div>
                                <div class="uk-card-body uk-padding-small">
                                    <asp:Label ID="Label1" runat="server" CssClass="uk-card-title uk-align-center uk-text-truncate" Text='<%# Eval("Nombre") %>'></asp:Label>
                                    <asp:Button ID="Button1" CssClass="uk-button uk-button-primary boton-ver uk-light uk-position-bottom uk-width-1-1 uk-margin-medium" runat="server" Text="Ver" CommandName="Select" CommandArgument='<%# Eval("id_Juego") %>' />
                                </div>
                            </div>
                        </ItemTemplate>
                    </asp:listview>
                </div>
            </div>
        </div>
    </div>
</asp:Content>

