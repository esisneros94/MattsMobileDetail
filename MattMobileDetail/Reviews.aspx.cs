using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace MattMobileDetail
{
    public partial class Reviews : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void ScheduleAppt_Click(object sender, EventArgs e)
        {
            Response.Redirect("ScheduleAppointment.aspx");
        }
    }
}