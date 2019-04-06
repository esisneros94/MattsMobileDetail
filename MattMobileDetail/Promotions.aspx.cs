using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace MattMobileDetail
{
    public partial class Promotions : System.Web.UI.Page
    {

        protected void Page_Load(object sender, EventArgs e)
        {
            DataSupplier supplier = new DataSupplier();
            String connection = supplier.GetConnectionInfo();

            using (SqlConnection con = new SqlConnection(connection))
            {
                SqlCommand RetrievePromotations = new SqlCommand("Select PromotionID, Name From Promotions Where EndDate >= cast(getdate() as Date) or (EndDate is null) order by Name");
                RetrievePromotations.Connection = con;
                RetrievePromotations.CommandType = System.Data.CommandType.Text;
                con.Open();

                PromotionsDropDown.DataSource = RetrievePromotations.ExecuteReader();
                PromotionsDropDown.DataTextField = "Name";
                PromotionsDropDown.DataValueField = "PromotionID";
                PromotionsDropDown.DataBind();

            }

            RetrievePromotionInfo(PromotionsDropDown.SelectedValue);

        }
        protected void RetrievePromotionInfo(string PromotionID)
        {
            DataSupplier supplier = new DataSupplier();
            String PromotionConnection = supplier.GetConnectionInfo();

            SqlConnection dbConnection = new SqlConnection(PromotionConnection);
            SqlCommand command = new SqlCommand("Select PromotionID, Name, Description, StartDate, EndDate From Promotions Where PromotionID = '" + PromotionID + "';");
            command.Connection = dbConnection;
            command.CommandType = System.Data.CommandType.Text;
            dbConnection.Open();

            SqlDataReader PromotionInfo = command.ExecuteReader();

            while (PromotionInfo.Read())
            {
                EditPromotionName.Text = PromotionInfo["Name"].ToString();
                EditPromotionStartDate.Text = PromotionInfo["StartDate"].ToString();
                EditPromotionEndDate.Text = PromotionInfo["EndDate"].ToString();
                EditPromotionDescription.Text = PromotionInfo["Description"].ToString();
                
            }

            dbConnection.Close();


        }
    }
}