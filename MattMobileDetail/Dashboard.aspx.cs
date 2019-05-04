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

            bool indicator = supplier.VerifyAuthFromCookie(Request.Cookies["userInfo"]);
            if (indicator == false)
            {
                Response.Redirect("Login.aspx");
            }

            if (!IsPostBack)
            {
                PopulateEventStatusFilter();
                PopulatePendingAppointments(EventStatusList.SelectedValue.ToString());
                PopulateInventoryLevels();
            }

            PopulateBestCustomersGridView();

        }

        private void PopulatePendingAppointments(string StatusToUse)
        {

            String InventoryConnection = supplier.GetConnectionInfo();

            SqlConnection dbConnection = new SqlConnection(InventoryConnection);


            String sqlCommand = "exec RetrieveAppointmentsByStatus " + "'" + StatusToUse + "'";


            SqlDataAdapter PendingAppointments = new SqlDataAdapter(sqlCommand, dbConnection);

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

        private void PopulateInventoryLevels()
        {
            String InventoryConnection = supplier.GetConnectionInfo();

            SqlConnection dbConnection = new SqlConnection(InventoryConnection);

            dbConnection.Open();
            SqlDataAdapter PendingAppointments = new SqlDataAdapter("exec ListInventoryOnHand", dbConnection);
            DataTable table = new DataTable();
            PendingAppointments.Fill(table);
            InventoryLevelsGridView.DataSource = table;
            InventoryLevelsGridView.DataBind();
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

                        DropDownList EmployeesDropDown2 = (DropDownList)e.Row.FindControl("EmployeesDropDown2");
                        EmployeesDropDown2.DataTextField = "userName";
                        EmployeesDropDown2.DataValueField = "userName";
                        EmployeesDropDown2.DataSource = GetEmployees();
                        EmployeesDropDown2.DataBind();
                        DataRowView dr = e.Row.DataItem as DataRowView;
                        EmployeesDropDown2.SelectedValue = dr["userName"].ToString();

                    }
                }
            }
        }

        private DataTable GetEmployees()
        {
            String InventoryConnection = supplier.GetConnectionInfo();
            SqlConnection dbConnection = new SqlConnection(InventoryConnection);
            string sqlCommand = "Select username From Employees";
            DataTable dtEmployees = new DataTable();


            dbConnection.Open();
            SqlDataAdapter ActiveInventoryList = new SqlDataAdapter(sqlCommand, dbConnection);
            ActiveInventoryList.Fill(dtEmployees);

            return dtEmployees;
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
            PopulatePendingAppointments(EventStatusList.SelectedValue.ToString());
        }

        protected void PendingAppointmentsGridView_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
        {
            PendingAppointmentsGridView.EditIndex = -1;
            PopulatePendingAppointments(EventStatusList.SelectedValue.ToString());
        }
        protected void PendingAppointmentsGridView_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {
            String InventoryConnection = supplier.GetConnectionInfo();

            String SelectedItem = (PendingAppointmentsGridView.Rows[e.RowIndex].FindControl("DropDownList1") as DropDownList).SelectedItem.Value.ToString();

            SqlConnection updateConnection = new SqlConnection(InventoryConnection);
            SqlCommand updateEstablishment = new SqlCommand();
            updateEstablishment.Connection = updateConnection;
            updateEstablishment.CommandText = "ModifyAnAppointment";
            updateEstablishment.CommandType = CommandType.StoredProcedure;

            updateEstablishment.Parameters.AddWithValue("@AppointmentID", (PendingAppointmentsGridView.Rows[e.RowIndex].FindControl("LabelAppointmentNumber") as Label).Text.Trim());
            updateEstablishment.Parameters.AddWithValue("@UserName", (PendingAppointmentsGridView.Rows[e.RowIndex].FindControl("EmployeesDropDown2") as DropDownList).SelectedItem.Value);
            updateEstablishment.Parameters.AddWithValue("@AppointmentDatetime", (PendingAppointmentsGridView.Rows[e.RowIndex].FindControl("txtAppointmentDate") as TextBox).Text.Trim());
            updateEstablishment.Parameters.AddWithValue("@AppointmentAddress", (PendingAppointmentsGridView.Rows[e.RowIndex].FindControl("txtAppointmentLocation") as TextBox).Text.Trim());
            updateEstablishment.Parameters.AddWithValue("@AptCity", (PendingAppointmentsGridView.Rows[e.RowIndex].FindControl("txtAppointmentCity") as TextBox).Text.Trim());
            updateEstablishment.Parameters.AddWithValue("@AptState", (PendingAppointmentsGridView.Rows[e.RowIndex].FindControl("txtAppointmentState") as TextBox).Text.Trim());
            updateEstablishment.Parameters.AddWithValue("@AptZIP", (PendingAppointmentsGridView.Rows[e.RowIndex].FindControl("txtAppointmentZIP") as TextBox).Text.Trim());
            updateEstablishment.Parameters.AddWithValue("@EventStatus", SelectedItem);


            updateConnection.Open();
            updateEstablishment.ExecuteNonQuery();
            PendingAppointmentsGridView.EditIndex = -1;
            PopulatePendingAppointments("Pending");
            lblSucess.Text = "Row Updated";
            lblError.Text = "";
            updateConnection.Close();
            PopulateEventStatusFilter();

        }

        protected void EventStatusList_SelectedIndexChanged(object sender, EventArgs e)
        {
            string selectedItem = EventStatusList.SelectedItem.ToString();
            PopulatePendingAppointments(selectedItem);
        }
    }
}