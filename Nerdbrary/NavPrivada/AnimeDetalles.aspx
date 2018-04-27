<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage/MP_Central.master" AutoEventWireup="true" CodeFile="AnimeDetalles.aspx.cs" Inherits="NavPrivada_AnimeDetalles" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
            <div>
                <h1>
                    <asp:Label ID="TituloA" runat="server" Text="Titulo"></asp:Label></h1>
            </div>
            <br />
            <table>
                <tr>
                    <td>
                        <img id="imagen" runat="server" src="../img/anime/" style="border: solid; height: 300px" alt="Imagen del anime" />
                    </td>
                    <td>&nbsp;</td>
                    <td style="vertical-align: top; text-align: left;">
                        <b>Descripcion:</b><br />
                        <asp:Label ID="DescripcionA" runat="server" Text="Descripcion del Anime"></asp:Label>
                        <br />
                        <span><b>Temporadas:</b><asp:Label ID="TemporadasA" runat="server" Text="Temporadas del Anime"></asp:Label>
                        </span>
                        <br />
                        <span><b>Capitulos:</b>
                            <asp:Label ID="CapitulosA" runat="server" Text="Label"></asp:Label></span><br />
                    </td>
                </tr>
            </table>






</asp:Content>

