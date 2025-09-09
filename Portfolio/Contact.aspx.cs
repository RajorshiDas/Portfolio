using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Xml.Linq;

namespace Portfolio
{
    public partial class Contact : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

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
    }
}