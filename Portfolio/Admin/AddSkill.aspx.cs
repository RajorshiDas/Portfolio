using System;
using System.Data.SqlClient;
using System.Configuration;

namespace Portfolio.Admin
{
    public partial class AddSkill : System.Web.UI.Page
    {
        protected void btnAdd_Click(object sender, EventArgs e)
        {
            string category = ddlCategory.SelectedValue;
            string name = txtName.Text.Trim();
            int level;
            if (!int.TryParse(txtLevel.Text, out level) || level < 0 || level > 100)
            {
                lblMessage.Text = "Level must be a number between 0 and 100.";
                return;
            }

            string connStr = ConfigurationManager.ConnectionStrings["DefaultConnection"].ConnectionString;
            using (SqlConnection conn = new SqlConnection(connStr))
            {
                string query = "INSERT INTO Skills (Category, Name, Level) VALUES (@Category, @Name, @Level)";
                SqlCommand cmd = new SqlCommand(query, conn);
                cmd.Parameters.AddWithValue("@Category", category);
                cmd.Parameters.AddWithValue("@Name", name);
                cmd.Parameters.AddWithValue("@Level", level);
                conn.Open();
                cmd.ExecuteNonQuery();
            }
            lblMessage.ForeColor = System.Drawing.Color.Green;
            lblMessage.Text = "Skill added successfully!";
            txtName.Text = "";
            txtLevel.Text = "";
        }
    }
}