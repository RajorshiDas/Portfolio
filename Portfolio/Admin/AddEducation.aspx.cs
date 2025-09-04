using System;
using System.Configuration;
using System.Data.SqlClient;

namespace Portfolio.Admin
{
    public partial class AddEducation : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["IsAdmin"] == null || !(bool)Session["IsAdmin"])
            {
                Response.Redirect("Login.aspx");
            }

            if (!IsPostBack)
            {
                txtDegree.Attributes["placeholder"] = "Degree";
                txtInstitution.Attributes["placeholder"] = "Institution";
                txtYear.Attributes["placeholder"] = "Year";
                txtDescription.Attributes["placeholder"] = "Description";
            }

        }

        protected void btnSave_Click(object sender, EventArgs e)
        {
            string cs = ConfigurationManager.ConnectionStrings["PortfolioDB"].ConnectionString;
            using (SqlConnection con = new SqlConnection(cs))
            {
                string query = "INSERT INTO Education (Degree, Institution, Year, Description) VALUES (@Degree, @Institution, @Year, @Description)";
                SqlCommand cmd = new SqlCommand(query, con);
                cmd.Parameters.AddWithValue("@Degree", txtDegree.Text);
                cmd.Parameters.AddWithValue("@Institution", txtInstitution.Text);
                cmd.Parameters.AddWithValue("@Year", txtYear.Text);
                cmd.Parameters.AddWithValue("@Description", txtDescription.Text);
                con.Open();
                cmd.ExecuteNonQuery();
            }
            Response.Redirect("ManageEducation.aspx");
        }
    }
}
