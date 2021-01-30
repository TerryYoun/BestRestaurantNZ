<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="Top10User.aspx.cs" Inherits="BestRestaurantNZ.WebForm24" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
        <div class="blankTop">
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
            <div class="blankTop">
        <table width="100%">
            <tr>
                <td align="center">
                    <table>
                        <tr>
                            <td height="30px">
                                <asp:ListView ID="ListView1" runat="server" DataSourceID="SqlDataSource2" GroupItemCount="3">
                                    <AlternatingItemTemplate>
                                        <td runat="server" style="background-color:#FFF8DC;">userEmail:
                                            <asp:Label ID="userEmailLabel" runat="server" Text='<%# Eval("userEmail") %>' />
                                            <br />userName:
                                            <asp:Label ID="userNameLabel" runat="server" Text='<%# Eval("userName") %>' />
                                            <br />userConnectCnt:
                                            <asp:Label ID="userConnectCntLabel" runat="server" Text='<%# Eval("userConnectCnt") %>' />
                                            <br /></td>
                                    </AlternatingItemTemplate>
                                    <EditItemTemplate>
                                        <td runat="server" style="background-color:#008A8C;color: #FFFFFF;">userEmail:
                                            <asp:TextBox ID="userEmailTextBox" runat="server" Text='<%# Bind("userEmail") %>' />
                                            <br />userName:
                                            <asp:TextBox ID="userNameTextBox" runat="server" Text='<%# Bind("userName") %>' />
                                            <br />userConnectCnt:
                                            <asp:TextBox ID="userConnectCntTextBox" runat="server" Text='<%# Bind("userConnectCnt") %>' />
                                            <br />userID:
                                            <asp:TextBox ID="userIDTextBox" runat="server" Text='<%# Bind("userID") %>' />
                                            <br />
                                            <asp:Button ID="UpdateButton" runat="server" CommandName="Update" Text="Update" />
                                            <br />
                                            <asp:Button ID="CancelButton" runat="server" CommandName="Cancel" Text="Cancel" />
                                            <br /></td>
                                    </EditItemTemplate>
                                    <EmptyDataTemplate>
                                        <table runat="server" style="background-color: #FFFFFF;border-collapse: collapse;border-color: #999999;border-style:none;border-width:1px;">
                                            <tr>
                                                <td>No data was returned.</td>
                                            </tr>
                                        </table>
                                    </EmptyDataTemplate>
                                    <EmptyItemTemplate>
