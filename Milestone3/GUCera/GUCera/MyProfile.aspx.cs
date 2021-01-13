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
    public partial class MyProfile : System.Web.UI.Page
    {
        private static string connStr = WebConfigurationManager.ConnectionStrings["GUCera"].ToString();
        private static SqlConnection conn = new SqlConnection(connStr);
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["user"] == null || Convert.ToInt32(Session["type"]) != 2)
            {
                Session["loginMsg"] = "Login to access your profile";
                Response.Redirect("Login.aspx");

            }
            if (Session["profileMsg"] != null)
            {
                message.Text = (String)Session["profileMsg"];
                editInfoDiv.Visible = true;
                Session["profileMsg"] = null;
            }
            if (Session["mobileMsg"] != null)
            {
                mobileMsg.Text = (String)Session["mobileMsg"];
                mobileDiv.Visible = true;
                Session["mobileMsg"] = null;
            }
            if (Session["cardMsg"] != null)
            {
                cardMsg.Text = (String)Session["cardMsg"];
               creditCardDiv.Visible = true;
                Session["cardMsg"] = null;
            }
        }

        protected void save_Click(object sender, EventArgs e)
        {

            int id = (System.Int32)(Session["user"]);
            SqlCommand editproc = new SqlCommand("editMyProfile", conn);
            editproc.CommandType = CommandType.StoredProcedure;
            editproc.Parameters.Add(new SqlParameter("@id", id));
            editproc.Parameters.Add(new SqlParameter("@firstname", fname.Text.Length == 0 ? (object)DBNull.Value : fname.Text));
            editproc.Parameters.Add(new SqlParameter("@lastName", lname.Text.Length == 0 ? (object)DBNull.Value : lname.Text));
            editproc.Parameters.Add(new SqlParameter("@password", password.Text.Length == 0 ? (object)DBNull.Value : password.Text));
            editproc.Parameters.Add(new SqlParameter("@email", email.Text.Length == 0 ? (object)DBNull.Value : email.Text));
            editproc.Parameters.Add(new SqlParameter("@gender", gender.SelectedItem == null ? (object)DBNull.Value : Int16.Parse(gender.SelectedItem.Value)));
            editproc.Parameters.Add(new SqlParameter("@address", address.Text.Length == 0 ? (object)DBNull.Value : address.Text));
            try
            {
                conn.Open();
                editproc.ExecuteNonQuery();
                conn.Close();
            } catch(Exception ee)
            {
                Response.Write(ee.Message);
                conn.Close();
                return;
            }
            Session["profileMsg"] = "Profile changed successfully!";
            Response.Redirect(Request.RawUrl);
        }

        protected void EditInfoLinkButton_Click(object sender, EventArgs e)
        {
            editInfoDiv.Visible = !editInfoDiv.Visible;
            message.Text = null;
        }
        protected void addmobile_Click(object sender, EventArgs e)
        {

            int id = (System.Int32)(Session["user"]);
            String number = mobileNumber.Text;
            if (number.Length == 0) {
                mobileMsg.Text = "Please Enter a Valid number";
                return;
            }
            
            SqlCommand mobileproc = new SqlCommand("addMobile", conn);
            mobileproc.CommandType = CommandType.StoredProcedure;
            mobileproc.Parameters.Add(new SqlParameter("@id", id));
            mobileproc.Parameters.Add(new SqlParameter("@mobile_number", number));

            try
            {
                conn.Open();
                mobileproc.ExecuteNonQuery();
                conn.Close();
            }
            catch (Exception ee)
            {
                Response.Write(ee.Message);
                conn.Close();
                return;
            }
            Session["mobileMsg"] = "Mobile Number Added successfully!";
            Response.Redirect(Request.RawUrl);
        }

        protected void MobileLinkButton_Click(object sender, EventArgs e)
        {
            mobileDiv.Visible = !mobileDiv.Visible;
            mobileMsg.Text = null;
        }

        protected void addcard_Click(object sender, EventArgs e)
        {
            int sid = (System.Int32)(Session["user"]);
            String number = cardnumber.Text;
            String holder = cardholder.Text;
            String expiry = expirydate.Text;
            String cvv = cvvtextbox.Text;
            if (number.Length == 0 || holder.Length==0 || expiry.Length == 0 || cvv.Length == 0)
            {
                cardMsg.Text = "Please Enter Data Correctly";
                return;
            }
                
            SqlCommand cardproc = new SqlCommand("addCreditCard", conn);
            cardproc.CommandType = CommandType.StoredProcedure;
            cardproc.Parameters.Add(new SqlParameter("@sid", sid));
            cardproc.Parameters.Add(new SqlParameter("@number", number));
            cardproc.Parameters.Add(new SqlParameter("@cardHolderName", holder));
            cardproc.Parameters.Add(new SqlParameter("@expiryDate", Convert.ToDateTime(expiry)));
            cardproc.Parameters.Add(new SqlParameter("@cvv", cvv));
            try
            {
                conn.Open();
                cardproc.ExecuteNonQuery();
                conn.Close();
            }
            catch (Exception ee)
            {
                Response.Write(ee.Message);
                conn.Close();
                return;
            }
            Session["cardMsg"] = "Credit Card Added successfully!";
            Response.Redirect(Request.RawUrl);

        }

        protected void CardLinkButton_Click(object sender, EventArgs e)
        {
            creditCardDiv.Visible = !creditCardDiv.Visible;
            cardMsg.Text = null;
        }

        protected void PromoLinkButton_Click(object sender, EventArgs e)
        {
            promoDiv.Visible = !promoDiv.Visible;
        }
    }
}