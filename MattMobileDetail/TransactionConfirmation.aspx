<%@ Page Title="" Language="C#" MasterPageFile="~/EmployeeContent.Master" AutoEventWireup="true" CodeBehind="TransactionConfirmation.aspx.cs" Inherits="MattMobileDetail.TransactionConfirmation" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
     <!DOCTYPE html>
    <html>
    <head>
        <style>
            .DashboardButton {
                width: 100%;
                height: 30px;
                border-radius: 12px;
                transition-duration: 0.4s;
                background-color: midnightblue;
                margin-left: 25%;
                color: white;
            }

            .TransactionButton {
                width: 100%;
                height: 30px;
                border-radius: 12px;
                transition-duration: 0.4s;
                background-color: green;
                color: white;
            }

        </style>
    </head>


        <div id="holdingContainer" style="width: 100%;">
        <div id="ConfirmationSection" style="width: 75%; background-color: lightgray; text-align: center; height: 200px; margin: 20px auto; display: table;">
            <h3>Transaction Confirmation</h3>

                <div id="CustomerDetails" style="width: 45%; float: left; text-align:left; margin: 0px 20px;">
                    <b>First Name:</b> <asp:Label ID="FirstName" runat="server"></asp:Label>
                    <br />
                    <b>Last Name:</b> <asp:Label ID="LastName" runat="server"></asp:Label>
                    <br />
                    <b>Email:</b> <asp:Label ID="Email" runat="server"></asp:Label>
                    <br /> 
                    <b>Phone:</b> <asp:Label ID="Phone" runat="server"></asp:Label>
                    <br /> 
                    <b>AppointmentTime:</b> <asp:Label ID="AppointmentTime" runat="server"></asp:Label>
                    <br /> 

                </div>
                <div id="TransactionDetails" style="width: 45%; float: right; text-align:left; margin: 0px 20px;"">
                    <b>Transaction Grand Total</b> <asp:Label ID="GrandToal" runat="server"></asp:Label>
                    <br />
                    <b>Payment Method</b> <asp:Label ID="Payment" runat="server"></asp:Label>
                    <br />
                </div>
            
            
        </div>
            <div>
                <asp:Button ID="ReturnToDashboard" CssClass="DashboardButton" runat="server" Text="Return To Dashboard" OnClick="ReturnToDashboard_Click"/>
                <asp:Button ID="ReturnToTransactionPage" CssClass="TransactionButton" runat="server" Text="Enter A New Transaction" OnClick="ReturnToTransactionPage_Click"/>
            </div>
    </div>



</asp:Content>
