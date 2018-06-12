<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage/MP_Central.master" AutoEventWireup="true" CodeFile="Autor.aspx.cs" Inherits="NavPrivada_Autor" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div class="uk-section-default">
        <div id="MainCover" runat="server" class="uk-section uk-light uk-background-cover uk-flex uk-flex-top" uk-parallax="bgyu: -200; sepia: 100;" style="background-image: url(../img/MyGamesBG.jpg); height: 70vh">
        </div>
    </div>

    <div class="uk-section-default uk-margin">
        <div class="uk-section">
            <div class="uk-container-expand">
                <div class="uk-container">
                    <article class="uk-article uk-padding">
                        <h1 class="uk-article-title uk-text-center uk-heading-bullet">
                            <asp:label id="Titulo" runat="server" text="Developer"></asp:label>
                        </h1>
                        <p class="uk-dropcap">
                            <asp:label id="DetallesAut" cssclass="uk-text-justify" runat="server" text="Label"></asp:label>
                        </p>
                    </article>
                </div>
                <div class="uk-flex uk-flex-center" uk-grid>
                    <asp:listview id="BookList" datakeynames="id_Libro" runat="server" onitemcommand="BookList_ItemCommand">
                        <GroupTemplate>
                            <div id="itemPlaceholderContainer" class="uk-child-width-1-4@m" runat="server">
                                <div id="itemPlaceholder" runat="server">
                                </div>
                            </div>
                        </GroupTemplate>
                        <ItemTemplate>
                            <div class="uk-card uk-card-default uk-width-medium" >
                                <div class="uk-card-media-top image-wrapper">
                                    <img class="card-img" src="../img/books/<%# Eval("Imagen") %>" alt="">
                                </div>
                                <div class="uk-card-body uk-padding-small">
                                        <asp:Label ID="lbl_nombre" CssClass="uk-card-title uk-align-center uk-text-truncate" runat="server" Text='<%# Eval("Nombre") %>'></asp:Label>
                                    <asp:Button ID="btn_ver" CssClass="uk-button uk-button-primary boton-ver uk-light uk-position-bottom uk-width-1-1 uk-margin-medium" runat="server" Text="Ver" CommandName="Select" CommandArgument='<%# Eval("id_Libro") %>' />
                                </div>
                            </div>
                        </ItemTemplate>
                    </asp:listview>
                </div>

            </div>

        </div>
    </div>
</asp:Content>

