<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="ForgotRegister.aspx.cs" Inherits="BestRestaurantNZ.WebForm27" %>

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
                                    <tr height="2px">
                                        <td colspan="3">
                                            <h1>Reset password.</h1>
                                        </td>
                                    </tr>
                                    <tr height="2px">
                                        <td colspan="3">
                                            <h3>Reset your password.</h3>
                                        </td>
                                    </tr>
                                    <tr height="40">
                                        <td width="80%">Email:
                                        </td>
                                        <td>
                                            <asp:TextBox ID="tbFrEmail" runat="server" Width="200px"></asp:TextBox></asp:TextBox>
                                        </td>
                                        <td style="text-align: left;">
                                            <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="tbFrEmail" ErrorMessage="Please enter your email." Font-Bold="True" Font-Size="Large" ForeColor="Red" ValidationGroup="reg">*</asp:RequiredFieldValidator>
                                            <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" ControlToValidate="tbFrEmail" ErrorMessage="Email address must be entered and it should be in correct format." Font-Bold="True" Font-Size="X-Large" ForeColor="Red" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" ValidationGroup="reg">*</asp:RegularExpressionValidator>
                                        </td>
                                    </tr>
                                    <tr height="40">
                                        <td>Password</td>
                                        <td>
                                            <asp:TextBox ID="tbRegPwd" runat="server" Width="200px" TextMode="Password"></asp:TextBox>
                                        </td>
                                        <td>
                                            <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="tbRegPwd" ErrorMessage="Password must be enterd." Font-Bold="True" Font-Size="Large" ForeColor="Red" ValidationGroup="reg">*</asp:RequiredFieldValidator>
                                        </td>
                                    </tr>
                                    <tr height="40">
                                        <td>Confirm Password</td>
                                        <td>
                                            <asp:TextBox ID="tbRegConfirmPwd" runat="server" Width="200px" TextMode="Password"></asp:TextBox>
                                        </td>
                                        <td>
                                            <asp:CompareValidator ID="CompareValidator2" runat="server" ControlToCompare="tbRegConfirmPwd" ControlToValidate="tbRegPwd" ErrorMessage="Password and confirm password must be same. " Font-Bold="True" Font-Size="Large" ForeColor="Red" ValidationGroup="reg">*</asp:CompareValidator>
                                        </td>
                                    </tr>
                                    <tr height="80">
                                        <td class="auto-style7" colspan="2">
                                            <strong>
                                                <asp:Button ID="btnForgotRegister" runat="server" Text="Reset" CssClass="btn2" ValidationGroup="reg" OnClick="btnForgotRegister_Click" Style="color: #FFFFFF; font-weight: bold; font-size: large; background-color: #FF0000" Width="200px" />
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
