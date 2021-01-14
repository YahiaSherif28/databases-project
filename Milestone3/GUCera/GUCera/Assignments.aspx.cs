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
    public partial class Assignments : System.Web.UI.Page
    {
        private static string connStr = WebConfigurationManager.ConnectionStrings["GUCera"].ToString();
        private static SqlConnection conn = new SqlConnection(connStr);
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["user"] == null || Convert.ToInt32(Session["type"]) != 2 || Session["cid"] == null)
            {
                Session["loginMsg"] = "Login to access my assignments page";
                Response.Redirect("Login.aspx");
                return;
            }

            int sid = Convert.ToInt32(Session["user"]);
            int id = Convert.ToInt32(Session["cid"]);
            string name = Convert.ToString(Session["user"]);

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

            rowF.BackColor = System.Drawing.ColorTranslator.FromHtml("#E3EAEB");
            AssignmentsTable.Controls.Add(rowF);

            conn.Open();
            SqlDataReader rdr = viewAssign.ExecuteReader(CommandBehavior.CloseConnection);
            while (rdr.Read())
            {
                String number, fullGrade, weight, type, content, deadline;

                number = Convert.ToString(rdr.GetInt32(rdr.GetOrdinal("number")));
                type = rdr.GetString(rdr.GetOrdinal("type"));

                if (rdr.IsDBNull(rdr.GetOrdinal("fullGrade")))
                {
                    fullGrade = "NULL";
                }
                else
                {
                    fullGrade = Convert.ToString(rdr.GetInt32(rdr.GetOrdinal("fullGrade")));
                }
                if (rdr.IsDBNull(rdr.GetOrdinal("weight")))
                {
                    weight = "NULL";
                }
                else
                {
                    weight = Convert.ToString((Double)Decimal.Parse(rdr["weight"].ToString()));
                }
                if (rdr.IsDBNull(rdr.GetOrdinal("deadline")))
                {
                    deadline = "NULL";
                }
                else
                {
                    deadline = Convert.ToString(rdr.GetDateTime(rdr.GetOrdinal("deadline")));
                }
                if (rdr.IsDBNull(rdr.GetOrdinal("content")))
                {
                    content = "NULL";
                }
                else
                {
                    content = rdr.GetString(rdr.GetOrdinal("content"));
                }
                
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
                btn1.Click += (s, EventArgs) => { submitAssignment(s, EventArgs, id, sid, Convert.ToInt32(number), type); };
                btn1.ForeColor = Color.Black;
                submitButton.Controls.Add(btn1);
                row.Cells.Add(submitButton);

                TableCell showGradeButton = new TableCell();
                Button btn2 = new Button();
                btn2.Text = "Show Assignment Grade";
                btn2.Click += (s, EventArgs) => { showGrade(s, EventArgs, id, sid, number, type); };
                btn2.ForeColor = Color.Black;
                showGradeButton.Controls.Add(btn2);
                row.Cells.Add(showGradeButton);

                row.BackColor = System.Drawing.ColorTranslator.FromHtml("#1C5E55");
                row.ForeColor = Color.White;
                AssignmentsTable.Controls.Add(row);
            }

            conn.Close();

            AssignmentsTable.ForeColor = System.Drawing.ColorTranslator.FromHtml("#333333");
            AssignmentsTable.CellPadding = 4;
            AssignmentsTable.HorizontalAlign = HorizontalAlign.Center;
            AssignmentsTable.Width = 500;
            AssignmentsTable.Height = 100;
            AssignmentsTable.CssClass = "auto-style3";
        }

        private void submitAssignment(object sender, EventArgs eventArgs, int cid, int sid, int number, string type)
        {
            SqlCommand submitAssign = new SqlCommand("submitAssign", conn);
            submitAssign.CommandType = CommandType.StoredProcedure;
            submitAssign.Parameters.Add(new SqlParameter("@assignType", type));
            submitAssign.Parameters.Add(new SqlParameter("@assignnumber", number));
            submitAssign.Parameters.Add(new SqlParameter("@sid", sid));
            submitAssign.Parameters.Add(new SqlParameter("@cid", cid));

            Label Message = new Label();
            
            try
            {
                conn.Open();
                submitAssign.ExecuteNonQuery();
                conn.Close();
            }
            catch (Exception e) {
                Message.Text = "Assignment Already Submitted";
                msgDiv.Controls.Add(Message);
                conn.Close();
                return;
            }

            Message.Text = "Assignment Submitted Successfully";
            msgDiv.Controls.Add(Message);
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

            Label Message = new Label();
            Message.Text = "Assignment Grade is " + grade.Value.ToString() + ".";
            msgDiv.Controls.Add(Message);
        }
        protected void logout_Click(object sender, EventArgs e)
        {
            Session["user"] = null;
            Response.Redirect("Login.aspx");
        }
    }
}