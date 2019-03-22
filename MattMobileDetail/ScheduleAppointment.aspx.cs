using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace MattMobileDetail
{
    public partial class ScheduleAppointment : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                AppointmentDate.Visible = false;
            }
        }

        protected void ToggleCalendarControl(object sender, EventArgs e)
        {

            if (AppointmentDate.Visible == false)
            {
                AppointmentDate.Visible = true;
            }
            else
            {
                AppointmentDate.Visible = false;
            }
            
        }

        protected void SaveDateToTextBox(object sender, EventArgs e)
        {
            DateSelected.Text = AppointmentDate.SelectedDate.ToShortDateString();
            AppointmentDate.Visible = false;
        }
    }
}