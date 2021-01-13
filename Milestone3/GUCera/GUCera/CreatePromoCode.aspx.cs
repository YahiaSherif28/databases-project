using System;
using System.Data;
using System.Data.SqlClient;
using System.Web.Configuration;
using System.Web.UI;
using static GUCera.Util;

namespace GUCera
{
    public partial class CreatePromoCode : Page
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
        }

        protected void CreatePromocodeOnClick(object sender, EventArgs e)
        {
            
            string connStr = WebConfigurationManager.ConnectionStrings["GUCera"].ToString();
            SqlConnection conn = new SqlConnection(connStr);

            try
            {
                string codeValue = code.Text;
                DateTime expiryDateValue = Convert.ToDateTime(expiryDate.Text);
                DateTime issueDateValue = DateTime.Today;
                double discountValue = double.Parse(discount.Text);

                string adminId = Session["user"].ToString();

                SqlCommand proc = new SqlCommand("AdminCreatePromocode", conn)
                    {CommandType = CommandType.StoredProcedure};
                proc.Parameters.Add(new SqlParameter("@code", codeValue.Length == 0 ? (object)DBNull.Value : codeValue));
                proc.Parameters.Add(new SqlParameter("@issueDate", issueDateValue));
                proc.Parameters.Add(new SqlParameter("@expiryDate", expiryDateValue));
                proc.Parameters.Add(new SqlParameter("@discount", discountValue));
                proc.Parameters.Add(new SqlParameter("@adminId", Convert.ToInt32(adminId)));

                conn.Open();
                proc.ExecuteNonQuery();
                conn.Close(); 
            }
            catch (Exception exception)
            {
                Response.Write("Something is wrong please check the entered information");
                Console.WriteLine(exception);
            }
            
        }

        protected void IssuePromocodeOnClick(object sender, EventArgs e)
        {
            string connStr = WebConfigurationManager.ConnectionStrings["GUCera"].ToString();
            SqlConnection conn = new SqlConnection(connStr);

            try
            {
                string codeValue = promoCodeToIssue.Text;
                string studentIdValue = studentId.Text;
                
                
                SqlCommand proc = new SqlCommand("AdminIssuePromocodeToStudent", conn)
                    {CommandType = CommandType.StoredProcedure};
                proc.Parameters.Add(new SqlParameter("@pid", codeValue.Length == 0 ? (object)DBNull.Value : codeValue));
                proc.Parameters.Add(new SqlParameter("@sid", studentIdValue.Length == 0 ? (object)DBNull.Value : studentIdValue));
                
                conn.Open();
                proc.ExecuteNonQuery();
                conn.Close(); 
            }
            catch (Exception exception)
            {
                Response.Write("Something is wrong please check the entered information");
                Console.WriteLine(exception);
            }
        }
    }
}