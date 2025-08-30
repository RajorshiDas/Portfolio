using System;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Web.UI.WebControls;

namespace Portfolio
{
    public partial class Education : System.Web.UI.Page
    {
        string cs = ConfigurationManager.ConnectionStrings["PortfolioDB"].ConnectionString;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
                LoadEducation();
        }

        private void LoadEducation()
        {
            using (SqlConnection con = new SqlConnection(cs))
            {
                string query = "SELECT * FROM Education";
                SqlCommand cmd = new SqlCommand(query, con);
                con.Open();
                SqlDataReader dr = cmd.ExecuteReader();
                DataTable dt = new DataTable();
                dt.Load(dr);
                rptEducation.DataSource = dt;
                rptEducation.DataBind();
            }
        }
    }
}