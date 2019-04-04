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
    public partial class AppointmentConfirmation : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            String AppointmentID = EncryptionSupplier.GetDecryptedQueryString(Request.QueryString["Appointment"].ToString());

            GatherAppointmentDetails(AppointmentID);
        }

        private void GatherAppointmentDetails(string AppointmentID)
        {
            var supplier = new DataSupplier();
            String connection = supplier.GetConnectionInfo();

            SqlConnection dbConnection = new SqlConnection(connection);
            SqlCommand command = new SqlCommand();
            command.Connection = dbConnection;
            command.CommandText = "Select c.FirstName, c.LastName, c.Email, a.DateTime, a.AptAddress from Appointments as a join Customers as c on c.CustomerID = a.CustomerID where AppointmentID = '" + AppointmentID + "'";
            command.CommandType = CommandType.Text;

            dbConnection.Open();
            SqlDataReader AppointmentReader = command.ExecuteReader();

            if (AppointmentReader.HasRows)
            {
                while (AppointmentReader.Read())
                {
                    AppointmentNumberLabel.Text = AppointmentID;
                    FirstName.Text = AppointmentReader["FirstName"].ToString();
                    LastName.Text = AppointmentReader["LastName"].ToString();
                    Email.Text = AppointmentReader["Email"].ToString();
                    AppointmentTime.Text = AppointmentReader["DateTime"].ToString();
                    AppointmentLocation.Text = AppointmentReader["AptAddress"].ToString();

                }
            }

            dbConnection.Close();
        }
    }
}