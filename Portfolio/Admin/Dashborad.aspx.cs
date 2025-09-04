using System;
using System.Configuration;
using System.Data.SqlClient;

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
            string cs = ConfigurationManager.ConnectionStrings["PortfolioDB"].ConnectionString;
            using (SqlConnection con = new SqlConnection(cs))
            {
                SqlCommand cmd = new SqlCommand($"SELECT COUNT(*) FROM {table}", con);
                con.Open();
                return (int)cmd.ExecuteScalar();
            }
        }

        protected void btnLogout_Click(object sender, EventArgs e)
        {
            Session["IsAdmin"] = null;
            Response.Redirect("Login.aspx");
        }
    }
}