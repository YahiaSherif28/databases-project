﻿using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.Configuration;
using System.Web.UI;
using System.Web.UI.WebControls;
using static GUCera.Util;
namespace GUCera
{
    public partial class Login : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["loginMsg"] != null)
            {
                loginMsg.Text = (String)Session["loginMsg"];
                Session["loginMsg"] = null;
            }
        }

        protected void login(object sender, EventArgs e)
        {
            string connStr = WebConfigurationManager.ConnectionStrings["GUCera"].ToString();
            //create a new connection
            SqlConnection conn = new SqlConnection(connStr);
            if (username.Text.Length == 0)
            {
                loginMsg.Text = "Invalid Information";
                return;
            }
            int id;
            try { 
                id = Int32.Parse(username.Text);                
            }
            catch (Exception)
            {
                loginMsg.Text = "ID must be a number";
                return;
            }
            String pass = password.Text;
            try
            {
                SqlCommand loginproc = new SqlCommand("userLogin", conn);
                loginproc.CommandType = CommandType.StoredProcedure;
                loginproc.Parameters.Add(new SqlParameter("@id", id));
                loginproc.Parameters.Add(new SqlParameter("@password", pass.Length == 0 ? (object)DBNull.Value : pass));

                SqlParameter success = loginproc.Parameters.Add("@success", SqlDbType.Int);
                SqlParameter type = loginproc.Parameters.Add("@type", SqlDbType.Int);

                success.Direction = ParameterDirection.Output;
                type.Direction = ParameterDirection.Output;

                conn.Open();
                loginproc.ExecuteNonQuery();
                conn.Close();
                if (success.Value.ToString() == "1")
                {
                    Session["user"] = id;
                    Session["type"] = type.Value.ToString();
                    if (type.Value.ToString() == "2") //Student
                        Response.Redirect("MyProfile.aspx");
                    else if (type.Value.ToString() == "1") //Admin
                        Response.Redirect("Admin.aspx");
                    else if (type.Value.ToString() == "0") //Instructor
                        Response.Redirect("InstructorProfile.aspx");
                }
                else
                {
                    loginMsg.Text = "Invalid Information";
                }
            }
            catch (Exception ee)
            {
                loginMsg.Text = "Please Enter Data Correctly";
                conn.Close();
                return;
            }

           
        }

      
    }
}