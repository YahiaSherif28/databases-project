<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="StudentRegister.aspx.cs" Inherits="GUCera.StudentRegister" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Student Register</title>

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
        }

        .table{
            text-align:center;
        }
        .auto-style10 {
            width: 800px;
            height: 408px;
            margin-left: auto;
            margin-right: auto;
            padding: 20px;
            background-color: white;
        }
        .auto-style12 {
            font-size: large;
            color: #1C5E55;
            font-weight: bold;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">


          <div class="auto-style10" runat="server" id="editInfoDiv" visible="True">
                <asp:Panel ID="Panel2" runat="server" ForeColor="#333333" BorderColor="#1C5E55" BorderStyle="Double" BorderWidth="6px" BackColor="#E3EAEB">
                    <table class="auto-style4" style="padding: 4px">
                        <tr>
                            <td class="auto-style12">
                                Student Register</td>
                            <td>
                                <asp:Label ID="StudentRegisterMessage" runat="server" Font-Bold="True" ForeColor="#1C5E55"></asp:Label>
                            </td>
                        </tr>
                        <tr>
                            <td class="auto-style9">First Name:</td>
                            <td>
                                <asp:TextBox ID="firstname" class="form-control" runat="server" Width="200px" MaxLength="10"></asp:TextBox>
                            </td>
                        </tr>
                        <tr>
                            <td class="auto-style9">Last Name:</td>
                            <td>
                                <asp:TextBox ID="lastname" class="form-control" runat="server" Width="200px" MaxLength="10"></asp:TextBox>
                            </td>
                        </tr>
                        <tr>
                            <td class="auto-style9">Password:</td>
                            <td>
                                <asp:TextBox ID="password" class="form-control" runat="server" TextMode="Password" Width="200px" MaxLength="10"></asp:TextBox>
                            </td>
                        </tr>
                        <tr>
                            <td class="auto-style9">Gender:</td>
                            <td>
                                <asp:RadioButtonList ID="gender" runat="server">
                                    <asp:ListItem Value="1" Selected="True">Male</asp:ListItem>
                                    <asp:ListItem Value="0">Female</asp:ListItem>
                                </asp:RadioButtonList>
                            </td>
                        </tr>
                        <tr>
                            <td class="auto-style9">Email:</td>
                            <td>
                                <asp:TextBox ID="email" class="form-control" runat="server" Width="200px" MaxLength="10"></asp:TextBox>
                            </td>
                        </tr>
                        <tr>
                            <td class="auto-style9">Address:</td>
                            <td>
                                <asp:TextBox ID="address" class="form-control" runat="server" Width="200px" MaxLength="10"></asp:TextBox>
                            </td>
                        </tr>
                        <tr>
                            <td class="auto-style9">&nbsp;</td>
                            <td>
                                <asp:Button ID="registerStudent" class="btn-default" runat="server" Text="Register" Width="200px" Height="30px" BorderStyle="Groove" OnClick="register" />
                            </td>
                        </tr>
                    </table>
                </asp:Panel>
            </div>
            <div  style ="text-align : center; margin-left: auto; margin-right: auto; margin-bottom: auto; height: 41px;" class="auto-style28" >

                <asp:HyperLink ID="HyperLink" runat="server" NavigateUrl="Login.aspx" align =" middle" >Back To Login</asp:HyperLink>
 

            </div>
      
    </form>
</body>
</html>
