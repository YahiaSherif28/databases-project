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
    public partial class Home : System.Web.UI.Page
    {
        private static string connStr = WebConfigurationManager.ConnectionStrings["GUCera"].ToString();
        private static SqlConnection conn = new SqlConnection(connStr);
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["user"] == null || Convert.ToInt32(Session["type"]) != 2)
            {
                Session["loginMsg"] = "Login to Access Your Home Page";
                Response.Redirect("Login.aspx");

            }
        }

        protected void profileButton(object sender, EventArgs e)
        {
            Response.Redirect("MyProfile.aspx");
        }

        protected void myCoursesButton(object sender, EventArgs e)
        {
            Response.Redirect("MyCourses.aspx");
        }

        protected void addCoursesButton(object sender, EventArgs e)
        {
            Response.Redirect("AddCourse.aspx");
        }
    }
}