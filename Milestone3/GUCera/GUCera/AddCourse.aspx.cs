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
    public partial class AddCourse : System.Web.UI.Page
    {
        private static string connStr = WebConfigurationManager.ConnectionStrings["GUCera"].ToString();
        private static SqlConnection conn = new SqlConnection(connStr);
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["user"] == null || Convert.ToInt32(Session["type"]) != 2)
            {
                Session["loginMsg"] = "Login to Acess Add Course Page";
                Response.Redirect("Login.aspx");

            }
            if (Session["enrollMsg"] != null)
            {
                message.Text = (String)Session["enrollMsg"];
                Session["enrollMsg"] = null;
            }          
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