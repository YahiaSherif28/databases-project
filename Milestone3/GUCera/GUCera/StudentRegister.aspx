<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="StudentRegister.aspx.cs" Inherits="GUCera.StudentRegister" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <asp:Label ID="Label1" runat="server" Text="Student Register"></asp:Label>
            <br />
            <asp:Label ID="Label2" runat="server" Text="First Name"></asp:Label>
            <br />
            <asp:TextBox ID="firstname" runat="server"></asp:TextBox>
            <br />
            <asp:Label ID="Label3" runat="server" Text="Last Name"></asp:Label>
            <br />
            <asp:TextBox ID="lastname" runat="server"></asp:TextBox>
            <br />
            <asp:Label ID="Label4" runat="server" Text="Password"></asp:Label>
            <br />
            <asp:TextBox ID="password" runat="server"></asp:TextBox>
            <br />
            <asp:Label ID="Label5" runat="server" Text="Email"></asp:Label>
            <br />
            <asp:TextBox ID="email" runat="server"></asp:TextBox>
            <br />
            <asp:Label ID="Label6" runat="server" Text="Gender"></asp:Label>
            <asp:RadioButtonList ID="gender" runat="server">
                <asp:ListItem Value="1">Male</asp:ListItem>
                <asp:ListItem Value="0">Female</asp:ListItem>
            </asp:RadioButtonList>
            <br />
            <asp:Label ID="Label7" runat="server" Text="Address"></asp:Label>
            <br />
            <asp:TextBox ID="address" runat="server"></asp:TextBox>
            <br />
            <asp:Button ID="registerStudent" runat="server" OnClick="register" Text="Register" />
            <br />
            <asp:HyperLink ID="HyperLink" runat="server" NavigateUrl="Login.aspx">Back To Login</asp:HyperLink>
        </div>
    </form>
</body>
</html>
