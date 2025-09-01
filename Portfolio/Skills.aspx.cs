using System;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

namespace Portfolio
{
    public partial class Skills : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                BindSkills();
            }
        }

        private void BindSkills()
        {
            string connStr = ConfigurationManager.ConnectionStrings["DefaultConnection"].ConnectionString;
            DataTable dtBackend = new DataTable();
            DataTable dtFrontend = new DataTable();
            DataTable dtTools = new DataTable();

            using (SqlConnection conn = new SqlConnection(connStr))
            {
                string query = "SELECT Category, Name, Level FROM Skills";
                SqlDataAdapter da = new SqlDataAdapter(query, conn);
                DataTable dt = new DataTable();
                da.Fill(dt);

                // Filter by category
                dtBackend = dt.Select("Category = 'Backend'").CopyToDataTableOrNull();
                dtFrontend = dt.Select("Category = 'Frontend'").CopyToDataTableOrNull();
                dtTools = dt.Select("Category = 'Tools'").CopyToDataTableOrNull();
            }

            rptBackend.DataSource = dtBackend;
            rptBackend.DataBind();

            rptFrontend.DataSource = dtFrontend;
            rptFrontend.DataBind();

            rptTools.DataSource = dtTools;
            rptTools.DataBind();
        }
    }

    // Helper extension to handle empty selections
    public static class DataTableExtensions
    {
        public static DataTable CopyToDataTableOrNull(this DataRow[] rows)
        {
            if (rows == null || rows.Length == 0)
                return null;
            return rows.CopyToDataTable();
        }
    }
}