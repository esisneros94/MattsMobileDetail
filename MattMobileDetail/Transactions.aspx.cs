using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace MattMobileDetail
{
    public partial class Transactions : System.Web.UI.Page
    {
        DataSupplier supplier = new DataSupplier();

        protected void Page_Load(object sender, EventArgs e)
        {
            bool indicator = supplier.VerifyAuthFromCookie(Request.Cookies["userInfo"]);
            if (indicator == false)
            {
                Response.Redirect("Login.aspx");
            }

        }
    }
}