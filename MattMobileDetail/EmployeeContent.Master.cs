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
            FormsAuthentication.SignOut();
            HttpContext.Current.Session.Abandon();
            FormsAuthentication.SignOut();
            FormsAuthentication.RedirectToLoginPage("~/Non-Members/Login");

            Response.Cache.SetCacheability(HttpCacheability.NoCache);
            Response.Cache.SetExpires(DateTime.UtcNow.AddHours(-1));
            Response.Cache.SetNoStore();

            //----------
            //HttpContext context = HttpContext.Current;
            //overwrite the authentication cookie
            //FormsAuthenticationTicket ticket = new FormsAuthenticationTicket(1, context.User.Identity.Name, DateTime.Now, DateTime.Now.AddDays(-1), false, Guid.NewGuid().ToString());
            //string encrypted_ticket = FormsAuthentication.Encrypt(ticket);

            //HttpCookie cookie = new HttpCookie(FormsAuthentication.FormsCookieName, encrypted_ticket);
            //cookie.Expires = ticket.Expiration;
            //context.Response.Cookies.Add(cookie);

            //clear all the sessions
            //context.Session.Abandon();

            //sign out and go to the login page
            //FormsAuthentication.SignOut();
            //FormsAuthentication.RedirectToLoginPage();
        }
    }
}