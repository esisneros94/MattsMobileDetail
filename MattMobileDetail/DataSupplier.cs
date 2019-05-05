
using System;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Web;

namespace MattMobileDetail
{

    public class DataSupplier
    {

        public string GetConnectionInfo()
        {
            string connection = ConfigurationManager.ConnectionStrings["MobileDetailOwner"].ConnectionString;

            return connection;
        }
        public string GetWebUserConnectInfo()
        {
            string connection = ConfigurationManager.ConnectionStrings["WebUserRemoteConnection"].ConnectionString;

            return connection;
        }

        public SqlDataReader GetPromotions()
        {
            var supplier = new DataSupplier();
            var connection = supplier.GetWebUserConnectInfo();
           
            SqlConnection PromotionsConnection = new SqlConnection(connection);
            SqlCommand RetrievePromotionsInfo = new SqlCommand();
            RetrievePromotionsInfo.Connection = PromotionsConnection;

            RetrievePromotionsInfo.CommandText = "Select Name from Promotions where Startdate <= cast(getdate() as date) and EndDate is null";
            RetrievePromotionsInfo.CommandType = CommandType.Text;

            PromotionsConnection.Open();
            SqlDataReader PromotionsResults = RetrievePromotionsInfo.ExecuteReader();


            return PromotionsResults;
        }

        public bool VerifyAuthFromCookie(HttpCookie cookie)
        {
            bool indicator = false;

            string isAuth = cookie["auth"];
            if(isAuth != "Yes")
            {
                indicator = false;
            }
            else
            {
                indicator = true;
            }

            return indicator;
        }
    }
}




