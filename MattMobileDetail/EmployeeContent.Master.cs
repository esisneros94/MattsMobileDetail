using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.Security;

namespace MattMobileDetail
{
    public partial class EmployeeContent : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btLogout_Click(object sender, EventArgs e)
        {
            Session.Clear();
            Session.Abandon();
            HttpContext.Current.Session.Abandon();
            Response.Redirect("~/Non-Members/Login");

            Response.Cache.SetCacheability(HttpCacheability.NoCache);
            Response.Cache.SetExpires(DateTime.UtcNow.AddHours(-1));
            Response.Cache.SetNoStore();
        }
    }
}