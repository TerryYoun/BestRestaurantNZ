<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="DeleteShop.aspx.cs" Inherits="BestRestaurantNZ.WebForm10" %>

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
                                        <td colspan="3" class="master-style4">Delete Shop</td>
                                    </tr>
                                    <tr style='background-color: #bfbeb8'>
                                        <td style="text-align-left">Name</td>
                                        <td class="text-align-left">
                                            <asp:TextBox ID="tbShopName" runat="server" Width="300px" ReadOnly="True"></asp:TextBox>
                                        </td>
                                        <td>&nbsp;</td>
                                    </tr>
                                    <tr style='background-color: #bfbeb8'>
                                        <td>SubName</td>
                                        <td class="text-align-left">
                                            <asp:TextBox ID="tbShopSubName" runat="server" Width="300px" ReadOnly="True"></asp:TextBox>
                                        </td>
                                        <td>&nbsp;</td>
                                    </tr>
                                    <tr style='background-color: #bfbeb8'>
                                        <td>Information</td>
                                        <td>
                                            <asp:TextBox ID="tbShopInformation" runat="server" Height="124px" TextMode="MultiLine" Width="300px" ReadOnly="True"></asp:TextBox>
                                        </td>
                                        <td>&nbsp;</td>
                                    </tr>
                                    <tr style='background-color: #bfbeb8'>
                                        <td>Address</td>
                                        <td>
                                            <asp:TextBox ID="tbShopAddress" name="tbShopAddress" runat="server" Width="300px" ReadOnly="True"></asp:TextBox>
                                        </td>
                                        <td>&nbsp;</td>
                                    </tr>
                                    <tr style='background-color: #bfbeb8'>
                                        <td>Phone</td>
                                        <td>
                                            <asp:TextBox ID="tbShopPhone" runat="server" Width="300px" ReadOnly="True"></asp:TextBox>
                                        </td>
                                        <td>&nbsp;</td>
                                    </tr>
                                                                        <tr style='background-color: #bfbeb8'>
                                        <td>Region</td>
                                        <td>
                                            <asp:TextBox ID="tbShopRegion" runat="server" Width="300px" ReadOnly="True"></asp:TextBox>
                                        </td>
                                        <td>&nbsp;</td>
                                    </tr>
                                    <tr style='background-color: #bfbeb8'>
                                        <td>Image</td>
                                        <td style="text-align: center;">
                                            <asp:Image ID="Image1" runat="server" Width="100px" Height="100px" />
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
                                <b>Are you use you want to delete this shop?</b><br />
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
