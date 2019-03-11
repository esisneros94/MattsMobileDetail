using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace MattMobileDetail
{
    public partial class Login : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        protected void RedirectToBarsList(object sender, EventArgs e)
        {

            var supplier = new DataSupplier();
            var connection = supplier.GetConnectionInfo();

            SqlConnection dbConnection = new SqlConnection(connection);
            SqlCommand command = new SqlCommand();
            command.Connection = dbConnection;
            command.CommandText = "LoginUser";
            command.CommandType = CommandType.StoredProcedure;
            command.Parameters.AddWithValue("@email", LoginEmail.Text);
            command.Parameters.AddWithValue("@code", LoginPW.Text);


            dbConnection.Open();
            SqlDataReader reader = command.ExecuteReader();

            if (reader.HasRows)
            {
                Response.Redirect("Bars.aspx");
            }
            else
            {
                Response.Write("No Login Information found");
            }

            dbConnection.Close();

        }
    }
}