<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="MyProfile.aspx.cs" Inherits="GUCera.MyProfile" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>My Profile</title>

    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css" />
    <style type="text/css">
       th{
            text-align:center;
            padding:4px;
        }
        td{
            padding:4px;
        }
        .container {
            width: 800px;
            margin-left: auto;
            margin-right: auto;
            background-color: white;
            padding: 20px;
        }

        .auto-style1 {
            height: 40px;
            text-align: center;
        }

        .auto-style2 {
            font-family: Arial, Helvetica, sans-serif;
        }

        .auto-style5 {
            height: 200px;
            padding: 10px;
            text-align: center;
        }

        .auto-style9 {
            width: 348px;
            text-align: right;
        }

        .auto-style10 {
            width: 200px;
            text-align: center;
        }

        .auto-style11 {
            text-align: center;
        }

        .auto-style12 {
            width: 100%;
        }

        .auto-style13 {
            width: 350px;
        }

        .auto-style14 {
            text-align: left;
            padding: 6px;
        }

        .auto-style15 {
            width: 331px;
        }
        .table{
            text-align:center;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <nav class="navbar navbar-inverse" style="background:#1C5E55">
                <div class="container-fluid">
                    <div class="navbar-header">
                        <a class="navbar-brand">GUCera</a>
                    </div>
                    <ul class="nav navbar-nav">
                        <li><a href="/AddCourse.aspx">My Courses</a></li>
                        <li class="active"><a href="MyProfile.aspx">My Profile</a></li>
                        <li><a href="MyCourses.aspx">Available Courses</a></li>
                    </ul>
                    <ul class="nav navbar-nav navbar-right">
                        <li><a href="#"><span class="glyphicon glyphicon-log-out"></span>Logout</a></li>
                    </ul>
                </div>
            </nav>
            <div class="auto-style1">
                <h2>
                    <asp:Label ID="Label1" runat="server" CssClass="auto-style2" ForeColor="#1C5E55" Text="My Profile"></asp:Label>
                </h2>
            </div>
            <div>
                <asp:SqlDataSource ID="ProfileDataSource" runat="server" ConnectionString="<%$ ConnectionStrings:GUCeraConnectionString %>" SelectCommand="viewMyProfile" SelectCommandType="StoredProcedure">
                    <SelectParameters>
                        <asp:SessionParameter DefaultValue="" Name="id" SessionField="user" Type="Int32" />
                    </SelectParameters>
                </asp:SqlDataSource>
                <div class="auto-style5">
                    <asp:GridView class="table" ID="GridView1" HorizontalAlign="Center" runat="server" AutoGenerateColumns="False" CellPadding="4" DataKeyNames="id,id1" DataSourceID="ProfileDataSource" ForeColor="#333333" Width="500px" ShowHeaderWhenEmpty="True" Height="100px">
                        <AlternatingRowStyle BackColor="White" />
                        <Columns>
                            <asp:BoundField DataField="id" HeaderText="ID" ReadOnly="True" SortExpression="id" />
                            <asp:BoundField DataField="gpa" HeaderText="GPA" SortExpression="gpa" />
                            <asp:BoundField DataField="firstName" HeaderText="First Name" SortExpression="firstName" />
                            <asp:BoundField DataField="lastName" HeaderText="Last Name" SortExpression="lastName" />
                            <asp:TemplateField HeaderText="Gender" SortExpression="gender">
                                <ItemTemplate>
                                    <asp:Label ID="l8" runat="server" Text='<%# Boolean.Parse(Eval("gender").ToString()) ? "Male" : "Female" %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:BoundField DataField="password" HeaderText="Password" SortExpression="password" />
                            <asp:BoundField DataField="email" HeaderText="Email" SortExpression="email" />
                            <asp:BoundField DataField="address" HeaderText="Address" SortExpression="address" />
                        </Columns>
                        <EditRowStyle BackColor="#7C6F57" />
                        <FooterStyle BackColor="#1C5E55" Font-Bold="True" ForeColor="White" />
                        <HeaderStyle BackColor="#1C5E55" Font-Bold="True" ForeColor="White" />
                        <PagerStyle BackColor="#666666" ForeColor="White" HorizontalAlign="Center" />
                        <RowStyle BackColor="#E3EAEB" />
                        <SelectedRowStyle BackColor="#C5BBAF" Font-Bold="True" ForeColor="#333333" />
                        <SortedAscendingCellStyle BackColor="#F8FAFA" />
                        <SortedAscendingHeaderStyle BackColor="#246B61" />
                        <SortedDescendingCellStyle BackColor="#D4DFE1" />
                        <SortedDescendingHeaderStyle BackColor="#15524A" />
                    </asp:GridView>
                </div>
                <div class="container" runat="server" style="text-align: center">
                    <table style="width: 100%">
                        <tr>
                            <td class="auto-style10">
                                <asp:LinkButton ID="EditInfoLinkButton" runat="server" Style="padding: 4px" Text="Edit Profile" BackColor="#1C5E55" BorderColor="Black" BorderStyle="Solid" BorderWidth="2px" Font-Bold="True" Font-Size="Medium" Font-Underline="False" ForeColor="White" Width="180px" OnClick="EditInfoLinkButton_Click" Font-Names="Arial" />
                            </td>
                            <td class="auto-style10">
                                <asp:LinkButton ID="MobileLinkButton" runat="server" Text="Mobile Numbers" Style="padding: 4px" BackColor="#1C5E55" BorderColor="Black" BorderStyle="Solid" BorderWidth="2px" Font-Bold="True" Font-Size="Medium" Font-Underline="False" ForeColor="White" Width="180px" Font-Names="Arial" OnClick="MobileLinkButton_Click" />
                            </td>
                            <td class="auto-style10">
                                <asp:LinkButton ID="CardLinkButton" runat="server" Text="Credit Cards" Style="padding: 4px" BackColor="#1C5E55" BorderColor="Black" BorderStyle="Solid" BorderWidth="2px" Font-Bold="True" Font-Size="Medium" Font-Underline="False" ForeColor="White" Width="180px" Font-Names="Arial" OnClick="CardLinkButton_Click" />
                            </td>
                            <td class="auto-style10">
                                <asp:LinkButton ID="PromoLinkButton" runat="server" Text="Promo Codes" Style="padding: 4px" BackColor="#1C5E55" BorderColor="Black" BorderStyle="Solid" BorderWidth="2px" Font-Bold="True" Font-Size="Medium" Font-Underline="False" ForeColor="White" Width="180px" Font-Names="Arial" OnClick="PromoLinkButton_Click" />
                            </td>
                        </tr>
                    </table>
                </div>
            </div>
            <div class="container" runat="server" id="editInfoDiv" visible="false">
                <asp:Panel ID="Panel2" runat="server" ForeColor="#333333" BorderColor="#1C5E55" BorderStyle="Double" BorderWidth="6px" BackColor="#E3EAEB">
                    <table class="auto-style4" style="padding: 4px">
                        <tr>
                            <td>
                                <asp:Label ID="Label2" runat="server" Font-Bold="True" ForeColor="#1C5E55" Font-Size="Large">Edit my information</asp:Label>
                            </td>
                            <td>
                                <asp:Label ID="message" runat="server" Font-Bold="True" ForeColor="#1C5E55"></asp:Label>
                            </td>
                        </tr>
                        <tr>
                            <td class="auto-style9">First Name:</td>
                            <td>
                                <asp:TextBox ID="fname" runat="server" Width="200px" MaxLength="10"></asp:TextBox>
                            </td>
                        </tr>
                        <tr>
                            <td class="auto-style9">Last Name:</td>
                            <td>
                                <asp:TextBox ID="lname" runat="server" Width="200px" MaxLength="10"></asp:TextBox>
                            </td>
                        </tr>
                        <tr>
                            <td class="auto-style9">Password:</td>
                            <td>
                                <asp:TextBox ID="password" runat="server" TextMode="Password" Width="200px" MaxLength="10"></asp:TextBox>
                            </td>
                        </tr>
                        <tr>
                            <td class="auto-style9">Gender:</td>
                            <td>
                                <asp:RadioButtonList ID="gender" runat="server">
                                    <asp:ListItem Value="1">Male</asp:ListItem>
                                    <asp:ListItem Value="0">Female</asp:ListItem>
                                </asp:RadioButtonList>
                            </td>
                        </tr>
                        <tr>
                            <td class="auto-style9">Email:</td>
                            <td>
                                <asp:TextBox ID="email" runat="server" Width="200px" MaxLength="10"></asp:TextBox>
                            </td>
                        </tr>
                        <tr>
                            <td class="auto-style9">Address:</td>
                            <td>
                                <asp:TextBox ID="address" runat="server" Width="200px" MaxLength="10"></asp:TextBox>
                            </td>
                        </tr>
                        <tr>
                            <td class="auto-style9">&nbsp;</td>
                            <td>
                                <asp:Button ID="save" runat="server" Text="Save" Width="200px" BorderStyle="Groove" OnClick="save_Click" />
                            </td>
                        </tr>
                    </table>
                </asp:Panel>
            </div>
            <div class="container" id="mobileDiv" visible="False" runat="server">
                <asp:Panel ID="Panel1" runat="server" CellPadding="4" ForeColor="#333333" BorderColor="#1C5E55" BorderStyle="Double" BorderWidth="6px" BackColor="#E3EAEB">
                    <div class="auto-style11">
                        <div class="auto-style14">
                            <asp:Label ID="Label4" runat="server" Font-Bold="True" Font-Size="Large" ForeColor="#1C5E55">Add Mobile Number</asp:Label>
                        </div>
                        <asp:GridView ID="GridView2" runat="server" align="center" AutoGenerateColumns="False" CellPadding="4" DataSourceID="mobileDataSource" ForeColor="#333333" ShowHeaderWhenEmpty="True" Width="200px" EmptyDataText="No data available">
                            <AlternatingRowStyle BackColor="White" />
                            <Columns>
                                <asp:BoundField DataField="mobileNumber" HeaderText="Mobile Number" />
                            </Columns>
                            <EditRowStyle BackColor="#7C6F57" />
                            <FooterStyle BackColor="#1C5E55" Font-Bold="True" ForeColor="White" />
                            <HeaderStyle BackColor="#1C5E55" Font-Bold="True" ForeColor="White" />
                            <PagerStyle BackColor="#666666" ForeColor="White" HorizontalAlign="Center" />
                            <RowStyle BackColor="#E3EAEB" />
                            <SelectedRowStyle BackColor="#C5BBAF" Font-Bold="True" ForeColor="#333333" />
                            <SortedAscendingCellStyle BackColor="#F8FAFA" />
                            <SortedAscendingHeaderStyle BackColor="#246B61" />
                            <SortedDescendingCellStyle BackColor="#D4DFE1" />
                            <SortedDescendingHeaderStyle BackColor="#15524A" />
                        </asp:GridView>
                    </div>

                    <asp:SqlDataSource ID="mobileDataSource" runat="server" ConnectionString="<%$ ConnectionStrings:GUCeraConnectionString %>" SelectCommand="SELECT [mobileNumber] FROM [UserMobileNumber] WHERE ([id] = @id)">
                        <SelectParameters>
                            <asp:SessionParameter Name="id" SessionField="user" Type="Int32" />
                        </SelectParameters>
                    </asp:SqlDataSource>

                    <table class="auto-style12">
                        <tr>
                            <td class="auto-style13">&nbsp;</td>
                            <td>
                                <asp:Label ID="mobileMsg" runat="server" Font-Bold="True" ForeColor="#1C5E55"></asp:Label>
                            </td>
                        </tr>
                        <tr>
                            <td class="auto-style9">Enter your Number:</td>
                            <td>
                                <asp:TextBox ID="mobileNumber" runat="server" Width="200px" MaxLength="16"></asp:TextBox>
                            </td>
                        </tr>
                        <tr>
                            <td class="auto-style13">&nbsp;</td>
                            <td>
                                <asp:Button ID="addmobile" runat="server" BorderStyle="Groove" OnClick="addmobile_Click" Text="Add" Width="200px" />
                            </td>
                        </tr>
                    </table>

                </asp:Panel>
            </div>
            <div class="container" id="creditCardDiv" visible="False" runat="server">
                <asp:Panel ID="Panel3" runat="server" CellPadding="4" ForeColor="#333333" BorderColor="#1C5E55" BorderStyle="Double" BorderWidth="6px" BackColor="#E3EAEB">
                    <div class="auto-style11">
                        <div class="auto-style14">
                            <asp:Label ID="Label3" runat="server" Font-Bold="True" Font-Size="Large" ForeColor="#1C5E55">Add Credit Card</asp:Label>
                        </div>
                        <asp:GridView class="table" ID="GridView3" runat="server" align="center" AutoGenerateColumns="False" CellPadding="4" DataSourceID="creditCardDataSource" ForeColor="#333333" ShowHeaderWhenEmpty="True" Width="500px" EmptyDataText="No data available" DataKeyNames="number">
                            <AlternatingRowStyle BackColor="White" />
                            <Columns>
                                <asp:BoundField DataField="number" HeaderText="Card Number" ReadOnly="True" SortExpression="number" />
                                <asp:BoundField DataField="cardHolderName" HeaderText="Holder Name" SortExpression="cardHolderName" />
                                <asp:BoundField DataField="expiryDate" DataFormatString="{0:Y}" HeaderText="Expiry Date" SortExpression="expiryDate" />
                                <asp:BoundField DataField="cvv" HeaderText="CVV" SortExpression="cvv" />
                            </Columns>
                            <EditRowStyle BackColor="#7C6F57" />
                            <FooterStyle BackColor="#1C5E55" Font-Bold="True" ForeColor="White" />
                            <HeaderStyle BackColor="#1C5E55" Font-Bold="True" ForeColor="White" />
                            <PagerStyle BackColor="#666666" ForeColor="White" HorizontalAlign="Center" />
                            <RowStyle BackColor="#E3EAEB" />
                            <SelectedRowStyle BackColor="#C5BBAF" Font-Bold="True" ForeColor="#333333" />
                            <SortedAscendingCellStyle BackColor="#F8FAFA" />
                            <SortedAscendingHeaderStyle BackColor="#246B61" />
                            <SortedDescendingCellStyle BackColor="#D4DFE1" />
                            <SortedDescendingHeaderStyle BackColor="#15524A" />
                        </asp:GridView>
                    </div>
                    <asp:SqlDataSource ID="creditCardDataSource" runat="server" ConnectionString="<%$ ConnectionStrings:GUCeraConnectionString %>" SelectCommand="studentCreditCards" SelectCommandType="StoredProcedure">
                        <SelectParameters>
                            <asp:SessionParameter Name="sid" SessionField="user" Type="Int32" />
                        </SelectParameters>
                    </asp:SqlDataSource>
                    <table class="auto-style4" style="padding: 4px">
                        <tr>
                            <td>&nbsp;</td>
                            <td class="auto-style15">
                                <asp:Label ID="cardMsg" runat="server" Font-Bold="True" ForeColor="#1C5E55"></asp:Label>
                            </td>
                        </tr>
                        <tr>
                            <td class="auto-style9">Card Number:</td>
                            <td class="auto-style15">
                                <asp:TextBox ID="cardnumber" runat="server" Width="200px" MaxLength="14"></asp:TextBox>
                            </td>
                        </tr>
                        <tr>
                            <td class="auto-style9">Holder Name:</td>
                            <td class="auto-style15">
                                <asp:TextBox ID="cardholder" runat="server" Width="200px" MaxLength="16"></asp:TextBox>
                            </td>
                        </tr>
                        <tr>
                            <td class="auto-style9">Expiry date:</td>
                            <td class="auto-style15">
                                <asp:TextBox ID="expirydate" runat="server" TextMode="Date" Width="200px"></asp:TextBox>
                            </td>
                        </tr>
                        <tr>
                            <td class="auto-style9">CVV:</td>
                            <td class="auto-style15">
                                <asp:TextBox ID="cvvtextbox" runat="server" Width="200px" MaxLength="3"></asp:TextBox>
                            </td>
                        </tr>
                        <tr>
                            <td class="auto-style9">&nbsp;</td>
                            <td class="auto-style15">
                                <asp:Button ID="addcard" runat="server" BorderStyle="Groove" OnClick="addcard_Click" Text="Add" Width="200px" />
                            </td>
                        </tr>
                    </table>
                </asp:Panel>
            </div>
            <div class="container" id="promoDiv" visible="False" runat="server">
                <asp:Panel ID="Panel4" runat="server" CellPadding="4" ForeColor="#333333" BorderColor="#1C5E55" BorderStyle="Double" BorderWidth="6px" BackColor="#E3EAEB">
                    <div class="auto-style11" style="margin-bottom: 20px">
                        <div class="auto-style14">
                            <asp:Label ID="Label5" runat="server" Font-Bold="True" Font-Size="Large" ForeColor="#1C5E55">My Promo Codes</asp:Label>
                        </div>
                        <asp:GridView class="table" ID="GridView4" runat="server" align="center" AutoGenerateColumns="False" CellPadding="4" DataSourceID="PromoDataSource" ForeColor="#333333" ShowHeaderWhenEmpty="True" Width="500px" EmptyDataText="No data available" DataKeyNames="code">
                            <AlternatingRowStyle BackColor="White" />
                            <Columns>
                                <asp:BoundField DataField="code" HeaderText="Code" ReadOnly="True" SortExpression="code" />
                                <asp:BoundField DataField="isuueDate" HeaderText="Isuue Date" SortExpression="isuueDate" />
                                <asp:BoundField DataField="expiryDate" HeaderText="Expiry Date" SortExpression="expiryDate" />
                                <asp:BoundField DataField="discount" HeaderText="Discount Amount" SortExpression="discount" />
                                <asp:BoundField DataField="adminId" HeaderText="Admin ID" SortExpression="adminId" />
                            </Columns>
                            <EditRowStyle BackColor="#7C6F57" />
                            <FooterStyle BackColor="#1C5E55" Font-Bold="True" ForeColor="White" />
                            <HeaderStyle BackColor="#1C5E55" Font-Bold="True" ForeColor="White" />
                            <PagerStyle BackColor="#666666" ForeColor="White" HorizontalAlign="Center" />
                            <RowStyle BackColor="#E3EAEB" />
                            <SelectedRowStyle BackColor="#C5BBAF" Font-Bold="True" ForeColor="#333333" />
                            <SortedAscendingCellStyle BackColor="#F8FAFA" />
                            <SortedAscendingHeaderStyle BackColor="#246B61" />
                            <SortedDescendingCellStyle BackColor="#D4DFE1" />
                            <SortedDescendingHeaderStyle BackColor="#15524A" />
                        </asp:GridView>
                    </div>

                    <asp:SqlDataSource ID="PromoDataSource" runat="server" ConnectionString="<%$ ConnectionStrings:GUCeraConnectionString %>" SelectCommand="viewPromocode" SelectCommandType="StoredProcedure">
                        <SelectParameters>
                            <asp:SessionParameter Name="sid" SessionField="user" Type="Int32" />
                        </SelectParameters>
                    </asp:SqlDataSource>

                </asp:Panel>
            </div>
        </div>
    </form>
</body>
</html>
