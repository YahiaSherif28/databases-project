using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.Configuration;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace GUCera
{
    public partial class MyCourses1 : System.Web.UI.Page
    {
        private static string connStr = WebConfigurationManager.ConnectionStrings["GUCera"].ToString();
        private static SqlConnection conn = new SqlConnection(connStr);
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["user"] == null || Convert.ToInt32(Session["type"]) != 2)
            {
                Session["loginMsg"] = "Login to access my courses page";
                Response.Redirect("Login.aspx");
                return;
            }
            assignDiv.Visible = false;
            feedbackDiv.Visible = false;
            certDiv.Visible = false;
            int sid = Convert.ToInt32(Session["user"]);

            SqlCommand viewCourses = new SqlCommand("allStudentCourses", conn);
            viewCourses.CommandType = CommandType.StoredProcedure;
            viewCourses.Parameters.Add(new SqlParameter("@sid", sid));

            TableRow rowF = new TableRow();
            TableCell cellIDF = new TableCell();
            TableCell cellNameF = new TableCell();
            cellIDF.Text = "CourseID";
            cellNameF.Text = "CourseName";
            rowF.Cells.Add(cellIDF);
            rowF.Cells.Add(cellNameF);
            rowF.Cells.Add(new TableCell());
            rowF.Cells.Add(new TableCell());
            rowF.Cells.Add(new TableCell());
            Courses.Controls.Add(rowF);

            conn.Open();
            SqlDataReader rdr = viewCourses.ExecuteReader(CommandBehavior.CloseConnection);
            while (rdr.Read())
            {
                int id = rdr.GetInt32(rdr.GetOrdinal("id"));
                String name = rdr.GetString(rdr.GetOrdinal("name"));
                TableRow row = new TableRow();
                TableCell cellID = new TableCell();
                TableCell cellName = new TableCell();
                cellID.Text = Convert.ToString(id);
                cellName.Text = name;
                row.Cells.Add(cellID);
                row.Cells.Add(cellName);

                TableCell cellButton1 = new TableCell();
                Button btn1 = new Button();
                btn1.Text = "View Assignments";
                btn1.Click += (s, EventArgs) => { viewAssignBtn(s, EventArgs, id, name); };
                cellButton1.Controls.Add(btn1);
                row.Cells.Add(cellButton1);

                TableCell cellButton2 = new TableCell();
                Button btn2 = new Button();
                btn2.Text = "Add Feedback";
                btn2.Click += (s, EventArgs) => { addFeedbackBtn(s, EventArgs, id, name); };
                cellButton2.Controls.Add(btn2);
                row.Cells.Add(cellButton2);

                TableCell cellButton3 = new TableCell();
                Button btn3 = new Button();
                btn3.Text = "List Certificate";
                btn3.Click += (s, EventArgs) => { listCertBtn(s, EventArgs, id, name); };
                cellButton3.Controls.Add(btn3);
                row.Cells.Add(cellButton3);

                Courses.Controls.Add(row);
            }
            conn.Close();
        }

        private void listCertBtn(object sender, EventArgs e, int id, String name)
        {
            if (certDiv.Visible == true)
            {
                certDiv.Visible = false;
            }
            else
            {
                Message.Visible = false;
                certDiv.Visible = true;
                int sid = Convert.ToInt32(Session["user"]);
                SqlCommand viewCertificate = new SqlCommand("viewCertificate", conn);
                viewCertificate.CommandType = CommandType.StoredProcedure;
                viewCertificate.Parameters.Add(new SqlParameter("@cid", id));
                viewCertificate.Parameters.Add(new SqlParameter("@sid", sid));


                TableRow rowF = new TableRow();
                TableCell cellSIDF = new TableCell();
                TableCell cellCIDF = new TableCell();
                TableCell cellCNameF = new TableCell();
                TableCell cellIssueDateF = new TableCell();
                cellSIDF.Text = "StudentID";
                cellCIDF.Text = "CourseID";
                cellCNameF.Text = "CourseName";
                cellIssueDateF.Text = "IssueDate";
                rowF.Cells.Add(cellSIDF);
                rowF.Cells.Add(cellCIDF);
                rowF.Cells.Add(cellCNameF);
                rowF.Cells.Add(cellIssueDateF);
                Certs.Controls.Add(rowF);

                conn.Open();
                SqlDataReader rdr = viewCertificate.ExecuteReader(CommandBehavior.CloseConnection);
                while (rdr.Read())
                {
                    DateTime date = rdr.GetDateTime(rdr.GetOrdinal("issueDate"));
                    TableCell cellSID = new TableCell();
                    TableCell cellCID = new TableCell();
                    TableCell cellCName = new TableCell();
                    TableCell cellIssueDate = new TableCell();
                    cellSID.Text = Convert.ToString(sid);
                    cellCID.Text = Convert.ToString(id);
                    cellCName.Text = name;
                    cellIssueDate.Text = Convert.ToString(date);

                    TableRow row = new TableRow();
                    row.Cells.Add(cellSID);
                    row.Cells.Add(cellCID);
                    row.Cells.Add(cellCName);
                    row.Cells.Add(cellIssueDate);
                    Certs.Controls.Add(row);
                }

                conn.Close();
            }
        }

        private void addFeedbackBtn(object sender, EventArgs e, int id, String name)
        {
            if (feedbackDiv.Visible == true)
            {
                feedbackDiv.Visible = false;
            }
            else
            {
                Message.Visible = false;
                TextBox2.Text = "";
                feedbackDiv.Visible = true;
                Label2.Text = "Add feedback for " + name;
                courseID.Text = Convert.ToString(id);
                courseID.Visible = false;
            }
        }

        protected void addFeedback(object sender, EventArgs e)
        {
            int sid = Convert.ToInt32(Session["user"]);
            int cid = Convert.ToInt32(courseID.Text);
            String comment = TextBox2.Text;
            SqlCommand addFeedback = new SqlCommand("addFeedback", conn);
            addFeedback.CommandType = CommandType.StoredProcedure;
            addFeedback.Parameters.Add(new SqlParameter("@comment", comment));
            addFeedback.Parameters.Add(new SqlParameter("@cid", cid));
            addFeedback.Parameters.Add(new SqlParameter("@sid", sid));

            try {
            conn.Open();
            addFeedback.ExecuteNonQuery();
            conn.Close();
            } catch(Exception ee) {
                conn.Close();
                Message.Text = "This Same Feedback Already Exists";
                Message.Visible = true;
                return;
            }
            Message.Text = "Feedback Added Successfully";
            Message.Visible = true;
        }
        protected void logout_Click(object sender, EventArgs e)
        {
            Session["user"] = null;
            Response.Redirect("Login.aspx");
        }
        private void viewAssignBtn(object sender, EventArgs e, int id, String name)
        {
            if (assignDiv.Visible == true)
            {
                assignDiv.Visible = false;
            }
            else
            {
                Message.Visible = false;
                assignDiv.Visible = true;

                int sid = Convert.ToInt32(Session["user"]);
                SqlCommand viewAssign = new SqlCommand("viewAssign", conn);
                viewAssign.CommandType = CommandType.StoredProcedure;
                viewAssign.Parameters.Add(new SqlParameter("@courseId", id));
                viewAssign.Parameters.Add(new SqlParameter("@Sid", sid));

                TableRow rowF = new TableRow();
                TableCell cellSIDF = new TableCell();
                TableCell cellCIDF = new TableCell();
                TableCell cellNumberF = new TableCell();
                TableCell cellTypeF = new TableCell();
                TableCell cellFullGradeF = new TableCell();
                TableCell cellWeightF = new TableCell();
                TableCell cellDeadlineF = new TableCell();
                TableCell cellContentF = new TableCell();
                cellSIDF.Text = "StudentID";
                cellCIDF.Text = "CourseID";
                cellNumberF.Text = "Number";
                cellTypeF.Text = "Type";
                cellFullGradeF.Text = "Full Grade";
                cellWeightF.Text = "Weight";
                cellDeadlineF.Text = "Deadline";
                cellContentF.Text = "Content";
                rowF.Cells.Add(cellSIDF);
                rowF.Cells.Add(cellCIDF);
                rowF.Cells.Add(cellNumberF);
                rowF.Cells.Add(cellTypeF);
                rowF.Cells.Add(cellFullGradeF);
                rowF.Cells.Add(cellWeightF);
                rowF.Cells.Add(cellDeadlineF);
                rowF.Cells.Add(cellContentF);
                rowF.Cells.Add(new TableCell());
                rowF.Cells.Add(new TableCell());
                Assignments.Controls.Add(rowF);

                conn.Open();
                SqlDataReader rdr = viewAssign.ExecuteReader(CommandBehavior.CloseConnection);
                while (rdr.Read())
                {
                    if (!rdr.IsDBNull(rdr.GetOrdinal("number")))
                    {
                        
                    }
                    int number = rdr.GetInt32(rdr.GetOrdinal("number"));
                    String type = rdr.GetString(rdr.GetOrdinal("type"));
                    int fullGrade = rdr.GetInt32(rdr.GetOrdinal("fullGrade"));
                    Double weight = (Double)Decimal.Parse(rdr["weight"].ToString());
                    DateTime deadline = rdr.GetDateTime(rdr.GetOrdinal("deadline"));
                    String content = rdr.GetString(rdr.GetOrdinal("content"));

                    TableRow row = new TableRow();
                    TableCell cellSID = new TableCell();
                    TableCell cellCID = new TableCell();
                    TableCell cellNumber = new TableCell();
                    TableCell cellType = new TableCell();
                    TableCell cellFullGrade = new TableCell();
                    TableCell cellWeight = new TableCell();
                    TableCell cellDeadline = new TableCell();
                    TableCell cellContent = new TableCell();

                    cellSID.Text = Convert.ToString(sid);
                    cellCID.Text = Convert.ToString(id);
                    cellNumber.Text = Convert.ToString(number);
                    cellType.Text = Convert.ToString(type);
                    cellFullGrade.Text = Convert.ToString(fullGrade);
                    cellWeight.Text = Convert.ToString(weight);
                    cellDeadline.Text = Convert.ToString(deadline);
                    cellContent.Text = Convert.ToString(content);

                    row.Cells.Add(cellSID);
                    row.Cells.Add(cellCID);
                    row.Cells.Add(cellNumber);
                    row.Cells.Add(cellType);
                    row.Cells.Add(cellFullGrade);
                    row.Cells.Add(cellWeight);
                    row.Cells.Add(cellDeadline);
                    row.Cells.Add(cellContent);

                    TableCell submitButton = new TableCell();
                    Button btn1 = new Button();
                    btn1.Text = "Submit Assignment";
                    btn1.Click += (s, EventArgs) => { submitAssignment(s, EventArgs, id, sid, number, type); };
                    //btn1.CausesValidation = false;
                    submitButton.Controls.Add(btn1);
                    row.Cells.Add(submitButton);

                    TableCell showGradeButton = new TableCell();
                    Button btn2 = new Button();
                    btn2.Text = "Show Assignment Grade";
                    btn2.Click += (s, EventArgs) => { showGrade(s, EventArgs, id, sid, number, type); };
                    //btn2.CausesValidation = false;
                    showGradeButton.Controls.Add(btn2);
                    row.Cells.Add(showGradeButton);

                    Assignments.Controls.Add(row);
                }

                conn.Close();
            }
        }

        private void submitAssignment(object sender, EventArgs eventArgs, int cid, int sid, int number, string type)
        {
            Response.Write("hi");
            SqlCommand submitAssign = new SqlCommand("submitAssign", conn);
            submitAssign.CommandType = CommandType.StoredProcedure;
            submitAssign.Parameters.Add(new SqlParameter("@assignType", type));
            submitAssign.Parameters.Add(new SqlParameter("@assignnumber", number));
            submitAssign.Parameters.Add(new SqlParameter("@sid", sid));
            submitAssign.Parameters.Add(new SqlParameter("@cid", cid));

            conn.Open();
            submitAssign.ExecuteNonQuery();
            conn.Close();

            Message.Text = "Assignment Submitted Successfully";
            Message.Visible = true;
        }
        private void showGrade(object sender, EventArgs eventArgs, int cid, int sid, object number, string type)
        {
            SqlCommand viewAssignGrades = new SqlCommand("viewAssignGrades", conn);
            viewAssignGrades.CommandType = CommandType.StoredProcedure;
            viewAssignGrades.Parameters.Add(new SqlParameter("@assignType", type));
            viewAssignGrades.Parameters.Add(new SqlParameter("@assignnumber", number));
            viewAssignGrades.Parameters.Add(new SqlParameter("@sid", sid));
            viewAssignGrades.Parameters.Add(new SqlParameter("@cid", cid));

            SqlParameter grade = viewAssignGrades.Parameters.Add("@assignGrade", SqlDbType.Int);
            grade.Direction = ParameterDirection.Output;

            conn.Open();
            viewAssignGrades.ExecuteNonQuery();
            conn.Close();

            Message.Text = "Assignment Grade is " + grade.Value.ToString();
            Message.Visible = true;
        }
    }
}