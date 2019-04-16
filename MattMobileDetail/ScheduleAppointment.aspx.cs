using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Drawing;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace MattMobileDetail
{
    public partial class ScheduleAppointment : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                AppointmentDate.Visible = false;
                AppointmentInfo.Visible = false;

            }
        }

        protected void RedirectToConfirmationPage(int AppointmentNumber)
        {
            string EncryptedString = EncryptionSupplier.GetEncryptedQueryString(AppointmentNumber.ToString());

            Response.Redirect("AppointmentConfirmation.aspx?Appointment=" + EncryptedString);
        }

        protected void ToggleCalendarControl(object sender, EventArgs e)
        {

            if (AppointmentDate.Visible == false)
            {
                AppointmentDate.Visible = true;
            }
            else
            {
                AppointmentDate.Visible = false;
            }

        }

        protected void SaveDateToTextBox(object sender, EventArgs e)
        {
            DateSelected.Text = AppointmentDate.SelectedDate.ToShortDateString();
            AppointmentDate.Visible = false;
        }

        protected void ProceedAppointmentButtonClick(object sender, EventArgs e)
        {
            AppointmentInfo.Visible = true;
            AppointmentInfo.BackColor = Color.Aquamarine;
        }

        protected void DisplayReturningCustomerCars(object sender, EventArgs e)
        {
            if (PreviousCustomerVehicles.Visible == true)
            {
                PreviousCustomerVehicles.Visible = false;
            }
            else
            {
                PreviousCustomerVehicles.Visible = true;
            }

        }

        protected void InsertAppointmentRequest(object sender, EventArgs e)
        {

            var AppointmentTime = AppointmentTimeBuilder(DateSelected.Text);


            DataSupplier Supplier = new DataSupplier();
            String connection = Supplier.GetWebUserConnectInfo();


            SqlConnection dbConnection = new SqlConnection(connection);
            SqlCommand command = new SqlCommand();
            command.Connection = dbConnection;
            command.CommandText = "InsertCustomerRecord";
            command.CommandType = CommandType.StoredProcedure;
            command.Parameters.AddWithValue("@firstName", FirstName.Text);
            command.Parameters.AddWithValue("@LastName", LastName.Text);
            command.Parameters.AddWithValue("@City", CityOfResidence.Text);
            command.Parameters.AddWithValue("@State", CustomerState.Text);
            command.Parameters.AddWithValue("@ZIP", CustomerZipCode.Text);
            command.Parameters.AddWithValue("@Phone", PhoneNumber.Text);
            command.Parameters.AddWithValue("@Email", EmailAddress.Text);

            dbConnection.Open();
            int CustomerID = Convert.ToInt32(command.ExecuteScalar());
            dbConnection.Close();

            InsertCustomerCar(CustomerID);
            int AppointmentNumber = InsertAppointmentDetails(CustomerID, AppointmentTime);

            RedirectToConfirmationPage(AppointmentNumber);

            
        }

        private void InsertCustomerCar(int customerNumber)
        {
            DataSupplier Supplier = new DataSupplier();
            String connection = Supplier.GetWebUserConnectInfo();


            SqlConnection dbConnection = new SqlConnection(connection);
            SqlCommand command = new SqlCommand();
            command.Connection = dbConnection;
            command.CommandText = "InsertVehicleRecord";
            command.CommandType = CommandType.StoredProcedure;
            command.Parameters.AddWithValue("@CustomerID", customerNumber);
            command.Parameters.AddWithValue("@Year", CarYear.Text);
            command.Parameters.AddWithValue("@Make", CarMake.Text);
            command.Parameters.AddWithValue("@Model", CarModel.Text);
            command.Parameters.AddWithValue("@Color", CarColor.Text);
            command.Parameters.AddWithValue("@PlateNumber", CarLicensePlateNumber.Text);
            command.Parameters.AddWithValue("@PlateState", LicensePlateState.Text);

            dbConnection.Open();
            command.ExecuteScalar();
            dbConnection.Close();

        }

        private int InsertAppointmentDetails(int customerNumber, DateTime AppointmentTime)
        {
            DataSupplier Supplier = new DataSupplier();
            String connection = Supplier.GetWebUserConnectInfo();


            SqlConnection dbConnection = new SqlConnection(connection);
            SqlCommand command = new SqlCommand();
            command.Connection = dbConnection;
            command.CommandText = "InsertAppointmentInfo";
            command.CommandType = CommandType.StoredProcedure;
            command.Parameters.AddWithValue("@CustomerID", customerNumber);
            command.Parameters.AddWithValue("@AppointmentDateTime", AppointmentTime);
            command.Parameters.AddWithValue("@AppointmentAddress", ServiceAddress.Text);
            command.Parameters.AddWithValue("@AptCity", ServiceCity.Text);
            command.Parameters.AddWithValue("@AptState", ServiceState.Text);
            command.Parameters.AddWithValue("@AptZIP", ServiceZip.Text);
            command.Parameters.AddWithValue("@EventNotes", "");

            dbConnection.Open();
            int AppointmentNumber = Convert.ToInt32(command.ExecuteScalar());
            dbConnection.Close();

            return AppointmentNumber;
        }

        private DateTime AppointmentTimeBuilder(string DateSelected)
        {
            DateTime CustomerAppointmentDateTime = Convert.ToDateTime(DateSelected);

            AppointmentHour.SelectedValue = AppointmentHour.SelectedItem.Value;
            AppointmentMinute.SelectedValue = AppointmentHour.SelectedItem.Value;
            AppointmentDayPart.SelectedValue = AppointmentDayPart.SelectedValue.ToString();

            int ActualHour = 0;


            if(AppointmentDayPart.SelectedValue == "PM")
            {
                if(AppointmentHour.SelectedValue != "12" && AppointmentDayPart.SelectedValue == "PM")
                {
                    ActualHour = Convert.ToUInt16(AppointmentHour.SelectedValue) + 12;
                }
            }

            TimeSpan ts = new TimeSpan(ActualHour, Convert.ToInt16(AppointmentMinute.SelectedValue), 0);

            CustomerAppointmentDateTime = CustomerAppointmentDateTime.Date + ts;

            return CustomerAppointmentDateTime;
        }

    }
}