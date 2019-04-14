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
    public partial class Dashboard : System.Web.UI.Page
    {
        DataSupplier supplier = new DataSupplier();

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                PopulateEventStatusFilter();
                PopulatePendingAppointments();
                PopulateBestCustomersGridView();
            }

        }

        private void PopulatePendingAppointments()
        {
            String InventoryConnection = supplier.GetConnectionInfo();

            SqlConnection dbConnection = new SqlConnection(InventoryConnection);
            SqlDataAdapter PendingAppointments = new SqlDataAdapter("exec RetrieveAppointmentsByStatus 'Completed'", dbConnection);

            dbConnection.Open();
            DataTable table = new DataTable();
            PendingAppointments.Fill(table);
            PendingAppointmentsGridView.DataSource = table;
            PendingAppointmentsGridView.DataBind();
        }

        private void PopulateBestCustomersGridView()
        {
            String InventoryBookmarkConnection = supplier.GetConnectionInfo();

            SqlConnection dbConnection = new SqlConnection(InventoryBookmarkConnection);

            dbConnection.Open();
            SqlDataAdapter InventoryBookmarkInfo = new SqlDataAdapter("exec RetrieveBestCustomers", dbConnection);
            DataTable table = new DataTable();
            InventoryBookmarkInfo.Fill(table);
            BestCustomersGridView.DataSource = table;
            BestCustomersGridView.DataBind();
        }

        protected void PendingAppointmentsGridView_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                if (e.Row.DataItem != null)
                {
                    //check if is in edit mode
                    if ((e.Row.RowState & DataControlRowState.Edit) > 0)
                    {

                        String InventoryConnection = supplier.GetConnectionInfo();
                        SqlConnection dbConnection = new SqlConnection(InventoryConnection);
                        dbConnection.Open();

                        SqlDataAdapter ActiveInventoryList = new SqlDataAdapter("Select username From Employees", dbConnection);
                        DataTable table = new DataTable();
                        ActiveInventoryList.Fill(table);

                        EmployeesDropDown.DataSource = table;
                        EmployeesDropDown.DataBind();
                        EmployeesDropDown.DataTextField = "userName";
                        EmployeesDropDown.DataValueField = "userName";
                        EmployeesDropDown.DataBind();
                        EmployeesDropDown.Items.Insert(0, new ListItem("Please Select. . . ", "0"));
                    }
                }
            }
        }

        protected void PopulateEventStatusFilter()
        {
            String InventoryConnection = supplier.GetConnectionInfo();
            SqlConnection dbConnection = new SqlConnection(InventoryConnection);
            dbConnection.Open();

            SqlDataAdapter ActiveInventoryList = new SqlDataAdapter("Select distinct eventStatus From Appointments", dbConnection);
            DataTable table = new DataTable();
            ActiveInventoryList.Fill(table);

            EventStatusList.DataSource = table;
            EventStatusList.DataBind();
            EventStatusList.DataTextField = "eventStatus";
            EventStatusList.DataValueField = "eventStatus";
            EventStatusList.DataBind();
            EventStatusList.Items.Insert(0, new ListItem("Please Select. . . ", "0"));
        }

        protected void PendingAppointmentsGridView_RowEditing(object sender, GridViewEditEventArgs e)
        {
            PendingAppointmentsGridView.EditIndex = e.NewEditIndex;
            PopulatePendingAppointments();
        }

        protected void PendingAppointmentsGridView_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
        {
            PendingAppointmentsGridView.EditIndex = -1;
            PopulatePendingAppointments();
        }
        protected void PendingAppointmentsGridView_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {
            String InventoryConnection = supplier.GetConnectionInfo();

            SqlConnection updateConnection = new SqlConnection(InventoryConnection);
            SqlCommand updateEstablishment = new SqlCommand();
            updateEstablishment.Connection = updateConnection;
            updateEstablishment.CommandText = "ModifyAnAppointment";
            updateEstablishment.CommandType = CommandType.StoredProcedure;

            updateEstablishment.Parameters.AddWithValue("@AppointmentID", (PendingAppointmentsGridView.Rows[e.RowIndex].FindControl("LabelAppointmentNumber") as Label).Text.Trim());
            updateEstablishment.Parameters.AddWithValue("@UserName", (PendingAppointmentsGridView.Rows[e.RowIndex].FindControl("txtEmpAssigned") as TextBox).Text.Trim());
            updateEstablishment.Parameters.AddWithValue("@AppointmentDatetime", (PendingAppointmentsGridView.Rows[e.RowIndex].FindControl("txtAppointmentDate") as TextBox).Text.Trim());
            updateEstablishment.Parameters.AddWithValue("@AppointmentAddress", (PendingAppointmentsGridView.Rows[e.RowIndex].FindControl("txtAppointmentLocation") as TextBox).Text.Trim());
            updateEstablishment.Parameters.AddWithValue("@AptCity", (PendingAppointmentsGridView.Rows[e.RowIndex].FindControl("txtAppointmentCity") as TextBox).Text.Trim());
            updateEstablishment.Parameters.AddWithValue("@AptState", (PendingAppointmentsGridView.Rows[e.RowIndex].FindControl("txtAppointmentState") as TextBox).Text.Trim());
            updateEstablishment.Parameters.AddWithValue("@AptZIP", (PendingAppointmentsGridView.Rows[e.RowIndex].FindControl("txtAppointmentZIP") as TextBox).Text.Trim());
            updateEstablishment.Parameters.AddWithValue("@EventStatus", (PendingAppointmentsGridView.Rows[e.RowIndex].FindControl("txtAppointmentStatus") as TextBox).Text.Trim());
            

            updateConnection.Open();
            updateEstablishment.ExecuteNonQuery();
            PendingAppointmentsGridView.EditIndex = -1;
            PopulatePendingAppointments();
            lblSucess.Text = "Row Updated";
            lblError.Text = "";
            updateConnection.Close();

        }
    }
}