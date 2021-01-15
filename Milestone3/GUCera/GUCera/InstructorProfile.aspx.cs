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
    public partial class InstructorProfile : System.Web.UI.Page
    {
        private static string connStr = WebConfigurationManager.ConnectionStrings["GUCera"].ToString();
        private static SqlConnection conn = new SqlConnection(connStr);
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["user"] == null || Convert.ToInt32(Session["type"]) != 0)
            {
                Session["loginMsg"] = "Login to access your profile";
                Response.Redirect("Login.aspx");

            }
            if (Session["AddCourseMessage"] != null)
            {
                AddCourseMessage.Text = (String)Session["AddCourseMessage"];
                addCourseDiv.Visible = true;
                Session["AddCourseMessage"] = null;
            }
            if (Session["DefineAssignmentMessage"] != null)
            {
                DefineAssignmentMessage.Text = (String)Session["DefineAssignmentMessage"];
                defineAssignment.Visible = true;
                Session["DefineAssignmentMessage"] = null;
            }
            if (Session["GradeAssignmentMessage"] != null)
            {
                GradeAssignmentMessage.Text = (String)Session["GradeAssignmentMessage"];
                gradeAssignments.Visible = true;
                Session["GradeAssignmentMessage"] = null;
            }
            if (Session["IssueCertificateMessage"] != null)
            {
                IssueCertificateMessage.Text = (String)Session["IssueCertificateMessage"];
                issueCertificate.Visible = true;
                Session["IssueCertificateMessage"] = null;
            }
            
        }

        protected void AddCourseLinkButton_Click(object sender, EventArgs e)
        {
            addCourseDiv.Visible = !addCourseDiv.Visible;
            AddCourseMessage.Text = null;
        }

        protected void DefineAssignmentLinkButton_Click(object sender, EventArgs e)
        {
            defineAssignment.Visible = !defineAssignment.Visible;
            DefineAssignmentMessage.Text = null;
        }

        protected void ViewAssignmentLinkButton_Click(object sender, EventArgs e)
        {
            viewAssignmentsDiv.Visible = !viewAssignmentsDiv.Visible; ;

        }

        protected void GradeAssignmentLinkButton_Click(object sender, EventArgs e)
        {
            gradeAssignments.Visible = !gradeAssignments.Visible;
            GradeAssignmentMessage.Text = null;
        }

        protected void ViewFeedBackButton_Click(object sender, EventArgs e)
        {
            feedbackDiv.Visible = !feedbackDiv.Visible;

        }

        protected void IssueCertificate_Click(object sender, EventArgs e)
        {
            issueCertificate.Visible = !issueCertificate.Visible;
            IssueCertificateMessage.Text = null;
        }
        protected void AddCourseClick(object sender, EventArgs e)
        {
            int id = (System.Int32)(Session["user"]);
            if (credithours.Text.Length == 0 || cname.Text.Length == 0 || price.Text.Length == 0)
            {
                AddCourseMessage.Text = "Please Enter Data Correctly";
                return;
            }
          
            try
            {
                SqlCommand editproc = new SqlCommand("InstAddCourse", conn);
                editproc.CommandType = CommandType.StoredProcedure;
                editproc.Parameters.Add(new SqlParameter("@creditHours", credithours.Text.Length == 0 ? (object)DBNull.Value : Int16.Parse(credithours.Text)));
                editproc.Parameters.Add(new SqlParameter("@name", cname.Text.Length == 0 ? (object)DBNull.Value : cname.Text));
                editproc.Parameters.Add(new SqlParameter("@price", price.Text.Length == 0 ? (object)DBNull.Value : double.Parse(price.Text)));
                editproc.Parameters.Add(new SqlParameter("@instructorId", id));
                conn.Open();
                editproc.ExecuteNonQuery();
                conn.Close();
            }
            catch (Exception ee)
            {
                AddCourseMessage.Text = "Please Enter Data Correctly";
                conn.Close();
                return;
            }
            Session["AddCourseMessage"] = "Course added successfully!";
            Response.Redirect(Request.RawUrl);
        }

        protected void DefineAssignmentClick(object sender, EventArgs e)
        {
            int id = (System.Int32)(Session["user"]);
            if (CourseID.Text.Length == 0 || AssignmentNumber.Text.Length == 0 || AssignmentType.Text.Length == 0 || AssignmentfullGrade.Text.Length == 0 || AssignmentWeight.Text.Length == 0 || DeadLine.Text.Length == 0 || Content.Text.Length==0)
            {
                DefineAssignmentMessage.Text = "Please Enter Data Correctly";
                return;
            }

            try
            {

                SqlCommand editproc = new SqlCommand("DefineAssignmentOfCourseOfCertianType", conn);
                editproc.CommandType = CommandType.StoredProcedure;
                editproc.Parameters.Add(new SqlParameter("@instId", id));
                editproc.Parameters.Add(new SqlParameter("@cid", CourseID.Text.Length == 0 ? (object)DBNull.Value : Int16.Parse(CourseID.Text)));
                editproc.Parameters.Add(new SqlParameter("@number", AssignmentNumber.Text.Length == 0 ? (object)DBNull.Value : Int16.Parse(AssignmentNumber.Text)));
                editproc.Parameters.Add(new SqlParameter("@type", AssignmentType.Text.Length == 0 ? (object)DBNull.Value : AssignmentType.Text));
                editproc.Parameters.Add(new SqlParameter("@fullGrade", AssignmentfullGrade.Text.Length == 0 ? (object)DBNull.Value : Int16.Parse(AssignmentfullGrade.Text)));
                editproc.Parameters.Add(new SqlParameter("@weight", AssignmentWeight.Text.Length == 0 ? (object)DBNull.Value : double.Parse(AssignmentWeight.Text)));
                editproc.Parameters.Add(new SqlParameter("@deadline", DeadLine.Text.Length == 0 ? (object)DBNull.Value : Convert.ToDateTime(DeadLine.Text)));
                editproc.Parameters.Add(new SqlParameter("@content", Content.Text.Length == 0 ? (object)DBNull.Value : Content.Text));
                conn.Open();
                editproc.ExecuteNonQuery();
                conn.Close();
            }
            catch (Exception ee)
            {
                DefineAssignmentMessage.Text = "Please Enter Data Correctly";
                conn.Close();
                return;
            }
            Session["DefineAssignmentMessage"] = "Assignment defined successfully!";
            Response.Redirect(Request.RawUrl);
        }

        protected void GradeAssignmentClick(object sender, EventArgs e)
        {
            int id = (System.Int32)(Session["user"]);

            if (StudentID_G.Text.Length == 0 || CourseID_G.Text.Length == 0 || AssignmentNumber_G.Text.Length == 0 || AssignmentType_G.Text.Length == 0 || AssignmentGrade_G.Text.Length == 0)
            {
                GradeAssignmentMessage.Text = "Please Enter Data Correctly";
                return;
            }
          
            try
            {
                SqlCommand editproc = new SqlCommand("InstructorgradeAssignmentOfAStudent", conn);
                editproc.CommandType = CommandType.StoredProcedure;
                editproc.Parameters.Add(new SqlParameter("@instrId", id));
                editproc.Parameters.Add(new SqlParameter("@sid", StudentID_G.Text.Length == 0 ? (object)DBNull.Value : Int16.Parse(StudentID_G.Text)));
                editproc.Parameters.Add(new SqlParameter("@cid", CourseID_G.Text.Length == 0 ? (object)DBNull.Value : Int16.Parse(CourseID_G.Text)));
                editproc.Parameters.Add(new SqlParameter("@assignmentNumber", AssignmentNumber_G.Text.Length == 0 ? (object)DBNull.Value : Int16.Parse(AssignmentNumber_G.Text)));
                editproc.Parameters.Add(new SqlParameter("@type", AssignmentType_G.Text.Length == 0 ? (object)DBNull.Value : AssignmentType_G.Text));
                editproc.Parameters.Add(new SqlParameter("@grade", AssignmentGrade_G.Text.Length == 0 ? (object)DBNull.Value : double.Parse(AssignmentGrade_G.Text)));
                conn.Open();
                editproc.ExecuteNonQuery();
                conn.Close();
            }
            catch (Exception ee)
            {
                GradeAssignmentMessage.Text = "Please Enter Data Correctly";
                conn.Close();
                return;
            }
            Session["GradeAssignmentMessage"] = "Assignment graded successfully!";
            Response.Redirect(Request.RawUrl);
        
        }

        protected void IssueCertificateClick(object sender, EventArgs e)
        {
            int id = (System.Int32)(Session["user"]);

            if (CoursID_C.Text.Length == 0 || StudentID_C.Text.Length == 0 )
            {
                IssueCertificateMessage.Text = "Please Enter Data Correctly";
                return;
            }
            
            

            try
            {
                SqlCommand editproc = new SqlCommand("InstructorIssueCertificateToStudent", conn);
                editproc.CommandType = CommandType.StoredProcedure;
                editproc.Parameters.Add(new SqlParameter("@cid", CoursID_C.Text.Length == 0 ? (object)DBNull.Value : Int16.Parse(CoursID_C.Text)));
                editproc.Parameters.Add(new SqlParameter("@sid", StudentID_C.Text.Length == 0 ? (object)DBNull.Value : Int16.Parse(StudentID_C.Text)));
                editproc.Parameters.Add(new SqlParameter("@insId", id));
                editproc.Parameters.Add(new SqlParameter("@issueDate", DateTime.Today));
                conn.Open();
                editproc.ExecuteNonQuery();
                conn.Close();
            }
            catch (Exception ee)
            {
                IssueCertificateMessage.Text = "Please Enter Data Correctly";
                conn.Close();
                return;
            }
            Session["IssueCertificateMessage"] = "Certificate issued successfully!";
            Response.Redirect(Request.RawUrl);
        }

        protected void addMobile(object sender, EventArgs e)
        {
            Response.Redirect("addMobile.aspx");
        }

        protected void logout_Click(object sender, EventArgs e)
        {
            Session["user"] = null;
            Response.Redirect("Login.aspx");
        }

        protected void addMoreDetailsClick(object sender, EventArgs e)
        {
            Response.Redirect("InstructorCourses.aspx");
        }
    }
}