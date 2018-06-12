<%@ Page Title="Gestión de Mangas" Language="C#" MasterPageFile="~/MasterPage/MP_Central.master" AutoEventWireup="true" CodeFile="CRUD_Manga.aspx.cs" Inherits="NavPrivada_MangaCRUD" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <script type="text/javascript">
        $(function () {
            $('[id*=btn_crearGenero]').click(function () {
                $.ajax({
                    type: "POST",
                    url: "CRUD_Manga.aspx/CrearEstado",
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
    <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
    <div class="uk-section-default uk-margin">
        <div class="uk-section">
            <div class="uk-container">
                <div class="uk-card uk-card-secondary">
                    <h1 class="uk-heading-line uk-text-center uk-padding">Mantenedor de Mangas</h1>
                    <asp:Label ID="lbl_idPendiente" runat="server" Text="Label" Visible="false"></asp:Label>
                    <asp:Label ID="lbl_hayPendientes" runat="server" Text="Label" Visible="false"></asp:Label>
                    <div class="uk-card-body" uk-grid>
                        <div class="uk-width-1-2@m">
                            <p>Nombre</p>
                            <div class="uk-inline">
                                <span class="uk-form-icon" uk-icon="icon: bookmark"></span>
                                <asp:textbox id="txt_nombreN" cssclass="uk-input uk-width-xlarge" runat="server"></asp:textbox>
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
                            <p>Tomos</p>
                            <div class="uk-inline">
                                <asp:textbox id="txt_Tomos" cssclass="uk-input uk-form-width-large" runat="server"></asp:textbox>
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
                                <asp:textbox id="txt_OGenerosN" cssclass="uk-input uk-width-xlarge" runat="server"></asp:textbox>
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
                                <asp:updatepanel id="UpdatePanel1" runat="server">
                                    <Triggers>
                                        <asp:PostBackTrigger ControlID="btn_crear" />
                                    </Triggers>
                                    <ContentTemplate>
                                        <asp:Button ID="btn_crear" CssClass="uk-button uk-button-secondary uk-button-large uk-width-1-1" runat="server" Text="Crear Manga" OnClick="btn_crear_Click" />
                                    </ContentTemplate>
                                </asp:updatepanel>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

    

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
                <button id="btn_crearGenero" class="uk-button uk-button-primary uk-modal-close" type="button">Crear</button>
            </div>
        </div>
    </div>




    <div class="uk-section-default uk-margin">
        <div class="uk-section">
            <div class="uk-container">
                <h1 class=" uk-heading-primary uk-text-center">Lista de Manga</h1>
                <div class="uk-card uk-card-default">
                    <div class="uk-card-body uk-overflow-auto">
                        <asp:gridview id="GrillaMangas" datakeynames="id_Manga" cssclass="uk-table uk-table-divider uk-table-small" autogeneratecolumns="False"
                            onrowdatabound="GrillaMangas_RowDataBound" onrowediting="GrillaMangas_RowEditing" onrowcancelingedit="GrillaMangas_RowCancelingEdit"
                            onrowupdating="GrillaMangas_RowUpdating" onrowdeleting ="GrillaMangas_RowDeleting" OnRowCommand="GrillaMangas_RowCommand"
                            borderstyle="None" gridlines="None" runat="server">
                            <Columns>
                                <asp:TemplateField HeaderText="ID Juego" Visible="false">
                                    <ItemTemplate>
                                        <asp:Label ID="lbl_id" runat="server" Text='<%# Eval("id_Manga") %>'></asp:Label>
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
                                <asp:TemplateField HeaderText="Tomos">
                                    <ItemTemplate>
                                        <asp:Label ID="lbl_tomos" runat="server" Text='<%# Eval("Tomos") %>'></asp:Label>
                                    </ItemTemplate>
                                    <EditItemTemplate>
                                        <asp:TextBox ID="txt_tomos" CssClass="uk-input uk-form-width-small" Text='<%# Eval("Tomos") %>' runat="server"></asp:TextBox>
                                    </EditItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Lanzamiento" >
                                    <ItemTemplate>
                                        <asp:Label ID="lbl_lanzamiento" runat="server" Text='<%# Eval("Lanzamiento") %>'></asp:Label>
                                    </ItemTemplate>
                                    <EditItemTemplate>
                                        <asp:TextBox ID="txt_lanzamiento" CssClass="uk-input" Text='<%# String.Format("{0:dd/MM/yyyy}", Convert.ToDateTime(Eval("Lanzamiento")))%>' runat="server"></asp:TextBox>
                                    </EditItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Estado">
                                    <ItemTemplate>
                                        <asp:Label ID="lbl_Estado" runat="server" Text='<%# Eval("Estado") %>'></asp:Label>
                                    </ItemTemplate>
                                    <EditItemTemplate>
                                        <asp:DropDownList ID="dd_estado" CssClass="uk-select uk-form-width-small" runat="server" DataSourceID="DS_Estado" DataTextField="Descripcion" DataValueField="id_EstadoManga"></asp:DropDownList>
                                    </EditItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Genero">
                                    <ItemTemplate>
                                        <asp:Label ID="lbl_genero" runat="server" Text='<%# Eval("Genero") %>'></asp:Label>
                                    </ItemTemplate>
                                    <EditItemTemplate>
                                        <asp:DropDownList ID="dd_genero" CssClass="uk-select uk-form-width-small" runat="server" DataSourceID="DS_Genero" DataTextField="Descripcion" DataValueField="id_GeneroManga"></asp:DropDownList>
                                    </EditItemTemplate>
                                </asp:TemplateField>
                                 <asp:TemplateField HeaderText="Otros Generos" ItemStyle-CssClass="uk-text-truncate">
                                    <ItemTemplate>
                                        <asp:Label ID="lbl_OGenero" runat="server" CssClass="uk-width-small" Text='<%# Eval("Otros_Generos") %>'></asp:Label>
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
    </div>

    <asp:LinqDataSource id="DS_Genero" runat="server" ContextTypeName="ConexionLQDataContext" EntityTypeName="" TableName="Genero_Mangas"></asp:LinqDataSource>
    <asp:LinqDataSource id="DS_Estado" runat="server" ContextTypeName="ConexionLQDataContext" EntityTypeName="" TableName="Estado_Manga"></asp:LinqDataSource>
</asp:Content>

