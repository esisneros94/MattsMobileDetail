<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="AppointmentConfirmation.aspx.cs" Inherits="MattMobileDetail.AppointmentConfirmation" ValidateRequest="true" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

    <div id="holdingContainer" style="width: 100%;">
        <div id="ConfirmationSection" style="width: 75%; background-color: lightgray; text-align: center; height: 200px; margin: 20px auto; display: table;">
            <h3>Appointment Request Confirmation</h3>
            <h5>Your appointment number is: </h5>
            <asp:Label ID="AppointmentNumberLabel" runat="server" Style="font-weight: 600;"></asp:Label>

            <p>
                Please allow 24 hours for Matt to get in contact with you to confirm your appointment
            </p>
            
                <div id="CustomerDetails" style="width: 45%; float: left; text-align:left; margin: 0px 20px;">
                    <b>First Name:</b> <asp:Label ID="FirstName" runat="server"></asp:Label>
                    <br />
                    <b>Last Name:</b> <asp:Label ID="LastName" runat="server"></asp:Label>
                    <br />
                    <b>Email:</b> <asp:Label ID="Email" runat="server"></asp:Label>
                    <br /> 

                </div>
                <div id="ApptDetails" style="width: 45%; float: right; text-align:left; margin: 0px 20px;"">
                    <b>Appointment Time:</b> <asp:Label ID="AppointmentTime" runat="server"></asp:Label>
                    <br />
                    <b>Appointment Location:</b> <asp:Label ID="AppointmentLocation" runat="server"></asp:Label>
                    <br />
                </div>
            
        </div>
    </div>


</asp:Content>
