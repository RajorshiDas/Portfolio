using System;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;

namespace Portfolio
{
    public partial class Default : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                BindProjects();
                LoadEducation();
            }
        }

        private void BindProjects()
        {
            string cs = ConfigurationManager.ConnectionStrings["PortfolioDB"].ConnectionString;
            using (SqlConnection con = new SqlConnection(cs))
            {
                SqlDataAdapter da = new SqlDataAdapter("SELECT * FROM Projects ORDER BY CreatedAt DESC", con);
                DataTable dt = new DataTable();
                da.Fill(dt);
                rptProjects.DataSource = dt;
                rptProjects.DataBind();
            }
        }
        protected void btnSend_Click(object sender, EventArgs e)
        {
            string cs = ConfigurationManager.ConnectionStrings["PortfolioDB"].ConnectionString;
            using (SqlConnection con = new SqlConnection(cs))
            {
                string query = "INSERT INTO Messages (Name, Email, Subject, Message) VALUES (@Name, @Email, @Subject, @Message)";
                SqlCommand cmd = new SqlCommand(query, con);

                cmd.Parameters.AddWithValue("@Name", txtName.Text);
                cmd.Parameters.AddWithValue("@Email", txtEmail.Text);
                cmd.Parameters.AddWithValue("@Subject", txtSubject.Text);
                cmd.Parameters.AddWithValue("@Message", txtMessage.Text);

                con.Open();
                cmd.ExecuteNonQuery();
                con.Close();
            }

            lblContactStatus.Text = "✅ Thank you! Your message has been sent.";
            txtName.Text = txtEmail.Text = txtSubject.Text = txtMessage.Text = "";
        }
        private void LoadEducation()
        {
            string cs = ConfigurationManager.ConnectionStrings["PortfolioDB"].ConnectionString;
            using (SqlConnection con = new SqlConnection(cs))
            {
                SqlDataAdapter da = new SqlDataAdapter("SELECT * FROM Education", con);
                DataTable dt = new DataTable();
                da.Fill(dt);
                rptEducation.DataSource = dt;
                rptEducation.DataBind();
            }
        }
    }
}