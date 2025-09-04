using System;
using System.Configuration;
using System.Data.SqlClient;
using System.IO;

namespace Portfolio.Admin
{
    public partial class AddProject : System.Web.UI.Page
    {

        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["IsAdmin"] == null || !(bool)Session["IsAdmin"])
            {
                Response.Redirect("Login.aspx");
            }

        }
        protected void btnAdd_Click(object sender, EventArgs e)
        {
            string cs = ConfigurationManager.ConnectionStrings["PortfolioDB"].ConnectionString;
            string imgPath = "";

            if (fuImage.HasFile)
            {
                string ext = Path.GetExtension(fuImage.FileName).ToLower();
                string[] allowed = { ".jpg", ".jpeg", ".png", ".gif" };
                if (Array.IndexOf(allowed, ext) < 0)
                {
                    lblStatus.Text = "Only image files (.jpg, .jpeg, .png, .gif) are allowed.";
                    return;
                }

                // Optional: Validate file size (e.g., max 2MB)
                if (fuImage.PostedFile.ContentLength > 2 * 1024 * 1024)
                {
                    lblStatus.Text = "File size must be less than 2MB.";
                    return;
                }

                // Save file with unique name to prevent overwrite
                string fileName = Path.GetFileNameWithoutExtension(fuImage.FileName);
                string uniqueName = fileName + "_" + DateTime.Now.Ticks + ext;
                imgPath = "~/Uploads/" + uniqueName;
                fuImage.SaveAs(Server.MapPath(imgPath));
            }
            else
            {
                lblStatus.Text = "Please select an image to upload.";
                return;
            }

            using (SqlConnection con = new SqlConnection(cs))
            {
                string query = "INSERT INTO Projects (Title, Description, Image, Url) VALUES (@Title, @Description, @Image, @Url)";
                SqlCommand cmd = new SqlCommand(query, con);

                cmd.Parameters.AddWithValue("@Title", txtTitle.Text);
                cmd.Parameters.AddWithValue("@Description", txtDescription.Text);
                cmd.Parameters.AddWithValue("@Image", imgPath);
                cmd.Parameters.AddWithValue("@Url", txtUrl.Text);

                con.Open();
                cmd.ExecuteNonQuery();
                lblStatus.Text = "✅ Project added successfully!";
            }

            // Clear inputs
            txtTitle.Text = "";
            txtDescription.Text = "";
            txtUrl.Text = "";
        }
    }
}