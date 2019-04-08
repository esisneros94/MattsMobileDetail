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
    

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                PopulateGridView();
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

        protected void SelectAInventory(object sender, EventArgs e)
        {
            int InventoryID = Convert.ToInt32((sender as LinkButton).CommandArgument);
        }

        protected void InventoryGridView_RowCommand(object sender, GridViewCommandEventArgs e)
        {


            if (e.CommandName.Equals("AddNew"))
            {
                String InventoryConnection = supplier.GetConnectionInfo();

                using (SqlConnection conn = new SqlConnection(InventoryConnection))
                {
                    conn.Open();
                    String Query = "Insert into Inventory(UPC, Name, Description, IsForSale, Quantity, StartDate, EndDate) VALUES (@UPC, @Name, @Description, @IsForSale, @Quantity, @StartDate, @EndDate)";
                    SqlCommand cmd = new SqlCommand(Query, conn);
                    cmd.Parameters.AddWithValue("@UPC", (InventoryGridView.FooterRow.FindControl("NewInventoryUPC") as TextBox).Text.Trim());
                    cmd.Parameters.AddWithValue("@Name", (InventoryGridView.FooterRow.FindControl("NewInventoryName") as TextBox).Text.Trim());
                    cmd.Parameters.AddWithValue("@Description", (InventoryGridView.FooterRow.FindControl("NewInventoryDescr") as TextBox).Text.Trim());
                    cmd.Parameters.AddWithValue("@IsForSale", (InventoryGridView.FooterRow.FindControl("NewInventoryForSale") as TextBox).Text.Trim());
                    cmd.Parameters.AddWithValue("@Quantity", (InventoryGridView.FooterRow.FindControl("NewInventoryQuantity") as TextBox).Text.Trim());
                    cmd.Parameters.AddWithValue("@StartDate", (InventoryGridView.FooterRow.FindControl("NewStartDate") as TextBox).Text.Trim());
                    cmd.Parameters.AddWithValue("@EndDate", (InventoryGridView.FooterRow.FindControl("NewInventoryEnd") as TextBox).Text.Trim());

                    cmd.ExecuteNonQuery();
                    PopulateGridView();
                    lblSucess.Text = "Insert successful";
                    lblError.Text = "";

                }
            }
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
            updateEstablishment.CommandText = "UpdateInventoryRecord";
            updateEstablishment.CommandType = CommandType.StoredProcedure;

            updateEstablishment.Parameters.AddWithValue("@UPC", (InventoryGridView.Rows[e.RowIndex].FindControl("txtBoxInventoryUPC") as TextBox).Text.Trim());
            updateEstablishment.Parameters.AddWithValue("@Name", (InventoryGridView.Rows[e.RowIndex].FindControl("txtBoxInventoryName") as TextBox).Text.Trim());
            updateEstablishment.Parameters.AddWithValue("@Description", (InventoryGridView.Rows[e.RowIndex].FindControl("TextBoxInventoryDescription") as TextBox).Text.Trim());
            updateEstablishment.Parameters.AddWithValue("@IsForSale", (InventoryGridView.Rows[e.RowIndex].FindControl("txtBoxInventoryForSale") as TextBox).Text.Trim());
            updateEstablishment.Parameters.AddWithValue("@Quantity", (InventoryGridView.Rows[e.RowIndex].FindControl("txtBoxInventoryQuantity") as TextBox).Text.Trim());
            updateEstablishment.Parameters.AddWithValue("@StartDate", (InventoryGridView.Rows[e.RowIndex].FindControl("TextBoxInventoryStart") as TextBox).Text.Trim());
            updateEstablishment.Parameters.AddWithValue("@EndDate", (InventoryGridView.Rows[e.RowIndex].FindControl("TextBoxInventoryEnd") as TextBox).Text.Trim());
            //updateEstablishment.Parameters.AddWithValue("@InventoryID", Convert.ToInt32(InventoryGridView.DataKeys[e.RowIndex].Value.ToString()));

            updateConnection.Open();
            updateEstablishment.ExecuteNonQuery();
            InventoryGridView.EditIndex = -1;
            PopulateGridView();
            lblSucess.Text = "Row Updated";
            lblError.Text = "";
            updateConnection.Close();

        }
    }
}