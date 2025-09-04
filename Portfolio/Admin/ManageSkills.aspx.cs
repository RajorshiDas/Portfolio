using System;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;
using System.Web.UI.WebControls;

namespace Portfolio.Admin
{
    public partial class ManageSkills : System.Web.UI.Page
    {
        private static readonly string[] Categories = { "Backend", "Frontend", "Tools", "Languages","Database","App Development" ,};

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
                BindGrid();
        }

        private void BindGrid()
        {
            string connStr = ConfigurationManager.ConnectionStrings["PortfolioDB"].ConnectionString;
            using (SqlConnection conn = new SqlConnection(connStr))
            {
                string query = "SELECT Id, Category, Name, Level FROM Skills ORDER BY Category, Name";
                SqlDataAdapter da = new SqlDataAdapter(query, conn);
                DataTable dt = new DataTable();
                da.Fill(dt);
                gvSkills.DataSource = dt;
                gvSkills.DataBind();
            }
        }

        protected void gvSkills_RowEditing(object sender, GridViewEditEventArgs e)
        {
            gvSkills.EditIndex = e.NewEditIndex;
            BindGrid();
        }

        protected void gvSkills_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
        {
            gvSkills.EditIndex = -1;
            BindGrid();
        }

        protected void gvSkills_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {
            int id = Convert.ToInt32(gvSkills.DataKeys[e.RowIndex].Value);

            // Get controls
            GridViewRow row = gvSkills.Rows[e.RowIndex];
            var ddlCategory = (DropDownList)row.FindControl("ddlEditCategory");
            string category = ddlCategory.SelectedValue;
            string name = ((TextBox)row.Cells[1].Controls[0]).Text;
            int level;
            if (!int.TryParse(((TextBox)row.Cells[2].Controls[0]).Text, out level) || level < 0 || level > 100)
            {
                lblMessage.Text = "Level must be a number between 0 and 100.";
                return;
            }

            string connStr = ConfigurationManager.ConnectionStrings["PortfolioDB"].ConnectionString;
            using (SqlConnection conn = new SqlConnection(connStr))
            {
                string query = "UPDATE Skills SET Category=@Category, Name=@Name, Level=@Level WHERE Id=@Id";
                SqlCommand cmd = new SqlCommand(query, conn);
                cmd.Parameters.AddWithValue("@Category", category);
                cmd.Parameters.AddWithValue("@Name", name);
                cmd.Parameters.AddWithValue("@Level", level);
                cmd.Parameters.AddWithValue("@Id", id);
                conn.Open();
                cmd.ExecuteNonQuery();
            }
            gvSkills.EditIndex = -1;
            BindGrid();
            lblMessage.ForeColor = System.Drawing.Color.Green;
            lblMessage.Text = "Skill updated successfully!";
        }

        protected void gvSkills_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            int id = Convert.ToInt32(gvSkills.DataKeys[e.RowIndex].Value);
            string connStr = ConfigurationManager.ConnectionStrings["PortfolioDB"].ConnectionString;
            using (SqlConnection conn = new SqlConnection(connStr))
            {
                string query = "DELETE FROM Skills WHERE Id=@Id";
                SqlCommand cmd = new SqlCommand(query, conn);
                cmd.Parameters.AddWithValue("@Id", id);
                conn.Open();
                cmd.ExecuteNonQuery();
            }
            BindGrid();
            lblMessage.ForeColor = System.Drawing.Color.Green;
            lblMessage.Text = "Skill deleted successfully!";
        }

        protected void gvSkills_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.DataRow && e.Row.RowState.HasFlag(DataControlRowState.Edit))
            {
                var ddl = (DropDownList)e.Row.FindControl("ddlEditCategory");
                ddl.DataSource = Categories;
                ddl.DataBind();
                // Set selected value
                var dataItem = (DataRowView)e.Row.DataItem;
                if (dataItem != null)
                {
                    ddl.SelectedValue = dataItem["Category"].ToString();
                }
            }
        }
    }
}