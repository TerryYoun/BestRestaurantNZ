<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="BestRestaurantNZ.WebForm1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div>
        <table width="100%">
            <tr>
                <td align="center">
                    <table>
                        <tr>
                            <td height="5px"></td>
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
                            <td><a href="Promotion.aspx"><img src="./Properties/deal.jpg" /></a></td>
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
                            <td height="5px"></td>
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
                            <td>Region</td>
                            <td>
                                <asp:DropDownList ID="DropDownList1" runat="server" DataSourceID="SqlDataSource1" DataTextField="regionName" DataValueField="regionName" Width="205px">
                                </asp:DropDownList>
                                <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:dbBrnzConnectionString %>" SelectCommand="SELECT [regionName] FROM [tblRegion]"></asp:SqlDataSource>
                            </td>
                            <td>
                                <asp:Button ID="Button2" runat="server" Text="Search" Class="button-small" OnClick="Button2_Click" />
                            </td>
                        </tr>
                    </table>
                </td>
            </tr>
        </table>
    </div>
    <div>
        <table>
            <tr>
                <td align="center">
                    <table class="auto-style2">
                        <tr>
                            <td>
                                <asp:ListView ID="ListView1" runat="server">
                                    <ItemTemplate>
                                        <div>
                                            <table width="780px" style="padding: 1px 1px 1px 1px; border: 1px #000000 solid">
                                                <tr>
                                                    <td style="text-align: center;"><a href="SearchDetail.aspx?shopID=<%#Eval("shopID")%>">
                                                        <img src="<%#Eval("shopImage")%>" /></a></td>
                                                </tr>
                                                <tr>
                                                    <td style="text-align: center;">
                                                        <h1><%#Eval("shopName")%></h1>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td style="text-align: center;">
                                                        <h2><%#Eval("shopSubName")%>(<%#Eval("shopRegion")%>)</h2>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td>
                                                        <h3><%#Eval("shopIntroduce")%></h3>
                                                    </td>
                                                </tr>
                                            </table>
                                            <br />
                                        </div>
                                    </ItemTemplate>
                                </asp:ListView>
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
