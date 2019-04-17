using MattMobileDetail;
using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.Security;

namespace MattMobileDetail
{
	public partial class Login : System.Web.UI.Page
	{
		protected void Page_Load(object sender, EventArgs e)
		{

		}
        protected void RedirectToFAQ(object sender, EventArgs e)
        {


            var supplier = new DataSupplier();
            var connection = supplier.GetWebUserConnectInfo();

            SqlConnection dbConnection = new SqlConnection(connection);
            SqlCommand command = new SqlCommand();
            command.Connection = dbConnection;
            command.CommandText = "LoginUser";
            command.CommandType = CommandType.StoredProcedure;
            command.Parameters.AddWithValue("@username", LoginEmail.Text);
            command.Parameters.AddWithValue("@password", LoginPW.Text);


            dbConnection.Open();
            SqlDataReader reader = command.ExecuteReader();

            if (reader.HasRows == true)
            {
                HttpCookie cookie = new HttpCookie("userInfo");
                cookie["userName"] = LoginEmail.Text;
                cookie["auth"] = "Yes";

                Response.Cookies.Add(cookie);

                Response.Redirect("Dashboard.aspx");
                
            }
            else
            {
                
                Response.Write("Invalid Username / Password Combination");
            }

            dbConnection.Close();

        }
    }
}