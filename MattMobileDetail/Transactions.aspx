<%@ Page Title="" Language="C#" MasterPageFile="~/EmployeeContent.Master" AutoEventWireup="true" CodeBehind="Transactions.aspx.cs" Inherits="MattMobileDetail.Transactions" ValidateRequest="true" %>

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
                height: 30px;
                border-radius: 12px;
                transition-duration: 0.4s;
                background-color: midnightblue;
                margin-left: 30%;
                color: white;
            }

            .AddTransactionsButton {
                width: 100%;
                height: 30px;
                border-radius: 12px;
                transition-duration: 0.4s;
                background-color: midnightblue;
                margin-left: 25%;
                color: white;
            }

            .AddItemButton {
                width: 100%;
                height: 30px;
                border-radius: 12px;
                transition-duration: 0.4s;
                background-color: green;
                margin-left: 25%;
                color: white;
            }

            .DoneAdding {
                width: 100%;
                height: 30px;
                border-radius: 12px;
                transition-duration: 0.4s;
                background-color: green;
                margin-left: 33%;
                color: white;
            }

            .AddPromotion {
                width: 120px;
                height: 30px;
                border-radius: 12px;
                transition-duration: 0.4s;
                background-color: green;
                color: white;
            }

            .SubmitFinalTransaction {
                width: 120px;
                height: 30px;
                border-radius: 12px;
                transition-duration: 0.4s;
                background-color: green;
                color: white;
            }

            .Button:hover {
                background-color: dodgerblue;
                color: white;
            }
        </style>
    </head>
    <body>
        <div id="container" style="height: auto; border: 1px solid black; overflow: hidden; background-color: lightgray;">
            <div id="Finder" style="width: 50%; float: left; padding: 20px">
                <h3 style="margin-left: 30%">Find a Transaction</h3>
                <br />
                Customer First Name:
                <asp:TextBox ID="CustomerFirstName" runat="server" />
                <asp:RequiredFieldValidator ID="RequiredSearchFirstName" CssClass="ErrorMessage" ControlToValidate="CustomerFirstName" runat="server" ErrorMessage="Input a First Name" ValidationGroup="InitialSearch"></asp:RequiredFieldValidator><br />
                <br />
                Customer Last Name:
                <asp:TextBox ID="CustomerLastName" runat="server" />
                <asp:RequiredFieldValidator ID="RequiredSearchLastName" CssClass="ErrorMessage" ControlToValidate="CustomerLastName" runat="server" ErrorMessage="Input a Last Name" ValidationGroup="InitialSearch"></asp:RequiredFieldValidator><br />
                <br />
                Appointment Date:
                <asp:TextBox ID="DateSelected" runat="server"></asp:TextBox>&nbsp<asp:ImageButton ID="CalendarLogo" runat="server" Height="20px" ImageUrl="~/Pictures/CalendarImage.png" Width="20px" OnClick="CalendarLogo_Click" />
                <asp:RequiredFieldValidator ID="RequiredSearchDate" CssClass="ErrorMessage" ControlToValidate="DateSelected" runat="server" ErrorMessage="Select/Insert date" ValidationGroup="InitialSearch"></asp:RequiredFieldValidator>
                <asp:CompareValidator ID="CheckSearchDateType" CssClass="ErrorMessage" ControlToValidate="DateSelected" runat="server" ErrorMessage="MM/DD/YYY format required" ValidationGroup="InitialSearch" Operator="DataTypeCheck" Type="Date" />
                <asp:Calendar ID="AppointmentDate" BackColor="White" runat="server" OnSelectionChanged="SaveDateToTextBox"></asp:Calendar>
                <br />
                <br />

                <asp:Button ID="SearchForAppointments" CssClass="Button" runat="server" Text="Search For Appointment" OnClick="SearchForAppointment" CausesValidation="true" ValidationGroup="InitialSearch" Style="width: 200px" /><br />
                <br />

                <asp:Panel ID="FoundAppointmentInfo" runat="server" Visible="true">
                    <b>Appointment Number:</b>
                    <asp:Label ID="AppointmentNumberFind" runat="server" />
                    <br />
                    <br />
                    <b>Customer First Name:</b>
                    <asp:Label ID="CustomerFirstFind" runat="server" /><br />
                    <br />
                    <b>Customer Last Name:</b>
                    <asp:Label ID="CustomerLastFind" runat="server" /><br />
                    <br />
                    <b>Phone Number:</b>
                    <asp:Label ID="PhoneFind" runat="server" /><br />
                    <br />
                    <b>Email:</b>
                    <asp:Label ID="EmailFind" runat="server" /><br />
                    <br />

                    <asp:Button ID="ConfirmAppointment" runat="server" CssClass="AddTransactionsButton" Text="Add Items To This Appointment" Style="width: 300px" OnClick="ConfirmAppointment_Click" /><br />
                    <br />

                </asp:Panel>

            </div>

            <div id="AddItemsToTransaction" style="width: 50%; float: right; padding: 20px">
                <asp:Panel ID="AdditionsToAppointment" runat="server" Visible="false">

                    <asp:Panel ID="AddingAService" runat="server">
                        Add a Service:
                        <asp:RadioButton ID="ShowServices" runat="server" OnCheckedChanged="ShowServices_CheckedChanged" AutoPostBack="true" /><br />
                        <br />
                    </asp:Panel>

                    <asp:Panel ID="AddingAProduct" runat="server">
                        Add a Product:
                        <asp:RadioButton ID="ShowProduct" runat="server" OnCheckedChanged="ShowProduct_CheckedChanged" AutoPostBack="true" /><br />
                        <br />
                    </asp:Panel>



                    <asp:Panel ID="ServiceInfo" runat="server" Visible="false">
                        Add A Service To The Transaction:
                        <asp:DropDownList ID="ServicesToAdd" runat="server" />
                        <asp:RequiredFieldValidator ID="RequiredServiceName" runat="server" InitialValue="0" ControlToValidate="ServicesToAdd" ErrorMessage="Select A Service" CssClass="ErrorMessage" ValidationGroup="ServiceAdd"></asp:RequiredFieldValidator><br />
                        Quantity:
                        <asp:DropDownList ID="ServiceQuantity" runat="server">
                            <asp:ListItem Enabled="true" Text="Select Quantity" Value=""></asp:ListItem>
                            <asp:ListItem Enabled="true" Text="1" Value="1"></asp:ListItem>
                            <asp:ListItem Enabled="true" Text="2" Value="2"></asp:ListItem>
                            <asp:ListItem Enabled="true" Text="3" Value="3"></asp:ListItem>
                            <asp:ListItem Enabled="true" Text="4" Value="4"></asp:ListItem>
                            <asp:ListItem Enabled="true" Text="5" Value="5"></asp:ListItem>
                            <asp:ListItem Enabled="true" Text="6" Value="6"></asp:ListItem>
                            <asp:ListItem Enabled="true" Text="7" Value="7"></asp:ListItem>
                            <asp:ListItem Enabled="true" Text="8" Value="8"></asp:ListItem>
                            <asp:ListItem Enabled="true" Text="9" Value="9"></asp:ListItem>
                            <asp:ListItem Enabled="true" Text="10" Value="10"></asp:ListItem>
                        </asp:DropDownList>
                        <asp:RequiredFieldValidator ID="RequiredServiceQuantity" runat="server" InitialValue="" ControlToValidate="ServiceQuantity" ErrorMessage="Select A Quantity" CssClass="ErrorMessage" ValidationGroup="ServiceAdd"></asp:RequiredFieldValidator><br />
                        <br />
                    </asp:Panel>


                    <asp:Panel ID="ProductInfo" runat="server" Visible="false">
                        Add A Product To The Transaction:
                        <asp:DropDownList ID="ProductsToAdd" runat="server" />
                        <asp:RequiredFieldValidator ID="RequiredProductName" runat="server" InitialValue="0" ControlToValidate="ProductsToAdd" ErrorMessage="Select A Product" CssClass="ErrorMessage" ValidationGroup="ServiceAdd"></asp:RequiredFieldValidator><br />
                        Quantity:
                        <asp:DropDownList ID="ProductQuantity" runat="server">
                            <asp:ListItem Enabled="true" Text="Select Quantity" Value=""></asp:ListItem>
                            <asp:ListItem Enabled="true" Text="1" Value="1"></asp:ListItem>
                            <asp:ListItem Enabled="true" Text="2" Value="2"></asp:ListItem>
                            <asp:ListItem Enabled="true" Text="3" Value="3"></asp:ListItem>
                            <asp:ListItem Enabled="true" Text="4" Value="4"></asp:ListItem>
                            <asp:ListItem Enabled="true" Text="5" Value="5"></asp:ListItem>
                            <asp:ListItem Enabled="true" Text="6" Value="6"></asp:ListItem>
                            <asp:ListItem Enabled="true" Text="7" Value="7"></asp:ListItem>
                            <asp:ListItem Enabled="true" Text="8" Value="8"></asp:ListItem>
                            <asp:ListItem Enabled="true" Text="9" Value="9"></asp:ListItem>
                            <asp:ListItem Enabled="true" Text="10" Value="10"></asp:ListItem>
                        </asp:DropDownList>
                        <asp:RequiredFieldValidator ID="RequiredProductQuantity" runat="server" InitialValue="" ControlToValidate="ProductQuantity" ErrorMessage="Select A Quantity" CssClass="ErrorMessage" ValidationGroup="ServiceAdd"></asp:RequiredFieldValidator><br />
                        <br />
                        <br />

                    </asp:Panel>

                    <asp:Panel ID="AddItemPanel" runat="server">
                        <asp:Button ID="AddItemToTransaction" CssClass="AddItemButton" runat="server" Text="Add Item to Transaction" ValidationGroup="ServiceAdd" OnClick="AddItemToTransaction_Click" Style="width: 250px" /><br />
                        <br />
                    </asp:Panel>


                    <asp:Panel ID="PanelBox" runat="server">
                        <asp:Button ID="AddAnother" CssClass="AddTransactionsButton" runat="server" Text="Add Another Item" OnClick="AddAnother_Click" />
                        <asp:Button ID="FinishedAddingItems" CssClass="DoneAdding" runat="server" Text="Done Adding Items" OnClick="FinishedAddingItems_Click" Style="width: 200px" /><br />
                        <br />
                    </asp:Panel>

                </asp:Panel>
                <asp:Panel ID="PromotionalInfo" runat="server" Visible="false">

                    <h4>Items For this Transaction</h4>
                    <div runat="server" id="ItemsListing">
                    </div>

                    <asp:Panel ID="PromotionControls" runat="server">
                        Utilize A Promotion (If Needed):
                        <asp:DropDownList ID="PromotionalDropDown" runat="server" />
                        <asp:Button ID="AddPromotion" CssClass="AddPromotion" runat="server" Text="Use Promotion" OnClick="AddPromotion_Click" />
                    </asp:Panel>

                    <div runat="server" id="PromotionListing">
                    </div>

                </asp:Panel>

                <asp:Panel ID="ConfirmTransaction" runat="server" Visible="false">
                    <asp:Button ID="InsertTransaction" CssClass="SubmitFinalTransaction" runat="server" Text="Submit Transaction" Style="width: 200px" OnClick="InsertTransaction_Click" />
                </asp:Panel>





            </div>

        </div>


    </body>
    </html>



</asp:Content>