<td runat="server" />
                                    </EmptyItemTemplate>
                                    <GroupTemplate>
                                        <tr id="itemPlaceholderContainer" runat="server">
                                            <td id="itemPlaceholder" runat="server"></td>
                                        </tr>
                                    </GroupTemplate>
                                    <InsertItemTemplate>
                                        <td runat="server" style="">userEmail:
                                            <asp:TextBox ID="userEmailTextBox" runat="server" Text='<%# Bind("userEmail") %>' />
                                            <br />userName:
                                            <asp:TextBox ID="userNameTextBox" runat="server" Text='<%# Bind("userName") %>' />
                                            <br />userConnectCnt:
                                            <asp:TextBox ID="userConnectCntTextBox" runat="server" Text='<%# Bind("userConnectCnt") %>' />
                                            <br />userID:
                                            <asp:TextBox ID="userIDTextBox" runat="server" Text='<%# Bind("userID") %>' />
                                            <br />
                                            <asp:Button ID="InsertButton" runat="server" CommandName="Insert" Text="Insert" />
                                            <br />
                                            <asp:Button ID="CancelButton" runat="server" CommandName="Cancel" Text="Clear" />
                                            <br /></td>
                                    </InsertItemTemplate>
                                    <ItemTemplate>
                                        <td runat="server" style="background-color:#DCDCDC;color: #000000;">userEmail:
                                            <asp:Label ID="userEmailLabel" runat="server" Text='<%# Eval("userEmail") %>' />
                                            <br />userName:
                                            <asp:Label ID="userNameLabel" runat="server" Text='<%# Eval("userName") %>' />
                                            <br />userConnectCnt:
                                            <asp:Label ID="userConnectCntLabel" runat="server" Text='<%# Eval("userConnectCnt") %>' />
                                            <br /></td>
                                    </ItemTemplate>
                                    <LayoutTemplate>
                                        <table runat="server">
                                            <tr runat="server">
                                                <td runat="server">
                                                    <table id="groupPlaceholderContainer" runat="server" border="1" style="background-color: #FFFFFF;border-collapse: collapse;border-color: #999999;border-style:none;border-width:1px;font-family: Verdana, Arial, Helvetica, sans-serif;">
                                                        <tr id="groupPlaceholder" runat="server">
                                                        </tr>
                                                    </table>
                                                </td>
                                            </tr>
                                            <tr runat="server">
                                                <td runat="server" style="text-align: center;background-color: #CCCCCC;font-family: Verdana, Arial, Helvetica, sans-serif;color: #000000;">
                                                    <asp:DataPager ID="DataPager1" runat="server" PageSize="12">
                                                        <Fields>
                                                            <asp:NextPreviousPagerField ButtonType="Button" ShowFirstPageButton="True" ShowNextPageButton="False" ShowPreviousPageButton="False" />
                                                            <asp:NumericPagerField />
                                                            <asp:NextPreviousPagerField ButtonType="Button" ShowLastPageButton="True" ShowNextPageButton="False" ShowPreviousPageButton="False" />
                                                        </Fields>
                                                    </asp:DataPager>
                                                </td>
                                            </tr>
                                        </table>
                                    </LayoutTemplate>
                                    <SelectedItemTemplate>
                                        <td runat="server" style="background-color:#008A8C;font-weight: bold;color: #FFFFFF;">userEmail:
                                            <asp:Label ID="userEmailLabel" runat="server" Text='<%# Eval("userEmail") %>' />
                                            <br />userName:
                                            <asp:Label ID="userNameLabel" runat="server" Text='<%# Eval("userName") %>' />
                                            <br />userConnectCnt:
                                            <asp:Label ID="userConnectCntLabel" runat="server" Text='<%# Eval("userConnectCnt") %>' />
                                            <br />userID:
                                            <asp:Label ID="userIDLabel" runat="server" Text='<%# Eval("userID") %>' />
                                            <br /></td>
                                    </SelectedItemTemplate>
                                </asp:ListView>
                                <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:dbBrnzConnectionString %>" SelectCommand="SELECT [userEmail], [userName], [userConnectCnt], [userID] FROM [tblUser]"></asp:SqlDataSource>
                            </td>
                        </tr>
                    </table>
                </td>
            </tr>
        </table>
    </div>
    <div class="blankTop">
        <table width="100%">
            <tr>
                <td align="center">
                    <table width="780px">
                        <tr>
                                                                    <td align="center">
                                            <h2 class="font-size-30">Top 10 Most Connected User</h2>
                                        </td>   </tr>
                    </table>
                </td>
            </tr>
        </table>
    </div>
    <div class="top10">
        <table width="100%">
            <tr>
                <td align="center">
                    <table>
                        <tr>
                            <td height="30px">
                                <asp:GridView ID="GridView1" runat="server" AllowSorting="True" AutoGenerateColumns="False" CellPadding="4" DataSourceID="SqlDataSource1" ForeColor="#333333" GridLines="None">
                                    <AlternatingRowStyle BackColor="White" />
                                    <Columns>
                                        <asp:BoundField DataField="userID" HeaderText="ID" SortExpression="userID" />
                                        <asp:BoundField DataField="userEmail" HeaderText="Email" SortExpression="userEmail" >
                                        <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                                        </asp:BoundField>
                                        <asp:BoundField DataField="userName" HeaderText="Name" SortExpression="userName" />
                                        <asp:BoundField DataField="userConnectCnt" HeaderText="The number of Connection" SortExpression="userConnectCnt" >
                                        <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                                        </asp:BoundField>
                                        <asp:BoundField DataField="userRegion" HeaderText="Region" SortExpression="userRegion" />
                                    </Columns>
                                    <FooterStyle BackColor="#990000" Font-Bold="True" ForeColor="White" />
                                    <HeaderStyle BackColor="#990000" Font-Bold="True" ForeColor="White" />
                                    <PagerStyle BackColor="#FFCC66" ForeColor="#333333" HorizontalAlign="Center" />
                                    <RowStyle BackColor="#FFFBD6" ForeColor="#333333" />
                                    <SelectedRowStyle BackColor="#FFCC66" Font-Bold="True" ForeColor="Navy" />
                                    <SortedAscendingCellStyle BackColor="#FDF5AC" />
                                    <SortedAscendingHeaderStyle BackColor="#4D0000" />
                                    <SortedDescendingCellStyle BackColor="#FCF6C0" />
                                    <SortedDescendingHeaderStyle BackColor="#820000" />
                                </asp:GridView>
                                <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:dbBrnzConnectionString8 %>" SelectCommand="SELECT TOP 10 [userEmail], [userID], [userName], [userConnectCnt], [userRegion] FROM [tblUser] ORDER BY [userConnectCnt] DESC"></asp:SqlDataSource>
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
                            <td height="30px"></td>
                        </tr>
                    </table>
                </td>
            </tr>
        </table>
    </div>
</asp:Content>
