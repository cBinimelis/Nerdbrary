<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage/MP_Central.master" AutoEventWireup="true" CodeFile="Pendientes.aspx.cs" Inherits="NavPrivada_Pendientes" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div class="uk-section-default">
        <div id="test-filter" class="uk-section uk-light uk-background-cover uk-overflow-hidden uk-flex uk-flex-top" uk-parallax="bgyu: -200; sepia: 100;" style="background-image: url(../img/PendientesBG.jpg); height: 70vh">
            <div class="uk-width-1-2@m uk-text-center uk-margin-auto uk-margin-auto-vertical" uk-parallax="target: #test-filter; blur: 0,10;">
                <div class="uk-overlay uk-overlay-primary uk-width-medium">
                    <h1>Pendientes</h1>
                </div>
            </div>
        </div>
    </div>
    
    <div class="uk-section-default uk-margin">
        <div class="uk-section">
            <div class="uk-container">
                <h1 class=" uk-heading-primary uk-text-center">Lista de Pendientes</h1>
                <div class="uk-margin">
                    <div class="uk-inline">
                        <asp:TextBox ID="txt_buscar" CssClass="uk-input uk-width-large" runat="server"></asp:TextBox>
                        <asp:Button ID="btn_buscar" CssClass="uk-button uk-position-right uk-button-default" runat="server" Text="Buscar" OnClick="btn_buscar_Click" />
                    </div>
                </div>
                <div class="uk-card uk-card-default">
                    <div class="uk-card-body uk-overflow-auto">
                        <asp:GridView ID="GrillaPendiente" DataKeyNames="id_Pendiente" CssClass="uk-table uk-table-divider uk-table-small" AutoGenerateColumns="False"
                            BorderStyle="None" GridLines="None" runat="server" OnRowCommand="GrillaPendiente_RowCommand" OnRowDataBound="GrillaPendiente_RowDataBound"
                            OnRowEditing="GrillaPendiente_RowEditing" OnRowCancelingEdit="GrillaPendiente_RowCancelingEdit" OnRowUpdating="GrillaPendiente_RowUpdating"
                            OnRowDeleting="GrillaPendiente_RowDeleting">
                            <Columns>
                                <asp:TemplateField HeaderText="ID Pendiente" Visible="false">
                                    <ItemTemplate>
                                        <asp:Label ID="lbl_id" runat="server" Text='<%# Eval("id_Pendiente") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Nombre">
                                    <ItemTemplate>
                                        <asp:Label ID="lbl_nombre" runat="server" Text='<%# Eval("Nombre") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Tipo de Elemento">
                                    <ItemTemplate>
                                        <asp:Label ID="lbl_lanzamiento" runat="server" Text='<%# Eval("Tipo") %>'></asp:Label>
                                    </ItemTemplate>
                                    <EditItemTemplate>
                                        <asp:DropDownList ID="dd_TPendiente" CssClass="uk-select uk-form-width-small" runat="server" DataSourceID="DS_TipoP" DataTextField="Descripcion" DataValueField="id_TipoPendiente"></asp:DropDownList>
                                    </EditItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Agregado Por">
                                    <ItemTemplate>
                                        <asp:Label ID="lbl_capitulos" runat="server" Text='<%# Eval("Usuario") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="ID Tipo Pendiente" Visible="false">
                                    <ItemTemplate>
                                        <asp:Label ID="lbl_idTP" runat="server" Text='<%# Eval("id_TipoPendiente") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:CommandField ButtonType="Link" ShowSelectButton="true" SelectText="<span uk-icon='icon: plus' uk-tooltip='title: Crear Elemento'></span>" 
                                    ShowDeleteButton="true" DeleteText="<span uk-icon='icon: trash' uk-tooltip='title: Eliminar'></span>"
                                    ShowEditButton="true" EditText="<span uk-icon='icon: pencil' uk-tooltip='title: Editar'></span>"
                                    CancelText="<span uk-icon='icon: close'></span>" UpdateText="<span uk-icon='icon: check'></span>"/>
                            </Columns>
                        </asp:GridView>
                    </div>
                </div>
            </div>
        </div>
    </div>
    
    <asp:LinqDataSource ID="DS_TipoP" runat="server" ContextTypeName="ConexionLQDataContext" EntityTypeName="" TableName="Tipo_Pendiente"></asp:LinqDataSource>
</asp:Content>

