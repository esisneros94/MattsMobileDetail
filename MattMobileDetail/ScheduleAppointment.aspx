<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="ScheduleAppointment.aspx.cs" Inherits="MattMobileDetail.ScheduleAppointment" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

    <!DOCTYPE html>
    <html>
        <head>
            <style>
                .AppointmentContent{
                    float: right;
                    border: 1px solid black;
                }
            </style>
        </head>
        <body>
            <div id="TotalContent">
                <div id="CustomerContent">
                    First Name <asp:TextBox ID="CustomerFirstName" runat="server"></asp:TextBox> <br/><br/>
                    Last Name <asp:TextBox ID="CustomerLastName" runat="server"></asp:TextBox><br/><br/>
                    City of Residence <asp:TextBox ID="CityOfResidence" runat="server"></asp:TextBox><br/><br/>
                    State of Residence <asp:TextBox ID="StateOfResidence" runat="server"></asp:TextBox><br/><br/>
                    ZIP Code <asp:TextBox ID="ZIPCodeOfResidence" runat="server"></asp:TextBox><br/><br/>
                    Phone Number: <asp:TextBox ID="Phone" runat="server"></asp:TextBox><br/><br/>
                    Email Address: <asp:TextBox ID="Email" runat="server"></asp:TextBox><br/><br/>

                    <asp:Button ID="SaveCustomerInfo" runat="server" text="Proceed to Appointment Details"/>
                </div>
                <div id="AppointmentContent" class="AppointmentContent">
                    Proposed Appointment Date: <asp:TextBox ID="DateSelected" runat="server"></asp:TextBox>&nbsp<asp:ImageButton ID="CalendarLogo" runat="server" Height="20px" ImageUrl="~/Pictures/CalendarImage.png" Width="20px" OnClick="ToggleCalendarControl" />
                    
                    
                    <asp:Calendar ID="AppointmentDate" runat="server" OnSelectionChanged="SaveDateToTextBox"></asp:Calendar><br /><br />
                    Proposed Appointment Hour: <asp:DropDownList ID="AppointmentHour" runat="server"></asp:DropDownList><br /><br />
                    Proposed Appointment Minute: <asp:DropDownList ID="AppointmentMinute" runat="server"></asp:DropDownList><br /><br />
                    AM/PM: <asp:DropDownList ID="AppointmentDayPart" runat="server"></asp:DropDownList><br /><br />

                    Where would you like the service done? <br />
                    Service Address: <asp:TextBox ID="ServiceAddress" runat="server"></asp:TextBox><br/><br/>
                    Service City: <asp:TextBox ID="ServiceCity" runat="server"></asp:TextBox><br/><br/>
                    Service State: <asp:TextBox ID="ServiceState" runat="server"></asp:TextBox><br/><br/>
                    Service ZIP: <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox><br/><br/>

                </div>
            </div>
        </body>
    </html>


</asp:Content>
