<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage/MP_Central.master" AutoEventWireup="true" CodeFile="AnimeCRUD.aspx.cs" Inherits="NavPrivada_AnimeCRUD" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div class="uk-section-default uk-margin">
        <div class="uk-section">
            <div class="uk-container">
                <h1 class="uk-heading-line uk-text-center">Mantenedor de Anime</h1>
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
                            OnDataBound="GrillaAnime_DataBound" OnRowCancelingEdit="GrillaAnime_RowCancelingEdit" OnRowEditing="GrillaAnime_RowEditing"
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
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Genero">
                                    <ItemTemplate>
                                        <asp:Label ID="lbl_genero" runat="server" Text='<%# Eval("Genero") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Estado">
                                    <ItemTemplate>
                                        <asp:Label ID="lbl_Estado" runat="server" Text='<%# Eval("Estado") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField>
                                    <ItemTemplate>
                                        <asp:Button ID="Button1" CssClass="uk-button uk-button-primary uk-button-small" runat="server" Text="Ver" CommandName="Select" CommandArgument="<%# Container.DataItemIndex %>" />
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:CommandField ButtonType="Link" ShowEditButton="true" EditText="<span uk-icon='icon: trash'></span>"
                                    CancelText="<span uk-icon='icon: close'></span>" UpdateText="<span uk-icon='icon: check'></span>"
                                    ShowDeleteButton="true" DeleteText="<span uk-icon='icon: trash'></span>" />
                            </Columns>
                        </asp:GridView>
                    </div>
                </div>
            </div>
        </div>
    </div>
</asp:Content>

