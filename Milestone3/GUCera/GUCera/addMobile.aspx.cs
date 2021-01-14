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

    public partial class addMobile : System.Web.UI.Page
    {
        private static string connStr = WebConfigurationManager.ConnectionStrings["GUCera"].ToString();
        private static SqlConnection conn = new SqlConnection(connStr);
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["user"] == null)
                Response.Redirect("Login.aspx");

            if (Session["mobileMsg"] != null)
            {
                mobileMsg.Text = (String)Session["mobileMsg"];
                mobileDiv.Visible = true;
                Session["mobileMsg"] = null;
            }
        }

        protected void addmobile_Click(object sender, EventArgs e)
        {

            int id = (System.Int32)(Session["user"]);
            String number = mobileNumber.Text;
            if (number.Length == 0)
            {
                mobileMsg.Text = "Please Enter a Valid number";
                return;
            }

           

            try
            {
                SqlCommand mobileproc = new SqlCommand("addMobile", conn);
                mobileproc.CommandType = CommandType.StoredProcedure;
                mobileproc.Parameters.Add(new SqlParameter("@id", id));
                mobileproc.Parameters.Add(new SqlParameter("@mobile_number", number));
                conn.Open();
                mobileproc.ExecuteNonQuery();
                conn.Close();
            }
            catch (Exception ee)
            {
                mobileMsg.Text = "Please Enter a Valid number";
                conn.Close();
                return;
            }
            Session["mobileMsg"] = "Mobile Number Added successfully!";
            Response.Redirect(Request.RawUrl);
        }

        protected void Back_Click(object sender, EventArgs e)
        {
            String type = Session["type"]+"";
            if (type == "2") //Student
                Response.Redirect("MyProfile.aspx");
            else if (type == "1") //Admin
                Response.Redirect("Admin.aspx");
            else if (type== "0") //Instructor
                Response.Redirect("InstructorProfile.aspx");
        }
    }
}