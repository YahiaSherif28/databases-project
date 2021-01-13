<%@ Page Language="C#" CodeBehind="ListAllCourses.aspx.cs" Inherits="GUCera.ListAllCourses" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<script runat="server">

</script>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Title</title>
</head>
<body>
    <div>
        <asp:Table id="coursesTable" runat="server"
                   CellPadding="10" 
                GridLines="Both"
                HorizontalAlign="Center">
        </asp:Table>
    </div>
</body>
</html>