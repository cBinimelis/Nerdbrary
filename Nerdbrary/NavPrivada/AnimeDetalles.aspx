<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage/MP_Central.master" AutoEventWireup="true" CodeFile="AnimeDetalles.aspx.cs" Inherits="NavPrivada_AnimeDetalles" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">

    <div class="uk-section-default">
        <div class="uk-section uk-dark uk-height-viewport uk-background-cover" style="background-image: url(../img/anime/defaultbg.jpg)">
            <div class="uk-position-large uk-position-center uk-overlay uk-overlay-default">
                <div class="uk-container uk-width-xxlarge">
                    <div class="uk-panel">
                        <h1 class="uk-title">
                            <asp:Label ID="TituloA" runat="server" Text="Titulo"></asp:Label></h1>
                        <img id="imagen" class="uk-align-left uk-margin-remove-adjacent" runat="server" src="../img/anime/default.jpg" style="height: 300px" alt="Imagen del anime" />
                        <b>Temporadas: </b><asp:Label ID="TemporadasA" runat="server" Text="Temporadas del Anime"></asp:Label><br />
                        <b>Capitulos: </b><asp:Label ID="CapitulosA" runat="server" Text="Label"></asp:Label><br />
                        <b>Descripcion: </b><asp:Label ID="DescripcionA" CssClass="uk-text-justify" runat="server" Text="Descripcion del Anime"></asp:Label>
                    </div>
                </div>
            </div>
        </div>
    </div>







</asp:Content>

