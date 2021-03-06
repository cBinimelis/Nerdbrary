﻿<%@ Page Title="Inicio de Sesion" Language="C#" MasterPageFile="MasterPage/MP_Inicial.master" AutoEventWireup="true" CodeFile="Login.aspx.cs" Inherits="Login" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div class="uk-grid-collapse uk-child-width-1-2@s uk-flex-middle" uk-grid>
        <div class="uk-position-relative uk-background-cover uk-height-viewport uk-visible-toggle uk-light"
            uk-slideshow="animation: push; autoplay: true; autoplay-interval: 2000; pause-on-hover: true">
            <ul class="uk-slideshow-items"  uk-height-viewport="min-height: 300" >
                <li>
                    <img src="img/LoginCover1.jpg" alt="" uk-cover>
                </li>
                <li>
                    <img src="img/LoginCover2.jpg" alt="" uk-cover>
                </li>
                <li>
                    <img src="img/LoginCover3.jpg" alt="" uk-cover>
                </li>
                <li>
                    <img src="img/LoginCover4.jpg" alt="" uk-cover>
                </li>
                <li>
                    <img src="img/LoginCover5.jpg" alt="" uk-cover>
                </li>
                <li>
                    <img src="img/LoginCover6.jpg" alt="" uk-cover>
                </li>
            </ul>

            <a class="uk-position-center-left uk-position-small uk-hidden-hover" href="#" uk-slidenav-previous uk-slideshow-item="previous"></a>
            <a class="uk-position-center-right uk-position-small uk-hidden-hover" href="#" uk-slidenav-next uk-slideshow-item="next"></a>
        </div>

        <div class="uk-padding-large">
            <h1>Inicio de Sesion</h1>
            <div class="uk-section">
                <div class="uk-margin">
                    <div class="uk-inline uk-width-1-2">
                        <span class="uk-form-icon" uk-icon="icon: user"></span>
                        <asp:TextBox ID="txt_username" placeholder="Correo / Nombre de Usuario" CssClass="uk-input" runat="server"></asp:TextBox>
                    </div>
                </div>
                <div class="uk-margin">
                    <div class="uk-inline uk-width-1-2">
                        <span class="uk-form-icon" uk-icon="icon: lock"></span>
                        <asp:TextBox ID="txt_password" placeholder="Contraseña" CssClass="uk-input" runat="server" TextMode="Password"></asp:TextBox>
                    </div>
                </div>
                <a class="boton-kuki uk-button" runat="server" onserverclick="btn_login_Click">Ingresar</a>
            </div>
        </div>
    </div>





</asp:Content>

