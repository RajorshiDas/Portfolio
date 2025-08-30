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

            using (SqlConnection con = new SqlConnection(cs))
            {
                string query = "UPDATE Projects SET Title=@Title, Description=@Desc, Url=@Url WHERE Id=@Id";
                SqlCommand cmd = new SqlCommand(query, con);
                cmd.Parameters.AddWithValue("@Title", title);
                cmd.Parameters.AddWithValue("@Desc", desc);
                cmd.Parameters.AddWithValue("@Url", url);
                cmd.Parameters.AddWithValue("@Id", id);

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
