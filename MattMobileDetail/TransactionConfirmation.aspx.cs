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
    public partial class TransactionConfirmation : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            String TransactionID = EncryptionSupplier.GetDecryptedQueryString(Request.QueryString["Transaction"].ToString());

            GetTransactionSummary(TransactionID);
        }

        private void GetTransactionSummary(string transactionID)
        {
            var supplier = new DataSupplier();
            String connection = supplier.GetWebUserConnectInfo();

            SqlConnection dbConnection = new SqlConnection(connection);
            SqlCommand TransactionSummary = new SqlCommand();
            TransactionSummary.Connection = dbConnection;
            TransactionSummary.CommandText = "GetTransactionSummary";
            TransactionSummary.CommandType = CommandType.StoredProcedure;

            TransactionSummary.Parameters.AddWithValue("TransactionID", transactionID);

            dbConnection.Open();
            SqlDataReader AppointmentReader = TransactionSummary.ExecuteReader();

            if (AppointmentReader.HasRows)
            {
                while (AppointmentReader.Read())
                {
                    FirstName.Text = AppointmentReader["FirstName"].ToString();
                    LastName.Text = AppointmentReader["LastName"].ToString();
                    Email.Text = AppointmentReader["Email"].ToString();
                    Phone.Text = AppointmentReader["Phone"].ToString();
                    AppointmentTime.Text = AppointmentReader["DateTime"].ToString();
                    GrandToal.Text = AppointmentReader["GrandTotal"].ToString();
                    Payment.Text = AppointmentReader["PaymentMethod"].ToString();

                }
            }

            dbConnection.Close();
        }

        protected void ReturnToDashboard_Click(object sender, EventArgs e)
        {
            Response.Redirect("Dashboard.aspx");
        }

        protected void ReturnToTransactionPage_Click(object sender, EventArgs e)
        {
            Response.Redirect("Transactions.aspx");
        }
    }
}