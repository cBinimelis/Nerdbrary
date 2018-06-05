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
                            <b>Usuario: </b>
                            <asp:Label ID="User" runat="server" Text="Más temporadas que Conan"></asp:Label>
                        </p>
                        <p>
                            <b>Nombre: </b>
                            <asp:Label ID="Nombre" runat="server" Text="blabla"></asp:Label>
                        </p>
                        <p>
                            <b>Estado: </b>
                            <asp:Label ID="CapitulosS" runat="server" Text="Activo"></asp:Label>
                        </p>
                        <p>
                            <b>Tipo de Usuario: </b>
                            <asp:Label ID="LanzamientoS" runat="server" Text="Administrador"></asp:Label>
                        </p>
                    </div>
                    <asp:Label ID="Preferido" CssClass="uk-card-badge uk-text-justify uk-label uk-width-auto" runat="server" Text="Anime"></asp:Label>
                </div>
                <div class="uk-section-small">
                <h1 class="uk-text-center uk-heading-line uk-padding-small">
                    <asp:Label ID="Label1" runat="server" Text="Contador de Vicios"></asp:Label></h1>
                    <div class="uk-child-width-1-3@s uk-grid-match" uk-grid>
                        <div>
                            <div class="uk-card uk-card-hover uk-card-body uk-text-center">
                                <asp:Label ID="lbl_Anime" CssClass="count uk-heading-primary" runat="server" Text="1111"></asp:Label>
                                <p>Animes</p>
                            </div>
                        </div>
                        <div>
                            <div class="uk-card uk-card-hover uk-card-body uk-text-center">
                                <asp:Label ID="lbl_Juegos" CssClass="count uk-heading-primary" runat="server" Text="2222"></asp:Label>
                                <p>Juegos</p>
                            </div>
                        </div>
                        <div>
                            <div class="uk-card uk-card-hover uk-card-body uk-text-center">
                                <asp:Label ID="lbl_Mangas" CssClass="count uk-heading-primary" runat="server" Text="3333"></asp:Label>
                                <p>Mangas</p>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</asp:Content>

