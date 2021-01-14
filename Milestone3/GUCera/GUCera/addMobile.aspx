<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="addMobile.aspx.cs" Inherits="GUCera.addMobile" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Add Mobile Number</title>
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css" />
    <style type="text/css">
       body { padding-top: 60px; }
        th{
            text-align:center;
            padding:4px;
        }
        td{
            padding:2px 4px 2px 4px;
        }
        .btn-default{
            margin-bottom:4px;
        }
        .container {
            width: 800px;
            margin-left: auto;
            margin-right: auto;
            background-color: white;
            padding: 20px;
        }

        .auto-style9 {
            width: 348px;
            text-align: right;
            height: 52px;
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

        .table{
            text-align:center;
        }
        .auto-style16 {
            height: 52px;
        }
        .auto-style17 {
            width: 800px;
            height: 462px;
            margin-left: auto;
            margin-right: auto;
            margin-bottom: 0px;
            padding: 20px;
            background-color: white;
        }
        .auto-style18 {
            margin-top: 16px;
        }
    </style>
</head>
<body style="height: 563px">
    <form id="form1" runat="server">
        <div class="auto-style17" id="mobileDiv" visible="True" runat="server">
                <asp:Panel ID="Panel1" runat="server" CellPadding="4" ForeColor="#333333" BorderColor="#1C5E55" BorderStyle="Double" BorderWidth="6px" BackColor="#E3EAEB">
                    <div class="auto-style11">
                        <div class="auto-style14">
                            <asp:Label ID="Label4" runat="server" Font-Bold="True" Font-Size="Large" ForeColor="#1C5E55">Add Mobile Number</asp:Label>
                        </div>
                        <asp:GridView ID="GridView2" class="table" runat="server" align="center" AutoGenerateColumns="False" CellPadding="2" DataSourceID="mobileDataSource" ForeColor="#333333" ShowHeaderWhenEmpty="True" Width="200px" EmptyDataText="No data available">
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
                            <td class="auto-style16">
                                <asp:TextBox ID="mobileNumber" class="form-control" runat="server" Width="200px" MaxLength="16"></asp:TextBox>
                            </td>
                        </tr>
                        <tr>
                            <td class="auto-style13">&nbsp;</td>
                            <td>
                                <asp:Button ID="addmobile" class="btn-default" runat="server" BorderStyle="Groove" OnClick="addmobile_Click" Text="Add" Width="200px" Height="30px"/>
                            </td>
                        </tr>
                    </table>

                </asp:Panel>
            </div>

          <div  style ="text-align : center; margin-left: auto; margin-right: auto; margin-bottom: auto; height: 52px;" class="auto-style28" >

                <td class="auto-style10">
                 <asp:LinkButton ID="BackButton" runat="server" style="padding:4px" Text="Back" BackColor="#1C5E55" BorderColor="Black" BorderStyle="Solid" BorderWidth="2px" Font-Bold="True" Font-Size="Medium" Font-Underline="False" ForeColor="White" Width="166px" OnClick ="Back_Click" Font-Names="Arial" Height="31px" CssClass="auto-style18"/>
                </td>

            </div>
    </form>
</body>
</html>
