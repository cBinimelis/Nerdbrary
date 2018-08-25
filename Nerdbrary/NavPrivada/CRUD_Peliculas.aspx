<%@ Page Title="" Language="C#" MaintainScrollPositionOnPostback="true" MasterPageFile="~/MasterPage/MP_Central.master" AutoEventWireup="true" CodeFile="CRUD_Peliculas.aspx.cs" Inherits="NavPrivada_CRUD_Peliculas" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <script type="text/javascript">
        $(function () {
            $('[id*=btn_crearGenero]').click(function () {
                $.ajax({
                    type: "POST",
                    url: "CRUD_Peliculas.aspx/CrearGenero",
                    data: '{Genero: "' + $("#txt_crearGenero").val() + '"}',
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
    <asp:ScriptManager runat="server"></asp:ScriptManager>
    <div class="uk-section-default uk-margin">
        <div class="uk-section">
            <div class="uk-container">
                <div class="uk-card uk-card-secondary">
                    <h1 class="uk-heading-line uk-text-center uk-padding">Mantenedor de Pelicula</h1>
                    <asp:Label ID="lbl_idPendiente" runat="server" Text="Label" Visible="false"></asp:Label>
                    <asp:Label ID="lbl_hayPendientes" runat="server" Text="Label" Visible="false"></asp:Label>
                    <div class="uk-card-body" uk-grid>
                        <div class="uk-width-1-2@m">
                            <p>Nombre</p>
                            <div class="uk-inline">
                                <span class="uk-form-icon" uk-icon="icon: bookmark"></span>
                                <asp:TextBox ID="txt_nombreN" autocomplete="off" CssClass="uk-input uk-width-xlarge" runat="server"></asp:TextBox>
                            </div>
                        </div>
                        <div class="uk-width-1-4@m">
                            <p>Lanzamiento</p>
                            <div class="uk-inline">
                                <span class="uk-form-icon" uk-icon="icon: calendar"></span>
                                <asp:TextBox ID="txt_lanzamientoN" TextMode="Date" CssClass="uk-input uk-form-width-large" runat="server"></asp:TextBox>
                            </div>
                        </div>
                        <div class="uk-width-1-4@m">
                            <p>Duracion</p>
                            <div class="uk-inline">
                                <span class="uk-form-icon" uk-icon="icon: clock"></span>
                                <asp:TextBox ID="txt_duracionN" CssClass="uk-input uk-form-width-large" runat="server"></asp:TextBox>
                            </div>
                        </div>
                        <div class="uk-width-1-4@m">
                            <p>Estado</p>
                            <div class="uk-inline">
                                <asp:DropDownList ID="dd_estadoN" CssClass="uk-select uk-form-width-large" runat="server" ForeColor="#999999"></asp:DropDownList>
                            </div>
                        </div>
                        <div class="uk-width-1-4@m">
                            <p>Genero <a class="uk-icon-link uk-margin-left-small" uk-icon="plus" href="#modal-genero" uk-tooltip="title: Agregar Genero" uk-toggle></a></p>
                            <div class="uk-inline">
                                <asp:DropDownList ID="dd_generoN" CssClass="uk-select uk-form-width-large" runat="server" ForeColor="#999999"></asp:DropDownList>
                            </div>
                        </div>
                        <div class="uk-width-1-2@m">
                            <p>Otros Generos</p>
                            <div class="uk-inline">
                                <span class="uk-form-icon" uk-icon="icon: tag"></span>
                                <asp:TextBox ID="txt_OGenerosN" autocomplete="off" CssClass="uk-input uk-width-xlarge" runat="server"></asp:TextBox>
                            </div>
                        </div>
                        <div class="uk-width-1-2@m">
                            <p>Sinopsis</p>
                            <div class="uk-inline">
                                <span class="uk-form-icon" uk-icon="icon: info"></span>
                                <asp:TextBox ID="txt_sinopsisN" CssClass="uk-textarea uk-height-medium uk-width-xlarge" runat="server" TextMode="MultiLine"></asp:TextBox>
                            </div>
                        </div>
                        <div class="uk-width-1-2@m">
                            <p>Imagen</p>
                            <img id="imagen_vprevia" runat="server" src="~/img/Sharky.jpg">
                            <asp:FileUpload ID="subir_imagen" CssClass="uk-input uk-width-auto" placeholder="Seleccionar Archivo" runat="server" onchange="VPrevia(this)" />
                        </div>
                        <div class="uk-width-1-1">
                            <div class="uk-inline uk-position-bottom-center uk-position-relative">
                                <span class="uk-form-icon" uk-icon="icon: plus"></span>
                                <asp:Button ID="btn_crear" CssClass="uk-button uk-button-secondary uk-button-large uk-width-1-1" runat="server" Text="Crear Pelicula" OnClick="btn_crear_Click" />
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
                <h1 class=" uk-heading-primary uk-text-center">Lista de Pelicula</h1>
                <div class="uk-card uk-card-default">
                    <div class="uk-card-body uk-overflow-auto">
                        <asp:GridView ID="GrillaPelicula" DataKeyNames="id_Pelicula" CssClass="uk-table uk-table-divider uk-table-small" AutoGenerateColumns="False"
                            OnRowDataBound="GrillaPelicula_RowDataBound" OnRowCancelingEdit="GrillaPelicula_RowCancelingEdit" OnRowEditing="GrillaPelicula_RowEditing"
                            OnRowDeleting="GrillaPelicula_RowDeleting" OnRowUpdating="GrillaPelicula_RowUpdating" OnRowCommand="GrillaPelicula_RowCommand"
                            BorderStyle="None" GridLines="None" runat="server">
                            <Columns>
                                <asp:TemplateField HeaderText="ID Pelicula" Visible="false">
                                    <ItemTemplate>
                                        <asp:Label ID="lbl_id" runat="server" Text='<%# Eval("id_Pelicula") %>'></asp:Label>
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
                                <asp:TemplateField HeaderText="Duración">
                                    <ItemTemplate>
                                        <asp:Label ID="lbl_capitulos" runat="server" Text='<%# Eval("Duracion") %>'></asp:Label>
                                    </ItemTemplate>
                                    <EditItemTemplate>
                                        <asp:TextBox ID="txt_duracion" CssClass="uk-input uk-form-width-auto" Text='<%# Eval("Duracion") %>' runat="server"></asp:TextBox>
                                    </EditItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Estado">
                                    <ItemTemplate>
                                        <asp:Label ID="lbl_Estado" runat="server" Text='<%# Eval("Estado") %>'></asp:Label>
                                    </ItemTemplate>
                                    <EditItemTemplate>
                                        <asp:DropDownList ID="dd_estado" CssClass="uk-select uk-form-width-small" runat="server" DataSourceID="DS_Estado" DataTextField="Descripcion" DataValueField="id_EstadoPelicula"></asp:DropDownList>
                                    </EditItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Genero">
                                    <ItemTemplate>
                                        <asp:Label ID="lbl_genero" runat="server" Text='<%# Eval("Genero") %>'></asp:Label>
                                    </ItemTemplate>
                                    <EditItemTemplate>
                                        <asp:DropDownList ID="dd_genero" CssClass="uk-select uk-form-width-small" runat="server" DataSourceID="DS_Genero" DataTextField="Descripcion" DataValueField="id_GeneroPelicula"></asp:DropDownList>
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
                        </asp:GridView>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <asp:LinqDataSource ID="DS_Genero" runat="server" ContextTypeName="ConexionLQDataContext" EntityTypeName="" TableName="Genero_Pelicula"></asp:LinqDataSource>
    <asp:LinqDataSource ID="DS_Estado" runat="server" ContextTypeName="ConexionLQDataContext" EntityTypeName="" TableName="Estado_Pelicula"></asp:LinqDataSource>
</asp:Content>

