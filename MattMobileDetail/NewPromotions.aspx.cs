﻿using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace MattMobileDetail
{
    public partial class NewPromotions : System.Web.UI.Page
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
            String PromotionConnection = supplier.GetConnectionInfo();

            SqlConnection dbConnection = new SqlConnection(PromotionConnection);
            SqlCommand PopulatePromotions = new SqlCommand();
            PopulatePromotions.Connection = dbConnection;
            PopulatePromotions.CommandText = "exec PopulatePromotionsTable";
            PopulatePromotions.CommandType = CommandType.Text;

            dbConnection.Open();
            SqlDataAdapter PromotionInfo = new SqlDataAdapter(PopulatePromotions.CommandText, dbConnection);
            DataTable table = new DataTable();
            PromotionInfo.Fill(table);
            PromotionGridView.DataSource = table;
            PromotionGridView.DataBind();
        }

        protected void SelectAPromotion(object sender, EventArgs e)
        {
            int PromotionID = Convert.ToInt32((sender as LinkButton).CommandArgument);
        }

        protected void PromotionGridView_RowCommand(object sender, GridViewCommandEventArgs e)
        {


            if (e.CommandName.Equals("AddNew"))
            {
                String PromotionConnection = supplier.GetConnectionInfo();

                SqlConnection InsertConnection = new SqlConnection(PromotionConnection);
                SqlCommand InsertPromotion = new SqlCommand();
                InsertPromotion.Connection = InsertConnection;
                InsertPromotion.CommandText = "InsertNewPromotion";
                InsertPromotion.CommandType = CommandType.StoredProcedure;

                InsertPromotion.Parameters.AddWithValue("@Name", (PromotionGridView.FooterRow.FindControl("NewPromotionName") as TextBox).Text.Trim());
                InsertPromotion.Parameters.AddWithValue("@Description", (PromotionGridView.FooterRow.FindControl("NewPromotionDescr") as TextBox).Text.Trim());
                InsertPromotion.Parameters.AddWithValue("@StartDate", (PromotionGridView.FooterRow.FindControl("NewStartDate") as TextBox).Text.Trim());
                InsertPromotion.Parameters.AddWithValue("@EndDate", (PromotionGridView.FooterRow.FindControl("NewPromotionEnd") as TextBox).Text.Trim());

                InsertConnection.Open();
                InsertPromotion.ExecuteNonQuery();
                InsertConnection.Close();
                PopulateGridView();
                lblSucess.Text = "Insert successful";
                lblError.Text = "";


            }
        }

        protected void PromotionGridView_RowEditing(object sender, GridViewEditEventArgs e)
        {
            PromotionGridView.EditIndex = e.NewEditIndex;
            PopulateGridView();
        }

        protected void PromotionGridView_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
        {
            PromotionGridView.EditIndex = -1;
            PopulateGridView();
        }

        protected void PromotionGridView_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {
            String PromotionConnection = supplier.GetConnectionInfo();

            SqlConnection updateConnection = new SqlConnection(PromotionConnection);
            SqlCommand updateEstablishment = new SqlCommand();
            updateEstablishment.Connection = updateConnection;
            updateEstablishment.CommandText = "UpdatePromotionRecord";
            updateEstablishment.CommandType = CommandType.StoredProcedure;

            updateEstablishment.Parameters.AddWithValue("@Name", (PromotionGridView.Rows[e.RowIndex].FindControl("txtBoxPromotionName") as TextBox).Text.Trim());
            updateEstablishment.Parameters.AddWithValue("@Description", (PromotionGridView.Rows[e.RowIndex].FindControl("TextBoxPromotionDescription") as TextBox).Text.Trim());
            updateEstablishment.Parameters.AddWithValue("@StartDate", (PromotionGridView.Rows[e.RowIndex].FindControl("TextBoxPromotionStart") as TextBox).Text.Trim());
            updateEstablishment.Parameters.AddWithValue("@EndDate", (PromotionGridView.Rows[e.RowIndex].FindControl("TextBoxPromotionEnd") as TextBox).Text.Trim());
            updateEstablishment.Parameters.AddWithValue("@PromotionID", Convert.ToInt32(PromotionGridView.DataKeys[e.RowIndex].Value.ToString()));

            updateConnection.Open();
            updateEstablishment.ExecuteNonQuery();
            PromotionGridView.EditIndex = -1;
            PopulateGridView();
            lblSucess.Text = "Row Updated";
            lblError.Text = "";
            updateConnection.Close();

        }
    }
}