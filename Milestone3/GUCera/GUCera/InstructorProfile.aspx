<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="InstructorProfile.aspx.cs" Inherits="GUCera.InstructorProfile" %>

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
        .auto-style10 {
            width: 200px;
            text-align: center;
        }
        .auto-style11 {
            text-align: center;
        }
        .auto-style14 {
            text-align: left;
            padding:6px;
        }
        .auto-style15 {
            width: 331px;
        }
        .auto-style16 {
            width: 72%;
            height: 63px;
            margin-left: 0px;
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
        .auto-style36 {
            width: 695px;
        }
        .auto-style37 {
            width: 800px;
            height: 114px;
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
                    <asp:Label ID="Label1" runat="server" CssClass="auto-style2" ForeColor="#1C5E55" Text="My Profile"></asp:Label>
                </h2>
            </div>
            <div>
                <asp:SqlDataSource ID="InstructorProfileDataSource" runat="server" ConnectionString="<%$ ConnectionStrings:GUCeraConnectionString %>" SelectCommand="viewInstructorProfile" SelectCommandType="StoredProcedure">
                    <SelectParameters>
                        <asp:SessionParameter Name="instrId" SessionField="user" Type="Int32" />
                    </SelectParameters>
                </asp:SqlDataSource>
                <div class="auto-style5">
                    <asp:GridView ID="GridView1" align="center" runat="server" AutoGenerateColumns="False" CellPadding="4"  DataSourceID="InstructorProfileDataSource" ForeColor="#333333" Width="500px" ShowHeaderWhenEmpty="True" Height="100px">
                        <AlternatingRowStyle BackColor="White" /> 
                        <Columns>
                            <asp:BoundField DataField="firstName" HeaderText="First Name" SortExpression="firstName" />
                            <asp:BoundField DataField="lastName" HeaderText="Last Name" SortExpression="lastName" />
                            <asp:TemplateField HeaderText="Gender" SortExpression="gender">
                                <ItemTemplate>
                                    <asp:Label ID="l8" runat="server" Text='<%# Boolean.Parse(Eval("gender").ToString()) ? "Male" : "Female" %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:BoundField DataField="email" HeaderText="Email" SortExpression="email" />
                            <asp:BoundField DataField="address" HeaderText="Address" SortExpression="address" />
                            <asp:BoundField DataField="mobileNumber" HeaderText="Mobile Number" SortExpression="mobileNumber" />
                            <asp:BoundField DataField="rating" HeaderText="Rating" SortExpression="rating" />

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
                            <td class="auto-style10">
                                <asp:LinkButton ID="AddCourseLinkButton" runat="server" style="padding:4px" Text="Add Course" BackColor="#1C5E55" BorderColor="Black" BorderStyle="Solid" BorderWidth="2px" Font-Bold="True" Font-Size="Medium" Font-Underline="False" ForeColor="White" Width="166px" OnClick ="AddCourseLinkButton_Click" Font-Names="Arial"/>
                            </td>
                             <td class="auto-style19">
                                <asp:LinkButton ID="AddAssignmentLinkButton" runat="server" Text="Define Assignment" style="padding:4px" BackColor="#1C5E55" BorderColor="Black" BorderStyle="Solid" BorderWidth="2px" Font-Bold="True" Font-Size="Medium" Font-Underline="False" ForeColor="White" Width="188px" Font-Names="Arial" OnClick="DefineAssignmentLinkButton_Click"/>
                            </td>
                            <td class="auto-style31">
                                <asp:LinkButton ID="ViewAssignmentLinkButton" runat="server" Text="View Assignments" style="padding:4px" BackColor="#1C5E55" BorderColor="Black" BorderStyle="Solid" BorderWidth="2px" Font-Bold="True" Font-Size="Medium" Font-Underline="False" ForeColor="White" Width="199px" Font-Names="Arial" OnClick="ViewAssignmentLinkButton_Click"/>
                            </td>
                              <td class="auto-style10">
                                <asp:LinkButton ID="GradeAssignmentLinkButton" runat="server" Text="Grade Assignment" style="padding:4px" BackColor="#1C5E55" BorderColor="Black" BorderStyle="Solid" BorderWidth="2px" Font-Bold="True" Font-Size="Medium" Font-Underline="False" ForeColor="White" Width="199px" Font-Names="Arial" OnClick="GradeAssignmentLinkButton_Click"/>
                            </td>
                             <td class="auto-style18">
                                 &nbsp;</td>
                             <td class="auto-style30">
                                 &nbsp;</td>
                        </tr>
                    </table>
                                <asp:LinkButton ID="FeedbacksLinkButton" runat="server" Text="View Feedbacks" style="padding:4px" BackColor="#1C5E55" BorderColor="Black" BorderStyle="Solid" BorderWidth="2px" Font-Bold="True" Font-Size="Medium" Font-Underline="False" ForeColor="White" Width="224px" Font-Names="Arial" OnClick="ViewFeedBackButton_Click"  Height="29px"/>
                                <asp:LinkButton ID="IssueCertificateLinkButton" runat="server" Text="Issue Certificate" style="padding:4px" BackColor="#1C5E55" BorderColor="Black" BorderStyle="Solid" BorderWidth="2px" Font-Bold="True" Font-Size="Medium" Font-Underline="False" ForeColor="White" Width="214px" Font-Names="Arial" OnClick="IssueCertificate_Click"  Height="29px"/>
                                <asp:LinkButton ID="LinkButton1" runat="server" Text="Add Mobile" style="padding:4px" BackColor="#1C5E55" BorderColor="Black" BorderStyle="Solid" BorderWidth="2px" Font-Bold="True" Font-Size="Medium" Font-Underline="False" ForeColor="White" Width="232px" Font-Names="Arial" OnClick="addMobile"  Height="29px"/>
                  
                </div>
            </div>
            <div class ="container" runat ="server" id="addCourseDiv" visible ="false" >
                <asp:Panel ID="Panel2"  runat="server" ForeColor="#333333" BorderColor="#1C5E55" BorderStyle="Double" BorderWidth="6px" BackColor="#E3EAEB">
                <table class="auto-style4" style="padding: 4px">
                    <tr>
                        <td class="auto-style24">
                            Add course</td>
                        <td class="auto-style27">
                            <asp:Label ID="AddCourseMessage" runat="server" Font-Bold="True" ForeColor="#1C5E55"></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td class="auto-style28">Course Name:</td>
                        <td class="auto-style29">
                            <asp:TextBox ID="cname" runat="server" Width="200px" MaxLength="10"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td class="auto-style28">Credit Hours:</td>
                        <td class="auto-style29">
                            <asp:TextBox ID="credithours" runat="server" Width="200px" MaxLength="10"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td class="auto-style9">Price:</td>
                        <td>
                            <asp:TextBox ID="price" runat="server" Width="200px" MaxLength="10"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td class="auto-style9">&nbsp;</td>
                        <td>
                            <asp:Button ID="addCourse" runat="server" Text="Add" Width="200px" BorderStyle="Groove" OnClick="AddCourseClick" />
                        </td>
                    </tr>
                </table>
                    </asp:Panel>
            </div>
            <div class="container" id="defineAssignment" visible="False" runat="server">
                <asp:Panel ID="Panel1"  runat="server" CellPadding="4" ForeColor="#333333" BorderColor="#1C5E55" BorderStyle="Double" BorderWidth="6px" BackColor="#E3EAEB">
                 

       
                      <table class="auto-style4" style="padding: 4px">
                         <tr>
                        <td class="auto-style24">
                            Define Assignment</td>
                        <td class="auto-style27">
                            <asp:Label ID="DefineAssignmentMessage" runat="server" Font-Bold="True" ForeColor="#1C5E55"></asp:Label>
                        </td>
                    </tr>
                          <tr>
                              <td class="auto-style9">Course ID:</td>
                              <td class="auto-style15">
                                  <asp:TextBox ID="CourseID" runat="server" Width="233px" MaxLength="14"></asp:TextBox>
                              </td>
                          </tr>
                          <tr>
                              <td class="auto-style9">Assignment Number:</td>
                              <td class="auto-style15">
                                  <asp:TextBox ID="AssignmentNumber" runat="server" Width="233px" MaxLength="16"></asp:TextBox>
                              </td>
                          </tr>
                           <tr>
                              <td class="auto-style9">Assignment Type:</td>
                              <td class="auto-style15">
                                  <asp:TextBox ID="AssignmentType" runat="server" Width="232px" MaxLength="10"></asp:TextBox>
                              </td>
                          </tr>   
                           <tr>
                              <td class="auto-style9">Assignment FullGrade:</td>
                              <td class="auto-style15">
                                  <asp:TextBox ID="AssignmentfullGrade" runat="server" Width="232px" MaxLength="16"></asp:TextBox>
                              </td>
                          </tr>   

                            <tr>
                              <td class="auto-style9">Assignment Weight:</td>
                              <td class="auto-style15">
                                  <asp:TextBox ID="AssignmentWeight" runat="server" Width="232px" MaxLength="16"></asp:TextBox>
                              </td>
                          </tr>   
                          <tr>
                              <td class="auto-style9">DeadLine:</td>
                              <td class="auto-style15">
                                  <asp:TextBox ID="DeadLine" runat="server" textmode="Date" Width="231px"></asp:TextBox>
                              </td>
                          </tr>
                          <tr>
                              <td class="auto-style9">Content:</td>
                              <td class="auto-style15">
                                  <asp:TextBox ID="Content" runat="server" Width="231px" MaxLength="200"></asp:TextBox>
                              </td>
                          </tr>
                          <tr>
                              <td class="auto-style9">&nbsp;</td>
                              <td class="auto-style15">
                                  <asp:Button ID="defineAssignmentButton" runat="server" BorderStyle="Groove" OnClick="DefineAssignmentClick" Text="Add" Width="200px" />
                              </td>
                          </tr>
                      </table>

                </asp:Panel>
            </div>
             <div class="container" id="viewAssignmentsDiv" visible="False" runat="server">
                 <asp:SqlDataSource ID="assignmentsDataSource" runat="server" ConnectionString="<%$ ConnectionStrings:GUCeraConnectionString %>" SelectCommand="InstructorViewAssignmentsStudents" SelectCommandType="StoredProcedure">
                        <SelectParameters>
                            <asp:SessionParameter Name="instrId" SessionField="user" Type="Int32" />
                        </SelectParameters>
                    </asp:SqlDataSource>
                 <asp:Panel ID="Panel3"  runat="server" CellPadding="4" ForeColor="#333333" BorderColor="#1C5E55" BorderStyle="Double" BorderWidth="6px" BackColor="#E3EAEB">
                      <div class="auto-style11">
                        <div class="auto-style14">
                            <asp:Label ID="Label3" runat="server" Font-Bold="True" Font-Size="Large" ForeColor="#1C5E55">View Assignments</asp:Label>
                        </div>
                        <asp:GridView ID="GridView3" runat="server" align="center" AutoGenerateColumns="False" CellPadding="4" DataSourceID="assignmentsDataSource" ForeColor="#333333" ShowHeaderWhenEmpty="True" Width="500px" EmptyDataText="No data available" DataKeyNames="number" >
                            <AlternatingRowStyle BackColor="White" />
                            <Columns>
                                <asp:BoundField DataField="sid" HeaderText="Student ID" ReadOnly="True" SortExpression="sid" />
                                <asp:BoundField DataField="cid" HeaderText="Course ID" ReadOnly="True" SortExpression="cid" />
                                <asp:BoundField DataField="assignmentNumber" HeaderText="Assignment Number" SortExpression="assignmentNumber" />
                                <asp:BoundField DataField="assignmenttype" HeaderText="Assignment Type" SortExpression="assignmenttype" />
                                <asp:BoundField DataField="grade" HeaderText="Grade" SortExpression="grade" />
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
                      
                    
                 </asp:Panel>
             </div>


               <div class="container" id="issueCertificate" visible="False" runat="server">
                <asp:Panel ID="Panel6"  runat="server" CellPadding="4" ForeColor="#333333" BorderColor="#1C5E55" BorderStyle="Double" BorderWidth="6px" BackColor="#E3EAEB"  Width="790px">
                 

       
                      <table class="auto-style36" style="padding: 4px">
                         <tr>
                        <td class="auto-style24">
                            Issue Certificate</td>
                        <td class="auto-style27">
                            <asp:Label ID="IssueCertificateMessage" runat="server" Font-Bold="True" ForeColor="#1C5E55"></asp:Label>
                        </td>
                    </tr>
                          <tr>
                              <td class="auto-style9">Course ID:</td>
                              <td class="auto-style15">
                                  <asp:TextBox ID="CoursID_C" runat="server" Width="233px" MaxLength="14"></asp:TextBox>
                              </td>
                          </tr>
                          <tr>
                              <td class="auto-style9">Student ID:</td>
                              <td class="auto-style15">
                                  <asp:TextBox ID="StudentID_C" runat="server" Width="233px" MaxLength="16"></asp:TextBox>
                              </td>
                          </tr>
                          <tr>
                              <td class="auto-style9">&nbsp;</td>
                              <td class="auto-style15">
                                  <asp:Button ID="IssueCertificateButton" runat="server" BorderStyle="Groove" OnClick="IssueCertificateClick" Text="Issue" Width="200px" />
                              </td>
                          </tr>
                      </table>

                </asp:Panel>
            </div>

            <div class="container" id="feedbackDiv" visible="False" runat="server">
                <asp:Panel ID="Panel4"  runat="server" CellPadding="4" ForeColor="#333333" BorderColor="#1C5E55" BorderStyle="Double" BorderWidth="6px" BackColor="#E3EAEB">
                    <div class="auto-style11" style="margin-bottom:20px">
                        <div class="auto-style14">
                            <asp:Label ID="Label5" runat="server" Font-Bold="True" Font-Size="Large" ForeColor="#1C5E55">Feedbacks</asp:Label>
                        </div>
                        <asp:GridView ID="GridView4" runat="server" align="center" AutoGenerateColumns="False" CellPadding="4" DataSourceID="FeedbackDataSource" ForeColor="#333333" ShowHeaderWhenEmpty="True" Width="500px" EmptyDataText="No data available">
                            <AlternatingRowStyle BackColor="White" />
                            <Columns>
                                <asp:BoundField DataField="cid" HeaderText="Course ID" ReadOnly="True" SortExpression="cid" />
                                <asp:BoundField DataField="number" HeaderText="Number" SortExpression="number" />
                                <asp:BoundField DataField="comment" HeaderText="Comment" SortExpression="comment" />
                                <asp:BoundField DataField="numberOfLikes" HeaderText="Likes" SortExpression="numberOfLikes" />
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

                    <asp:SqlDataSource ID="FeedbackDataSource" runat="server" ConnectionString="<%$ ConnectionStrings:GUCeraConnectionString %>" SelectCommand="ViewFeedbacksAddedByStudentsOnMyCourse" SelectCommandType="StoredProcedure">
                        <SelectParameters>
                            <asp:SessionParameter Name="instrId" SessionField="user" Type="Int32" />
                        </SelectParameters>
                    </asp:SqlDataSource>                    

                </asp:Panel>
            </div>


             <div class="container" id="gradeAssignments" visible="False" runat="server">
                <asp:Panel ID="Panel5"  runat="server" CellPadding="4" ForeColor="#333333" BorderColor="#1C5E55" BorderStyle="Double" BorderWidth="6px" BackColor="#E3EAEB">
                 

       
                      <table class="auto-style4" style="padding: 4px">
                         <tr>
                        <td class="auto-style24">
                            Grade Assignment</td>
                        <td class="auto-style27">
                            <asp:Label ID="GradeAssignmentMessage" runat="server" Font-Bold="True" ForeColor="#1C5E55"></asp:Label>
                        </td>
                    </tr>
                          <tr>
                              <td class="auto-style9">Course ID:</td>
                              <td class="auto-style15">
                                  <asp:TextBox ID="CourseID_G" runat="server" Width="233px" MaxLength="14"></asp:TextBox>
                              </td>
                          </tr>
                           <tr>
                              <td class="auto-style9">Student ID:</td>
                              <td class="auto-style15">
                                  <asp:TextBox ID="StudentID_G" runat="server" Width="233px" MaxLength="14"></asp:TextBox>
                              </td>
                          </tr>
                          <tr>
                              <td class="auto-style9">Assignment Number:</td>
                              <td class="auto-style15">
                                  <asp:TextBox ID="AssignmentNumber_G" runat="server" Width="233px" MaxLength="16"></asp:TextBox>
                              </td>
                          </tr>
                           <tr>
                              <td class="auto-style9">Assignment Type:</td>
                              <td class="auto-style15">
                                  <asp:TextBox ID="AssignmentType_G" runat="server" Width="232px" MaxLength="10"></asp:TextBox>
                              </td>
                          </tr>   
                           <tr>
                              <td class="auto-style9">Assignment Grade:</td>
                              <td class="auto-style15">
                                  <asp:TextBox ID="AssignmentGrade_G" runat="server" Width="232px" MaxLength="16"></asp:TextBox>
                              </td>
                          </tr>   
                             <tr>
                              <td class="auto-style9">&nbsp;</td>
                              <td class="auto-style15">
                                  <asp:Button ID="gradeAssignment" runat="server" BorderStyle="Groove" OnClick="GradeAssignmentClick" Text="Grade" Width="200px" />
                              </td>
                          </tr>
                      </table>

                </asp:Panel>
            </div>

            </div>
    </form>
</body>
</html>
