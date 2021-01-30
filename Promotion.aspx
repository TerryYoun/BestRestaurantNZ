<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="Promotion.aspx.cs" Inherits="BestRestaurantNZ.WebForm23" %>

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
    <div>
        <table width="100%">
            <tr>
                <td align="center">
                    <table>
                        <tr>
                            <td height="30px">
                                <asp:DataList ID="DataList1" runat="server" DataSourceID="SqlDataSourceDataList" BackColor="White" BorderColor="#999999" BorderWidth="1px" CellPadding="3" Font-Bold="True" Font-Italic="False" Font-Names="Arial" Font-Overline="False" Font-Size="Medium" Font-Strikeout="False" Font-Underline="False" HorizontalAlign="Center" RepeatColumns="3" RepeatDirection="Horizontal" BorderStyle="None" GridLines="Vertical">
                                    <AlternatingItemStyle BackColor="#DCDCDC" />
                                    <FooterStyle BackColor="#CCCCCC" ForeColor="Black" />
                                    <HeaderStyle BackColor="#000084" Font-Bold="True" ForeColor="White" />
                                    <ItemStyle BackColor="#EEEEEE" ForeColor="Black" HorizontalAlign="Center" VerticalAlign="Middle" />
                                    <ItemTemplate>
                                        <asp:Image ID="Label1" CssClass="imgPromo" runat="server" ImageUrl='<%# Eval("imgPath") %>' style = "width:200px; height:200px;text-align:center;" />
                                        <br />
                                        <asp:Label ID="Label4" runat="server" Text='<%# Eval("menuName") %>' /><br /><br />
                                        <asp:Label ID="shopNameLabel" runat="server" Text='<%# Eval("shopName") %>' />
                                        <br /><br />
                                        <asp:Label ID="shopRegionLabel" runat="server" Text='<%# Eval("shopRegion") %>' />
                                        <br /><br />
                                        Price: $<asp:Label ID="Label2" runat="server" Text='<%# Eval("menuPrice") %>' /> > <font color="red">$</font><asp:Label ID="Label3" runat="server" Text='<%# Eval("menuPromoPrice") %>' style = "color:red;" />
                                    </ItemTemplate>
                                    <SelectedItemStyle BackColor="#008A8C" Font-Bold="True" ForeColor="White" />
                                </asp:DataList>
                                <asp:SqlDataSource ID="SqlDataSourceDataList" runat="server" ConnectionString="<%$ ConnectionStrings:dbBrnzConnectionString %>" SelectCommand=" SELECT b.imgPath, a.shopName, a.shopRegion, b.menuName, b.menuPrice, b.menuPromoPrice from tblShop a, tblMenu b where 1=1 and a.shopID = b.shopID and b.menuPromo = '1'"></asp:SqlDataSource>
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
