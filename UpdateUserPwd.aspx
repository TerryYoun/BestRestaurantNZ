<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="UpdateUserPwd.aspx.cs" Inherits="BestRestaurantNZ.WebForm20" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div>
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
    <div class="summary">
        <table width="100%">
            <tr>
                <td align="center">
                    <table>
                        <tr>
                            <td>
                                <strong>
                                    <asp:ValidationSummary ID="ValidationSummary1" runat="server" ValidationGroup="reg" CssClass="auto-style8" />
                                </strong>
                            </td>
                        </tr>
                    </table>
                </td>
            </tr>
        </table>
    </div>
    <div class="register">
        <table width="100%" height="200px">
            <tr>
                <td align="center">
                    <table>
                        <tr>
                            <td>
                                <table class="auto-style9">
                                    <tr height="80">
                                        <td colspan="3" class="auto-style14"><strong>Update Password</strong></td>
                                    </tr>
                                    <tr>
                                        <td style="text-align-left">Name</td>
                                        <td class="text-align-left">
                                            <asp:TextBox ID="tbUserName" runat="server" Width="300px" ReadOnly="True"></asp:TextBox>
                                        </td>
                                        <td>&nbsp;</td>
                                    </tr>
                                    <tr>
                                        <td>Email</td>
                                        <td class="text-align-left">
                                            <asp:TextBox ID="tbEmail" runat="server" Width="300px" ReadOnly="True"></asp:TextBox>
                                        </td>
                                        <td>&nbsp;</td>
                                    </tr>
                                                                        <tr height="40">
                                        <td>Old Password</td>
                                        <td>
                                            <asp:TextBox ID="tbOldPwd" runat="server" Width="200px" TextMode="Password"></asp:TextBox>
                                        </td>
                                        <td>
                                            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="tbOldPwd" ErrorMessage="Password must be enterd." Font-Bold="True" Font-Size="Large" ForeColor="Red" ValidationGroup="reg">*</asp:RequiredFieldValidator>
                                        </td>
                                    </tr>
                                    <tr height="40">
                                        <td>New Password</td>
                                        <td>
                                            <asp:TextBox ID="tbRegPwd" runat="server" Width="200px" TextMode="Password"></asp:TextBox>
                                        </td>
                                        <td>
                                            <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="tbRegPwd" ErrorMessage="Password must be enterd." Font-Bold="True" Font-Size="Large" ForeColor="Red" ValidationGroup="reg">*</asp:RequiredFieldValidator>
                                        </td>
                                    </tr>
                                    <tr height="40">
                                        <td>Confirm New Password</td>
                                        <td>
                                            <asp:TextBox ID="tbRegConfirmPwd" runat="server" Width="200px" TextMode="Password"></asp:TextBox>
                                        </td>
                                        <td>
                                            <asp:CompareValidator ID="CompareValidator2" runat="server" ControlToCompare="tbRegConfirmPwd" ControlToValidate="tbRegPwd" ErrorMessage="Password and confirm password must be same. " Font-Bold="True" Font-Size="Large" ForeColor="Red" ValidationGroup="reg">*</asp:CompareValidator>
                                        </td>
                                    </tr>
                                    <tr height="80">
                                        <td class="auto-style7" colspan="3">
                                            <strong>
                                                <asp:Button ID="btnUpdate" runat="server" Text="Update Password" CssClass="button-big" ValidationGroup="reg" OnClick="Button1_Click" Style="color: #FFFFFF; font-weight: bold; font-size: large; background-color: #FF0000" Width="200px" />&nbsp;&nbsp;&nbsp;&nbsp;
                <asp:Button ID="btnHome" runat="server" Text="Home" CssClass="button-big" OnClick="Button2_Click" Style="color: #FFFFFF; font-weight: bold; font-size: large; background-color: #FF0000" Width="120px" />
                                            </strong>
                                        </td>
                                    </tr>
                                </table>
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
                            <td height="30px"></td>
                        </tr>
                    </table>
                </td>
            </tr>
        </table>
    </div>
</asp:Content>
