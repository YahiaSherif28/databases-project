<%@ Page Language="C#" CodeBehind="CreatePromoCode.aspx.cs" Inherits="GUCera.CreatePromoCode" %>

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
        <asp:Label ID="Label1" runat="server" Text="Create Promocode"></asp:Label>
        <br/>
        <asp:Label ID="Label2" runat="server" Text="Code"></asp:Label>
        <br/>
        <asp:TextBox ID="code" runat="server"></asp:TextBox>
        <br/>
        <asp:Label ID="Label3" runat="server" Text="Issue Date"></asp:Label>
        <br/>
        <asp:TextBox ID="issueDate" runat="server"></asp:TextBox>
        <br/>
        <asp:Label ID="Label4" runat="server" Text="Expiry Date"></asp:Label>
        <br/>
        <asp:TextBox ID="expiryDate" runat="server"></asp:TextBox>
        <br/>
        <asp:Label ID="Label5" runat="server" Text="Discount"></asp:Label>
        <br/>
        <asp:TextBox ID="discount" runat="server"></asp:TextBox>
        <br/>
        <asp:Button ID="createPromocodeButton" runat="server" OnClick="CreatePromocodeOnClick" Text="Create Promocode"/>
        <br/>
    </div>
    <div>
        <asp:Label ID="Label6" runat="server" Text="Issue Promocode to student"></asp:Label>
        <br/>
        <asp:Label ID="Label7" runat="server" Text="Enter the code of the promocode"></asp:Label>
        <br/>
        <asp:TextBox ID="promoCodeToIssue" runat="server"></asp:TextBox>
        <br/>
        <asp:Label ID="Label8" runat="server" Text="Student Id"></asp:Label>
        <br/>
        <asp:TextBox ID="studentId" runat="server"></asp:TextBox>
        <br/>
        <asp:Button ID="issuePromocodeToStudentButton" runat="server" OnClick="IssuePromocodeOnClick" Text="Issue Promocode to student"/>
        <br/>
    </div>
</form>
</body>
</html>