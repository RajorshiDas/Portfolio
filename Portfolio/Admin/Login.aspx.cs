using System;
using System.Web;
using System.Web.UI;

namespace Portfolio.Admin
{
    public partial class Login : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            // If user already has a session or cookie, redirect directly
            if (Session["IsAdmin"] != null && (bool)Session["IsAdmin"])
            {
                Response.Redirect("Dashborad.aspx");
            }
            else if (Request.Cookies["AdminAuth"] != null)
            {
                // Restore session from cookie
                string username = Request.Cookies["AdminAuth"]["Username"];
                string authToken = Request.Cookies["AdminAuth"]["AuthToken"];

                if (username == "admin" && authToken == "valid_token")
                {
                    Session["IsAdmin"] = true;
                    Response.Redirect("Dashborad.aspx");
                }
            }
        }

        protected void btnLogin_Click(object sender, EventArgs e)
        {
            // Hardcoded credentials
            if (txtUsername.Text == "admin" && txtPassword.Text == "password")
            {
                // 🔹 Store in session
                Session["IsAdmin"] = true;

                // 🔹 Create a cookie (valid for 1 day)
                HttpCookie authCookie = new HttpCookie("AdminAuth");
                authCookie["Username"] = "admin";
                authCookie["AuthToken"] = "valid_token"; // normally should be GUID/random
                authCookie.Expires = DateTime.Now.AddDays(1);
                Response.Cookies.Add(authCookie);

                Response.Redirect("Dashborad.aspx");
            }
            else
            {
                lblMessage.Text = "Invalid username or password.";
            }
        }
    }
}
