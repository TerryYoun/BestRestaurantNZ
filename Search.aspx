<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="Search.aspx.cs" Inherits="BestRestaurantNZ.WebForm2" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <script>
        function changetext() {
            var elem = document.getElementById("btnFavourite");
            if (elem.value == "click me change text") {
                elem.value = "changed text here";
            }
            else {
                elem.value = "click me change text";
            }
        }
              function changeText() {
            $("[id*=LinkButton1]")[0].innerText = "Processing...";
            return false;
        }   

         function TestFunction()
            {
                //var mybutton=document.getElementById ("LinkButton1");
                //alert(mybutton);
                $("[id*=LinkButton1]")[0].innerHTML="Test";
                return false;
            }
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
        <div>
        <table width="100%">
            <tr>
                <td align="center">
                    <table>
                        <tr>
                            <td height="30px"</td>
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
                            <td height="30px" width="30%" style="text-align:right;padding-right:20px;">
                                <asp:DropDownList ID="DropDownList1" runat="server">
                                    <asp:ListItem>All</asp:ListItem>
                                    <asp:ListItem>Name</asp:ListItem>
                                    <asp:ListItem>SubName</asp:ListItem>
                                    <asp:ListItem>Introduce</asp:ListItem>
                                    <asp:ListItem>Address</asp:ListItem>
                                    <asp:ListItem>Phone</asp:ListItem>
                                    <asp:ListItem>Region</asp:ListItem>
                                </asp:DropDownList>
                            </td>
                            <td width="40%" style="text-align:center"><asp:TextBox ID="tbSearch" runat="server" Width="400px" Height="28px"></asp:TextBox></td>
                            <td style="text-align:center">&nbsp;&nbsp;<asp:Button ID="Button1" runat="server" Text="Search" Height="28px" Width="76px" class="button-small" OnClick="Search_Click"/></td>
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
                                            <table width="780px" style="padding:1px 1px 1px 1px;border:1px #000000 solid">
                                                <tr><td style="text-align:center;"><a href="SearchDetail.aspx?shopID=<%#Eval("shopID")%>"><img src="<%#Eval("shopImage")%>" /></a></td></tr>
                                                <tr><td style="text-align:center;"><h1><%#Eval("shopName")%></h1></td></tr>
                                                <tr><td style="text-align:center;"><h2><%#Eval("shopSubName")%></h2></td></tr>
                                                <tr><td><h3><%#Eval("shopIntroduce")%></h3></td></tr>
                                                <tr><td><asp:LinkButton ID="LinkButton1" runat="server" Text="Add Favourite" CommandArgument=<%#Eval("shopID")%>  OnClientClick="javascript:return TestFunction();" onclick="Button1_Click" Visible='<%#Eval("favouriteShopID").Equals(0) %>' /></asp:LinkButton></td></tr>
                                                <tr><td><asp:LinkButton ID="LinkButton2" runat="server" Text="Delete Favourite" CommandArgument=<%#Eval("favouriteID")%>  OnClientClick="javascript:return TestFunction();" onclick="Button2_Click" Visible='<%#!Eval("favouriteShopID").Equals(0) %>' /></asp:LinkButton></td></tr>
                                            </table><br />
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
