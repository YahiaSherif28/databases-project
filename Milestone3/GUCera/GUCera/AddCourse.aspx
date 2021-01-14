<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AddCourse.aspx.cs" Inherits="GUCera.AddCourse" %>

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
        th{
            text-align:center;
            padding:4px;
        }
        td{
            padding:4px;
        }
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
            <nav class="navbar navbar-inverse" style="background: #1C5E55">
                <div class="container-fluid">
                    <div class="navbar-header">
                        <a class="navbar-brand" href="#">GUCera</a>
                    </div>
                    <ul class="nav navbar-nav">
                        <li><a href="MyCourses.aspx">My Courses</a></li>
                        <li><a href="MyProfile.aspx">My Profile</a></li>
                        <li class="active"><a href="AddCourse.aspx">Available Courses</a></li>
                    </ul>
                    <ul class="nav navbar-nav navbar-right">
                        <li><asp:linkButton runat="server" onClick="logout_Click"><span class="glyphicon glyphicon-log-out"></span>Logout</asp:linkButton></li>
                    </ul>
                </div>
            </nav>
            <div>
                <h2 class="auto-style3">
                    <asp:Label ID="Label1" runat="server" CssClass="auto-style2" ForeColor="#1C5E55" Text="Add Courses"></asp:Label>
                </h2>
            </div>
            <div style="padding: 10px">
                <asp:Label ID="Label2" runat="server" CssClass="auto-style2" ForeColor="#1C5E55" Text="Available Courses:"></asp:Label>
                <div class="auto-style3">
                    <div class="text-center">
                    <asp:GridView ID="GridView1" align="center" runat="server" AllowSorting="True" AutoGenerateColumns="False" CellPadding="4" DataKeyNames="id" DataSourceID="SqlDataSource1" ForeColor="#333333" ShowHeaderWhenEmpty="True" Width="350px" EmptyDataText="No Data Available">
                        <AlternatingRowStyle BackColor="White" />
                        <Columns>
                            <asp:BoundField DataField="id" HeaderText="Course ID" InsertVisible="False" ReadOnly="True" SortExpression="id" />
                            <asp:BoundField DataField="name" HeaderText="Name" SortExpression="name" />
                            <asp:TemplateField ItemStyle-HorizontalAlign="Center" HeaderText="More Details">
                                <ItemTemplate>
                                    <asp:LinkButton ID="moreDetails" Text="View" runat="server" CommandArgument='<%# Eval("id")%>' OnClick="moreDetails_Click" />
                                </ItemTemplate>
                            </asp:TemplateField>
                        </Columns>
                        <EditRowStyle BackColor="#7C6F57" />
                        <FooterStyle BackColor="#1C5E55" Font-Bold="True" ForeColor="White" />
                        <HeaderStyle BackColor="#1C5E55" Font-Bold="True" ForeColor="White" />
                        <PagerStyle BackColor="#666666" ForeColor="White" HorizontalAlign="Center" />
                        <RowStyle BackColor="#E3EAEB" />
                        <SelectedRowStyle BackColor="#C5BBAF" Font-Bold="True" ForeColor="#333333" />
                        <SortedAscendingCellStyle BackColor="#F8FAFA" />
                        <SortedAscendingHeaderStyle BackColor="#246B61" />
                        <SortedDescendingCellStyle BackColor="#D4DFE1" />
                        <SortedDescendingHeaderStyle BackColor="#15524A" />
                    </asp:GridView>
                    </div>
                    <asp:Label ID="message" runat="server" Font-Bold="True" ForeColor="#1C5E55"></asp:Label>
                </div>
                <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:GUCeraConnectionString %>" SelectCommand="newAvailableCourses" SelectCommandType="StoredProcedure">
                    <SelectParameters>
                        <asp:SessionParameter Name="sid" SessionField="user" Type="Int32" />
                    </SelectParameters>
                </asp:SqlDataSource>
            </div>

            <div style="padding: 10px" id="chosendiv" runat="server" visible="false">

                <asp:Label ID="Label3" runat="server" CssClass="auto-style2" ForeColor="#1C5E55" Text="Chosen Course:"></asp:Label>

                <asp:Label ID="chosenID" runat="server" Text="Chosen Course ID" Visible="False"></asp:Label>
                <asp:FormView ID="FormView1" runat="server" CellPadding="4" DataKeyNames="id" DataSourceID="SqlDataSource2" EmptyDataText="Course Information not available" ForeColor="#333333" Width="600px" BorderColor="#1C5E55" BorderStyle="Double" BorderWidth="6px">
                    <EditRowStyle BackColor="#7C6F57" />
                    <FooterStyle BackColor="#1C5E55" Font-Bold="True" ForeColor="White" />
                    <HeaderStyle BackColor="#1C5E55" Font-Bold="True" ForeColor="White" />
                    <ItemTemplate>
                        <asp:Label ID="Label5" runat="server" CssClass="auto-style2" ForeColor="White" Text="Course ID:" BackColor="#1C5E55"></asp:Label>
                        <asp:Label ID="idLabel" runat="server" Text='<%# Eval("id") %>' />
                        <br />
                        <asp:Label ID="Label6" runat="server" CssClass="auto-style2" ForeColor="White" Text="Name:" BackColor="#1C5E55"></asp:Label>
                        <asp:Label ID="nameLabel" runat="server" Text='<%# Bind("name") %>' />
                        <br />
                        <asp:Label ID="Label4" runat="server" CssClass="auto-style2" ForeColor="White" Text="Credit Hours:" BackColor="#1C5E55"></asp:Label>
                        <asp:Label ID="creditHoursLabel" runat="server" Text='<%# Bind("creditHours") %>' />
                        <br />


                        <asp:Label ID="Label7" runat="server" CssClass="auto-style2" ForeColor="White" Text="Description:" BackColor="#1C5E55"></asp:Label>
                        <asp:Label ID="courseDescriptionLabel" runat="server" Text='<%# Bind("courseDescription") %>' />
                        <br />
                        <asp:Label ID="Label8" runat="server" CssClass="auto-style2" ForeColor="White" Text="Price:" BackColor="#1C5E55"></asp:Label>
                        <asp:Label ID="priceLabel" runat="server" Text='<%# Bind("price") %>' />
                        <br />
                        <asp:Label ID="Label9" runat="server" CssClass="auto-style2" ForeColor="White" Text="Content:" BackColor="#1C5E55"></asp:Label>
                        <asp:Label ID="contentLabel" runat="server" Text='<%# Bind("content") %>' />
                        <br />

                        <asp:Label ID="Label10" runat="server" CssClass="auto-style2" ForeColor="White" Text="Instructor ID:" BackColor="#1C5E55"></asp:Label>
                        <asp:Label ID="instructorIdLabel" runat="server" Text='<%# Bind("instructorId") %>' />
                        <br />
                        <asp:Label ID="Label12" runat="server" CssClass="auto-style2" ForeColor="White" Text="Instructor Name:" BackColor="#1C5E55"></asp:Label>
                        <asp:Label ID="Label14" runat="server" Text='<%# string.Format("{0} {1}", Eval("firstName"), Eval("lastName")) %>' />
                        <br />
                        <asp:Label ID="Label13" runat="server" CssClass="auto-style2" ForeColor="White" Text="Admin ID:" BackColor="#1C5E55"></asp:Label>
                        <asp:Label ID="adminIdLabel" runat="server" Text='<%# Bind("adminId") %>' />
                        <br />
                        <asp:Label ID="Label11" runat="server" CssClass="auto-style2" ForeColor="White" Text="Accepted by Admin" BackColor="#1C5E55"></asp:Label>
                        <asp:CheckBox ID="acceptedCheckBox" runat="server" Checked='<%# Bind("accepted") %>' Enabled="false" />
                        <br />

                    </ItemTemplate>
                    <PagerStyle BackColor="#666666" ForeColor="White" HorizontalAlign="Center" />
                    <RowStyle BackColor="#E3EAEB" />
                </asp:FormView>
                <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:GUCeraConnectionString %>" SelectCommand="courseInformation" SelectCommandType="StoredProcedure">
                    <SelectParameters>
                        <asp:ControlParameter ControlID="chosenID" Name="id" PropertyName="Text" Type="Int32" />
                    </SelectParameters>
                </asp:SqlDataSource>

                <asp:Label ID="Label4" runat="server" CssClass="auto-style2" ForeColor="#1C5E55" Text="Instructors Teaching The Course:"></asp:Label>

                <div class="auto-style3">

                    <asp:GridView ID="GridView2" runat="server" AllowSorting="True" AutoGenerateColumns="False" CellPadding="4" DataKeyNames="id" DataSourceID="SqlDataSource3" ForeColor="#333333" ShowHeaderWhenEmpty="True">
                        <AlternatingRowStyle BackColor="White" />
                        <Columns>
                            <asp:BoundField DataField="id" HeaderText="ID" InsertVisible="False" ReadOnly="True" SortExpression="id" />
                            <asp:TemplateField HeaderText="Name" SortExpression="firstName">
                                <ItemTemplate>
                                    <asp:Label ID="Label1" runat="server" Text='<%# string.Format("{0} {1}", Eval("firstName"), Eval("lastName")) %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Enroll With This Instructor">
                                <ItemTemplate>
                                    <asp:LinkButton ID="enroll" Text="Enroll" runat="server" CommandArgument='<%# Eval("id")%>' OnClick="enroll_Click" />
                                </ItemTemplate>
                            </asp:TemplateField>
                        </Columns>
                        <EditRowStyle BackColor="#7C6F57" />
                        <FooterStyle BackColor="#1C5E55" Font-Bold="True" ForeColor="White" />
                        <HeaderStyle BackColor="#1C5E55" Font-Bold="True" ForeColor="White" />
                        <PagerStyle BackColor="#666666" ForeColor="White" HorizontalAlign="Center" />
                        <RowStyle BackColor="#E3EAEB" />
                        <SelectedRowStyle BackColor="#C5BBAF" Font-Bold="True" ForeColor="#333333" />
                        <SortedAscendingCellStyle BackColor="#F8FAFA" />
                        <SortedAscendingHeaderStyle BackColor="#246B61" />
                        <SortedDescendingCellStyle BackColor="#D4DFE1" />
                        <SortedDescendingHeaderStyle BackColor="#15524A" />
                    </asp:GridView>
                </div>
                <asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString="<%$ ConnectionStrings:GUCeraConnectionString %>" SelectCommand="InstructorsOfACourse" SelectCommandType="StoredProcedure">
                    <SelectParameters>
                        <asp:ControlParameter ControlID="chosenID" Name="cid" PropertyName="Text" Type="Int32" />
                    </SelectParameters>
                </asp:SqlDataSource>

            </div>
        </div>
    </form>
</body>
</html>
