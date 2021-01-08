<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="addMobile.aspx.cs" Inherits="GUCera.addMobile" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <asp:Label ID="Label1" runat="server" Text="Adding Phone Number"></asp:Label>
            <br />
            <asp:Label ID="Label2" runat="server" Text="Phone Number"></asp:Label>
            <br />
            <asp:TextBox ID="phonenumber" runat="server"></asp:TextBox>
            <br />
            <asp:Button ID="Button1" runat="server" OnClick="Add" Text="Add" />
        </div>
    </form>
</body>
</html>
