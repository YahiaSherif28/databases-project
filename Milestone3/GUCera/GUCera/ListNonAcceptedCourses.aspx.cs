using System;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web.Caching;
using System.Web.Configuration;
using System.Web.UI;
using System.Web.UI.WebControls;
using static GUCera.Util;
namespace GUCera
{
    public partial class ListNonAcceptedCourses : Page
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

            string adminId = Session["user"].ToString();
            string connStr = WebConfigurationManager.ConnectionStrings["GUCera"].ToString();
            SqlConnection conn = new SqlConnection(connStr);
            SqlCommand proc = new SqlCommand("AdminViewNonAcceptedCourses", conn) {CommandType = CommandType.StoredProcedure};
            conn.Open();
            SqlDataReader reader = proc.ExecuteReader();
            string[] attributes = {"id", "name", "creditHours", "price", "content"};
            FillTable(CoursesTable, reader, attributes);
            foreach (TableRow row in CoursesTable.Rows.Cast<TableRow>().Skip(1)) // skips header row
            {
                TableCell cell = new TableCell();
                Button acceptButton = new Button(){CommandArgument = adminId + "," + row.Cells[0].Text, Text = "Accept Course"};
                acceptButton.Command += AcceptButtonOnClick;
                cell.Controls.Add(acceptButton);
                row.Cells.Add(cell);
            }
            conn.Close();
        }

        private  void AcceptButtonOnClick(object sender, EventArgs e)
        {
            Button button = (Button) sender;
            string[] arguments = button.CommandArgument.Split(',');
            Int16 adminId = Int16.Parse(arguments[0]);
            Int16 acceptedCourseId = Int16.Parse(arguments[1]);
            string connStr = WebConfigurationManager.ConnectionStrings["GUCera"].ToString();
            SqlConnection conn = new SqlConnection(connStr);
            SqlCommand proc = new SqlCommand("AdminAcceptRejectCourse", conn) {CommandType = CommandType.StoredProcedure};
            proc.Parameters.Add(new SqlParameter("@adminid", adminId));
            proc.Parameters.Add(new SqlParameter("@courseId", acceptedCourseId));
            conn.Open();
            proc.ExecuteNonQuery();
            conn.Close();
            Response.Redirect(Request.RawUrl); // reload the page
        }

        
    }
    
    
}