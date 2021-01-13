<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="MyCourses.aspx.cs" Inherits="GUCera.MyCourses1" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>My Courses</title>
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css" />
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
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
            <div>
                <nav class="navbar navbar-inverse" style="background: #1C5E55">
                    <div class="container-fluid">
                        <div class="navbar-header">
                            <a class="navbar-brand" href="#">GUCera</a>
                        </div>
                        <ul class="nav navbar-nav">
                            <li><a href="/AddCourse.aspx">My Courses</a></li>
                            <li><a href="MyProfile.aspx">My Profile</a></li>
                            <li class="active"><a href="MyCourses.aspx">Available Courses</a></li>
                        </ul>
                        <ul class="nav navbar-nav navbar-right">
                            <li><a href="#"><span class="glyphicon glyphicon-log-out"></span>Logout</a></li>
                        </ul>
                    </div>
                </nav>
            </div>
            <div>
                <asp:Table ID="Courses" runat="server"
                    CellPadding="10"
                    GridLines="Both"
                    HorizontalAlign="Center" BackColor="#E8E8E8" CellSpacing="5">
                </asp:Table>
            </div>
            <br />
            <br />
            <br />
            <div runat="server" id="assignDiv">
                <asp:Table ID="Assignments" runat="server"
                    CellPadding="10"
                    GridLines="Both"
                    HorizontalAlign="Center" BackColor="#E8E8E8">
                </asp:Table>
            </div>

            <div runat="server" id="feedbackDiv" style="position: absolute; left: 500px">
                <asp:Label ID="Label2" runat="server"></asp:Label>
                <br />
                <asp:TextBox ID="TextBox2" runat="server" Height="25px"></asp:TextBox>
                <br />
                <asp:Button ID="Button2" runat="server" Text="Add" OnClick="addFeedback" />
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

            <asp:Label ID="Message" runat="server"></asp:Label>
        </div>
    </form>
</body>
</html>
