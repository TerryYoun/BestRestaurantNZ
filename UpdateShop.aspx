<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="UpdateShop.aspx.cs" Inherits="BestRestaurantNZ.WebForm11" %>

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
                                        <td colspan="3" class="master-style4">Update Shop</td>
                                    </tr>
                                    <tr style='background-color: #bfbeb8'>
                                        <td style="text-align-left">Name</td>
                                        <td class="text-align-left">
                                            <asp:TextBox ID="tbShopName" runat="server" Width="300px"></asp:TextBox>
                                        </td>
                                        <td>
                                            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="Input Shop Name" ControlToValidate="tbShopName" Font-Bold="True" Font-Size="X-Large" ForeColor="#CC0000" ValidationGroup="update">*</asp:RequiredFieldValidator>
                                        </td>
                                    </tr>
                                    <tr style='background-color: #bfbeb8'>
                                        <td>SubName</td>
                                        <td class="text-align-left">
                                            <asp:TextBox ID="tbShopSubName" runat="server" Width="300px"></asp:TextBox>
                                        </td>
                                        <td>&nbsp;</td>
                                    </tr>
                                    <tr style='background-color: #bfbeb8'>
                                        <td>Description</td>
                                        <td>
                                            <asp:TextBox ID="tbShopInformation" runat="server" Height="124px" TextMode="MultiLine" Width="300px"></asp:TextBox>
                                        </td>
                                        <td>
                                            <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="Input Description" ValidationGroup="update" ControlToValidate="tbShopInformation" Font-Bold="True" Font-Size="X-Large" ForeColor="Red">*</asp:RequiredFieldValidator>
                                        </td>
                                    </tr>
                                    <tr style='background-color: #bfbeb8'>
                                        <td>Address</td>
                                        <td>
                                            <asp:TextBox ID="tbShopAddress" name="tbShopAddress" runat="server" Width="300px"></asp:TextBox>
                                        </td>
                                        <td>&nbsp;</td>
                                    </tr>
                                    <tr style='background-color: #bfbeb8'>
                                        <td>Phone</td>
                                        <td>
                                            <asp:TextBox ID="tbShopPhone" runat="server" Width="300px"></asp:TextBox>
                                        </td>
                                        <td>&nbsp;</td>
                                    </tr>
                                    <tr height="40">
                                        <td>Region</td>
                                        <td>
                                            <asp:DropDownList ID="DropDownList1" runat="server" DataSourceID="SqlDataSource1" DataTextField="regionName" DataValueField="regionName" Width="205px">
                                            </asp:DropDownList>
                                            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:dbBrnzConnectionString %>" SelectCommand="SELECT [regionName] FROM [tblRegion]"></asp:SqlDataSource>
                                        </td>
                                        <td>&nbsp;</td>
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
                            <td height="30px">
                                <asp:Button ID="Button2" runat="server" Text="Update" class="button-small" OnClick="Button2_Click" Style="height: 26px" ValidationGroup="update" />&nbsp;&nbsp;&nbsp;&nbsp;                               
                                <asp:Button ID="Button3" runat="server" Text="Cancel" class="button-small" OnClick="Button3_Click" Style="height: 26px" />
                            </td>
                        </tr>
                    </table>
                </td>
            </tr>
        </table>
    </div>
</asp:Content>
