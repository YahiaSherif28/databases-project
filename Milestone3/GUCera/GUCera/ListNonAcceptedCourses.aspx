<%@ Page Language="C#" CodeBehind="ListNonAcceptedCourses.aspx.cs" Inherits="GUCera.ListNonAcceptedCourses" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<script runat="server">

</script>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Title</title>
</head>
<body>
<form id="HtmlForm" runat="server">
    <div>
        <asp:Table id="CoursesTable" runat="server"
                   CellPadding="10"
                GridLines="Both"
                HorizontalAlign="Center">
        </asp:Table>
    </div>
</form>
</body>
</html>