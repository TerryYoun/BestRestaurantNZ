<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="Favourites.aspx.cs" Inherits="BestRestaurantNZ.WebForm5" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="blankTop">
        <table width="100%">
            <tr>
                <td align="center">
                    <table width="780px">
                        <tr>
                            <td height="20px" style="text-align: right;">
                                <asp:Button ID="btnCheckOut" runat="server" Text="Check Out" CssClass="button-small" OnClick="btnCheckOut_Click" />
                            </td>
                        </tr>
                    </table>
                </td>
            </tr>
        </table>
    </div>
    <div class="restaurant">
        <table width="100%">
            <tr>
                <td align="center">
                    <table width="780px">
                        <tr>
                            <td height="30px">
                                <asp:Label ID="lbTest" runat="server" Text=""></asp:Label>
                            </td>
                        </tr>
                    </table>
                </td>
            </tr>
        </table>
    </div>
    <div class="blankBottom">
        <table width="100%">
            <tr>
                <td align="center">
                    <table width="780px">
                        <tr>
                            <td height="20px"></td>
                        </tr>
                    </table>
                </td>
            </tr>
        </table>
    </div>
</asp:Content>
