<%@ Page Title="Gestión de Autores" Language="C#" MasterPageFile="~/MasterPage/MP_Central.master" AutoEventWireup="true" CodeFile="CRUD_Autores.aspx.cs" Inherits="NavPrivada_CRUD_Autores" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div class="uk-section-default uk-padding">
        <div class="uk-section">
            <div class="uk-container">
                <div class="uk-card uk-card-secondary">
                    <h1 class="uk-heading-line uk-text-center uk-padding">Mantenedor de Autores</h1>
                    <div class="uk-card-body">
                        <div class="uk-child-width-1-2@m uk-grid-match" uk-grid>
                        <div>
                            <div class="uk-width-1-1">
                                <p>Nombre</p>
                                <div class="uk-inline">
                                    <span class="uk-form-icon" uk-icon="icon: bookmark"></span>
                                    <asp:TextBox ID="txt_nombreN" autocomplete="off" CssClass="uk-input uk-width-xlarge" runat="server"></asp:TextBox>
                                </div>
                            </div>
                            <div class="uk-width-1-1">
                                <p>Imagen</p>
                                <img id="imagen_vprevia" runat="server" src="~/img/Sharky.jpg">
                                <asp:FileUpload ID="subir_imagen" CssClass="uk-input uk-width-auto" placeholder="Seleccionar Archivo" runat="server" onchange="VPrevia(this)" />
                            </div>
                        </div>
                        <div>
                            <div class="uk-width-1-1">
                                <p>Bio del Autor</p>
                                <div class="uk-inline">
                                    <span class="uk-form-icon" uk-icon="icon: info"></span>
                                    <asp:TextBox ID="txt_sinopsisN" CssClass="uk-textarea uk-height-medium uk-width-xlarge" runat="server" TextMode="MultiLine"></asp:TextBox>
                                </div>
                            </div>
                        </div>
                            </div>
                        <div class="uk-width-1-1">
                            <div class="uk-inline uk-position-bottom-center uk-margin-bottom uk-position-relative">
                                <span class="uk-form-icon" uk-icon="icon: plus"></span>
                                <asp:Button ID="btn_crear" CssClass="uk-button uk-button-secondary uk-button-large uk-width-1-1" runat="server" Text="Crear Autor" OnClick="btn_crear_Click" />
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <asp:Label ID="lbl_redirect" runat="server" Text="Label" Visible="false"></asp:Label>
    <div class="uk-section-default">
        <div class="uk-container">
            <h1 class=" uk-heading-primary uk-text-center">Lista de Autores</h1>
            <div class="uk-card uk-card-default">
                <div class="uk-card-body uk-overflow-auto">
                    <asp:GridView ID="GrillaAut" DataKeyNames="id_Autor" CssClass="uk-table uk-table-divider uk-table-small" AutoGenerateColumns="False"
                        OnRowCancelingEdit="GrillaAut_RowCancelingEdit" OnRowEditing="GrillaAut_RowEditing"
                        OnRowUpdating="GrillaAut_RowUpdating" OnRowCommand="GrillaAut_RowCommand"
                        BorderStyle="None" GridLines="None" runat="server">
                        <Columns>
                            <asp:TemplateField HeaderText="ID Juego" Visible="false">
                                <ItemTemplate>
                                    <asp:Label ID="lbl_id" runat="server" Text='<%# Eval("id_Autor") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Nombre" ItemStyle-CssClass="uk-form-width-large">
                                <ItemTemplate>
                                    <asp:Label ID="lbl_nombre" runat="server" Text='<%# Eval("Nombre") %>'></asp:Label>
                                </ItemTemplate>
                                <EditItemTemplate>
                                    <asp:TextBox ID="txt_nombre" CssClass="uk-input" Text='<%# Eval("Nombre") %>' runat="server"></asp:TextBox>
                                </EditItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Sinopsis" ItemStyle-CssClass="uk-text-truncate">
                                <ItemTemplate>
                                    <asp:Label ID="lbl_sinopsis" CssClass="uk-form-width-expand " runat="server" Text='<%# Eval("Detalles")%>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:CommandField ButtonType="Link" ShowEditButton="true" EditText="<span uk-icon='icon: pencil' uk-tooltip='title: Editar'></span>"
                                CancelText="<span uk-icon='icon: close'></span>" UpdateText="<span uk-icon='icon: check'></span>"
                                 ShowSelectButton="true" SelectText="<span uk-icon='icon: search' uk-tooltip='title: Ver'></span>" />
                        </Columns>
                    </asp:GridView>
                </div>
            </div>
        </div>
    </div>
</asp:Content>

