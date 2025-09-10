using System;
using System.Configuration;
using System.Data.SqlClient;
using System.Web;

namespace Portfolio.Admin
{
    public partial class Dashborad : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["IsAdmin"] == null || !(bool)Session["IsAdmin"])
            {
                Response.Redirect("Login.aspx");
            }

            if (!IsPostBack)
            {
                lblEducationCount.Text = GetCount("Education").ToString();
                lblSkillsCount.Text = GetCount("Skills").ToString();
                lblProjectsCount.Text = GetCount("Projects").ToString();
                lblMessagesCount.Text = GetCount("Messages").ToString();
            }
        }

        private int GetCount(string table)
        {
            string[] allowedTables = { "Education", "Skills", "Projects", "Messages" };
            if (Array.IndexOf(allowedTables, table) == -1)
                return 0; // or throw error

            string cs = ConfigurationManager.ConnectionStrings["PortfolioDB"].ConnectionString;

            try
            {
                using (SqlConnection con = new SqlConnection(cs))
                using (SqlCommand cmd = new SqlCommand($"SELECT COUNT(*) FROM {table}", con))
                {
                    con.Open();
                    return (int)cmd.ExecuteScalar();
                }
            }
            catch (Exception ex)
            {
                // Log the error (using Serilog, NLog, or System.Diagnostics)
                return 0; // Show 0 instead of crashing page
            }
        }

        protected void btnLogout_Click(object sender, EventArgs e)
        {
            Session.Clear(); // Clears all session variables
            Session.Abandon(); // Ends the session

            // Optionally expire the login cookie if you set one
            if (Request.Cookies["AdminUser"] != null)
            {
                var cookie = new HttpCookie("AdminUser");
                cookie.Expires = DateTime.Now.AddDays(-1);
                Response.Cookies.Add(cookie);
            }

            Response.Redirect("~/Default.aspx"); // Redirect to home page
        }
    }
}