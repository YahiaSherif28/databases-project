<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="InstructorCourses.aspx.cs" Inherits="GUCera.InstructorCourses" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css" />
    <style type="text/css">
       body { padding-top: 60px; }
        th{
            text-align:center;
            padding:4px;
        }
        td{
            padding:2px 4px 2px 4px;
        }
        .btn-default{
            margin-bottom:4px;
        }

         .container {
            width: 800px;
            margin-left: auto;
            margin-right: auto;
            background-color: white;
            padding: 20px;
        }
        .auto-style1 {
            height: 40px;
            text-align: center;
        }

        .auto-style2 {
            font-family: Arial, Helvetica, sans-serif;
        }

        .auto-style5 {
            height: 200px;
            padding: 10px;
            text-align: center;
        }

        .auto-style9 {
            width: 348px;
            text-align: right;
        }
        .auto-style16 {
            width: 102%;
            height: 68px;
            margin-left: 0px;
            margin-top: 0px;
        }
        .auto-style18 {
            width: 218px;
            text-align: center;
        }
        .auto-style19 {
            width: 191px;
            text-align: center;
        }
        .auto-style24 {
            font-size: large;
            color: #1C5E55;
            font-weight: bold;
            height: 27px;
        }
        .auto-style27 {
            height: 27px;
        }
        .auto-style28 {
            width: 348px;
            text-align: right;
            height: 29px;
        }
        .auto-style29 {
            height: 29px;
        }
        .auto-style30 {
            width: 170px;
            text-align: center;
        }
        .auto-style31 {
            width: 178px;
            text-align: center;
        }
        .auto-style37 {
            width: 800px;
            height: 90px;
            margin-left: auto;
            margin-right: auto;
            padding: 20px;
            background-color: white;
        }
        .auto-style38 {
            width: 75px;
            text-align: center;
        }
        .auto-style39 {
            width: 702px;
        }
        .auto-style40 {
            width: 708px;
        }
        .auto-style41 {
            text-align: center;
            margin-top: 11px;
        }
        .auto-style42 {
            width: 348px;
            text-align: right;
            height: 62px;
            margin-top: 77px;
        }
        .auto-style43 {
            width: 800px;
            height: 168px;
            margin-left: auto;
            margin-right: auto;
            padding: 20px;
            background-color: white;
        }
        .auto-style44 {
            width: 800px;
            height: 158px;
            margin-left: auto;
            margin-right: auto;
            padding: 20px;
            background-color: white;
        }
        .auto-style45 {
            width: 800px;
            height: 157px;
            margin-left: auto;
            margin-right: auto;
            padding: 20px;
            background-color: white;
        }
        .auto-style46 {
            width: 800px;
            height: 154px;
            margin-left: auto;
            margin-right: auto;
            padding: 20px;
            background-color: white;
        }
    </style>
