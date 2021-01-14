<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Assignments.aspx.cs" Inherits="GUCera.Assignments" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
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
                            <li class="active"><a href="MyCourses.aspx">My Courses</a></li>
                            <li><a href="MyProfile.aspx">My Profile</a></li>
                            <li><a href="AddCourse.aspx">Available Courses</a></li>
                        </ul>
                        <ul class="nav navbar-nav navbar-right">
                        <li><asp:linkButton runat="server" onClick="logout_Click"><span class="glyphicon glyphicon-log-out"></span>Logout</asp:linkButton></li>
                        </ul>
                    </div>
                </nav>
            </div>
        <div>
            <div runat="server" id="assignDiv">
                <asp:Table ID="AssignmentsTable" runat="server"
                    CellPadding="10"
                    GridLines="Both"
                    HorizontalAlign="Center">
                </asp:Table>
            </div>
            <div runat="server" id="msgDiv" style="position: absolute; left: 500px">
            </div>
        </div>
    </form>
</body>
</html>
