<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage/MP_Central.master" AutoEventWireup="true" CodeFile="Inicio.aspx.cs" Inherits="NavPrivada_Inicio" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">


    <div class="uk-section-default">
        <div id="test-filter" class="uk-section uk-light uk-background-cover uk-overflow-hidden uk-flex uk-flex-top" style="background-image: url(../img/ProfileBG.png); height: 50vh">
            <div class="uk-width-1-2@m uk-text-center uk-margin-auto uk-margin-auto-vertical" uk-parallax="target: #test-filter; blur: 0,10;">
                <div class="uk-overlay uk-overlay-primary uk-width-large">
                    <div class="uk-grid-small uk-flex-middle" uk-grid>
                        <div class="uk-width-auto">
                            <img class="uk-border-circle uk-height-small" src="../img/DefaultPP.png">
                        </div>
                        <div class="uk-width-expand">
                            <h3 id="Username" class="uk-card-title uk-margin-remove-bottom">Tukulito Sakayama</h3>
                            <p id="Description" class="uk-text-meta uk-margin-remove-top">Zoy Muy kul xddddd</p>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <div class="uk-section-default">
        <div class="uk-section-secondary">
            <div class="uk-container">
                <h2 class="uk-text-center uk-margin-top">Agregar un pendiente</h2>
                <div class="uk-padding" uk-grid>
                    <a href="#" class="uk-icon-button uk-margin-small-right" uk-icon="icon: search" uk-tooltip="title: Ver pendientes"></a>
                    <asp:TextBox ID="txt_pendiente" CssClass="uk-width-1-2 uk-input" runat="server"></asp:TextBox>
                    <asp:DropDownList ID="dd_tipopendiente" CssClass="uk-width-1-4 uk-select" runat="server" forecolor="#999999"></asp:DropDownList>
                    <asp:Button ID="btn_crear" CssClass="uk-width-expand uk-button uk-button-primary" runat="server" Text="Crear Pendiente" />
                </div>
            </div>
        </div>
    </div>

    <div class="uk-section-muted uk-padding">
        <div class="uk-container">
            <div class="uk-child-width-1-2@s uk-child-width-1-3@m uk-text-center uk-flex-center" uk-grid>
                <div>
                    <div class="uk-card uk-card-default uk-card-body uk-height-large">Item</div>
                </div>
                <div>
                    <div class="uk-card uk-card-default uk-card-body uk-height-large">Item</div>
                </div>
                <div>
                    <div class="uk-card uk-card-default uk-card-body uk-height-large">Item</div>
                </div>
                <div>
                    <div class="uk-card uk-card-default uk-card-body uk-height-large">Item</div>
                </div>
                <div>
                    <div class="uk-card uk-card-default uk-card-body uk-height-large">Item</div>
                </div>
                <div>
                    <div class="uk-card uk-card-default uk-card-body uk-height-large">Item</div>
                </div>
                <div>
                    <div class="uk-card uk-card-default uk-card-body uk-height-large">Item</div>
                </div>
                <div>
                    <div class="uk-card uk-card-default uk-card-body uk-height-large">Item</div>
                </div>
                <div>
                    <div class="uk-card uk-card-default uk-card-body uk-height-large">Item</div>
                </div>
                <div>
                    <div class="uk-card uk-card-default uk-card-body uk-height-large">Item</div>
                </div>
                <div>
                    <div class="uk-card uk-card-default uk-card-body uk-height-large">Item</div>
                </div>
                <div>
                    <div class="uk-card uk-card-default uk-card-body uk-height-large">Item</div>
                </div>
                <div>
                    <div class="uk-card uk-card-default uk-card-body uk-height-large">Item</div>
                </div>
                <div>
                    <div class="uk-card uk-card-default uk-card-body uk-height-large">Item</div>
                </div>
                <div>
                    <div class="uk-card uk-card-default uk-card-body uk-height-large">Item</div>
                </div>
                <div>
                    <div class="uk-card uk-card-default uk-card-body uk-height-large">Item</div>
                </div>
                <div>
                    <div class="uk-card uk-card-default uk-card-body uk-height-large">Item</div>
                </div>
                <div>
                    <div class="uk-card uk-card-default uk-card-body uk-height-large">Item</div>
                </div>
                <div>
                    <div class="uk-card uk-card-default uk-card-body uk-height-large">Item</div>
                </div>
            </div>
        </div>

    </div>
</asp:Content>

