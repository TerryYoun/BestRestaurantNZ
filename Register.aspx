<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="Register.aspx.cs" Inherits="BestRestaurantNZ.WebForm9" %>

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
                                        <td colspan="3" class="auto-style14"><strong>Registration</strong></td>
                                    </tr>
                                    <tr height="40">
                                        <td width="250px">Enter Your Name</td>
                                        <td width="240px">
                                            <asp:TextBox ID="tbRegName" runat="server" Width="200px"></asp:TextBox>
                                        </td>
                                        <td>
                                            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="tbRegName" ErrorMessage="Please enter your name." Font-Bold="True" Font-Size="Large" ForeColor="Red" ValidationGroup="reg">*</asp:RequiredFieldValidator>
                                        </td>
                                    </tr>
                                    <tr height="40">
                                        <td>Email Address (User ID)</td>
                                        <td>
                                            <asp:TextBox ID="tbRegEmail" runat="server" Width="200px"></asp:TextBox>
                                        </td>
                                        <td>
                                            <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="tbRegEmail" ErrorMessage="Email address must be entered and it should be in correct format." Font-Bold="True" Font-Size="Large" ForeColor="Red" ValidationGroup="reg" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*">*</asp:RegularExpressionValidator>
                                            <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="tbRegEmail" Font-Bold="True" Font-Size="Large" ForeColor="Red" ValidationGroup="reg" ErrorMessage="Email address must be entered and it should be in correct format.">*</asp:RequiredFieldValidator>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>Confirm Email Address</td>
                                        <td>
                                            <asp:TextBox ID="tbRegConfirmEmail" runat="server" Width="200px"></asp:TextBox>
                                        </td>
                                        <td>
                                            <asp:CompareValidator ID="CompareValidator1" runat="server" ControlToCompare="tbRegConfirmEmail" ControlToValidate="tbRegEmail" ErrorMessage="Email address and confirm email address must be same." Font-Bold="True" Font-Size="Large" ForeColor="Red" ValidationGroup="reg">*</asp:CompareValidator>
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
                                    <tr height="40">
                                        <td>Region</td>
                                        <td>
                                            <asp:DropDownList ID="DropDownList1" runat="server" DataSourceID="SqlDataSource1" DataTextField="regionName" DataValueField="regionName" Width="205px">
                                            </asp:DropDownList>
                                            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:dbBrnzConnectionString %>" SelectCommand="SELECT [regionName] FROM [tblRegion]"></asp:SqlDataSource>
                                        </td>
                                        <td>&nbsp;</td>
                                    </tr>
                                    <tr height="80">
                                        <td class="auto-style7" colspan="3">
                                            <strong>
                                                <asp:Button ID="brnRegister" runat="server" Text="Register User" CssClass="button-big" ValidationGroup="reg" OnClick="Button1_Click" Style="color: #FFFFFF; font-weight: bold; font-size: large; background-color: #FF0000" Width="200px" />&nbsp;&nbsp;&nbsp;&nbsp;
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
