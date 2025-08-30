using System;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Web.UI.WebControls;

namespace Portfolio.Admin
{
    public partial class Messages : System.Web.UI.Page
    {
        string cs = ConfigurationManager.ConnectionStrings["PortfolioDB"].ConnectionString;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack) BindGrid();
        }

        private void BindGrid()
        {
            using (SqlConnection con = new SqlConnection(cs))
            {
                SqlDataAdapter da = new SqlDataAdapter("SELECT * FROM Messages ORDER BY CreatedAt DESC", con);
                DataTable dt = new DataTable();
                da.Fill(dt);
                gvMessages.DataSource = dt;
                gvMessages.DataBind();
            }
        }

        protected void chkIsRead_CheckedChanged(object sender, EventArgs e)
        {
            CheckBox chk = (CheckBox)sender;
            GridViewRow row = (GridViewRow)chk.NamingContainer;
            int id = Convert.ToInt32(gvMessages.DataKeys[row.RowIndex].Value);
            bool isRead = chk.Checked;

            using (SqlConnection con = new SqlConnection(cs))
            {
                string query = "UPDATE Messages SET IsRead = @IsRead WHERE Id = @Id";
                SqlCommand cmd = new SqlCommand(query, con);
                cmd.Parameters.AddWithValue("@IsRead", isRead);
                cmd.Parameters.AddWithValue("@Id", id);
                con.Open();
                cmd.ExecuteNonQuery();
            }
            BindGrid();
        }
    }
}