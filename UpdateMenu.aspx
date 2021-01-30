<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="UpdateMenu.aspx.cs" Inherits="BestRestaurantNZ.WebForm13" %>

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
                                        <td colspan="3" class="master-style4">Update Menu</td>
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
                                            <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="tbMenuPrice" ErrorMessage="Input Double Number (ex 10.0)" Font-Bold="True" Font-Size="X-Large" ForeColor="Red" ValidationExpression="^[0-9]{1,2}([,.]{1}[0-9]{1,2})?$" ValidationGroup="update">*</asp:RegularExpressionValidator>
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
                                            <asp:CheckBox ID="cbPromotion" runat="server" Width="300px"></asp:CheckBox>
                                        </td>
                                        <td>&nbsp;</td>
                                    </tr>
                                    <tr style='background-color: #bfbeb8'>
                                        <td>Price</td>
                                        <td class="text-align-left">
                                            <asp:TextBox ID="tbPromoPrice" runat="server" Width="300px"></asp:TextBox>
                                        </td>
                                        <td>
                                            <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="tbPromoPrice" ErrorMessage="Input Menu Price" Font-Bold="True" Font-Size="X-Large" ForeColor="Red" ValidationGroup="update">*</asp:RequiredFieldValidator>
                                            <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" ControlToValidate="tbPromoPrice" ErrorMessage="Input a Double Number at Promotion Price(ex 10.0)" Font-Bold="True" Font-Size="X-Large" ForeColor="Red" ValidationExpression="^[0-9]{1,2}([,.]{1}[0-9]{1,2})?$" ValidationGroup="update">*</asp:RegularExpressionValidator>
                                        </td>
                                    </tr>
                                    <tr style='background-color: #bfbeb8'>
                                        <td>Image</td>
                                        <td style="text-align: center;">
                                            <asp:Image ID="Image1" runat="server" Width="100px" Height="100px" />&nbsp;<asp:FileUpload ID="FileUpload1" runat="server" />
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
                                <asp:Button ID="Button2" runat="server" Text="Update" class="button-small" OnClick="Update_Click" Style="height: 26px" ValidationGroup="update" />&nbsp;&nbsp;&nbsp;&nbsp;
                                <asp:Button ID="Button3" runat="server" Text="Cancel" class="button-small" OnClick="Cancel_Click" Style="height: 26px" />
                            </td>
                        </tr>
                    </table>
                </td>
            </tr>
        </table>
    </div>
</asp:Content>
