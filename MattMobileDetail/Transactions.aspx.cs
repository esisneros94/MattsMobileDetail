using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace MattMobileDetail
{
    public partial class Transactions : System.Web.UI.Page
    {
        DataSupplier supplier = new DataSupplier();

        public List<TransactionItem> Items
        {
            get
            {
                if (HttpContext.Current.Session["Items"] == null)
                {
                    HttpContext.Current.Session["Items"] = new List<TransactionItem>();
                }
                return HttpContext.Current.Session["Items"] as List<TransactionItem>;
            }
            set
            {
                HttpContext.Current.Session["Items"] = value;
            }

        }



        protected void Page_Load(object sender, EventArgs e)
        {
            bool indicator = supplier.VerifyAuthFromCookie(Request.Cookies["userInfo"]);
            if (indicator == false)
            {
                Response.Redirect("Login.aspx");
            }

            if (!IsPostBack)
            {
              Session["ItemsList"] = new List<TransactionItem>();
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

        protected void CalendarLogo_Click(object sender, ImageClickEventArgs e)
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

        protected void SearchForAppointment(object sender, EventArgs e)
        {
            String AppointmentSearchConnection = supplier.GetConnectionInfo();

            SqlConnection SearchConnection = new SqlConnection(AppointmentSearchConnection);
            SqlCommand SearchForAppointment = new SqlCommand();
            SearchForAppointment.Connection = SearchConnection;
            SearchForAppointment.CommandText = "FindAppointmentInfo";
            SearchForAppointment.CommandType = CommandType.StoredProcedure;

            SearchForAppointment.Parameters.AddWithValue("@FirstName", CustomerFirstName.Text);
            SearchForAppointment.Parameters.AddWithValue("@LastName", CustomerLastName.Text);
            SearchForAppointment.Parameters.AddWithValue("@AppointmentDate", DateSelected.Text);

            SqlDataReader dr;


            SearchConnection.Open();
            dr = SearchForAppointment.ExecuteReader();

            if (dr.HasRows)
            {
                dr.Read();
                AppointmentNumberFind.Text = dr[0].ToString();
                CustomerFirstFind.Text = dr[1].ToString();
                CustomerLastFind.Text = dr[2].ToString();
                PhoneFind.Text = dr[3].ToString();
                EmailFind.Text = dr[4].ToString();
            }
            
            SearchConnection.Close();
        }

        protected void ConfirmAppointment_Click(object sender, EventArgs e)
        {
            if(AppointmentNumberFind.Text == "" )
            {
                return;
            }

            AdditionsToAppointment.Visible = true;
            PopulateProducts();
            PopulateServices();
        }

        private void PopulateServices()
        {
            String ServicesConnection = supplier.GetConnectionInfo();

            SqlConnection dbConnection = new SqlConnection(ServicesConnection);
            dbConnection.Open();
            SqlDataAdapter ActiveServices = new SqlDataAdapter("select ServiceID, Name from Services where StartDate <= cast(getdate() as date)", dbConnection);
            DataTable table = new DataTable();
            ActiveServices.Fill(table);
            ServicesToAdd.DataSource = table;
            ServicesToAdd.DataBind();
            ServicesToAdd.DataTextField = "Name";
            ServicesToAdd.DataValueField = "ServiceID";
            ServicesToAdd.DataBind();
            ServicesToAdd.Items.Insert(0, new ListItem("Please Select. . . ", "0"));

        }


        private void PopulateProducts()
        {
            String ServicesConnection = supplier.GetConnectionInfo();

            SqlConnection dbConnection = new SqlConnection(ServicesConnection);
            dbConnection.Open();
            SqlDataAdapter ActiveProducts = new SqlDataAdapter("select Name, UPC from Inventory where StartDate <= cast(getdate() as date) and IsForSale = 1", dbConnection);
            DataTable table = new DataTable();
            ActiveProducts.Fill(table);
            ProductsToAdd.DataSource = table;
            ProductsToAdd.DataBind();
            ProductsToAdd.DataTextField = "Name";
            ProductsToAdd.DataValueField = "UPC";
            ProductsToAdd.DataBind();
            ProductsToAdd.Items.Insert(0, new ListItem("Please Select. . . ", "0"));

        }

        public void GetActivePromotions()
        {
            String PromotionsConnection = supplier.GetConnectionInfo();

            SqlConnection dbConnection = new SqlConnection(PromotionsConnection);
            dbConnection.Open();
            SqlDataAdapter ActivePromotions = new SqlDataAdapter("Select PromotionID, Name from Promotions where Startdate <= cast(getdate() as date) and EndDate is null", dbConnection);
            DataTable table = new DataTable();
            ActivePromotions.Fill(table);
            PromotionalDropDown.DataSource = table;
            PromotionalDropDown.DataBind();
            PromotionalDropDown.DataTextField = "Name";
            PromotionalDropDown.DataValueField = "PromotionID";
            PromotionalDropDown.DataBind();
            PromotionalDropDown.Items.Insert(0, new ListItem("Please Select. . . ", "0"));



        }

        protected void ShowProduct_CheckedChanged(object sender, EventArgs e)
        {
            AddingAService.Visible = false;
            ServiceInfo.Visible = false;
            ProductInfo.Visible = true;
            PanelBox.Visible = true;

        }

        protected void ShowServices_CheckedChanged(object sender, EventArgs e)
        {
            AddingAProduct.Visible = false;
            ServiceInfo.Visible = true;
            ProductInfo.Visible = false;
            PanelBox.Visible = true;
        }

        protected void AddItemToTransaction_Click(object sender, EventArgs e)
        {

            if (ShowProduct.Checked == true)
            {
                Items.Add(new TransactionItem(ProductsToAdd.SelectedValue.ToString(), ProductsToAdd.SelectedItem.Text.ToString(), "Product", Int32.Parse(ProductQuantity.SelectedValue.ToString())));
            }
            if (ShowServices.Checked == true)
            {
                Items.Add(new TransactionItem(ServicesToAdd.SelectedValue.ToString(), ServicesToAdd.SelectedItem.Text.ToString(), "Service", Int32.Parse(ServiceQuantity.SelectedValue.ToString())));
            }

        }
            

        protected void AddAnother_Click(object sender, EventArgs e)
        {
            AddingAService.Visible = true;
            AddingAProduct.Visible = true;
            ShowServices.Checked = false;
            ShowProduct.Checked = false;

            ServiceInfo.Visible = false;
            ProductInfo.Visible = false;
            PanelBox.Visible = false;

        }

        private void ListItems()
        {
            ItemsListing.InnerHtml = null;

            foreach (TransactionItem things in Items)
            {
                ItemsListing.InnerHtml += "<b>Item:</b>"+ things.Name + "<br/>";
            }
        }

        protected void FinishedAddingItems_Click(object sender, EventArgs e)
        {
            AdditionsToAppointment.Visible = false;
            PromotionalInfo.Visible = true;
            ListItems();


            GetActivePromotions();
        }

        protected void AddPromotion_Click(object sender, EventArgs e)
        {
            PromotionControls.Visible = false;
            ListItems();
            PromotionListing.InnerHtml = "<b>Promotion:</b>" + PromotionalDropDown.SelectedItem.ToString();
        }
    }
}