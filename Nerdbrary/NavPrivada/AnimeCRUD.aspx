<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage/MP_Central.master" AutoEventWireup="true" CodeFile="AnimeCRUD.aspx.cs" Inherits="NavPrivada_AnimeCRUD" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <asp:ScriptManager runat="server"></asp:ScriptManager>
    <div class="uk-section-default uk-margin">
        <div class="uk-section">
            <div class="uk-container">
                <div class="uk-card uk-card-secondary">
                    <h1 class="uk-heading-line uk-text-center uk-padding">Mantenedor de Anime</h1>
                    <div class="uk-card-body" uk-grid>
                        <div class="uk-width-1-2@m">
                            <p>Nombre</p>
                            <div class="uk-inline">
                                <span class="uk-form-icon" uk-icon="icon: bookmark"></span>
                                <asp:TextBox ID="txt_nombre" CssClass="uk-input uk-width-xlarge" runat="server"></asp:TextBox>
                            </div>
                        </div>
                        <div class="uk-width-1-4@m">
                            <p>Capitulos</p>
                            <div class="uk-inline">
                                <span class="uk-form-icon" uk-icon="icon: tv"></span>
                                <asp:TextBox ID="txt_Precio" CssClass="uk-input uk-form-width-large" runat="server"></asp:TextBox>
                            </div>
                        </div>
                        <div class="uk-width-1-4@m">
                            <p>Temporadas</p>
                            <div class="uk-inline">
                                <span class="uk-form-icon" uk-icon="icon: world"></span>
                                <asp:TextBox ID="txt_temporadas" CssClass="uk-input uk-form-width-large" runat="server"></asp:TextBox>
                            </div>
                        </div>
                        <div class="uk-width-1-4@m">
                            <p>Estado</p>
                            <div class="uk-inline">
                                <asp:DropDownList ID="dd_estadoN" CssClass="uk-select uk-form-width-large" runat="server" ForeColor="#999999"></asp:DropDownList>
                            </div>
                        </div>
                        <div class="uk-width-1-4@m">
                            <p>Genero</p>
                            <div class="uk-inline">
                                <asp:DropDownList ID="dd_generoN" CssClass="uk-select uk-form-width-large" runat="server" ForeColor="#999999"></asp:DropDownList>
                            </div>
                        </div>
                        <div class="uk-width-1-2@m">
                            <p>Otros Generos</p>
                            <div class="uk-inline">
                                <span class="uk-form-icon" uk-icon="icon: tag"></span>
                                <asp:TextBox ID="txt_OGenerosN" CssClass="uk-input uk-width-xlarge" runat="server"></asp:TextBox>
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
                            <asp:FileUpload CssClass="uk-input uk-width-auto" placeholder="Seleccionar Archivo" ID="subir_imagen" runat="server" onchange="VPrevia(this)" />
                        </div>
                        <div class="uk-width-1-1">
                            <div class="uk-inline uk-position-bottom-center uk-position-relative">
                                <span class="uk-form-icon" uk-icon="icon: plus"></span>
                                <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                                    <ContentTemplate>
                                        <asp:Button ID="btn_crear" CssClass="uk-button uk-button-secondary uk-button-large uk-width-1-1" runat="server" Text="Crear Anime" OnClick="btn_crear_Click" />
                                    </ContentTemplate>
                                </asp:UpdatePanel>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>




    <div class="uk-section-default uk-margin">
        <div class="uk-section">
            <div class="uk-container">
                <h1 class=" uk-heading-primary uk-text-center">Lista de Anime</h1>
                <div class="uk-card uk-card-default">
                    <div class="uk-card-body uk-overflow-auto">
                        <asp:GridView ID="GrillaAnime" DataKeyNames="id_Anime" CssClass="uk-table uk-table-divider uk-table-small" AutoGenerateColumns="False"
                            OnRowDataBound="GrillaAnime_RowDataBound" OnRowCancelingEdit="GrillaAnime_RowCancelingEdit" OnRowEditing="GrillaAnime_RowEditing"
                            OnRowDeleting="GrillaAnime_RowDeleting" OnRowUpdating="GrillaAnime_RowUpdating"
                            BorderStyle="None" GridLines="None" runat="server">
                            <Columns>
                                <asp:TemplateField HeaderText="ID Anime" Visible="false">
                                    <ItemTemplate>
                                        <asp:Label ID="lbl_id" runat="server" Text='<%# Eval("id_Anime") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Nombre">
                                    <ItemTemplate>
                                        <asp:Label ID="lbl_nombre" runat="server" Text='<%# Eval("Nombre") %>'></asp:Label>
                                    </ItemTemplate>
                                    <EditItemTemplate>
                                        <asp:TextBox ID="txt_nombre" CssClass="uk-input" Text='<%# Eval("Nombre") %>' runat="server"></asp:TextBox>
                                    </EditItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Sinopsis">
                                    <ItemTemplate>
                                        <asp:Label ID="lbl_sinopsis" CssClass=" uk-width-small" runat="server" Text='<%# Eval("Sinopsis")%>'></asp:Label>
                                    </ItemTemplate>
                                    <EditItemTemplate>
                                        <asp:TextBox ID="txt_sinopsis" CssClass="uk-input" Text='<%# Eval("Sinopsis")%>' runat="server" TextMode="MultiLine"></asp:TextBox>
                                    </EditItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Lanzamiento">
                                    <ItemTemplate>
                                        <asp:Label ID="lbl_lanzamiento" runat="server" Text='<%# Eval("Lanzamiento") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Total Capítulos">
                                    <ItemTemplate>
                                        <asp:Label ID="lbl_capitulos" runat="server" Text='<%# Eval("Capitulos") %>'></asp:Label>
                                    </ItemTemplate>
                                    <EditItemTemplate>
                                        <asp:TextBox ID="txt_capitulos" CssClass="uk-input" Text='<%# Eval("Capitulos") %>' runat="server"></asp:TextBox>
                                    </EditItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Genero">
                                    <ItemTemplate>
                                        <asp:Label ID="lbl_genero" runat="server" Text='<%# Eval("Genero") %>'></asp:Label>
                                    </ItemTemplate>
                                    <EditItemTemplate>
                                        <asp:DropDownList ID="dd_genero" runat="server" DataSourceID="LinqDataSource1" DataTextField="Descripcion" DataValueField="id_EstadoSerie"></asp:DropDownList>
                                    </EditItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Estado">
                                    <ItemTemplate>
                                        <asp:Label ID="lbl_Estado" runat="server" Text='<%# Eval("Estado") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <%-- <asp:TemplateField>
                                    <ItemTemplate>
                                        <asp:Button ID="Button1" CssClass="uk-button uk-button-primary uk-button-small" runat="server" Text="Ver" CommandName="Select" CommandArgument="<%# Container.DataItemIndex %>" />
                                    </ItemTemplate>
                                </asp:TemplateField>--%>
                                <asp:CommandField ButtonType="Link" ShowEditButton="true" EditText="<span uk-icon='icon: pencil'></span>"
                                    CancelText="<span uk-icon='icon: close'></span>" UpdateText="<span uk-icon='icon: check'></span>"
                                    ShowDeleteButton="true" DeleteText="<span uk-icon='icon: trash'></span>" />
                            </Columns>
                        </asp:GridView>
                    </div>
                </div>
            </div>
        </div>
    </div>

    
    <asp:LinqDataSource ID="LinqDataSource1" runat="server" ContextTypeName="ConexionLQDataContext" EntityTypeName="" TableName="Estado_Serie">
    </asp:LinqDataSource>
</asp:Content>

