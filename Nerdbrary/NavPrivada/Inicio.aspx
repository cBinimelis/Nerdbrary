<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage/MP_Central.master" AutoEventWireup="true" CodeFile="Inicio.aspx.cs" Inherits="NavPrivada_Inicio" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">


    <div class="uk-section-default">
        <div id="test-filter" class="uk-section uk-light uk-background-cover uk-overflow-hidden uk-flex uk-flex-top" style="background-image: url(../img/ProfileBG.png); height: 50vh">
            <div class="uk-width-1-2@m uk-text-center uk-margin-auto uk-margin-auto-vertical" uk-parallax="target: #test-filter; blur: 0,10;">
                <div class="uk-overlay uk-overlay-primary uk-width-large">
                    <div class="uk-grid-small uk-flex-middle" uk-grid>
                        <div class="uk-width-auto">
                            <img class="uk-border-circle uk-height-small" src="../img/DefaultPP.png">
                        </div>
                        <div class="uk-width-expand">
                            <h3 id="Username" class="uk-card-title uk-margin-remove-bottom">Tukulito Sakayama</h3>
                            <p id="Description" class="uk-text-meta uk-margin-remove-top">Zoy Muy kul xddddd</p>
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
                <div class="uk-padding" uk-grid>
                    <div class="uk-width-1-2">
                        <div class="uk-inline">
                            <a class="uk-form-icon" href="#" uk-icon="icon: search" uk-tooltip="title: Ver pendientes"></a>
                            <asp:TextBox ID="txt_pendiente" CssClass="uk-input uk-form-width-large" placeholder="Ingresa el nombre... " runat="server"></asp:TextBox>
                        </div>
                    </div>
                    <asp:DropDownList ID="dd_tipopendiente" CssClass="uk-width-1-4 uk-select" runat="server" ForeColor="#999999"></asp:DropDownList>
                    <div class="uk-width-expand ">
                        <div class="uk-inline">
                            <span class="uk-form-icon" uk-icon="icon: plus"></span>
                            <asp:Button ID="btn_crear" CssClass="uk-button uk-button-primary uk-form-width-medium" runat="server" Text="Crear Pendiente" />
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <div class="uk-section-muted uk-padding">
        <div class="uk-container">
            <div class="uk-child-width-1-2@s uk-child-width-1-3@m uk-text-center uk-flex-center" uk-grid>

                <%--SLIDE SHOW PARA ANIME--%>
                <div>
                    <h4 class="uk-heading-line">Anime</h4>
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
                    <h4 class="uk-heading-line">Juegos</h4>
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
                    <h4 class="uk-heading-line">Mangas</h4>
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
                <div>
                    <div class="uk-card uk-card-default uk-card-body uk-height-large">Item</div>
                </div>
                <div>
                    <div class="uk-card uk-card-default uk-card-body uk-height-large">Item</div>
                </div>
                <div>
                    <div class="uk-card uk-card-default uk-card-body uk-height-large">Item</div>
                </div>
                <div>
                    <div class="uk-card uk-card-default uk-card-body uk-height-large">Item</div>
                </div>
                <div>
                    <div class="uk-card uk-card-default uk-card-body uk-height-large">Item</div>
                </div>
                <div>
                    <div class="uk-card uk-card-default uk-card-body uk-height-large">Item</div>
                </div>
                <div>
                    <div class="uk-card uk-card-default uk-card-body uk-height-large">Item</div>
                </div>
                <div>
                    <div class="uk-card uk-card-default uk-card-body uk-height-large">Item</div>
                </div>
                <div>
                    <div class="uk-card uk-card-default uk-card-body uk-height-large">Item</div>
                </div>
                <div>
                    <div class="uk-card uk-card-default uk-card-body uk-height-large">Item</div>
                </div>
                <div>
                    <div class="uk-card uk-card-default uk-card-body uk-height-large">Item</div>
                </div>
                <div>
                    <div class="uk-card uk-card-default uk-card-body uk-height-large">Item</div>
                </div>
                <div>
                    <div class="uk-card uk-card-default uk-card-body uk-height-large">Item</div>
                </div>
                <div>
                    <div class="uk-card uk-card-default uk-card-body uk-height-large">Item</div>
                </div>
                <div>
                    <div class="uk-card uk-card-default uk-card-body uk-height-large">Item</div>
                </div>
                <div>
                    <div class="uk-card uk-card-default uk-card-body uk-height-large">Item</div>
                </div>
                <div>
                    <div class="uk-card uk-card-default uk-card-body uk-height-large">Item</div>
                </div>
                <div>
                    <div class="uk-card uk-card-default uk-card-body uk-height-large">Item</div>
                </div>
            </div>
        </div>

    </div>
</asp:Content>

