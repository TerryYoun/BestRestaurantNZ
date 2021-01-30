<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="Restaurant.aspx.cs" Inherits="BestRestaurantNZ.WebForm6" %>

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
                                <asp:Button ID="Button2" runat="server" Text="Add Restaurant" Width="141px" Height="28px" class="button-small" OnClick="Button2_Click" />
                            </td>
                        </tr>
                    </table>
                </td>
            </tr>
        </table>
    </div>
    <div>
        <table width="100%">
            <tr>
                <td align="center">
                    <table>
                        <tr>
                            <td height="30px" width="20%" style="text-align:right;padding-right:20px;">
                                <asp:DropDownList ID="DropDownList1" runat="server">
                                    <asp:ListItem>All</asp:ListItem>
                                    <asp:ListItem>Name</asp:ListItem>
                                    <asp:ListItem>SubName</asp:ListItem>
                                    <asp:ListItem>Introduce</asp:ListItem>
                                    <asp:ListItem>Address</asp:ListItem>
                                    <asp:ListItem>Phone</asp:ListItem>
                                    <asp:ListItem>Region</asp:ListItem>
                                </asp:DropDownList>
                            </td>
                            <td width="40%" style="text-align:center"><asp:TextBox ID="tbSearch" runat="server" Width="400px" Height="28px"></asp:TextBox></td>
                            <td style="text-align:right">&nbsp;&nbsp;<asp:Button ID="Button1" runat="server" Text="Search" Height="28px" Width="141px" class="button-small" OnClick="Search_Click"/></td>
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
