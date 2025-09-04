using System;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Web.UI.WebControls;

namespace Portfolio.Admin
{
    public partial class ManageEducation : System.Web.UI.Page
    {
        string cs = ConfigurationManager.ConnectionStrings["PortfolioDB"].ConnectionString;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
                BindGrid();
            
        
            if (Session["IsAdmin"] == null || !(bool)Session["IsAdmin"])
            {
                Response.Redirect("Login.aspx");
            }

        
        }

        private void BindGrid()
        {
            using (SqlConnection con = new SqlConnection(cs))
            {
                SqlDataAdapter da = new SqlDataAdapter("SELECT * FROM Education", con);
                DataTable dt = new DataTable();
                da.Fill(dt);
                gvEducation.DataSource = dt;
                gvEducation.DataBind();
            }
        }

        protected void gvEducation_RowEditing(object sender, GridViewEditEventArgs e)
        {
            gvEducation.EditIndex = e.NewEditIndex;
            BindGrid();
        }

        protected void gvEducation_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
        {
            gvEducation.EditIndex = -1;
            BindGrid();
        }

        protected void gvEducation_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {
            int id = Convert.ToInt32(gvEducation.DataKeys[e.RowIndex].Value);
            string degree = ((TextBox)gvEducation.Rows[e.RowIndex].Cells[1].Controls[0]).Text;
            string institution = ((TextBox)gvEducation.Rows[e.RowIndex].Cells[2].Controls[0]).Text;
            string year = ((TextBox)gvEducation.Rows[e.RowIndex].Cells[3].Controls[0]).Text;
            string description = ((TextBox)gvEducation.Rows[e.RowIndex].Cells[4].Controls[0]).Text;

            using (SqlConnection con = new SqlConnection(cs))
            {
                string query = "UPDATE Education SET Degree=@Degree, Institution=@Institution, Year=@Year, Description=@Description WHERE Id=@Id";
                SqlCommand cmd = new SqlCommand(query, con);
                cmd.Parameters.AddWithValue("@Degree", degree);
                cmd.Parameters.AddWithValue("@Institution", institution);
                cmd.Parameters.AddWithValue("@Year", year);
                cmd.Parameters.AddWithValue("@Description", description);
                cmd.Parameters.AddWithValue("@Id", id);
                con.Open();
                cmd.ExecuteNonQuery();
            }

            gvEducation.EditIndex = -1;
            BindGrid();
        }

        protected void gvEducation_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            int id = Convert.ToInt32(gvEducation.DataKeys[e.RowIndex].Value);
            using (SqlConnection con = new SqlConnection(cs))
            {
                string query = "DELETE FROM Education WHERE Id=@Id";
                SqlCommand cmd = new SqlCommand(query, con);
                cmd.Parameters.AddWithValue("@Id", id);
                con.Open();
                cmd.ExecuteNonQuery();
            }
            BindGrid();
        }

        protected void btnReturnDashboard_Click(object sender, EventArgs e)
        {
            Response.Redirect("Dashborad.aspx");
        }
    }
}
