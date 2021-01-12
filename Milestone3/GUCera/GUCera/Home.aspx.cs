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
            if (Session["user"] == null)
            {
                Session["loginMsg"] = "Login to Access Your Home Page";
                Response.Redirect("Login.aspx");

            }
            if (Session["enrollMsg"] != null)
            {
                message.Text = (String)Session["enrollMsg"];
                Session["enrollMsg"] = null;
            }

            SqlCommand allcourses = new SqlCommand("availableCourses", conn);
            allcourses.CommandType = CommandType.StoredProcedure;
            conn.Open();
            SqlDataAdapter adapter = new SqlDataAdapter(allcourses);
            DataTable table = new DataTable();
            adapter.Fill(table);
            coursesList.DataSource = table;
            coursesList.DataBind();
            conn.Close();
        }

        protected void moreDetails_Click(object sender, EventArgs e)
        {
            int cid = Convert.ToInt32((sender as LinkButton).CommandArgument);
            chosenID.Text = cid.ToString();
            chosendiv.Visible = true;
        }
        protected void enroll_Click(object sender, EventArgs e)
        {
            int instid = Convert.ToInt32((sender as LinkButton).CommandArgument);
            int cid = Convert.ToInt32(chosenID.Text);
            int sid = (System.Int32)(Session["user"]);
            SqlCommand enrollInCourse = new SqlCommand("enrollInCourse", conn);
            enrollInCourse.CommandType = CommandType.StoredProcedure;
            enrollInCourse.Parameters.Add(new SqlParameter("@sid", sid));
            enrollInCourse.Parameters.Add(new SqlParameter("@cid", cid));
            enrollInCourse.Parameters.Add(new SqlParameter("@instr", instid));

            try
            {
                conn.Open();
                enrollInCourse.ExecuteNonQuery();
                conn.Close();
            }
            catch (Exception ee)
            {
                Response.Write(ee.Message);
                conn.Close();
                return;
            }
            Session["enrollMsg"] = "Enrolled in Course Successfully!";
            Response.Redirect(Request.RawUrl);
        }
    }
}