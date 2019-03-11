
using System;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;

namespace BarTracker
{

    public class DataSupplier
    {

        public string GetConnectionInfo()
        {
            string connection = ConfigurationManager.ConnectionStrings["MobileDetailConnection"].ConnectionString;

            return connection;
        }
    }
}




