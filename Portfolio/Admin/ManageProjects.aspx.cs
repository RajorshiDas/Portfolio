using System;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;

namespace Portfolio.Admin
{
    public partial class ManageProjects : System.Web.UI.Page
    {
        string cs = ConfigurationManager.ConnectionStrings["PortfolioDB"].ConnectionString;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
                BindGrid();
        }

        private void BindGrid()
        {
            using (SqlConnection con = new SqlConnection(cs))
            {
                SqlDataAdapter da = new SqlDataAdapter("SELECT * FROM Projects", con);
                DataTable dt = new DataTable();
                da.Fill(dt);
                gvProjects.DataSource = dt;
                gvProjects.DataBind();
            }
        }

        // 🔹 Enable editing
        protected void gvProjects_RowEditing(object sender, System.Web.UI.WebControls.GridViewEditEventArgs e)
        {
            gvProjects.EditIndex = e.NewEditIndex;
            BindGrid();
        }

        // 🔹 Cancel editing
        protected void gvProjects_RowCancelingEdit(object sender, System.Web.UI.WebControls.GridViewCancelEditEventArgs e)
        {
            gvProjects.EditIndex = -1;
            BindGrid();
        }

        // 🔹 Update Project
        protected void gvProjects_RowUpdating(object sender, System.Web.UI.WebControls.GridViewUpdateEventArgs e)
        {
            int id = Convert.ToInt32(gvProjects.DataKeys[e.RowIndex].Value.ToString());
            string title = ((System.Web.UI.WebControls.TextBox)gvProjects.Rows[e.RowIndex].Cells[1].Controls[0]).Text;
            string desc = ((System.Web.UI.WebControls.TextBox)gvProjects.Rows[e.RowIndex].Cells[2].Controls[0]).Text;
            string url = ((System.Web.UI.WebControls.TextBox)gvProjects.Rows[e.RowIndex].Cells[3].Controls[0]).Text;

            string imgPath = null;

            // Find FileUpload inside GridView
            var fu = (System.Web.UI.WebControls.FileUpload)gvProjects.Rows[e.RowIndex].FindControl("fuEditImage");

            if (fu != null && fu.HasFile)
            {
                string ext = System.IO.Path.GetExtension(fu.FileName).ToLower();
                string[] allowed = { ".jpg", ".jpeg", ".png", ".gif" };

                if (Array.IndexOf(allowed, ext) < 0)
                {
                    lblStatus.Text = "Only image files (.jpg, .jpeg, .png, .gif) are allowed.";
                    return;
                }

                if (fu.PostedFile.ContentLength > 2 * 1024 * 1024)
                {
                    lblStatus.Text = "File size must be less than 2MB.";
                    return;
                }

                string fileName = System.IO.Path.GetFileNameWithoutExtension(fu.FileName);
                string uniqueName = fileName + "_" + DateTime.Now.Ticks + ext;
                imgPath = "~/Uploads/" + uniqueName;
                fu.SaveAs(Server.MapPath(imgPath));
            }

            using (SqlConnection con = new SqlConnection(cs))
            {
                string query;

                if (imgPath != null) // update with new image
                {
                    query = "UPDATE Projects SET Title=@Title, Description=@Desc, Url=@Url, Image=@Image WHERE Id=@Id";
                }
                else // update without changing image
                {
                    query = "UPDATE Projects SET Title=@Title, Description=@Desc, Url=@Url WHERE Id=@Id";
                }

                SqlCommand cmd = new SqlCommand(query, con);
                cmd.Parameters.AddWithValue("@Title", title);
                cmd.Parameters.AddWithValue("@Desc", desc);
                cmd.Parameters.AddWithValue("@Url", url);
                cmd.Parameters.AddWithValue("@Id", id);

                if (imgPath != null)
                    cmd.Parameters.AddWithValue("@Image", imgPath);

                con.Open();
                cmd.ExecuteNonQuery();
                con.Close();
            }

            gvProjects.EditIndex = -1;
            BindGrid();
            lblStatus.Text = "✅ Project updated successfully!";
        }

        // 🔹 Delete Project
        protected void gvProjects_RowDeleting(object sender, System.Web.UI.WebControls.GridViewDeleteEventArgs e)
        {
            int id = Convert.ToInt32(gvProjects.DataKeys[e.RowIndex].Value.ToString());

            using (SqlConnection con = new SqlConnection(cs))
            {
                string query = "DELETE FROM Projects WHERE Id=@Id";
                SqlCommand cmd = new SqlCommand(query, con);
                cmd.Parameters.AddWithValue("@Id", id);

                con.Open();
                cmd.ExecuteNonQuery();
                con.Close();
            }

            BindGrid();
            lblStatus.Text = "🗑️ Project deleted successfully!";
        }
    }
}
