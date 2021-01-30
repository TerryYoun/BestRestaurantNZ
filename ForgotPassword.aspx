<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="ForgotPassword.aspx.cs" Inherits="BestRestaurantNZ.WebForm26" %>

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
                                        <td colspan="2"><h1>Forgot your password?</h1></td>
                                    </tr>
                                    <tr height="2px"><td colspan="2"><h3>Enter your Email.</h3></td></tr>
                                    <tr height="40">
                                        <td width="80%">Email: <asp:TextBox ID="tbFpEmail" runat="server" Width="200px"></asp:TextBox></td>
                                        <td style="text-align:left;">
                                            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="tbFpEmail" ErrorMessage="Please enter your email." Font-Bold="True" Font-Size="Large" ForeColor="Red" ValidationGroup="reg">*</asp:RequiredFieldValidator>
                                            <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="tbFpEmail" ErrorMessage="Email address must be entered and it should be in correct format." Font-Bold="True" Font-Size="X-Large" ForeColor="Red" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" ValidationGroup="reg">*</asp:RegularExpressionValidator>
                                        </td>
                                    </tr>
                                 
                                    <tr height="80">
                                        <td class="auto-style7" colspan="2">
                                            <strong>
                                                <asp:Button ID="btnEmailLink" runat="server" Text="Email Link" CssClass="btn2" ValidationGroup="reg" OnClick="btnEmailLink_Click" Style="color: #FFFFFF; font-weight: bold; font-size: large; background-color: #FF0000" Width="200px" />
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
