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
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["user"] == null)
                Response.Redirect("Login.aspx");
        }

        protected void Add(object sender, EventArgs e)
        {
            string connStr = WebConfigurationManager.ConnectionStrings["GUCera"].ToString();
            //create a new connection
            SqlConnection conn = new SqlConnection(connStr);

            SqlCommand loginproc = new SqlCommand("addMobile", conn);
            loginproc.CommandType = CommandType.StoredProcedure;
            loginproc.Parameters.Add(new SqlParameter("@id", Int16.Parse(Session["user"] + "")));
            loginproc.Parameters.Add(new SqlParameter("@mobile_number", phonenumber.Text.Length == 0 ? (object)DBNull.Value : phonenumber.Text));

            conn.Open();
            try
            {
                loginproc.ExecuteNonQuery();
            }
            catch (SqlException ee) {
                Response.Write("Phone Number already exists");
                conn.Close();
                return;
            }
            conn.Close();

            Response.Write("Phone Added Successfully");
        }
    }
}