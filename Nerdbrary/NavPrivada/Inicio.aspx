<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage/MP_Central.master" AutoEventWireup="true" CodeFile="Inicio.aspx.cs" Inherits="NavPrivada_Inicio" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div class="uk-section-default">
        <div id="FondoPrincipal" class="uk-section uk-light uk-background-cover uk-overflow-hidden uk-flex uk-flex-top" runat="server" style="background-image: url(../img/ProfileBG.png); height: 50vh">
            <div class="uk-width-1-2@m uk-text-center uk-margin-auto uk-margin-auto-vertical" uk-parallax="target: #test-filter; blur: 0,10;">
                <div class="uk-overlay uk-overlay-primary uk-width-large">
                    <div class="uk-grid-small uk-flex-middle" uk-grid>
                        <div class="uk-width-auto">
                            <img id="PPicture" width="200" height="200" class="uk-border-rounded" runat="server" src="../img/DefaultPP.png" />
                        </div>
                        <div class="uk-width-expand">
                            <asp:Label ID="Username" runat="server" CssClass="uk-card-title uk-margin-remove-bottom" Text="Tukulito Sakayama"></asp:Label><br />
                            <asp:Label ID="Descripcion" CssClass="uk-text-meta uk-margin-remove-top" runat="server" Text="Zoy Muy kul xddddd"></asp:Label>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <div class="uk-section-default">
        <div class="uk-section-secondary">
            <div class="uk-container">
                <h2 class="uk-text-center uk-margin-top">Agregar un pendiente</h2>
                <div class="uk-padding uk-flex-center" uk-grid>
                    <div class="uk-width-1-2@m ">
                        <div class="uk-inline">
                            <a class="uk-form-icon" href="Pendientes.aspx" uk-icon="icon: search" uk-tooltip="title: Ver pendientes"></a>
                            <asp:TextBox ID="txt_pendiente" CssClass="uk-input uk-form-width-large" placeholder="Ingresa el nombre... " runat="server"></asp:TextBox>
                        </div>
                    </div>
                    <asp:DropDownList ID="dd_tipoP" CssClass="uk-form-width-medium uk-select" runat="server" ForeColor="#999999"></asp:DropDownList>
                    <div class="uk-width-auto@m ">
                        <div class="uk-inline">
                            <span class="uk-form-icon" uk-icon="icon: plus"></span>
                            <asp:Button ID="btn_crear" CssClass="uk-button uk-button-primary" runat="server" Text="Crear Pendiente" OnClick="btn_crear_Click" />
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <div class="uk-section-muted uk-padding" style="background-color: #f19bff;">
        <div class="uk-container">
            <div class="uk-child-width-1-2@s uk-child-width-1-3@m uk-text-center uk-light uk-flex-center" uk-grid>

                <%--SLIDE SHOW PARA ANIME--%>
                <div>
                    <h2 class="uk-heading-divider uk-text-bold">Anime</h2>
                    <div class="uk-position-relative uk-visible-toggle uk-light uk-box-shadow-small uk-box-shadow-hover-xlarge"
                        uk-slideshow="animation: push; autoplay: true; autoplay-interval: 3000; pause-on-hover: true">

                        <ul class="uk-slideshow-items">
                            <li>
                                <img id="img_Anime1" runat="server" src="../img/AnimeGuestBG.jpg" alt="" uk-cover>
                                <div class="uk-position-center uk-position-small uk-text-center">
                                    <h2 id="tit_anime1" runat="server" uk-slideshow-parallax="y: -50,0,0; opacity: 1,1,0">Heading</h2>
                                    <p uk-slideshow-parallax="x: 200,-200"><a id="lnk_anime1" runat="server" href="#" class="uk-icon-link" uk-icon="plus"></a></p>
                                </div>
                            </li>
                            <li>
                                <img id="img_Anime2" runat="server" src="../img/LoginCover1.jpg" alt="" uk-cover>
                                <div class="uk-position-center uk-position-small uk-text-center">
                                    <h2 id="tit_anime2" runat="server" uk-slideshow-parallax="y: -50,0,0; opacity: 1,1,0">Heading</h2>
                                    <p uk-slideshow-parallax="x: 200,-200"><a id="lnk_anime2" runat="server" href="#" class="uk-icon-link" uk-icon="plus"></a></p>
                                </div>
                            </li>
                            <li>
                                <img id="img_Anime3" runat="server" src="../img/LoginCover2.jpg" alt="" uk-cover>
                                <div class="uk-position-center uk-position-small uk-text-center">
                                    <h2 id="tit_anime3" runat="server" uk-slideshow-parallax="y: -50,0,0; opacity: 1,1,0">Heading</h2>
                                    <p uk-slideshow-parallax="x: 200,-200"><a id="lnk_anime3" runat="server" href="#" class="uk-icon-link" uk-icon="plus"></a></p>
                                </div>
                            </li>
                            <li>
                                <img id="img_Anime4" runat="server" src="../img/LoginCover3.jpg" alt="" uk-cover>
                                <div class="uk-position-center uk-position-small uk-text-center">
                                    <h2 id="tit_anime4" runat="server" uk-slideshow-parallax="y: -50,0,0; opacity: 1,1,0">Heading</h2>
                                    <p uk-slideshow-parallax="x: 200,-200"><a id="lnk_anime4" runat="server" href="#" class="uk-icon-link" uk-icon="plus"></a></p>
                                </div>
                            </li>
                            <li>
                                <img id="img_Anime5" runat="server" src="../img/LoginCover4.jpg" alt="" uk-cover>
                                <div class="uk-position-center uk-position-small uk-text-center">
                                    <h2 id="tit_anime5" runat="server" uk-slideshow-parallax="y: -50,0,0; opacity: 1,1,0">Heading</h2>
                                    <p uk-slideshow-parallax="x: 200,-200"><a id="lnk_anime5" runat="server" href="#" class="uk-icon-link" uk-icon="plus"></a></p>
                                </div>
                            </li>
                        </ul>
                        <a class="uk-position-center-left uk-position-small uk-hidden-hover" href="#" uk-slidenav-previous uk-slideshow-item="previous"></a>
                        <a class="uk-position-center-right uk-position-small uk-hidden-hover" href="#" uk-slidenav-next uk-slideshow-item="next"></a>
                    </div>
                </div>


                <%--SLIDESHOW PARA JUEGOS--%>
                <div>
                    <h2 class="uk-heading-divider uk-text-bold">Juegos</h2>
                    <div class="uk-position-relative uk-visible-toggle uk-light uk-box-shadow-small uk-box-shadow-hover-xlarge"
                        uk-slideshow="animation: push; autoplay: true; autoplay-interval: 3000; pause-on-hover: true">

                        <ul class="uk-slideshow-items">
                            <li>
                                <img id="img_Juego1" runat="server" src="../img/AnimeGuestBG.jpg" alt="" uk-cover>
                                <div class="uk-position-center uk-position-small uk-text-center">
                                    <h2 id="tit_juego1" runat="server" uk-slideshow-parallax="y: -50,0,0; opacity: 1,1,0">Heading</h2>
                                    <p uk-slideshow-parallax="x: 200,-200"><a id="lnk_juego1" runat="server" href="#" class="uk-icon-link" uk-icon="plus"></a></p>
                                </div>
                            </li>
                            <li>
                                <img id="img_Juego2" runat="server" src="../img/LoginCover1.jpg" alt="" uk-cover>
                                <div class="uk-position-center uk-position-small uk-text-center">
                                    <h2 id="tit_juego2" runat="server" uk-slideshow-parallax="y: -50,0,0; opacity: 1,1,0">Heading</h2>
                                    <p uk-slideshow-parallax="x: 200,-200"><a id="lnk_juego2" runat="server" href="#" class="uk-icon-link" uk-icon="plus"></a></p>
                                </div>
                            </li>
                            <li>
                                <img id="img_Juego3" runat="server" src="../img/LoginCover2.jpg" alt="" uk-cover>
                                <div class="uk-position-center uk-position-small uk-text-center">
                                    <h2 id="tit_juego3" runat="server" uk-slideshow-parallax="y: -50,0,0; opacity: 1,1,0">Heading</h2>
                                    <p uk-slideshow-parallax="x: 200,-200"><a id="lnk_juego3" runat="server" href="#" class="uk-icon-link" uk-icon="plus"></a></p>
                                </div>
                            </li>
                            <li>
                                <img id="img_Juego4" runat="server" src="../img/LoginCover3.jpg" alt="" uk-cover>
                                <div class="uk-position-center uk-position-small uk-text-center">
                                    <h2 id="tit_juego4" runat="server" uk-slideshow-parallax="y: -50,0,0; opacity: 1,1,0">Heading</h2>
                                    <p uk-slideshow-parallax="x: 200,-200"><a id="lnk_juego4" runat="server" href="#" class="uk-icon-link" uk-icon="plus"></a></p>
                                </div>
                            </li>
                            <li>
                                <img id="img_Juego5" runat="server" src="../img/LoginCover4.jpg" alt="" uk-cover>
                                <div class="uk-position-center uk-position-small uk-text-center">
                                    <h2 id="tit_juego5" runat="server" uk-slideshow-parallax="y: -50,0,0; opacity: 1,1,0">Heading</h2>
                                    <p uk-slideshow-parallax="x: 200,-200"><a id="lnk_juego5" runat="server" href="#" class="uk-icon-link" uk-icon="plus"></a></p>
                                </div>
                            </li>
                        </ul>
                        <a class="uk-position-center-left uk-position-small uk-hidden-hover" href="#" uk-slidenav-previous uk-slideshow-item="previous"></a>
                        <a class="uk-position-center-right uk-position-small uk-hidden-hover" href="#" uk-slidenav-next uk-slideshow-item="next"></a>
                    </div>
                </div>


                <%--SLIDESHOW PARA MANGAS--%>
                <div>
                    <h2 class="uk-heading-divider uk-text-bold">Manga</h2>
                    <div class="uk-position-relative uk-visible-toggle uk-light uk-box-shadow-small uk-box-shadow-hover-xlarge"
                        uk-slideshow="animation: push; autoplay: true; autoplay-interval: 3000; pause-on-hover: true">

                        <ul class="uk-slideshow-items">
                            <li>
                                <img id="img_manga1" runat="server" src="../img/AnimeGuestBG.jpg" alt="" uk-cover>
                                <div class="uk-position-center uk-position-small uk-text-center">
                                    <h2 id="tit_manga1" runat="server" uk-slideshow-parallax="y: -50,0,0; opacity: 1,1,0">Heading</h2>
                                    <p uk-slideshow-parallax="x: 200,-200"><a id="lnk_manga1" runat="server" href="#" class="uk-icon-link" uk-icon="plus"></a></p>
                                </div>
                            </li>
                            <li>
                                <img id="img_manga2" runat="server" src="../img/LoginCover1.jpg" alt="" uk-cover>
                                <div class="uk-position-center uk-position-small uk-text-center">
                                    <h2 id="tit_manga2" runat="server" uk-slideshow-parallax="y: -50,0,0; opacity: 1,1,0">Heading</h2>
                                    <p uk-slideshow-parallax="x: 200,-200"><a id="lnk_manga2" runat="server" href="#" class="uk-icon-link" uk-icon="plus"></a></p>
                                </div>
                            </li>
                            <li>
                                <img id="img_manga3" runat="server" src="../img/LoginCover2.jpg" alt="" uk-cover>
                                <div class="uk-position-center uk-position-small uk-text-center">
                                    <h2 id="tit_manga3" runat="server" uk-slideshow-parallax="y: -50,0,0; opacity: 1,1,0">Heading</h2>
                                    <p uk-slideshow-parallax="x: 200,-200"><a id="lnk_manga3" runat="server" href="#" class="uk-icon-link" uk-icon="plus"></a></p>
                                </div>
                            </li>
                            <li>
                                <img id="img_manga4" runat="server" src="../img/LoginCover3.jpg" alt="" uk-cover>
                                <div class="uk-position-center uk-position-small uk-text-center">
                                    <h2 id="tit_manga4" runat="server" uk-slideshow-parallax="y: -50,0,0; opacity: 1,1,0">Heading</h2>
                                    <p uk-slideshow-parallax="x: 200,-200"><a id="lnk_manga4" runat="server" href="#" class="uk-icon-link" uk-icon="plus"></a></p>
                                </div>
                            </li>
                            <li>
                                <img id="img_manga5" runat="server" src="../img/LoginCover4.jpg" alt="" uk-cover>
                                <div class="uk-position-center uk-position-small uk-text-center">
                                    <h2 id="tit_manga5" runat="server" uk-slideshow-parallax="y: -50,0,0; opacity: 1,1,0">Heading</h2>
                                    <p uk-slideshow-parallax="x: 200,-200"><a id="lnk_manga5" runat="server" href="#" class="uk-icon-link" uk-icon="plus"></a></p>
                                </div>
                            </li>
                        </ul>
                        <a class="uk-position-center-left uk-position-small uk-hidden-hover" href="#" uk-slidenav-previous uk-slideshow-item="previous"></a>
                        <a class="uk-position-center-right uk-position-small uk-hidden-hover" href="#" uk-slidenav-next uk-slideshow-item="next"></a>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <div class="uk-section-muted uk-padding" style="background-color: #ba55d3;">
        <div class="uk-container">
            <div class="uk-child-width-1-2@s uk-child-width-1-3@m uk-text-center uk-light uk-flex-center" uk-grid>

                <%--SLIDE SHOW PARA SERIES--%>
                <div>
                    <h2 class="uk-heading-divider uk-text-bold">Series</h2>
                    <div class="uk-position-relative uk-visible-toggle uk-light uk-box-shadow-small uk-box-shadow-hover-xlarge"
                        uk-slideshow="animation: push; autoplay: true; autoplay-interval: 3000; pause-on-hover: true">

                        <ul class="uk-slideshow-items">
                            <li>
                                <img id="img1" runat="server" src="../img/AnimeGuestBG.jpg" alt="" uk-cover>
                                <div class="uk-position-center uk-position-small uk-text-center">
                                    <h2 id="H1" runat="server" uk-slideshow-parallax="y: -50,0,0; opacity: 1,1,0">Heading</h2>
                                    <p uk-slideshow-parallax="x: 200,-200"><a id="A1" runat="server" href="#" class="uk-icon-link" uk-icon="plus"></a></p>
                                </div>
                            </li>
                            <li>
                                <img id="img2" runat="server" src="../img/LoginCover1.jpg" alt="" uk-cover>
                                <div class="uk-position-center uk-position-small uk-text-center">
                                    <h2 id="H2" runat="server" uk-slideshow-parallax="y: -50,0,0; opacity: 1,1,0">Heading</h2>
                                    <p uk-slideshow-parallax="x: 200,-200"><a id="A2" runat="server" href="#" class="uk-icon-link" uk-icon="plus"></a></p>
                                </div>
                            </li>
                            <li>
                                <img id="img3" runat="server" src="../img/LoginCover2.jpg" alt="" uk-cover>
                                <div class="uk-position-center uk-position-small uk-text-center">
                                    <h2 id="H3" runat="server" uk-slideshow-parallax="y: -50,0,0; opacity: 1,1,0">Heading</h2>
                                    <p uk-slideshow-parallax="x: 200,-200"><a id="A3" runat="server" href="#" class="uk-icon-link" uk-icon="plus"></a></p>
                                </div>
                            </li>
                            <li>
                                <img id="img4" runat="server" src="../img/LoginCover3.jpg" alt="" uk-cover>
                                <div class="uk-position-center uk-position-small uk-text-center">
                                    <h2 id="H4" runat="server" uk-slideshow-parallax="y: -50,0,0; opacity: 1,1,0">Heading</h2>
                                    <p uk-slideshow-parallax="x: 200,-200"><a id="A4" runat="server" href="#" class="uk-icon-link" uk-icon="plus"></a></p>
                                </div>
                            </li>
                            <li>
                                <img id="img5" runat="server" src="../img/LoginCover4.jpg" alt="" uk-cover>
                                <div class="uk-position-center uk-position-small uk-text-center">
                                    <h2 id="H5" runat="server" uk-slideshow-parallax="y: -50,0,0; opacity: 1,1,0">Heading</h2>
                                    <p uk-slideshow-parallax="x: 200,-200"><a id="A5" runat="server" href="#" class="uk-icon-link" uk-icon="plus"></a></p>
                                </div>
                            </li>
                        </ul>
                        <a class="uk-position-center-left uk-position-small uk-hidden-hover" href="#" uk-slidenav-previous uk-slideshow-item="previous"></a>
                        <a class="uk-position-center-right uk-position-small uk-hidden-hover" href="#" uk-slidenav-next uk-slideshow-item="next"></a>
                    </div>
                </div>


                <%--SLIDE SHOW PARA PELICULAS--%>
                <div>
                    <h2 class="uk-heading-divider uk-text-bold">Películas</h2>
                    <div class="uk-position-relative uk-visible-toggle uk-light uk-box-shadow-small uk-box-shadow-hover-xlarge"
                        uk-slideshow="animation: push; autoplay: true; autoplay-interval: 3000; pause-on-hover: true">

                        <ul class="uk-slideshow-items">
                            <li>
                                <img id="img6" runat="server" src="../img/AnimeGuestBG.jpg" alt="" uk-cover>
                                <div class="uk-position-center uk-position-small uk-text-center">
                                    <h2 id="H6" runat="server" uk-slideshow-parallax="y: -50,0,0; opacity: 1,1,0">Heading</h2>
                                    <p uk-slideshow-parallax="x: 200,-200"><a id="A6" runat="server" href="#" class="uk-icon-link" uk-icon="plus"></a></p>
                                </div>
                            </li>
                            <li>
                                <img id="img7" runat="server" src="../img/LoginCover1.jpg" alt="" uk-cover>
                                <div class="uk-position-center uk-position-small uk-text-center">
                                    <h2 id="H7" runat="server" uk-slideshow-parallax="y: -50,0,0; opacity: 1,1,0">Heading</h2>
                                    <p uk-slideshow-parallax="x: 200,-200"><a id="A7" runat="server" href="#" class="uk-icon-link" uk-icon="plus"></a></p>
                                </div>
                            </li>
                            <li>
                                <img id="img8" runat="server" src="../img/LoginCover2.jpg" alt="" uk-cover>
                                <div class="uk-position-center uk-position-small uk-text-center">
                                    <h2 id="H8" runat="server" uk-slideshow-parallax="y: -50,0,0; opacity: 1,1,0">Heading</h2>
                                    <p uk-slideshow-parallax="x: 200,-200"><a id="A8" runat="server" href="#" class="uk-icon-link" uk-icon="plus"></a></p>
                                </div>
                            </li>
                            <li>
                                <img id="img9" runat="server" src="../img/LoginCover3.jpg" alt="" uk-cover>
                                <div class="uk-position-center uk-position-small uk-text-center">
                                    <h2 id="H9" runat="server" uk-slideshow-parallax="y: -50,0,0; opacity: 1,1,0">Heading</h2>
                                    <p uk-slideshow-parallax="x: 200,-200"><a id="A9" runat="server" href="#" class="uk-icon-link" uk-icon="plus"></a></p>
                                </div>
                            </li>
                            <li>
                                <img id="img10" runat="server" src="../img/LoginCover4.jpg" alt="" uk-cover>
                                <div class="uk-position-center uk-position-small uk-text-center">
                                    <h2 id="H10" runat="server" uk-slideshow-parallax="y: -50,0,0; opacity: 1,1,0">Heading</h2>
                                    <p uk-slideshow-parallax="x: 200,-200"><a id="A10" runat="server" href="#" class="uk-icon-link" uk-icon="plus"></a></p>
                                </div>
                            </li>
                        </ul>
                        <a class="uk-position-center-left uk-position-small uk-hidden-hover" href="#" uk-slidenav-previous uk-slideshow-item="previous"></a>
                        <a class="uk-position-center-right uk-position-small uk-hidden-hover" href="#" uk-slidenav-next uk-slideshow-item="next"></a>
                    </div>
                </div>


                <%--SLIDE SHOW PARA LIBROS--%>
                <div>
                    <h2 class="uk-heading-divider uk-text-bold">Libros</h2>
                    <div class="uk-position-relative uk-visible-toggle uk-light uk-box-shadow-small uk-box-shadow-hover-xlarge"
                        uk-slideshow="animation: push; autoplay: true; autoplay-interval: 3000; pause-on-hover: true">

                        <ul class="uk-slideshow-items">
                            <li>
                                <img id="img11" runat="server" src="../img/AnimeGuestBG.jpg" alt="" uk-cover>
                                <div class="uk-position-center uk-position-small uk-text-center">
                                    <h2 id="H11" runat="server" uk-slideshow-parallax="y: -50,0,0; opacity: 1,1,0">Heading</h2>
                                    <p uk-slideshow-parallax="x: 200,-200"><a id="A11" runat="server" href="#" class="uk-icon-link" uk-icon="plus"></a></p>
                                </div>
                            </li>
                            <li>
                                <img id="img12" runat="server" src="../img/LoginCover1.jpg" alt="" uk-cover>
                                <div class="uk-position-center uk-position-small uk-text-center">
                                    <h2 id="H12" runat="server" uk-slideshow-parallax="y: -50,0,0; opacity: 1,1,0">Heading</h2>
                                    <p uk-slideshow-parallax="x: 200,-200"><a id="A12" runat="server" href="#" class="uk-icon-link" uk-icon="plus"></a></p>
                                </div>
                            </li>
                            <li>
                                <img id="img13" runat="server" src="../img/LoginCover2.jpg" alt="" uk-cover>
                                <div class="uk-position-center uk-position-small uk-text-center">
                                    <h2 id="H13" runat="server" uk-slideshow-parallax="y: -50,0,0; opacity: 1,1,0">Heading</h2>
                                    <p uk-slideshow-parallax="x: 200,-200"><a id="A13" runat="server" href="#" class="uk-icon-link" uk-icon="plus"></a></p>
                                </div>
                            </li>
                            <li>
                                <img id="img14" runat="server" src="../img/LoginCover3.jpg" alt="" uk-cover>
                                <div class="uk-position-center uk-position-small uk-text-center">
                                    <h2 id="H14" runat="server" uk-slideshow-parallax="y: -50,0,0; opacity: 1,1,0">Heading</h2>
                                    <p uk-slideshow-parallax="x: 200,-200"><a id="A14" runat="server" href="#" class="uk-icon-link" uk-icon="plus"></a></p>
                                </div>
                            </li>
                            <li>
                                <img id="img15" runat="server" src="../img/LoginCover4.jpg" alt="" uk-cover>
                                <div class="uk-position-center uk-position-small uk-text-center">
                                    <h2 id="H15" runat="server" uk-slideshow-parallax="y: -50,0,0; opacity: 1,1,0">Heading</h2>
                                    <p uk-slideshow-parallax="x: 200,-200"><a id="A15" runat="server" href="#" class="uk-icon-link" uk-icon="plus"></a></p>
                                </div>
                            </li>
                        </ul>
                        <a class="uk-position-center-left uk-position-small uk-hidden-hover" href="#" uk-slidenav-previous uk-slideshow-item="previous"></a>
                        <a class="uk-position-center-right uk-position-small uk-hidden-hover" href="#" uk-slidenav-next uk-slideshow-item="next"></a>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <div class="uk-section-muted uk-padding">
        <div class="uk-container" onfocus="Contar()">
                <h1 class="uk-text-center uk-heading-line uk-padding-small">Elementos en el sistema</h1>

            <div class="uk-child-width-1-2@s uk-child-width-1-3@m uk-text-center uk-flex-center" uk-grid>
                <div>
                    <asp:Label ID="lbl_Anime" CssClass="count uk-heading-primary" runat="server" Text="1111"></asp:Label>
                    <p>Animes</p>
                </div>
                <div>
                    <asp:Label ID="lbl_Juegos" CssClass="count uk-heading-primary" runat="server" Text="1111"></asp:Label>
                    <p>Juegos</p>
                </div>
                <div>
                    <asp:Label ID="lbl_Mangas" CssClass="count uk-heading-primary" runat="server" Text="1111"></asp:Label>
                    <p>Mangas</p>
                </div>
                <div>
                    <asp:Label ID="lbl_Series" CssClass="count uk-heading-primary" runat="server" Text="1111"></asp:Label>
                    <p>Series</p>
                </div>
                <div>
                    <asp:Label ID="lbl_Peliculas" CssClass="count uk-heading-primary" runat="server" Text="1111"></asp:Label>
                    <p>Películas</p>
                </div>
                <div>
                    <asp:Label ID="lbl_Libros" CssClass="count uk-heading-primary" runat="server" Text="1111"></asp:Label>
                    <p>Libros</p>
                </div>
            </div>
        </div>
    </div>
</asp:Content>

