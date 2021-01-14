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
    public partial class InstructorRegister : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void register(object sender, EventArgs e)
        {
            string connStr = WebConfigurationManager.ConnectionStrings["GUCera"].ToString();
            //create a new connection
            SqlConnection conn = new SqlConnection(connStr);

          
            try
            {
                SqlCommand loginproc = new SqlCommand("studentRegister", conn);
                loginproc.CommandType = CommandType.StoredProcedure;


                loginproc.Parameters.Add(new SqlParameter("@first_name", firstname.Text.Length == 0 ? (object)DBNull.Value : firstname.Text));
                loginproc.Parameters.Add(new SqlParameter("@last_name", lastname.Text.Length == 0 ? (object)DBNull.Value : lastname.Text));
                loginproc.Parameters.Add(new SqlParameter("@password", password.Text.Length == 0 ? (object)DBNull.Value : password.Text));
                loginproc.Parameters.Add(new SqlParameter("@email", email.Text));
                loginproc.Parameters.Add(new SqlParameter("@gender", gender.SelectedItem == null ? (object)DBNull.Value : Int16.Parse(gender.SelectedItem.Value)));
                loginproc.Parameters.Add(new SqlParameter("@address", address.Text.Length == 0 ? (object)DBNull.Value : address.Text));


                conn.Open();
                Int32 result = -1;
                loginproc.ExecuteNonQuery();
                SqlCommand command = new SqlCommand("Select id from [Users] where email=@email", conn);
                command.Parameters.AddWithValue("@email", email.Text);
                result = (Int32)command.ExecuteScalar();
                conn.Close();
                InstructorRegisterMessage.Text = "Your ID is  " + result;
            }
            catch (SqlException ee)
            {
                InstructorRegisterMessage.Text = "Please enter valid information ";
                conn.Close();
                return;
            }
        
        }
    }
}