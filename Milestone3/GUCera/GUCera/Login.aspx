<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="GUCera.Login" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <asp:Label ID="Label1" runat="server" Text="Please Log In"></asp:Label>
            <br />
            <asp:Label ID="Label2" runat="server" Text="Username"></asp:Label>
            <br />
            <asp:TextBox ID="username" runat="server"></asp:TextBox>
            <br />
            <asp:Label ID="Label3" runat="server" Text="Password"></asp:Label>
            <br />
            <asp:TextBox ID="password" runat="server"></asp:TextBox>
            <br />
            <asp:Button ID="loginButton" runat="server" OnClick="login" Text="Log In" />
            <br />
            <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl="StudentRegister.aspx">Student Register</asp:HyperLink>
            <br />
            <asp:HyperLink ID="HyperLink2" runat="server" NavigateUrl="InstructorRegister.aspx">Instructor Register</asp:HyperLink>
        </div>
    </form>
</body>
</html>
