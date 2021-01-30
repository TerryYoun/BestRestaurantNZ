<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="BestRestaurantNZ.WebForm8" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">

    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="footer">
        <table width="100%">
            <tr>
                <td align="center">
                    <table>
                        <tr>
                            <td>

                                <strong>

                                    <asp:ValidationSummary ID="ValidationSummary1" runat="server" CssClass="auto-style8" ValidationGroup="login" />

                                </strong>

                            </td>
                        </tr>
                    </table>
                </td>
            </tr>
        </table>
    </div>
    <div class="login">
        <table width="100%">
            <tr>
                <td align="center">
                    <table>
                        <tr>
                            <td>
                                <table class="auto-style13">
                                    <tr height="40">
                                        <td class="auto-style14" colspan="3"><strong>Login</strong></td>
                                    </tr>
                                    <tr height="40">
                                        <td class="auto-style12"><strong>Email Address(User ID)</strong></td>
                                        <td width="90px">
                                            <asp:TextBox ID="tbLoginId" runat="server" Width="170px"></asp:TextBox>
                                        </td>
                                        <td width="20px">
                                            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="Input Email Address" ControlToValidate="tbLoginId" Font-Bold="True" Font-Size="Large" ForeColor="Red" ValidationGroup="login">*</asp:RequiredFieldValidator>
                                        </td>
                                    </tr>
                                    <tr height="40">
                                        <td class="auto-style12"><strong>Password</strong></td>
                                        <td>
                                            <asp:TextBox ID="tbLoginPwd" runat="server" Width="170px" TextMode="Password"></asp:TextBox>
                                        </td>
                                        <td>
                                            <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="Input Password" ControlToValidate="tbLoginPwd" Font-Bold="True" Font-Size="Large" ForeColor="Red" ValidationGroup="login">*</asp:RequiredFieldValidator>
                                        </td>
                                    </tr>
                                    <tr height="40">
                                        <td class="auto-style7" colspan="3" style="font-size:small; text-align: center;"><strong>
                                            <asp:Button ID="btnLogin" runat="server" CssClass="button-big" Text="Login" OnClick="btnLogin_Click" ValidationGroup="login" Width="120px" />&nbsp;&nbsp;&nbsp;&nbsp;
                                            <asp:Button ID="btnLoginRegister" runat="server" CssClass="button-big" Text="Register" OnClick="btnLoginRegister_Click" Width="120px" />
                                            &nbsp;&nbsp;<a href="ForgotPassword.aspx">Forgot password?</a>
                                        </strong></td>
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
