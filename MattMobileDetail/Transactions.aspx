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
        <div id="container" style="border: 1px solid Red">
            <div id="Finder" style="border: 1px solid black; width: 50%; float: left; ">
                <h3>Find a Transaction</h3><br/>
                Customer First Name: <asp:TextBox ID="CustomerFirstName" runat="server" /><br />
                Customer Last Name: <asp:TextBox ID="CustomerLastName" runat="server" /><br />
                Appointment Date: <asp:TextBox ID="DateSelected" runat="server"></asp:TextBox>&nbsp<asp:ImageButton ID="CalendarLogo" runat="server" Height="20px" ImageUrl="~/Pictures/CalendarImage.png" Width="20px" OnClick="CalendarLogo_Click" />
                        <asp:Calendar ID="AppointmentDate" runat="server" OnSelectionChanged="SaveDateToTextBox" ></asp:Calendar><br />

                <asp:Button ID="SearchForAppointments" runat="server" Text="Search For Appointment" OnClick="SearchForAppointment" Style="width: 200px"/><br /><br />

                <asp:Panel ID="FoundAppointmentInfo" runat="server" Visible="true">
                <b>Appointment Number:</b> <asp:Label ID="AppointmentNumberFind" runat="server" /> <br />
                <b>Customer First Name:</b> <asp:Label ID="CustomerFirstFind" runat="server" /><br />
                <b>Customer Last Name:</b> <asp:Label ID="CustomerLastFind" runat="server" /><br />
                <b>Phone Number:</b> <asp:Label ID="PhoneFind" runat="server" /><br />
                <b>Email:</b> <asp:Label ID="EmailFind" runat="server" /><br />

                <asp:Button ID="ConfirmAppointment" runat="server" Text="Add Items To This Appointment" Style="width: 300px" OnClick="ConfirmAppointment_Click"/><br /><br />

                </asp:Panel>
 
            </div>
            
            <div id="AddItemsToTransaction" style="border: 1px solid green; width: 50%; float: right; height: 350px" >
               <asp:Panel ID="AdditionsToAppointment" runat="server" Visible="false">
                    
                   <asp:Panel ID="AddingAService" runat="server">
                       Add a Service: <asp:RadioButton ID="ShowServices" runat="server" OnCheckedChanged="ShowServices_CheckedChanged" AutoPostBack="true"/><br />
                   </asp:Panel>
                
                   <asp:Panel ID="AddingAProduct" runat="server">
                       Add a Product: <asp:RadioButton ID="ShowProduct" runat="server" OnCheckedChanged="ShowProduct_CheckedChanged" AutoPostBack="true"/><br /><br />
                   </asp:Panel>
                
                

                <asp:Panel ID="ServiceInfo" runat="server" Visible ="false">
               Add A Service To The Transaction: <asp:DropDownList ID="ServicesToAdd" runat="server" />
               Quantity: <asp:DropDownList ID="ServiceQuantity" runat="server">
                   <asp:ListItem Enabled="true" Text="Select Quantity" Value=""></asp:ListItem>
                            <asp:ListItem Enabled="true" Text="1" Value="1" ></asp:ListItem>
                            <asp:ListItem Enabled="true" Text="2" Value="2" ></asp:ListItem>
                            <asp:ListItem Enabled="true" Text="3" Value="3" ></asp:ListItem>
                            <asp:ListItem Enabled="true" Text="4" Value="4" ></asp:ListItem>
                            <asp:ListItem Enabled="true" Text="5" Value="5" ></asp:ListItem>
                            <asp:ListItem Enabled="true" Text="6" Value="6" ></asp:ListItem>
                            <asp:ListItem Enabled="true" Text="7" Value="7" ></asp:ListItem>
                            <asp:ListItem Enabled="true" Text="8" Value="8" ></asp:ListItem>
                            <asp:ListItem Enabled="true" Text="9" Value="9" ></asp:ListItem>
                            <asp:ListItem Enabled="true" Text="10" Value="10"></asp:ListItem>
                   </asp:DropDownList><br />
                </asp:Panel>
                    

                <asp:Panel ID="ProductInfo" runat="server" Visible="false">
               Add A Product To The Transaction: <asp:DropDownList ID="ProductsToAdd" runat="server" />
               Quantity: <asp:DropDownList ID="ProductQuantity" runat="server">
                            <asp:ListItem Enabled="true" Text="Select Quantity" Value=""></asp:ListItem>
                            <asp:ListItem Enabled="true" Text="1" Value="1" ></asp:ListItem>
                            <asp:ListItem Enabled="true" Text="2" Value="2" ></asp:ListItem>
                            <asp:ListItem Enabled="true" Text="3" Value="3" ></asp:ListItem>
                            <asp:ListItem Enabled="true" Text="4" Value="4" ></asp:ListItem>
                            <asp:ListItem Enabled="true" Text="5" Value="5" ></asp:ListItem>
                            <asp:ListItem Enabled="true" Text="6" Value="6" ></asp:ListItem>
                            <asp:ListItem Enabled="true" Text="7" Value="7" ></asp:ListItem>
                            <asp:ListItem Enabled="true" Text="8" Value="8" ></asp:ListItem>
                            <asp:ListItem Enabled="true" Text="9" Value="9" ></asp:ListItem>
                            <asp:ListItem Enabled="true" Text="10" Value="10" ></asp:ListItem>
                   </asp:DropDownList><br />

                </asp:Panel>

                <asp:Panel ID="PanelBox" runat="server">
                   <asp:Button ID="AddItemToTransaction" runat="server" Text="Add Item to Transaction" OnClick="AddItemToTransaction_Click" /><br /><br />
                   <asp:Button ID="AddAnother" runat="server" Text="Add Another Item" OnClick="AddAnother_Click" />
                    <asp:Button ID="FinishedAddingItems" runat="server" Text="Done Adding Items" OnClick="FinishedAddingItems_Click"/>
                </asp:Panel>

            </asp:Panel>
                <asp:Panel ID="PromotionalInfo" runat="server" Visible="false">

                    <h4>Items For this Transaction</h4>
                    <div runat="server" id="ItemsListing">

                    </div>

                    <asp:Panel ID="PromotionControls" runat="server">
                            Utilize A Promotion (If Needed): <asp:DropDownList ID="PromotionalDropDown" runat="server" />
                            <asp:Button ID="AddPromotion" runat="server" Text="Use Promotion" OnClick="AddPromotion_Click"/>
                    </asp:Panel>

                    <div runat="server" id="PromotionListing">

                    </div>

                </asp:Panel>

          

    

            </div>

        </div>
    
    
    </body>
    </html>



</asp:Content>
