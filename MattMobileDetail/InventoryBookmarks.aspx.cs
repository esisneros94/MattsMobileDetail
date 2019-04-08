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
    public partial class InventoryBookmarks : System.Web.UI.Page
    {
        DataSupplier supplier = new DataSupplier();


        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                PopulateGridView();
            }

        }

        private void PopulateGridView()
        {
            String InventoryBookmarkConnection = supplier.GetConnectionInfo();

            SqlConnection dbConnection = new SqlConnection(InventoryBookmarkConnection);

            dbConnection.Open();
            SqlDataAdapter InventoryBookmarkInfo = new SqlDataAdapter("Select Inventory.UPC, Inventory.Name, InventoryBookmark.Vendor, InventoryBookmark.URL From Inventory, InventoryBookmark", dbConnection);
            DataTable table = new DataTable();
            InventoryBookmarkInfo.Fill(table);
            InventoryBookmarkGridView.DataSource = table;
            InventoryBookmarkGridView.DataBind();
        }

        protected void SelectAInventoryBookmark(object sender, EventArgs e)
        {
            int InventoryBookmarkID = Convert.ToInt32((sender as LinkButton).CommandArgument);
        }

        protected void InventoryBookmarkGridView_RowCommand(object sender, GridViewCommandEventArgs e)
        {


            if (e.CommandName.Equals("AddNew"))
            {
                String InventoryBookmarkConnection = supplier.GetConnectionInfo();

                using (SqlConnection conn = new SqlConnection(InventoryBookmarkConnection))
                {
                    conn.Open();
                    String Query = "Insert into InventoryBookmark(UPC, Name, Vendor, URL) VALUES (@UPC, @Name, @Vendor, @URL)";
                    SqlCommand cmd = new SqlCommand(Query, conn);
                    cmd.Parameters.AddWithValue("@UPC", (InventoryBookmarkGridView.FooterRow.FindControl("NewInventoryUPC") as TextBox).Text.Trim());
                    cmd.Parameters.AddWithValue("@Name", (InventoryBookmarkGridView.FooterRow.FindControl("NewInventoryName") as TextBox).Text.Trim());
                    cmd.Parameters.AddWithValue("@Vendor", (InventoryBookmarkGridView.FooterRow.FindControl("NewInventoryBookmarkVendor") as TextBox).Text.Trim());
                    cmd.Parameters.AddWithValue("@URL", (InventoryBookmarkGridView.FooterRow.FindControl("NewInventoryBookmarkURL") as TextBox).Text.Trim());

                    cmd.ExecuteNonQuery();
                    PopulateGridView();
                    lblSucess.Text = "Insert successful";
                    lblError.Text = "";

                }
            }
        }

        protected void InventoryBookmarkGridView_RowEditing(object sender, GridViewEditEventArgs e)
        {
            InventoryBookmarkGridView.EditIndex = e.NewEditIndex;
            PopulateGridView();
        }

        protected void InventoryBookmarkGridView_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
        {
            InventoryBookmarkGridView.EditIndex = -1;
            PopulateGridView();
        }

        protected void InventoryBookmarkGridView_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {
            String InventoryBookmarkConnection = supplier.GetConnectionInfo();

            SqlConnection updateConnection = new SqlConnection(InventoryBookmarkConnection);
            SqlCommand updateEstablishment = new SqlCommand();
            updateEstablishment.Connection = updateConnection;
            updateEstablishment.CommandText = "UpdateInventoryBookmarkRecord";
            updateEstablishment.CommandType = CommandType.StoredProcedure;

            updateEstablishment.Parameters.AddWithValue("@UPC", (InventoryBookmarkGridView.Rows[e.RowIndex].FindControl("txtBoxInventorykUPC") as TextBox).Text.Trim());
            updateEstablishment.Parameters.AddWithValue("@Name", (InventoryBookmarkGridView.Rows[e.RowIndex].FindControl("txtBoxInventorykName") as TextBox).Text.Trim());
            updateEstablishment.Parameters.AddWithValue("@Vendor", (InventoryBookmarkGridView.Rows[e.RowIndex].FindControl("TextBoxInventoryBookmarkVendor") as TextBox).Text.Trim());
            updateEstablishment.Parameters.AddWithValue("@URL", (InventoryBookmarkGridView.Rows[e.RowIndex].FindControl("txtBoxInventoryBookmarkURL") as TextBox).Text.Trim());
            //updateEstablishment.Parameters.AddWithValue("@InventoryBookmarkID", Convert.ToInt32(InventoryBookmarkGridView.DataKeys[e.RowIndex].Value.ToString()));

            updateConnection.Open();
            updateEstablishment.ExecuteNonQuery();
            InventoryBookmarkGridView.EditIndex = -1;
            PopulateGridView();
            lblSucess.Text = "Row Updated";
            lblError.Text = "";
            updateConnection.Close();

        }
    }
}