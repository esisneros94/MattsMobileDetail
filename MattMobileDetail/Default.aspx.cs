using MattMobileDetail;
using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace MattMobileDetail
{
    public partial class _Default : Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            var supplier = new DataSupplier();
            var connection = supplier.GetWebUserConnectInfo();

            SqlConnection Connection = new SqlConnection(connection);
            DataSupplier DataHolder = new DataSupplier();

            var results = supplier.GetPromotions();


            if (results.HasRows)
            {
                while (results.Read())
                {
                    Label label = new Label();
                    label.Text = (results["Name"].ToString());

                    PromotionsSpace.Controls.Add(label);
                    PromotionsSpace.Controls.Add(new LiteralControl("<br />"));

                }
            }
        }

        protected void RedirectToScheduleAppointment(object sender, EventArgs e)
        {
            Response.Redirect("ScheduleAppointment.aspx");
        }

        protected void btFacebook_Click(object sender, ImageClickEventArgs e)
        {
            Response.Redirect("https://www.facebook.com/MattsMobileDetailingABQ/");
        }

        protected void ntInstagram_Click(object sender, ImageClickEventArgs e)
        {
            Response.Redirect("https://www.instagram.com/matts_mobile_detail/");
        }

        protected void btSnapchat_Click(object sender, ImageClickEventArgs e)
        {
            //Response.Redirect("snapchat.com/add/mo9omick");
        }
    }
}