﻿<%@ Page Title="" Language="C#" MaintainScrollPositionOnPostback="true" MasterPageFile="~/MasterPage/MP_Central.master" AutoEventWireup="true" CodeFile="Detalles_Anime.aspx.cs" Inherits="NavPrivada_AnimeDetalles" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div class="uk-section uk-section-default">
        <div id="Cover" runat="server" class="background"></div>
        <div class="uk-container uk-card uk-card-default uk-align-center uk-animation-slide-left">
            <div class="uk-card-body uk-card-medium">
                <h1 class="uk-text-center uk-heading-line uk-padding-small">
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
                    </div>
                    <asp:Label ID="APersonalA" CssClass="uk-card-badge uk-text-justify uk-label uk-width-auto" runat="server" Text="Detalles"></asp:Label>
                    <div>
                        <asp:Label ID="DescripcionA" CssClass="uk-text-justify uk-align-center" runat="server" Text="Descripcion del Anime"></asp:Label>
                    </div>
                </div>

                <a href="#Edit_Anime" class="boton-kuki uk-button uk-align-center" uk-toggle="target: #Edit_Anime; animation: uk-animation-fade">Editar</a>
                <div id="Edit_Anime" class="uk-section-small" hidden>
                    <div class="uk-section" uk-grid>
                        <div class="uk-width-1-3@m">
                            <p>Capitulos</p>
                            <div class="uk-inline">
                                <span class="uk-form-icon" uk-icon="icon: tv"></span>
                                <asp:TextBox ID="txt_capitulosN" autocomplete="off" CssClass="uk-input uk-form-width-large" runat="server"></asp:TextBox>
                            </div>
                        </div>
                        <div class="uk-width-1-3@m">
                            <p>Temporadas</p>
                            <div class="uk-inline">
                                <span class="uk-form-icon" uk-icon="icon: world"></span>
                                <asp:TextBox ID="txt_temporadasN" autocomplete="off" CssClass="uk-input uk-form-width-large" runat="server"></asp:TextBox>
                            </div>
                        </div>
                        <div class="uk-width-1-3@m">
                            <p>Estado</p>
                            <div class="uk-inline">
                                <asp:DropDownList ID="dd_estadoN" CssClass="uk-select uk-form-width-large" runat="server" ForeColor="#999999"></asp:DropDownList>
                            </div>
                        </div>

                        <div class="uk-width-1-1">
                            <div class="uk-container">
                                <p>Sinopsis</p>
                                <div class="uk-inline">
                                    <span class="uk-form-icon" uk-icon="icon: info"></span>
                                    <asp:TextBox ID="txt_sinopsisN" CssClass="uk-textarea uk-height-medium uk-width-xxlarge" runat="server" TextMode="MultiLine"></asp:TextBox>
                                </div>
                            </div>
                        </div>

                        <span class="uk-form-icon" uk-icon="icon: edit"></span>
                        <asp:Button ID="btn_editar" CssClass="uk-button uk-button-secondary uk-button-large uk-width-1-1" runat="server" Text="Editar Anime" OnClick="btn_editar_Click" />
                    </div>
                </div>

                <div class="uk-section-small">
                    <asp:GridView ID="GrillaAnimeUsuario" DataKeyNames="id_AnimeUsuario" CssClass="uk-table uk-table-divider uk-table-small" AutoGenerateColumns="false"
                        GridLines="None" runat="server" OnRowDataBound="GrillaAnimeUsuario_RowDataBound" OnRowEditing="GrillaAnimeUsuario_RowEditing" OnRowCancelingEdit="GrillaAnimeUsuario_RowCancelingEdit"
                        OnRowUpdating="GrillaAnimeUsuario_RowUpdating" OnRowDeleting="GrillaAnimeUsuario_RowDeleting">
                        <Columns>
                            <asp:TemplateField HeaderText="ID Anime" Visible="false">
                                <ItemTemplate>
                                    <asp:Label ID="lbl_id" runat="server" Text='<%# Eval("id_AnimeUsuario") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField ControlStyle-CssClass="uk-form-width-medium uk-select">
                                <EditItemTemplate>
                                    <asp:DropDownList ID="dd_AAnime" CssClass="uk-select uk-form-width-large" runat="server" DataSourceID="AAnime_DS" DataTextField="Descripcion" DataValueField="id_AvanceAnime"></asp:DropDownList>
                                </EditItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Nota">
                                <ItemTemplate>
                                    <asp:Label ID="lbl_Nota" CssClass="uk-form-width-medium" Text='<%# Eval("Nota") %>' runat="server"></asp:Label>
                                </ItemTemplate>
                                <EditItemTemplate>
                                    <asp:TextBox ID="txt_nota" Text='<%# Eval("Nota") %>' CssClass="uk-input" runat="server"></asp:TextBox>
                                </EditItemTemplate>
                            </asp:TemplateField>
                            <asp:CommandField ButtonType="Link" ShowEditButton="true" EditText="<span uk-icon='icon: pencil' uk-tooltip='title: Editar'></span>"
                                CancelText="<span uk-icon='icon: close'></span>" UpdateText="<span uk-icon='icon: check'></span>"
                                ShowDeleteButton="true" DeleteText="<span uk-icon='icon: trash' uk-tooltip='title: Eliminar de mi lista'></span>" />
                        </Columns>
                    </asp:GridView>
                </div>
            </div>
        </div>
    </div>

    <asp:LinqDataSource ID="AAnime_DS" runat="server" ContextTypeName="ConexionLQDataContext" EntityTypeName="" TableName="Avance_Anime">
    </asp:LinqDataSource>
</asp:Content>

