using System;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;
using System.Linq;

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
            string connStr = ConfigurationManager.ConnectionStrings["PortfolioDB"].ConnectionString;
            DataTable dt = new DataTable();

            using (SqlConnection conn = new SqlConnection(connStr))
            {
                string query = "SELECT Category, Name, Level FROM Skills ORDER BY Category, Name";
                SqlDataAdapter da = new SqlDataAdapter(query, conn);
                da.Fill(dt);
            }

            var categories = dt.AsEnumerable()
                .GroupBy(row => row.Field<string>("Category"))
                .Select(g => new
                {
                    Category = g.Key,
                    Skills = g.CopyToDataTable()
                }).ToList();

            rptCategories.DataSource = categories;
            rptCategories.DataBind();
        }

        protected void rptCategories_ItemDataBound(object sender, System.Web.UI.WebControls.RepeaterItemEventArgs e)
        {
            if (e.Item.ItemType == System.Web.UI.WebControls.ListItemType.Item ||
                e.Item.ItemType == System.Web.UI.WebControls.ListItemType.AlternatingItem)
            {
                dynamic category = e.Item.DataItem;
                var rptSkills = (System.Web.UI.WebControls.Repeater)e.Item.FindControl("rptSkills");
                rptSkills.DataSource = ((DataTable)category.Skills);
                rptSkills.DataBind();
            }
        }
    }
}