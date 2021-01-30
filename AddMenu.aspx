<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="AddMenu.aspx.cs" Inherits="BestRestaurantNZ.WebForm16" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="blankTop">
        <table width="100%">
            <tr>
                <td align="center">
                    <table>
                        <tr>
                            <td height="30px">
                                <asp:ValidationSummary ID="ValidationSummary1" runat="server" ValidationGroup="update" />
                            </td>
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
                                        <td colspan="3" class="master-style4">Add Menu</td>
                                    </tr>
                                    <tr style='background-color: #bfbeb8'>
                                        <td style="text-align-left">Name</td>
                                        <td class="text-align-left">
                                            <asp:TextBox ID="tbMenuName" runat="server" Width="300px"></asp:TextBox>
                                        </td>
                                        <td>
                                            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="tbMenuName" ErrorMessage="Input Menu Name" Font-Bold="True" Font-Size="X-Large" ForeColor="Red" ValidationGroup="update">*</asp:RequiredFieldValidator>
                                        </td>
                                    </tr>
                                    <tr style='background-color: #bfbeb8'>
                                        <td>Price</td>
                                        <td class="text-align-left">
                                            <asp:TextBox ID="tbMenuPrice" runat="server" Width="300px"></asp:TextBox>
                                        </td>
                                        <td>
                                            <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="tbMenuPrice" ErrorMessage="Input Menu Price" Font-Bold="True" Font-Size="X-Large" ForeColor="Red" ValidationGroup="update">*</asp:RequiredFieldValidator>
                                            <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="tbMenuPrice" ErrorMessage="Input a Double Number (ex 10.0)" Font-Bold="True" Font-Size="X-Large" ForeColor="Red" ValidationExpression="^[0-9]{1,2}([,.]{1}[0-9]{1,2})?$" ValidationGroup="update">*</asp:RegularExpressionValidator>
                                        </td>
                                    </tr>
                                    <tr style='background-color: #bfbeb8'>
                                        <td>Description</td>
                                        <td>
                                            <asp:TextBox ID="tbMenuDesc" runat="server" Height="124px" TextMode="MultiLine" Width="300px"></asp:TextBox>
                                        </td>
                                        <td>&nbsp;</td>
                                    </tr>
                                                                        <tr style='background-color: #bfbeb8'>
                                        <td style="text-align-left">Promotion</td>
                                        <td class="text-align-left">
                                            <asp:CheckBox ID="tbMenuPromo" runat="server" Width="300px"></asp:CheckBox>
                                        </td>
                                        <td>
                                        </td>
                                    </tr>
                                    <tr style='background-color: #bfbeb8'>
                                        <td>Price</td>
                                        <td class="text-align-left">
                                            <asp:TextBox ID="tbMenuPromoPrice" runat="server" Width="300px"></asp:TextBox>
                                        </td>
                                        <td>
                                            <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="tbMenuPromoPrice" ErrorMessage="Input Menu Promo Price" Font-Bold="True" Font-Size="X-Large" ForeColor="Red" ValidationGroup="update">*</asp:RequiredFieldValidator>
                                            <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" ControlToValidate="tbMenuPromoPrice" ErrorMessage="Input a Double Number at Promotion Price (ex 10.0)" Font-Bold="True" Font-Size="X-Large" ForeColor="Red" ValidationExpression="^[0-9]{1,2}([,.]{1}[0-9]{1,2})?$" ValidationGroup="update">*</asp:RegularExpressionValidator>
                                        </td>
                                    </tr>
                                    <tr style='background-color: #bfbeb8'>
                                        <td>Image</td>
                                        <td style="text-align: center;">
                                            <asp:FileUpload ID="FileUpload1" runat="server" />
                                            <asp:Label ID="lbImage" runat="server"></asp:Label>
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
                                <asp:Button ID="Button2" runat="server" Text="Add" class="button-small" OnClick="Add_Click" Style="height: 26px" ValidationGroup="update" />&nbsp;&nbsp;&nbsp;&nbsp;
                                <asp:Button ID="Button3" runat="server" Text="Cancel" class="button-small" OnClick="Cancel_Click" Style="height: 26px" />
                            </td>
                        </tr>
                    </table>
                </td>
            </tr>
        </table>
    </div>
</asp:Content>
