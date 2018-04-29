<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage/MP_Central.master" AutoEventWireup="true" CodeFile="AnimeDetalles.aspx.cs" Inherits="NavPrivada_AnimeDetalles" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div class="uk-section-default">
        <div class="uk-section uk-dark uk-height-viewport uk-background-fixed uk-background-cover" style="background-image: url(../img/anime/defaultbg.jpg)">
            <div class=" uk-container uk-card uk-card-default uk-animation-slide-left">
                <div class="uk-card-body uk-card-medium">
                    <h1 class="uk-title uk-text-justify">
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
                            <p>
                                <b>Avance Personal: </b>
                                <asp:Label ID="APersonalA" runat="server" Text="Visto varias veces"></asp:Label>
                            </p>
                        </div>

                        <div>
                            <asp:Label ID="DescripcionA" CssClass="uk-text-justify uk-align-center" runat="server" Text="Descripcion del Anime"></asp:Label>
                        </div>

                    </div>
                </div>
            </div>
        </div>
    </div>





</asp:Content>

