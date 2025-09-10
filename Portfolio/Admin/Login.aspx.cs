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

                // Increment login count cookie
                int loginCount = 1;
                HttpCookie loginCountCookie = Request.Cookies["LoginCount"];
                if (loginCountCookie != null && int.TryParse(loginCountCookie.Value, out int count))
                {
                    loginCount = count + 1;
                }
                loginCountCookie = new HttpCookie("LoginCount", loginCount.ToString());
                loginCountCookie.Expires = DateTime.Now.AddYears(1);
                Response.Cookies.Add(loginCountCookie);

                // Set AdminAuth cookie (extend expiry)
                HttpCookie authCookie = new HttpCookie("AdminAuth");
                authCookie["Username"] = "admin";
                authCookie["AuthToken"] = "valid_token";
                authCookie.Expires = DateTime.Now.AddMinutes(1);
                authCookie.Path = "/";
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
