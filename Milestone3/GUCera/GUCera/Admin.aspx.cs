using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using static GUCera.Util;

namespace GUCera
{
    public partial class Admin : System.Web.UI.Page
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

        protected void promoButton(object sender, EventArgs e)
        {
            Response.Redirect("CreatePromoCode.aspx");
        }

        protected void allCoursesButton(object sender, EventArgs e)
        {
            Response.Redirect("ListAllCourses.aspx");
        }

        protected void nonAcceptedButton(object sender, EventArgs e)
        {
            Response.Redirect("ListNonAcceptedCourses.aspx");
        }

        protected void addMobile(object sender, EventArgs e)
        {
            Response.Redirect("addMobile.aspx");
        }
    }
}