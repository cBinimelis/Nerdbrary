﻿<%@ Page Title="Gestión de Juegos" MaintainScrollPositionOnPostback="true" Language="C#" MasterPageFile="~/MasterPage/MP_Central.master" AutoEventWireup="true" CodeFile="CRUD_Juegos.aspx.cs" Inherits="NavPrivada_JuegosCRUD" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <script type="text/javascript">
        $(function () {
            $('[id*=btn_crearEstado]').click(function () {
                $.ajax({
                    type: "POST",
                    url: "CRUD_Juegos.aspx/CrearEstado",
                    data: '{Estado: "' + $("#txt_crearGenero").val() + '"}',
                    contentType: "application/json; charset=utf-8",
                    dataType: "json",
                    success: function (response) {
                        swal("Felicidades", "El genero " + response.d + " ha sido creado \n Recargue la página para verlo en la lista", "success");
                        rellenar();
                    },
                    failure: function (response) {
                        swal(response.responseText);
                    },
                    error: function (response) {
                        swal(response.responseText);
                    }
                });
            });
        });
    </script>
    <asp:scriptmanager id="ScriptManager1" runat="server"></asp:scriptmanager>
    <div class="uk-section-default uk-padding">
        <div class="uk-section">
            <div class="uk-container">
                <div class="uk-card uk-card-secondary">
                    <h1 class="uk-heading-line uk-text-center uk-padding">Mantenedor de Juegos</h1>
                    <div class="uk-card-body" uk-grid>
                        <div class="uk-width-1-2@m">
                            <p>Nombre</p>
                            <div class="uk-inline">
                                <span class="uk-form-icon" uk-icon="icon: bookmark"></span>
                                <asp:textbox id="txt_nombreN" autocomplete="off" cssclass="uk-input uk-width-xlarge" runat="server"></asp:textbox>
                            </div>
                        </div>
                        <div class="uk-width-1-4@m">
                            <p>Lanzamiento</p>
                            <div class="uk-inline">
                                <span class="uk-form-icon" uk-icon="icon: calendar"></span>
                                <asp:textbox id="txt_lanzamientoN" textmode="Date" cssclass="uk-input uk-form-width-large" runat="server"></asp:textbox>
                            </div>
                        </div>
                        <div class="uk-width-1-4@m">
                            <p>Desarrollador <a class="uk-icon-link uk-margin-left-small" uk-icon="plus" href="CRUD_Desarrollador.aspx?Redir=1" uk-tooltip="title: Agregar Desarrollador" uk-toggle></a></p>
                            <div class="uk-inline">
                                <asp:dropdownlist id="dd_desarrolladorN" cssclass="uk-select uk-form-width-large" runat="server" forecolor="#999999"></asp:dropdownlist>
                            </div>
                        </div>
                        <div class="uk-width-1-4@m">
                            <p>Estado</p>
                            <div class="uk-inline">
                                <asp:dropdownlist id="dd_estadoN" cssclass="uk-select uk-form-width-large" runat="server" forecolor="#999999"></asp:dropdownlist>
                            </div>
                        </div>
                        <div class="uk-width-1-4@m">
                            <p>Genero <a class="uk-icon-link uk-margin-left-small" uk-icon="plus" href="#modal-genero" uk-tooltip="title: Agregar Genero" uk-toggle></a></p>
                            <div class="uk-inline">
                                <asp:dropdownlist id="dd_generoN" cssclass="uk-select uk-form-width-large" runat="server" forecolor="#999999"></asp:dropdownlist>
                            </div>
                        </div>
                        <div class="uk-width-1-2@m">
                            <p>Otros Generos</p>
                            <div class="uk-inline">
                                <span class="uk-form-icon" uk-icon="icon: tag"></span>
                                <asp:textbox id="txt_OGenerosN" autocomplete="off" cssclass="uk-input uk-width-xlarge" runat="server"></asp:textbox>
                            </div>
                        </div>
                        <div class="uk-width-1-2@m">
                            <p>Sinopsis</p>
                            <div class="uk-inline">
                                <span class="uk-form-icon" uk-icon="icon: info"></span>
                                <asp:textbox id="txt_sinopsisN" cssclass="uk-textarea uk-height-medium uk-width-xlarge" runat="server" textmode="MultiLine"></asp:textbox>
                            </div>
                        </div>
                        <div class="uk-width-1-2@m">
                            <p>Imagen</p>
                            <img id="imagen_vprevia" runat="server" src="~/img/Sharky.jpg">
                            <asp:fileupload id="subir_imagen" cssclass="uk-input uk-width-auto" placeholder="Seleccionar Archivo" runat="server" onchange="VPrevia(this)" />
                        </div>
                        <div class="uk-width-1-1">
                            <div class="uk-inline uk-position-bottom-center uk-position-relative">
                                <span class="uk-form-icon" uk-icon="icon: plus"></span>
                                <asp:button id="btn_crear" cssclass="uk-button uk-button-secondary uk-button-large uk-width-1-1" runat="server" text="Crear Juego" onclick="btn_crear_Click" />
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <asp:label id="lbl_idPendiente" runat="server" text="Label" hidden visible="false"></asp:label>
        <asp:label id="lbl_hayPendientes" runat="server" text="Label" hidden visible="false"></asp:label>

        <%--MODAL PARA LA CREACION DE ESTADOS--%>
        <div id="modal-genero" class="uk-flex-top" uk-modal>
            <div class="uk-modal-dialog uk-margin-auto-vertical">
                <button class="uk-modal-close-default" type="button" uk-close></button>
                <div class="uk-modal-header">
                    <h2 class="uk-modal-title">Crear Nuevo Genero</h2>
                </div>
                <div class="uk-modal-body">
                    <input type="tel" id="txt_crearGenero" class="uk-input uk-form-width-large" placeholder="Ingrese el nombre del nuevo genero..." />
                </div>
                <div class="uk-modal-footer uk-text-right">
                    <button class="uk-button uk-button-default uk-modal-close" type="button">Cancelar</button>
                    <button id="btn_crearEstado" class="uk-button uk-button-primary uk-modal-close" type="button">Crear</button>
                </div>
            </div>
        </div>
    </div>
    <div class="uk-section-default">
        <div class="uk-container">
            <h1 class=" uk-heading-primary uk-text-center">Lista de Juegos</h1>
            <div class="uk-card uk-card-default">
                <div class="uk-card-body uk-overflow-auto">
                    <asp:gridview id="GrillaJuegos" datakeynames="id_Juego" cssclass="uk-table uk-table-divider uk-table-small" autogeneratecolumns="False"
                        onrowdatabound="GrillaJuegos_RowDataBound" onrowcancelingedit="GrillaJuegos_RowCancelingEdit" onrowediting="GrillaJuegos_RowEditing"
                        onrowdeleting="GrillaJuegos_RowDeleting" onrowupdating="GrillaJuegos_RowUpdating" OnRowCommand="GrillaJuegos_RowCommand"
                        borderstyle="None" gridlines="None" runat="server">
                        <Columns>
                            <asp:TemplateField HeaderText="ID Juego" Visible="false">
                                <ItemTemplate>
                                    <asp:Label ID="lbl_id" runat="server" Text='<%# Eval("id_Juego") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Nombre">
                                <ItemTemplate>
                                    <asp:Label ID="lbl_nombre" runat="server" Text='<%# Eval("Nombre") %>'></asp:Label>
                                </ItemTemplate>
                                <EditItemTemplate>
                                    <asp:TextBox ID="txt_nombre" CssClass="uk-input uk-form-width-small" Text='<%# Eval("Nombre") %>' runat="server"></asp:TextBox>
                                </EditItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Lanzamiento">
                                <ItemTemplate>
                                    <asp:Label ID="lbl_lanzamiento" runat="server" Text='<%# Eval("Lanzamiento") %>'></asp:Label>
                                </ItemTemplate>
                                <EditItemTemplate>
                                    <asp:TextBox ID="txt_lanzamiento" CssClass="uk-input" Text='<%# String.Format("{0:dd/MM/yyyy}", Convert.ToDateTime(Eval("Lanzamiento")))%>' runat="server"></asp:TextBox>
                                </EditItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Desarrollador">
                                <ItemTemplate>
                                    <asp:Label ID="lbl_dev" runat="server" Text='<%# Eval("Desarrollador") %>'></asp:Label>
                                </ItemTemplate>
                                <EditItemTemplate>
                                    <asp:DropDownList ID="dd_dev" CssClass="uk-select uk-form-width-small" runat="server" DataSourceID="DS_Desarrollador" DataTextField="Nombre" DataValueField="id_Desarrollador"></asp:DropDownList>
                                </EditItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Estado">
                                <ItemTemplate>
                                    <asp:Label ID="lbl_Estado" runat="server" Text='<%# Eval("Estado") %>'></asp:Label>
                                </ItemTemplate>
                                <EditItemTemplate>
                                    <asp:DropDownList ID="dd_estado" CssClass="uk-select uk-form-width-small" runat="server" DataSourceID="DS_Estado" DataTextField="Descripcion" DataValueField="id_EstadoJuegos"></asp:DropDownList>
                                </EditItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Genero">
                                <ItemTemplate>
                                    <asp:Label ID="lbl_genero" runat="server" Text='<%# Eval("Genero") %>'></asp:Label>
                                </ItemTemplate>
                                <EditItemTemplate>
                                    <asp:DropDownList ID="dd_genero" CssClass="uk-select uk-form-width-small" runat="server" DataSourceID="DS_Genero" DataTextField="Descripcion" DataValueField="id_GeneroJuego"></asp:DropDownList>
                                </EditItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Otros Generos">
                                <ItemTemplate>
                                    <asp:Label ID="lbl_OGenero" runat="server" Text='<%# Eval("Otros_Generos") %>'></asp:Label>
                                </ItemTemplate>
                                <EditItemTemplate>
                                    <asp:TextBox ID="txt_OGeneros" CssClass="uk-input" Text='<%# Eval("Otros_Generos") %>' runat="server"></asp:TextBox>
                                </EditItemTemplate>
                            </asp:TemplateField>
                            <asp:CommandField ButtonType="Link" ShowEditButton="true" EditText="<span uk-icon='icon: pencil' uk-tooltip='title: Editar'></span>"
                                CancelText="<span uk-icon='icon: close'></span>" UpdateText="<span uk-icon='icon: check'></span>"
                                ShowDeleteButton="true" DeleteText="<span uk-icon='icon: trash' uk-tooltip='title: Eliminar'></span>"
                                ShowSelectButton="true" SelectText="<span uk-icon='icon: search' uk-tooltip='title: Ver'></span>" />
                        </Columns>
                    </asp:gridview>
                </div>
            </div>
        </div>
    </div>

    <asp:linqdatasource id="DS_Genero" runat="server" contexttypename="ConexionLQDataContext" entitytypename="" tablename="Genero_Juegos"></asp:linqdatasource>
    <asp:linqdatasource id="DS_Estado" runat="server" contexttypename="ConexionLQDataContext" entitytypename="" tablename="Estado_Juegos"></asp:linqdatasource>
    <asp:linqdatasource id="DS_Desarrollador" runat="server" contexttypename="ConexionLQDataContext" entitytypename="" tablename="Desarrollador"></asp:linqdatasource>
</asp:Content>

