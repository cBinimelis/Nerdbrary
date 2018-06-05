<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage/MP_Central.master" AutoEventWireup="true" CodeFile="PerfilUsuario.aspx.cs" Inherits="NavPrivada_PerfilUsuario" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div class="uk-section-default">
        <div id="Cover" runat="server" class="background" style="background-image: url(../img/logincover1.jpg)"></div>
        <div class="uk-container uk-card uk-card-default uk-align-center uk-animation-slide-left">
            <div class="uk-card-body uk-card-medium">
                <h1 class="uk-text-center uk-heading-line uk-padding-small">
                    <asp:Label ID="TituloA" runat="server" Text="Mi Perfil"></asp:Label></h1>


                <div class="uk-child-width-1-2@m" uk-grid>
                    <div>
                        <img id="imagen" class="uk-align-center uk-height-medium@m uk-margin-remove-adjacent" runat="server" src="../img/anime/default.jpg" alt="Imagen del Serie" />
                    </div>
                    <div>
                        <p>
                            <b>Temporadas: </b>
                            <asp:Label ID="Nombre" runat="server" Text="Más temporadas que Conan"></asp:Label>
                        </p>
                        <p>
                            <b>Capitulos: </b>
                            <asp:Label ID="CapitulosS" runat="server" Text="Chorrocientos mil"></asp:Label>
                        </p>
                        <p>
                            <b>Lanzamiento: </b>
                            <asp:Label ID="LanzamientoS" runat="server" Text="Año 0"></asp:Label>
                        </p>
                        <p>
                            <b>Genero: </b>
                            <asp:Label ID="GeneroS" runat="server" Text="Hentai"></asp:Label>
                        </p>
                        <p>
                            <b>Otros Generos: </b>
                            <asp:Label ID="OGenerosS" runat="server" Text="Lolicon, Eroguro, Shonen, Kodomo"></asp:Label>
                        </p>
                        <p>
                            <b>Estado: </b>
                            <asp:Label ID="EstadoA" runat="server" Text="En Emisión"></asp:Label>
                        </p>
                    </div>
                    <asp:Label ID="APersonalS" CssClass="uk-card-badge uk-text-justify uk-label uk-width-auto" runat="server" Text="Detalles"></asp:Label>
                </div>
                <div class="uk-section-small">
                    <div class="uk-child-width-1-3@s uk-grid-match" uk-grid>
                        <div>
                            <div class="uk-card uk-card-hover uk-card-body">
                                <h3 class="uk-card-title">Hover</h3>
                                <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit.</p>
                            </div>
                        </div>
                        <div>
                            <div class="uk-card uk-card-hover uk-card-body">
                                <h3 class="uk-card-title">Hover</h3>
                                <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit.</p>
                            </div>
                        </div>
                        <div>
                            <div class="uk-card uk-card-hover uk-card-body">
                                <h3 class="uk-card-title">Hover</h3>
                                <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit.</p>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</asp:Content>

