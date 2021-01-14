<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="GUCera.Login" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
      <title>Log in</title>
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
         .auto-style2 {
            font-family: Arial, Helvetica, sans-serif;
       
        }
        .auto-style1 {
            height: 63px;
            text-align: center;
        }


        .table{
            text-align:center;
        }
        .auto-style24 {
            font-size: large;
            color: #1C5E55;
            font-weight: bold;
            height: 27px;
        }
        .auto-style25 {
            width: 800px;
            height: 227px;
            margin-left: auto;
            margin-right: auto;
            padding: 20px;
            background-color: white;
        }

         .auto-style15 {
            width: 331px;
        }
        .auto-style26 {
            height: 52px;
        }
        .auto-style27 {
            height: 48px;
        }
        .auto-style28 {
            height: 62px;
            width: 1149px;
            margin-top: 21px;
        }
        .auto-style29 {
            width: 331px;
            height: 52px;
        }
        </style>
</head>
<body style="height: 428px">
    <form id="form1" runat="server">
          <div class="auto-style1">
                <h2>
                    <asp:Label ID="Label1" runat="server" CssClass="auto-style2" ForeColor="#1C5E55" Text="Log In"></asp:Label>
                </h2>
            </div>
         <div class="auto-style25" id="LoginDiv" visible="True" runat="server">
                <asp:Panel ID="Panel6"  runat="server" CellPadding="4" ForeColor="#333333" BorderColor="#1C5E55" BorderStyle="Double" BorderWidth="6px" BackColor="#E3EAEB"  Width="790px" Height="218px">
                 

       
                      <table class="auto-style36" style="padding: 4px">
                         <tr>
                        <td class="auto-style24">
                            <asp:Label ID="Label4" runat="server" Text="Please Log In"></asp:Label>
                             </td>
                        <td class="auto-style27">
                            <asp:Label ID="loginMsg" runat="server" Font-Bold="True" ForeColor="#1C5E55"></asp:Label>
                        </td>
                    </tr>
                          <tr>
                              <td class="auto-style9">User ID:</td>
                              <td class="auto-style15">
                                  <asp:TextBox ID="username" runat="server" Width="233px" MaxLength="14"></asp:TextBox>
                              </td>
                          </tr>
                          <tr>
                              <td class="auto-style9">
                                  <asp:Label ID="Label5" runat="server" Text="Password"></asp:Label>
                                  :</td>
                              <td class="auto-style26">
                                  <asp:TextBox ID="password" TextMode ="Password" runat="server" Width="233px" MaxLength="16"></asp:TextBox>
                              </td>
                          </tr>
                          <tr>
                              <td class="auto-style9"></td>
                              <td class="auto-style29">
                                  <asp:Button ID="LoginButton" runat="server" BorderStyle="Groove" OnClick="login" Text="Log In" Width="200px" Height="29px" />
                              </td>
                          </tr>
                         
                      </table>

                </asp:Panel>
            </div>
            <div  style ="text-align : center; margin-left: auto; margin-right: auto; margin-bottom: auto;" class="auto-style28" >
                <asp:HyperLink ID="HyperLink4" runat="server" NavigateUrl="InstructorRegister.aspx" align =" middle" >Instructor Register</asp:HyperLink>
 
            <br />
 
            <asp:HyperLink ID="HyperLink3" runat="server" NavigateUrl="StudentRegister.aspx">Student Register</asp:HyperLink>
            </div>
            
 
    </form>
</body>
</html>
