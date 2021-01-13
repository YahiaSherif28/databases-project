<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Home.aspx.cs" Inherits="GUCera.Home" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style type="text/css">
        .auto-style2 {
            font-family: Arial, Helvetica, sans-serif;
            padding: 4px;
            margin: 2px 4px 2px 0px;
            display: inline-block;
        }

        .auto-style3 {
            text-align: center;
        }

    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div>

            <asp:Button ID="Button1" runat="server" OnClick="profileButton" Text="My Profile" />
            <br />
            <br />
            <asp:Button ID="Button2" runat="server" OnClick="myCoursesButton" Text="My Courses" />
            <br />
            <br />
            <asp:Button ID="Button3" runat="server" OnClick="addCoursesButton" Text="Add Courses" />

        </div>
    </form>
</body>
</html>
