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
    public partial class InstructorCourses : System.Web.UI.Page
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
            if (Session["DefineCoursePrerequisitesMessage"] != null)
            {
                DefineCoursePrerequisitesMessage.Text = (String)Session["DefineCoursePrerequisitesMessage"];
                DefineCoursePrerequisites.Visible = true;
                Session["DefineCoursePrerequisitesMessage"] = null;
            }
            if (Session["UpdateCourseContentMessage"] != null)
            {
                UpdateCourseContentMessage.Text = (String)Session["UpdateCourseContentMessage"];
                UpdateCourseContent.Visible = true;
                Session["UpdateCourseContentMessage"] = null;
            }
            if (Session["UpdateCourseDescriptionMessage"] != null)
            {
                UpdateCourseDescriptionMessage.Text = (String)Session["UpdateCourseDescriptionMessage"];
                UpdateCourseDescription.Visible = true;
                Session["UpdateCourseDescriptionMessage"] = null;
            }
            if (Session["AddAnotherInstructorToCourseMessage"] != null)
            {
                AddAnotherInstructorToCourseMessage.Text = (String)Session["AddAnotherInstructorToCourseMessage"];
                AddAnotherInstructorToCourse.Visible = true;
                Session["AddAnotherInstructorToCourseMessage"] = null;
            }

        }

        protected void DefineCoursePrerequisitesLinkButton_Click(object sender, EventArgs e)
        {
            DefineCoursePrerequisites.Visible = !DefineCoursePrerequisites.Visible;
            DefineCoursePrerequisitesMessage.Text = null;
        }

        protected void UpdateCourseContentLinkButton_Click(object sender, EventArgs e)
        {
            UpdateCourseContent.Visible = !UpdateCourseContent.Visible;
            UpdateCourseContentMessage.Text = null;
        }

    
        protected void UpdateCourseDescriptionLinkButton_Click(object sender, EventArgs e)
        {
            UpdateCourseDescription.Visible = !UpdateCourseDescription.Visible;
            UpdateCourseDescriptionMessage.Text = null;
        }

    
        protected void AddAnotherInstructorToCourseLinkButton_Click(object sender, EventArgs e)
        {
            AddAnotherInstructorToCourse.Visible = !AddAnotherInstructorToCourse.Visible;
            AddAnotherInstructorToCourseMessage.Text = null;
        }


        protected void DefineCoursePrerequisitesClick(object sender, EventArgs e)
        {
            int id = (System.Int32)(Session["user"]);
            if (cid_P.Text.Length == 0 || prerequsiteId.Text.Length == 0 )
            {
                DefineCoursePrerequisitesMessage.Text = "Please Enter Data Correctly";
                return;
            }

            try
            {
                SqlCommand editproc = new SqlCommand("DefineCoursePrerequisites", conn);
                editproc.CommandType = CommandType.StoredProcedure;
                editproc.Parameters.Add(new SqlParameter("@cid", cid_P.Text.Length == 0 ? (object)DBNull.Value : Int16.Parse(cid_P.Text)));
                editproc.Parameters.Add(new SqlParameter("@prerequsiteId", prerequsiteId.Text.Length == 0 ? (object)DBNull.Value : Int16.Parse(prerequsiteId.Text)));
                conn.Open();
                editproc.ExecuteNonQuery();
                conn.Close();
            }
            catch (Exception ee)
            {
                DefineCoursePrerequisitesMessage.Text = "Please Enter Data Correctly";
                conn.Close();
                return;
            }
            Session["DefineCoursePrerequisitesMessage"] = "Prerequisite added successfully!";
            Response.Redirect(Request.RawUrl);
        }

        protected void UpdateCourseContentClick(object sender, EventArgs e)
        {
            int id = (System.Int32)(Session["user"]);
            if (cid_c.Text.Length == 0 || content.Text.Length == 0 )
            {
                UpdateCourseContentMessage.Text = "Please Enter Data Correctly";
                return;
            }

            try
            {

                SqlCommand editproc = new SqlCommand("UpdateCourseContent", conn);
                editproc.CommandType = CommandType.StoredProcedure;
                editproc.Parameters.Add(new SqlParameter("@instrId", id));
                editproc.Parameters.Add(new SqlParameter("@courseId", cid_c.Text.Length == 0 ? (object)DBNull.Value : Int16.Parse(cid_c.Text)));
                editproc.Parameters.Add(new SqlParameter("@content", content.Text.Length == 0 ? (object)DBNull.Value : content.Text));
                conn.Open();
                editproc.ExecuteNonQuery();
                conn.Close();
            }
            catch (Exception ee)
            {
                UpdateCourseContentMessage.Text = "Please Enter Data Correctly";
                conn.Close();
                return;
            }
            Session["UpdateCourseContentMessage"] = "Content Updated successfully!";
            Response.Redirect(Request.RawUrl);
        }

        protected void UpdateCourseDescriptionClick(object sender, EventArgs e)
        {
            int id = (System.Int32)(Session["user"]);

            if (cid_D.Text.Length == 0 || courseDescription.Text.Length == 0 )
            {
                UpdateCourseDescriptionMessage.Text = "Please Enter Data Correctly";
                return;
            }

            try
            {
                SqlCommand editproc = new SqlCommand("UpdateCourseDescription", conn);
                editproc.CommandType = CommandType.StoredProcedure;
                editproc.Parameters.Add(new SqlParameter("@instrId", id));
                editproc.Parameters.Add(new SqlParameter("@courseId", cid_D.Text.Length == 0 ? (object)DBNull.Value : Int16.Parse(cid_D.Text)));
                editproc.Parameters.Add(new SqlParameter("@courseDescription", courseDescription.Text.Length == 0 ? (object)DBNull.Value : courseDescription.Text));
                conn.Open();
                editproc.ExecuteNonQuery();
                conn.Close();
            }
            catch (Exception ee)
            {
                UpdateCourseDescriptionMessage.Text = "Please Enter Data Correctly";
                conn.Close();
                return;
            }
            Session["UpdateCourseDescriptionMessage"] = "Description Updated successfully!";
            Response.Redirect(Request.RawUrl);

        }

        protected void AddAnotherInstructorToCourseClick(object sender, EventArgs e)
        {
            int id = (System.Int32)(Session["user"]);

            if (cid_I.Text.Length == 0 || insid.Text.Length == 0)
            {
                AddAnotherInstructorToCourseMessage.Text = "Please Enter Data Correctly";
                return;
            }



            try
            {
                SqlCommand editproc = new SqlCommand("AddAnotherInstructorToCourse", conn);
                editproc.CommandType = CommandType.StoredProcedure;
                editproc.Parameters.Add(new SqlParameter("@adderIns", id));
                editproc.Parameters.Add(new SqlParameter("@cid", cid_I.Text.Length == 0 ? (object)DBNull.Value : Int16.Parse(cid_I.Text)));
                editproc.Parameters.Add(new SqlParameter("@insid", insid.Text.Length == 0 ? (object)DBNull.Value : Int16.Parse(insid.Text)));

                conn.Open();
                editproc.ExecuteNonQuery();
                conn.Close();
            }
            catch (Exception ee)
            {
                AddAnotherInstructorToCourseMessage.Text = "Please Enter Data Correctly";
                conn.Close();
                return;
            }
            Session["AddAnotherInstructorToCourseMessage"] = "Instructor Added successfully!";
            Response.Redirect(Request.RawUrl);
        }

     

        protected void logout_Click(object sender, EventArgs e)
        {
            Session["user"] = null;
            Response.Redirect("Login.aspx");
        }

        protected void Back_Click(object sender, EventArgs e)
        {
            String type = Session["type"] + "";
            if (type == "2") //Student
                Response.Redirect("MyProfile.aspx");
            else if (type == "1") //Admin
                Response.Redirect("Admin.aspx");
            else if (type == "0") //Instructor
                Response.Redirect("InstructorProfile.aspx");
        }
    }
}