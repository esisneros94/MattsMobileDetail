<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="ScheduleAppointment.aspx.cs" Inherits="MattMobileDetail.ScheduleAppointment" ValidateRequest="true" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

    <!DOCTYPE html>
    <html>
    <head>
        <style>
            .AppointmentContent {
                height: 250px;
                background-color: lightblue;
            }

            .ErrorMessage {
                color: red;
            }

            .ButtonWrapper {
                display: flex;
                align-items: center;
                justify-content: center;
                width: 100%;
            }

            .Button {
                width: 100%;
                height: 50px;
                border-radius: 12px;
                transition-duration: 0.4s;
                background-color: green;
                color: white;
                align-content: center;
            }

                .Button:hover {
                    background-color: dodgerblue;
                    color: white;
                }
        </style>
    </head>
    <body>
        <div class="container" style="border: 1px solid black; margin: 20px 0px; background-color: lightgrey">
            <div class="row">
                <div class="col-lg-5">
                    <div id="CustomerContent2">
                        <h3>Tell Us About You</h3>
                        First Name
                        <asp:TextBox ID="FirstName" runat="server" Style="margin-left: 50px;"></asp:TextBox>
                        <asp:RequiredFieldValidator runat="server" ControlToValidate="FirstName" ID="ReqFirstName" ErrorMessage="Please enter a first name!" CssClass="ErrorMessage"/>
                        <br />
                        <br />
                        Last Name
                        <asp:TextBox ID="LastName" runat="server" Style="margin-left: 50px;"></asp:TextBox>
                        <asp:RequiredFieldValidator runat="server" ControlToValidate="LastName" ID="ReqLastName" ErrorMessage="Please enter a last name" CssClass="ErrorMessage" />
                        <br />
                        <br />
                        City of Residence
                        <asp:TextBox ID="CityOfResidence" runat="server" Style="margin-left: 10px;"></asp:TextBox>
                        <asp:RequiredFieldValidator runat="server" ControlToValidate="CityOfResidence" ID="ReqCity" ErrorMessage="Please enter a city" CssClass="ErrorMessage" />
                        <br />
                        <br />
                        State of Residence
                        <asp:TextBox ID="CustomerState" runat="server" Style="margin-left: 5px;"></asp:TextBox>
                        <asp:RequiredFieldValidator runat="server" ControlToValidate="CustomerState" ID="ReqCustomerState" ErrorMessage="Please enter a State" CssClass="ErrorMessage" />
                        <br />
                        <br />
                        ZIP Code
                        <asp:TextBox ID="CustomerZipCode" runat="server" Style="margin-left: 60px;"></asp:TextBox>
                        <asp:RequiredFieldValidator runat="server" ControlToValidate="CustomerZipCode" ID="ReqCustomerZip" ErrorMessage="Please enter a ZIP Code" CssClass="ErrorMessage" />
                        <br />
                        <br />
                        Phone Number:
                        <asp:TextBox ID="PhoneNumber" runat="server" Style="margin-left: 30px;"></asp:TextBox>
                        <asp:RequiredFieldValidator runat="server" ControlToValidate="PhoneNumber" ID="ReqPhoneNumber" ErrorMessage="Please enter your phone number" CssClass="ErrorMessage" />
                        <br />
                        <br />
                        Email Address:
                        <asp:TextBox ID="EmailAddress" runat="server" Style="margin-left: 30px;"></asp:TextBox>
                        <asp:RequiredFieldValidator runat="server" ControlToValidate="EmailAddress" ID="ReqEmail" ErrorMessage="Please enter an email" CssClass="ErrorMessage" />
                        <br />
                        <br />

                        Previous Customer?
                        <asp:CheckBox runat="server" ID="IsPreviousCustomer" oncheckedchanged="DisplayReturningCustomerCars" AutoPostBack="true"/>
                        

                    </div>

                </div>

                <div class="col-md-2">
                </div>
                <div class="col-md-5">
                    <div id="CarInfo">
                        <h3>What Kind of Car Will We Be Working On?</h3>

                        <asp:PlaceHolder ID="PreviousCustomerVehicles" runat="server" Visible="false">

                        Your Previous Cars: <asp:DropDownList ID="PreviousCarList" runat="server" />
                            <br />
                            <br />

                        </asp:PlaceHolder>

                        Year:
                        <asp:TextBox ID="CarYear" runat="server"> </asp:TextBox>
                        <asp:RequiredFieldValidator runat="server" ControlToValidate="CarYear" ID="ReqCarYear" ErrorMessage="Please enter the year of your car" CssClass="ErrorMessage" />
                        <br />
                        <br />

                        Make:
                        <asp:TextBox ID="CarMake" runat="server"> </asp:TextBox>
                        <asp:RequiredFieldValidator runat="server" ControlToValidate="CarMake" ID="ReqCarMake" ErrorMessage="Please enter the make of your car" CssClass="ErrorMessage" />
                        <br />
                        <br />
                        Model:
                        <asp:TextBox ID="CarModel" runat="server"> </asp:TextBox>
                        <asp:RequiredFieldValidator runat="server" ControlToValidate="CarModel" ID="ReqCarModel" ErrorMessage="Please enter the model of your car" CssClass="ErrorMessage" />
                        <br />
                        <br />
                        Color:
                        <asp:TextBox ID="CarColor" runat="server"> </asp:TextBox>
                        <asp:RequiredFieldValidator runat="server" ControlToValidate="CarColor" ID="ReqCarColor" ErrorMessage="Please enter the color of your car" CssClass="ErrorMessage" />
                        <br />
                        <br />
                        License Plate Number:
                        <asp:TextBox ID="CarLicensePlateNumber" runat="server"> </asp:TextBox><br />
                        <asp:RequiredFieldValidator runat="server" ControlToValidate="CarLicensePlateNumber" ID="ReqLicensePlate" ErrorMessage="Please enter your car's license plate number" CssClass="ErrorMessage" />
                        <br />
                        <br />
                        License Plate State:
                        <asp:TextBox ID="LicensePlateState" runat="server"> </asp:TextBox><br />
                        <asp:RequiredFieldValidator runat="server" ControlToValidate="LicensePlateState" ID="ReqLicensePlateState" ErrorMessage="Please enter your license plate state" CssClass="ErrorMessage" />

                    </div>

                </div>
            </div>
        </div>
        <div id="ButtonWrapper" class="ButtonWrapper">
            <asp:Button ID="ProceedAppointmentButton" runat="server" Text="Proceed to Appointment Details" CssClass="Button" OnClick="ProceedAppointmentButtonClick" />
        </div>

        <br />
        <div class="container">
            <div id="appointmentRow" class="row">
                <asp:Panel ID="AppointmentInfo" runat="server">

                    <div id="AppointmentContent" class="col-md-6 AppointmentContent">
                        <h3>Proposed Appointment Time</h3>
                        Proposed Appointment Date:
                        <asp:TextBox ID="DateSelected" runat="server"></asp:TextBox>&nbsp<asp:ImageButton ID="CalendarLogo" runat="server" Height="20px" ImageUrl="~/Pictures/CalendarImage.png" Width="20px" OnClick="ToggleCalendarControl" CausesValidation="false" />
                        <asp:Calendar ID="AppointmentDate" BackColor="White" runat="server" OnSelectionChanged="SaveDateToTextBox"></asp:Calendar><br />
                        <asp:RequiredFieldValidator runat="server" ControlToValidate="DateSelected" ID="ReqAppointmentDate" ErrorMessage="Please select an appointment date" CssClass="ErrorMessage" />
                        <br />
                        
                        Proposed Appointment Hour:
                        <asp:DropDownList ID="AppointmentHour" runat="server">
                            <asp:ListItem Enabled="true" Text="Select Hour" Value=""></asp:ListItem>
                            <asp:ListItem Enabled="true" Text="1:00" Value="1"></asp:ListItem>
                            <asp:ListItem Enabled="true" Text="2:00" Value="2"></asp:ListItem>
                            <asp:ListItem Enabled="true" Text="3:00" Value="3"></asp:ListItem>
                            <asp:ListItem Enabled="true" Text="4:00" Value="4"></asp:ListItem>
                            <asp:ListItem Enabled="true" Text="5:00" Value="5"></asp:ListItem>
                            <asp:ListItem Enabled="true" Text="6:00" Value="6"></asp:ListItem>
                            <asp:ListItem Enabled="true" Text="7:00" Value="7"></asp:ListItem>
                            <asp:ListItem Enabled="true" Text="8:00" Value="8"></asp:ListItem>
                            <asp:ListItem Enabled="true" Text="9:00" Value="9"></asp:ListItem>
                            <asp:ListItem Enabled="true" Text="10:00" Value="10"></asp:ListItem>
                            <asp:ListItem Enabled="true" Text="11:00" Value="11"></asp:ListItem>
                            <asp:ListItem Enabled="true" Text="12:00" Value="12"></asp:ListItem>
                        </asp:DropDownList><br />

                        <asp:RequiredFieldValidator runat="server" ControlToValidate="AppointmentHour" ID="ReqAppointmentHour" ErrorMessage="Please select an hour for the appointment" CssClass="ErrorMessage" />
                        <br />
                        Proposed Appointment Minute:
                        <asp:DropDownList ID="AppointmentMinute" runat="server">
                            <asp:ListItem Enabled="true" Text="Select Minute" Value=""></asp:ListItem>
                            <asp:ListItem Enabled="true" Text="0:00" Value="0"></asp:ListItem>
                            <asp:ListItem Enabled="true" Text="0:15" Value="15"></asp:ListItem>
                            <asp:ListItem Enabled="true" Text="0:30" Value="30"></asp:ListItem>
                            <asp:ListItem Enabled="true" Text="0:45" Value="45"></asp:ListItem>

                        </asp:DropDownList><br />
                        <asp:RequiredFieldValidator runat="server" ControlToValidate="AppointmentMinute" ID="ReqAppointmentMinute" ErrorMessage="Please select a minute interval for the appointment" CssClass="ErrorMessage" />
                        <br />
                        AM/PM:
                        <asp:DropDownList ID="AppointmentDayPart" runat="server">
                            <asp:ListItem Enabled="true" Text="AM" Value="AM"></asp:ListItem>
                            <asp:ListItem Enabled="true" Text="PM" Value="PM"></asp:ListItem>
                        </asp:DropDownList><br />
                        <br />

                    </div>
                    <div id="ServiceLocation" class="col-md-6 AppointmentContent">
                        <h3>Where would you like the service done?</h3>
                        <br />
                        Service Address:
                        <asp:TextBox ID="ServiceAddress" runat="server"></asp:TextBox>
                        <asp:RequiredFieldValidator runat="server" ControlToValidate="ServiceAddress" ID="ReqServiceAddress" ErrorMessage="Please select an address for service" CssClass="ErrorMessage" />
                        <br />
                        <br />
                        Service City:
                        <asp:TextBox ID="ServiceCity" runat="server"></asp:TextBox>
                        <asp:RequiredFieldValidator runat="server" ControlToValidate="ServiceCity" ID="ReqServiceCity" ErrorMessage="Please select a city for service" CssClass="ErrorMessage" />
                        <br />
                        <br />
                        Service State:
                        <asp:TextBox ID="ServiceState" runat="server"></asp:TextBox>
                        <asp:RequiredFieldValidator runat="server" ControlToValidate="ServiceState" ID="ReqServiceState" ErrorMessage="Please select a city for service" CssClass="ErrorMessage" />
                        <br />
                        <br />
                        Service ZIP:
                        <asp:TextBox ID="ServiceZip" runat="server"></asp:TextBox>
                        <asp:RequiredFieldValidator runat="server" ControlToValidate="ServiceZip" ID="ReqServiceZIP" ErrorMessage="Please enter a ZIP Codes" CssClass="ErrorMessage" />
                        <br />
                        <br />
                    </div>
            </div>
        </div>
        <div id="ConfirmButtonWrapper" class="ButtonWrapper" style="margin: 20px 0px;">
            <asp:Button ID="ConfirmButton" runat="server" Text="Submit Appointment Request" CssClass="Button" OnClick="InsertAppointmentRequest"/>

        </div>
            </asp:Panel>
            </div>
            </body>
    </html>


</asp:Content>
