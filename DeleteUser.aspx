<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="DeleteUser.aspx.cs" Inherits="BestRestaurantNZ.WebForm19" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="blankTop">
        <table width="100%">
            <tr>
                <td align="center">
                    <table>
                        <tr>
                            <td height="30px"></td>
                        </tr>
                    </table>
                </td>
            </tr>
        </table>
    </div>
    <div class="favourites">
        <table width="100%">
            <tr>
                <td align="center">
                    <table>
                        <tr>
                            <td height="30px">

                                <table style='border: 1px #000000 solid;'>
                                    <tr style='background-color: yellow'>
                                        <td colspan="3" class="master-style4">Delete User</td>
                                    </tr>
                                    <tr style='background-color: #bfbeb8'>
                                        <td style="text-align-left">Name</td>
                                        <td class="text-align-left">
                                            <asp:TextBox ID="tbUserName" runat="server" Width="300px" ReadOnly="True"></asp:TextBox>
                                        </td>
                                        <td>&nbsp;</td>
                                    </tr>
                                    <tr style='background-color: #bfbeb8'>
                                        <td>Email</td>
                                        <td class="text-align-left">
                                            <asp:TextBox ID="tbEmail" runat="server" Width="300px" ReadOnly="True"></asp:TextBox>
                                        </td>
                                        <td>&nbsp;</td>
                                    </tr>
                                    <tr style='background-color: #bfbeb8'>
                                        <td>Region</td>
                                        <td>
                                            <asp:TextBox ID="tbRegion" runat="server" Width="300px" ReadOnly="True"></asp:TextBox>
                                        </td>
                                        <td>&nbsp;</td>
                                    </tr>
                                </table>

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
                    <table>
                        <tr>
                            <td height="30px" style="text-align: center;">
                                <b>Are you use you want to delete this user?</b><br />
                                <br />
                                <asp:Button ID="Button2" runat="server" Text="Delete" class="button-small" OnClick="Delete_Click" Style="height: 26px" />
                                <asp:Button ID="Button3" runat="server" Text="Cancel" class="button-small" OnClick="Cancel_Click" Style="height: 26px" />
                            </td>
                        </tr>
                    </table>
                </td>
            </tr>
        </table>
    </div>
</asp:Content>
