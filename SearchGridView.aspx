<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="SearchGridView.aspx.cs" Inherits="BestRestaurantNZ.WebForm22" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="blankTop">
        <table>
            <tr>
                <td align="gridView">
                    <table>
                        <tr>
                            <td height="20px"></td>
                        </tr>
                    </table>
                </td>
            </tr>
        </table>
    </div>
        <div class="blankTop">
        <table>
            <tr>
                <td align="gridView">
                    <table>
                        <tr>
                            <td height="20px">
                                <asp:DropDownList ID="DropDownList1" runat="server" DataSourceID="SqlDataSource2" DataTextField="regionName" DataValueField="regionName" AutoPostBack="True">
                                </asp:DropDownList>
                                <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:dbBrnzConnectionString %>" SelectCommand="SELECT [regionName] FROM [tblRegion]"></asp:SqlDataSource>
                            </td>
                        </tr>
                    </table>
                </td>
            </tr>
        </table>
    </div>
    <div class="dropDown">
        <table>
            <tr>
                <td align="gridView">
                    <table>
                        <tr>
                            <td height="20px">


                                <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="shopID" DataSourceID="SqlDataSource1">
                                    <Columns>
                                        <asp:BoundField DataField="shopID" HeaderText="shopID" ReadOnly="True" SortExpression="shopID" />
                                        <asp:BoundField DataField="shopName" HeaderText="shopName" SortExpression="shopName" />
                                        <asp:BoundField DataField="shopSubName" HeaderText="shopSubName" SortExpression="shopSubName" />
                                        <asp:BoundField DataField="shopIntroduce" HeaderText="shopIntroduce" SortExpression="shopIntroduce" />
                                        <asp:BoundField DataField="shopAddress" HeaderText="shopAddress" SortExpression="shopAddress" />
                                        <asp:BoundField DataField="shopPhone" HeaderText="shopPhone" SortExpression="shopPhone" />
                                        <asp:BoundField DataField="shopRegion" HeaderText="shopRegion" SortExpression="shopRegion" />
                                        <asp:BoundField DataField="shopImage" HeaderText="shopImage" SortExpression="shopImage" />
                                    </Columns>
                                </asp:GridView>
                                <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:dbBrnzConnectionString %>" SelectCommand="SELECT * FROM [tblShop] WHERE ([shopRegion] = @shopRegion)">
                                    <SelectParameters>
                                        <asp:ControlParameter ControlID="DropDownList1" Name="shopRegion" PropertyName="SelectedValue" Type="String" />
                                    </SelectParameters>
                                </asp:SqlDataSource>


                            </td>
                        </tr>
                    </table>
                </td>
            </tr>
        </table>
    </div>
    <div class="gridView">
        <table>
            <tr>
                <td align="center">
                    <table>
                        <tr>
                            <td>
                     
                            </td>
                        </tr>
                    </table>
                </td>
            </tr>
        </table>
    </div>
    <div class="blankBottom">
        <table>
            <tr>
                <td align="center">
                    <table>
                        <tr>
                            <td height="20px"></td>
                        </tr>
                    </table>
                </td>
            </tr>
        </table>
    </div>
</asp:Content>
