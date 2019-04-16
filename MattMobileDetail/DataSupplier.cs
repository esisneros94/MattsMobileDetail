
using System;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;

namespace MattMobileDetail
{

    public class DataSupplier
    {

        public string GetConnectionInfo()
        {
            string connection = ConfigurationManager.ConnectionStrings["RemoteConnection"].ConnectionString;

            return connection;
        }
        public string GetWebUserConnectInfo()
        {
            string connection = ConfigurationManager.ConnectionStrings["WebUserWemoteConnection"].ConnectionString;

            return connection;
        }

        public SqlDataReader GetPromotions()
        {
            var supplier = new DataSupplier();
            var connection = supplier.GetConnectionInfo();
           
            SqlConnection PromotionsConnection = new SqlConnection(connection);
            SqlCommand RetrievePromotionsInfo = new SqlCommand();
            RetrievePromotionsInfo.Connection = PromotionsConnection;

            RetrievePromotionsInfo.CommandText = "Select Name from Promotions where Startdate <= cast(getdate() as date) and EndDate is null";
            RetrievePromotionsInfo.CommandType = CommandType.Text;

            PromotionsConnection.Open();
            SqlDataReader PromotionsResults = RetrievePromotionsInfo.ExecuteReader();


            return PromotionsResults;
        }
    }
}




