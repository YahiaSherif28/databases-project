<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="MyCourses.aspx.cs" Inherits="GUCera.MyCourses1" %>

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
            <asp:Table ID="Courses" runat="server"
                CellPadding="10"
                GridLines="Both"
                HorizontalAlign="Center" BackColor="#E8E8E8">
            </asp:Table>
        </div>
        <br/>
        <br/>
        <br/>
        <div runat="server" id="assignDiv">
            <asp:Table ID="Assignments" runat="server"
                CellPadding="10"
                GridLines="Both"
                HorizontalAlign="Center" BackColor="#E8E8E8">
            </asp:Table>
        </div>
    
        <div runat="server" id="feedbackDiv" style="position:absolute; left:500px">
            <asp:Label ID="Label2" runat="server"></asp:Label>
            <br />
            <asp:TextBox ID="TextBox2" runat="server" Height="25px"></asp:TextBox>
            <br />
            <asp:Button ID="Button2" runat="server" Text="Add" onClick="addFeedback"/>
            <asp:Label ID="courseID" runat="server"></asp:Label>
            <br />
        </div>
    
        <div runat="server" id="certDiv">
            <asp:Table ID="Certs" runat="server"
                CellPadding="10"
                GridLines="Both"
                HorizontalAlign="Center" BackColor="#E8E8E8">
            </asp:Table>
        </div>

        <asp:Label id="Message" runat="server"></asp:Label>
    </form>
</body>
</html>
