using System;
using System.Data;
using System.Data.SqlClient;
using System.Web.Configuration;
using System.Web.UI;
using System.Web.UI.WebControls;
using static GUCera.Util;

namespace GUCera
{
    public partial class ListAllCourses : Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["user"] == null)
            {
                Response.Redirect("Login.aspx");
            }
            if (!string.Equals(Session["type"].ToString(), LogInTypeAdmin))
            {
                Response.Redirect("Login.aspx");
            }
            string connStr = WebConfigurationManager.ConnectionStrings["GUCera"].ToString();
            SqlConnection conn = new SqlConnection(connStr);
            SqlCommand proc = new SqlCommand("AdminViewAllCourses", conn) {CommandType = CommandType.StoredProcedure};
            conn.Open();
            SqlDataReader reader = proc.ExecuteReader();
            string[] attributes = {"name", "creditHours", "price", "content", "accepted"};
            FillTable(coursesTable, reader, attributes);
            conn.Close();
        }
    }
    
}