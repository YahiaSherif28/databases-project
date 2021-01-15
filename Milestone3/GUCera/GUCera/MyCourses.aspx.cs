using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.Configuration;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Drawing;

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

            rowF.BackColor = System.Drawing.ColorTranslator.FromHtml("#E3EAEB");
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
                btn1.ForeColor = Color.Black;
                cellButton1.Controls.Add(btn1);
                row.Cells.Add(cellButton1);

                TableCell cellButton2 = new TableCell();
                Button btn2 = new Button();
                btn2.Text = "Add Feedback";
                btn2.Click += (s, EventArgs) => { addFeedbackBtn(s, EventArgs, id, name); };
                btn2.ForeColor = Color.Black;
                cellButton2.Controls.Add(btn2);
                row.Cells.Add(cellButton2);

                TableCell cellButton3 = new TableCell();
                Button btn3 = new Button();
                btn3.Text = "List Certificate";
                btn3.Click += (s, EventArgs) => { listCertBtn(s, EventArgs, id, name); };
                btn3.ForeColor = Color.Black;
                cellButton3.Controls.Add(btn3);
                row.Cells.Add(cellButton3);

                row.BackColor = System.Drawing.ColorTranslator.FromHtml("#1C5E55");
                row.ForeColor = Color.White;
                Courses.Controls.Add(row);
            }
            conn.Close();

            Courses.ForeColor = System.Drawing.ColorTranslator.FromHtml("#333333");
            Courses.CellPadding = 4;
            Courses.HorizontalAlign = HorizontalAlign.Center;
            Courses.Width = 500;
            Courses.Height = 100;
            Courses.CssClass = "auto-style3";

        }

        private void viewAssignBtn(object s, EventArgs eventArgs, int id, string name)
        {
            int sid = Convert.ToInt32(Session["user"]);
            Session["cid"] = id;
            Session["name"] = name;
            Response.Redirect("Assignments.aspx");
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

                rowF.BackColor = System.Drawing.ColorTranslator.FromHtml("#E3EAEB");
                Certs.Controls.Add(rowF);

                conn.Open();
                SqlDataReader rdr = viewCertificate.ExecuteReader(CommandBehavior.CloseConnection);
                while (rdr.Read())
                {
                    String date;
                    if (rdr.IsDBNull(rdr.GetOrdinal("IssueDate")))
                    {
                        date = "NULL";
                    }
                    else
                    {
                        date = Convert.ToString(rdr.GetDateTime(rdr.GetOrdinal("issueDate")));
                    }

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

                    row.BackColor = System.Drawing.ColorTranslator.FromHtml("#1C5E55");
                    row.ForeColor = Color.White;
                    Certs.Controls.Add(row);
                }

                conn.Close();

                Certs.ForeColor = System.Drawing.ColorTranslator.FromHtml("#333333");
                Certs.CellPadding = 4;
                Certs.HorizontalAlign = HorizontalAlign.Center;
                Certs.Width = 500;
                Certs.Height = 100;
                Certs.CssClass = "auto-style3";
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

            try
            {
                conn.Open();
                addFeedback.ExecuteNonQuery();
                conn.Close();
            }
            catch (Exception ee)
            {
                Message.Text = "This Same Feedback Already Exists";
                Message.Visible = true;
                conn.Close();
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
    }
}
