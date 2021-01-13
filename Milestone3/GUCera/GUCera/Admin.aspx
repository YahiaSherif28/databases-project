<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Admin.aspx.cs" Inherits="GUCera.Admin" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <asp:Button ID="Button1" runat="server" Text="Create Promo Code" OnClick="promoButton"/>
            <br />
            <br />
            <asp:Button ID="Button2" runat="server" Text="List All Courses" OnClick="allCoursesButton"/>
            <br />
            <br />
            <asp:Button ID="Button3" runat="server" Text="List non-accepted Courses" OnClick="nonAcceptedButton"/>
            <br />
            <br />
            <asp:Button ID="Button4" runat="server" Text="Add Mobile" OnClick="addMobile"/>
            <br />
        </div>
    </form>
</body>
</html>