</head>
<body style="height: 2362px">
    <form id="form1" runat="server">
        <div>
            <nav class="navbar navbar-inverse navbar-fixed-top" style="background:#1C5E55">
                <div class="container-fluid">
                    <div class="navbar-header">
                        <a class="navbar-brand">GUCera</a>
                    </div>
                   
                    <ul class="nav navbar-nav navbar-right">
                        <li><asp:linkButton runat="server" onClick="logout_Click"><span class="glyphicon glyphicon-log-out"></span>Logout</asp:linkButton></li>
                    </ul>
                </div>
            </nav>

            <div class="auto-style1">
                <h2>
                    <asp:Label ID="Label1" runat="server" CssClass="auto-style2" ForeColor="#1C5E55" Text="My Courses"></asp:Label>
                </h2>
            </div>
            <div>
                <asp:SqlDataSource ID="InstructorCoursesDataSource" runat="server" ConnectionString="<%$ ConnectionStrings:GUCeraConnectionString %>" SelectCommand="InstructorViewAcceptedCoursesByAdmin" SelectCommandType="StoredProcedure">
                    <SelectParameters>
                        <asp:SessionParameter Name="instrId" SessionField="user" Type="Int32" />
                    </SelectParameters>
                </asp:SqlDataSource>
                <div class="auto-style5">
                    <asp:GridView ID="GridView1" align="center" runat="server" AutoGenerateColumns="False" CellPadding="4"  DataSourceID="InstructorCoursesDataSource" ForeColor="#333333" Width="500px" ShowHeaderWhenEmpty="True" Height="100px">
                        <AlternatingRowStyle BackColor="White" /> 
                        <Columns>
                            <asp:BoundField DataField="id" HeaderText="Course ID" SortExpression="id" />
                            <asp:BoundField DataField="name" HeaderText="Course Name" SortExpression="name" />
                            <asp:BoundField DataField="creditHours" HeaderText="Credit Hours" SortExpression="creditHours" />
                          
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
                <div class ="auto-style37" runat ="server" style="text-align:center; ">
                    <table class="auto-style16">
                        <tr>
                            <td class="auto-style31">
                                <asp:LinkButton ID="DefineCoursePrerequisitesLinkButton" runat="server" Text="Define Prerequisites" style="padding:4px" BackColor="#1C5E55" BorderColor="Black" BorderStyle="Solid" BorderWidth="2px" Font-Bold="True" Font-Size="Medium" Font-Underline="False" ForeColor="White" Width="199px" Font-Names="Arial" OnClick="DefineCoursePrerequisitesLinkButton_Click"/>
                            </td>
                            <td class="auto-style38">
                                <asp:LinkButton ID="UpdateCourseContentLinkButton" runat="server" style="padding:4px" Text="Update Content" BackColor="#1C5E55" BorderColor="Black" BorderStyle="Solid" BorderWidth="2px" Font-Bold="True" Font-Size="Medium" Font-Underline="False" ForeColor="White" Width="184px" OnClick ="UpdateCourseContentLinkButton_Click" Font-Names="Arial"/>
                            </td>
                             <td class="auto-style19">
                                <asp:LinkButton ID="UpdateCourseDescriptionLinkButton" runat="server" Text="Update Description" style="padding:4px" BackColor="#1C5E55" BorderColor="Black" BorderStyle="Solid" BorderWidth="2px" Font-Bold="True" Font-Size="Medium" Font-Underline="False" ForeColor="White" Width="190px" Font-Names="Arial" OnClick="UpdateCourseDescriptionLinkButton_Click"/>
                            </td>
                            <td class="auto-style31">
                                <asp:LinkButton ID="AddAnotherInstructorToCourseLinkButton" runat="server" Text="Add Instructor" style="padding:4px" BackColor="#1C5E55" BorderColor="Black" BorderStyle="Solid" BorderWidth="2px" Font-Bold="True" Font-Size="Medium" Font-Underline="False" ForeColor="White" Width="187px" Font-Names="Arial" OnClick="AddAnotherInstructorToCourseLinkButton_Click"/>
                            </td>

                            
                             <td class="auto-style18">
                                 &nbsp;</td>
                             <td class="auto-style30">
                                 &nbsp;</td>
                        </tr>
                    </table>
                              
                </div>
            </div>
            <div class ="auto-style44" runat ="server" id="DefineCoursePrerequisites" visible ="false" >
                <asp:Panel ID="Panel2"  runat="server" ForeColor="#333333" BorderColor="#1C5E55" BorderStyle="Double" BorderWidth="6px" BackColor="#E3EAEB">
                <table class="auto-style39" style="padding: 4px">
                    <tr>
                        <td class="auto-style24">
                            Define Prerequisites</td>
                        <td class="auto-style27">
                            <asp:Label ID="DefineCoursePrerequisitesMessage" runat="server" Font-Bold="True" ForeColor="#1C5E55"></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td class="auto-style28">Course ID:</td>
                        <td class="auto-style29">
                            <asp:TextBox ID="cid_P" runat="server" Width="200px" MaxLength="10"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td class="auto-style28">Prerequisite Course ID:</td>
                        <td class="auto-style29">
                            <asp:TextBox ID="prerequsiteId" runat="server" Width="200px" MaxLength="10"></asp:TextBox>
                        </td>
                    </tr>
                  
                    <tr>
                        <td class="auto-style9">&nbsp;</td>
                        <td>
                            <asp:Button ID="DefineCoursePrerequisitesButton" runat="server" Text="Add" Width="176px" BorderStyle="Groove" OnClick="DefineCoursePrerequisitesClick" />
                        </td>
                    </tr>
                </table>
                    </asp:Panel>
            </div>
              <div class ="auto-style45" runat ="server" id="UpdateCourseContent" visible ="false" >
                <asp:Panel ID="Panel1"  runat="server" ForeColor="#333333" BorderColor="#1C5E55" BorderStyle="Double" BorderWidth="6px" BackColor="#E3EAEB">
                <table class="auto-style40" style="padding: 4px">
                    <tr>
                        <td class="auto-style24">
                            Update Content</td>
                        <td class="auto-style27">
                            <asp:Label ID="UpdateCourseContentMessage" runat="server" Font-Bold="True" ForeColor="#1C5E55"></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td class="auto-style28">Course ID:</td>
                        <td class="auto-style29">
                            <asp:TextBox ID="cid_c" runat="server" Width="200px" MaxLength="10"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td class="auto-style28">Content :</td>
                        <td class="auto-style29">
                            <asp:TextBox ID="content" runat="server" Width="200px" MaxLength="200"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td class="auto-style9">&nbsp;</td>
                        <td>
                            <asp:Button ID="UpdateCourseContentButton" runat="server" Text="Add" Width="176px" BorderStyle="Groove" OnClick="UpdateCourseContentClick" />
                        </td>
                    </tr>
                   
                </table>
                    </asp:Panel>
            </div>
              <div class ="auto-style46" runat ="server" id="UpdateCourseDescription" visible ="false" >
                <asp:Panel ID="panel3"  runat="server" ForeColor="#333333" BorderColor="#1C5E55" BorderStyle="Double" BorderWidth="6px" BackColor="#E3EAEB">
                <table class="auto-style4" style="padding: 4px">
                    <tr>
                        <td class="auto-style24">
                            Update Description</td>
                        <td class="auto-style27">
                            <asp:Label ID="UpdateCourseDescriptionMessage" runat="server" Font-Bold="True" ForeColor="#1C5E55"></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td class="auto-style28">Course ID:</td>
                        <td class="auto-style29">
                            <asp:TextBox ID="cid_D" runat="server" Width="200px" MaxLength="10"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td class="auto-style28">Description:</td>
                        <td class="auto-style29">
                            <asp:TextBox ID="courseDescription" runat="server" Width="200px" MaxLength="200"></asp:TextBox>
                        </td>
                    </tr>
                 
                    <tr>
                        <td class="auto-style9">&nbsp;</td>
                        <td>
                            <asp:Button ID="UpdateCourseDescriptionButton" runat="server" Text="Add" Width="200px" BorderStyle="Groove" OnClick="UpdateCourseDescriptionClick" />
                        </td>
                    </tr>
                </table>
                    </asp:Panel>
            </div>
              <div class ="auto-style43" runat ="server" id="AddAnotherInstructorToCourse" visible ="false" >
                <asp:Panel ID="Panel4"  runat="server" ForeColor="#333333" BorderColor="#1C5E55" BorderStyle="Double" BorderWidth="6px" BackColor="#E3EAEB">
                <table class="auto-style4" style="padding: 4px">
                    <tr>
                        <td class="auto-style24">
                            Add Instructor</td>
                        <td class="auto-style27">
                            <asp:Label ID="AddAnotherInstructorToCourseMessage" runat="server" Font-Bold="True" ForeColor="#1C5E55"></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td class="auto-style28">Course ID:</td>
                        <td class="auto-style29">
                            <asp:TextBox ID="cid_I" runat="server" Width="200px" MaxLength="10"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td class="auto-style28">Instructor ID:</td>
                        <td class="auto-style29">
                            <asp:TextBox ID="insid" runat="server" Width="200px" MaxLength="10"></asp:TextBox>
                        </td>
                    </tr>
                 
                    <tr>
                        <td class="auto-style9">&nbsp;</td>
                        <td>
                            <asp:Button ID="AddAnotherInstructorToCourseButton" runat="server" Text="Add" Width="200px" BorderStyle="Groove" OnClick="AddAnotherInstructorToCourseClick" />
                        </td>
                    </tr>
                </table>
                    </asp:Panel>
            </div>
                      <div  style ="text-align : center; margin-left: auto; margin-right: auto; margin-bottom: auto; " class="auto-style42" >

                <td class="auto-style10">
                </td>

                 <asp:LinkButton ID="BackButton" runat="server" style="padding:4px" Text="Back" BackColor="#1C5E55" BorderColor="Black" BorderStyle="Solid" BorderWidth="2px" Font-Bold="True" Font-Size="Medium" Font-Underline="False" ForeColor="White" Width="166px" OnClick ="Back_Click" Font-Names="Arial" Height="31px" CssClass="auto-style41"/>

            </div>
            </div>
    </form>
</body>
</html>
