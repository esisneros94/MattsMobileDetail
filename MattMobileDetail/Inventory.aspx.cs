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
    public partial class Inventory : System.Web.UI.Page
    {
        DataSupplier supplier = new DataSupplier();
        public string selectedItem;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                PopulateGridView();
                PopulateBookMarkGridView();
                PopulateItemstoBookmarkEdit();
            }
        }

        private void PopulateGridView()
        {
            String InventoryConnection = supplier.GetConnectionInfo();

            SqlConnection dbConnection = new SqlConnection(InventoryConnection);

            dbConnection.Open();
            SqlDataAdapter InventoryInfo = new SqlDataAdapter("Select UPC, Name, Description, IsForSale, Quantity, StartDate, EndDate From Inventory", dbConnection);
            DataTable table = new DataTable();
            InventoryInfo.Fill(table);
            InventoryGridView.DataSource = table;
            InventoryGridView.DataBind();
        }

        private void PopulateItemstoBookmarkEdit()
        {
            String InventoryConnection = supplier.GetConnectionInfo();

            SqlConnection dbConnection = new SqlConnection(InventoryConnection);
            dbConnection.Open();
            SqlDataAdapter ActiveInventoryList = new SqlDataAdapter("Select UPC, Name From Inventory where StartDate <= getdate() and ((EndDate > getdate()) or EndDate is null)", dbConnection);
            DataTable table = new DataTable();
            ActiveInventoryList.Fill(table);
            DropDownItems.DataSource = table;
            DropDownItems.DataBind();
            DropDownItems.DataTextField = "Name";
            DropDownItems.DataValueField = "UPC";
            DropDownItems.DataBind();
            DropDownItems.Items.Insert(0, new ListItem("Please Select. . . ", "0"));

        }

        private void PopulateVendorNametoBookmarkEdit(string UPC)
        {
            String InventoryConnection = supplier.GetConnectionInfo();
            SqlConnection dbConnection = new SqlConnection(InventoryConnection);
            dbConnection.Open();

            SqlDataAdapter ActiveInventoryList = new SqlDataAdapter("Select Vendor From InventoryBookmark where UPC = '" + UPC + "'", dbConnection);
            DataTable table = new DataTable();
            ActiveInventoryList.Fill(table);
            DropDownUpdateVendor.DataSource = table;
            DropDownUpdateVendor.DataBind();
            DropDownUpdateVendor.DataTextField = "Vendor";
            DropDownUpdateVendor.DataValueField = "Vendor";
            DropDownUpdateVendor.DataBind();
            DropDownUpdateVendor.Items.Insert(0, new ListItem("Please Select. . . ", "0"));
        }


        protected void InventoryGridView_RowCommand(object sender, GridViewCommandEventArgs e)
        {


            if (e.CommandName.Equals("AddNew"))
            {
                String InventoryConnection = supplier.GetConnectionInfo();

                SqlConnection insertConnection = new SqlConnection(InventoryConnection);
                SqlCommand insertEstablishment = new SqlCommand();
                insertEstablishment.Connection = insertConnection;
                insertEstablishment.CommandText = "InsertInventoryItem";
                insertEstablishment.CommandType = CommandType.StoredProcedure;

                insertEstablishment.Parameters.AddWithValue("@UPC", (InventoryGridView.FooterRow.FindControl("NewInventoryUPC") as TextBox).Text.Trim());
                insertEstablishment.Parameters.AddWithValue("@Name", (InventoryGridView.FooterRow.FindControl("NewInventoryName") as TextBox).Text.Trim());
                insertEstablishment.Parameters.AddWithValue("@Description", (InventoryGridView.FooterRow.FindControl("NewInventoryDescription") as TextBox).Text.Trim());
                insertEstablishment.Parameters.AddWithValue("@IsForSale", (InventoryGridView.FooterRow.FindControl("NewInventoryIsForSale") as TextBox).Text.Trim());
                insertEstablishment.Parameters.AddWithValue("@Quantity", (InventoryGridView.FooterRow.FindControl("NewInventoryQuantity") as TextBox).Text.Trim());
                insertEstablishment.Parameters.AddWithValue("@StartDate", (InventoryGridView.FooterRow.FindControl("NewInventoryStartDate") as TextBox).Text.Trim());
                insertEstablishment.Parameters.AddWithValue("@EndDate", (InventoryGridView.FooterRow.FindControl("NewInventoryEndDate") as TextBox).Text.Trim());

                insertConnection.Open();
                insertEstablishment.ExecuteNonQuery();
                InventoryGridView.EditIndex = -1;
                PopulateGridView();
                lblSucess.Text = "Row Updated";
                lblError.Text = "";
                insertConnection.Close();
            }
            PopulateItemstoBookmarkEdit();


        }

        protected void InventoryGridView_RowEditing(object sender, GridViewEditEventArgs e)
        {
            InventoryGridView.EditIndex = e.NewEditIndex;
            PopulateGridView();
        }

        protected void InventoryGridView_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
        {
            InventoryGridView.EditIndex = -1;
            PopulateGridView();
        }

        protected void InventoryGridView_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {
            String InventoryConnection = supplier.GetConnectionInfo();

            SqlConnection updateConnection = new SqlConnection(InventoryConnection);
            SqlCommand updateEstablishment = new SqlCommand();
            updateEstablishment.Connection = updateConnection;
            updateEstablishment.CommandText = "UpdateInventoryItem";
            updateEstablishment.CommandType = CommandType.StoredProcedure;

            updateEstablishment.Parameters.AddWithValue("@UPC", (InventoryGridView.Rows[e.RowIndex].FindControl("txtBoxInventoryUPC") as TextBox).Text.Trim());
            updateEstablishment.Parameters.AddWithValue("@Name", (InventoryGridView.Rows[e.RowIndex].FindControl("txtBoxInventoryName") as TextBox).Text.Trim());
            updateEstablishment.Parameters.AddWithValue("@Description", (InventoryGridView.Rows[e.RowIndex].FindControl("txtBoxInventoryDescription") as TextBox).Text.Trim());
            updateEstablishment.Parameters.AddWithValue("@IsForSale", (InventoryGridView.Rows[e.RowIndex].FindControl("txtBoxInventoryIsForSale") as TextBox).Text.Trim());
            updateEstablishment.Parameters.AddWithValue("@Quantity", (InventoryGridView.Rows[e.RowIndex].FindControl("txtBoxInventoryQuantity") as TextBox).Text.Trim());
            updateEstablishment.Parameters.AddWithValue("@StartDate", (InventoryGridView.Rows[e.RowIndex].FindControl("txtBoxInventoryStartDate") as TextBox).Text.Trim());
            updateEstablishment.Parameters.AddWithValue("@EndDate", (InventoryGridView.Rows[e.RowIndex].FindControl("txtBoxInventoryEndDate") as TextBox).Text.Trim());
            
            updateConnection.Open();
            updateEstablishment.ExecuteNonQuery();
            InventoryGridView.EditIndex = -1;
            PopulateGridView();
            lblSucess.Text = "Row Updated";
            lblError.Text = "";
            updateConnection.Close();

        }
        private void PopulateBookMarkGridView()
        {
            String InventoryBookmarkConnection = supplier.GetConnectionInfo();

            SqlConnection dbConnection = new SqlConnection(InventoryBookmarkConnection);

            dbConnection.Open();
            SqlDataAdapter InventoryBookmarkInfo = new SqlDataAdapter("Select i.UPC, i.Name, ib.Vendor ,ib.URL From Inventory as i join InventoryBookmark as ib on ib.UPC = i.UPC", dbConnection);
            DataTable table = new DataTable();
            InventoryBookmarkInfo.Fill(table);
            InventoryBookmarkGridView.DataSource = table;
            InventoryBookmarkGridView.DataBind();
        }

        protected void SelectAInventoryBookmark(object sender, EventArgs e)
        {
            int InventoryBookmarkID = Convert.ToInt32((sender as LinkButton).CommandArgument);
        }

        protected void AddNewInventoryBookmark(string UPC, string vendor, string URL)
        {
            String InventoryBookmarkConnection = supplier.GetConnectionInfo();

            SqlConnection insertConnection = new SqlConnection(InventoryBookmarkConnection);
            SqlCommand insertEstablishment = new SqlCommand();
            insertEstablishment.Connection = insertConnection;
            insertEstablishment.CommandText = "InsertInventoryBookmark";
            insertEstablishment.CommandType = CommandType.StoredProcedure;

            insertEstablishment.Parameters.AddWithValue("@UPC", UPC);
            insertEstablishment.Parameters.AddWithValue("@Vendor", vendor);
            insertEstablishment.Parameters.AddWithValue("@URL", URL);

            insertConnection.Open();
            insertEstablishment.ExecuteNonQuery();
            InventoryBookmarkGridView.EditIndex = -1;
            PopulateGridView();
            insertConnection.Close();
        }


        protected void UpdateInventoryBookmark(string UPC, string vendor, string URL)
        {
            String InventoryBookmarkConnection = supplier.GetConnectionInfo();

            SqlConnection updateConnection = new SqlConnection(InventoryBookmarkConnection);
            SqlCommand updateEstablishment = new SqlCommand();
            updateEstablishment.Connection = updateConnection;
            updateEstablishment.CommandText = "UpdateInventoryBookmark";
            updateEstablishment.CommandType = CommandType.StoredProcedure;

            updateEstablishment.Parameters.AddWithValue("@UPC", UPC);
            updateEstablishment.Parameters.AddWithValue("@Vendor", vendor);
            updateEstablishment.Parameters.AddWithValue("@URL", URL);

            updateConnection.Open();
            updateEstablishment.ExecuteNonQuery();
            InventoryBookmarkGridView.EditIndex = -1;
            PopulateGridView();
            updateConnection.Close();

        }

        protected void DropDownItems_SelectedIndexChanged(object sender, EventArgs e)
        {
            selectedItem = DropDownItems.SelectedItem.ToString();
            PopulateVendorNametoBookmarkEdit(DropDownItems.SelectedValue);
            PopulateItemstoBookmarkEdit();
            ItemSelected.Text = selectedItem;
        }

        protected void HideUpdateBookmark(object sender, EventArgs e)
        {
            YesToUpdating.Checked = false;
            VendorInfoSection.Visible = true;
            URLPanel.Visible = true;

        }
        protected void HideAddBookmark(object sender, EventArgs e)
        {
            YesToAdding.Checked = false;
            SpecifyAvendor.Visible = true;
            VendorInfoSection.Visible = false;
            URLPanel.Visible = true;
            PopulateVendorNametoBookmarkEdit(DropDownItems.SelectedValue);
        }

        protected void SubmitInventoryBookmark(object sender, EventArgs e)
        {
            bool isAddChecked = YesToAdding.Checked;
            bool isUpdatedChecked = YesToUpdating.Checked;
            string itemSelected = ItemSelected.Text;
            string URLInsertValue = TextBoxUrl.Text;
            string InsertVendor = TextBoxVendor.Text;
            string SelectedVendor = DropDownUpdateVendor.SelectedValue.ToString();
            string productUpc = LookUpIventoryItem(itemSelected);


            if (isAddChecked == true && isUpdatedChecked == false)
            {
                AddNewInventoryBookmark(productUpc, InsertVendor, URLInsertValue);
                PopulateBookMarkGridView();
            }
            else if (isAddChecked == false && isUpdatedChecked == true)
            {
                UpdateInventoryBookmark(productUpc, SelectedVendor, URLInsertValue);
                PopulateBookMarkGridView();
            }

        }

        protected string LookUpIventoryItem(string Name)
        {
            String InventoryBookmarkConnection = supplier.GetConnectionInfo();

            SqlConnection searchConnection = new SqlConnection(InventoryBookmarkConnection);
            SqlCommand findUPCNumber  = new SqlCommand();

            findUPCNumber.Connection = searchConnection;
            findUPCNumber.CommandText = "Select upc from Inventory where name = '" + Name + "'";
            findUPCNumber.CommandType = CommandType.Text;

            searchConnection.Open();
            string UPC = Convert.ToString(findUPCNumber.ExecuteScalar());
            searchConnection.Close();

            return UPC;
        }
    }
}