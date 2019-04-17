<%@ Page Title="" Language="C#" MasterPageFile="~/EmployeeContent.Master" AutoEventWireup="true" CodeBehind="Dashboard.aspx.cs" Inherits="MattMobileDetail.Dashboard" ValidateRequest="true" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <style>
        .ErrorMessage {
            color: red;
        }
    </style>



    <div id="DashboardContainer" style="margin: 20px 0px; width: 100%; text-align: left; display: table">

        <h3>Appointments</h3>
        Select an appointment status:
        <asp:DropDownList ID="EventStatusList" AutoPostBack="true" runat="server" OnSelectedIndexChanged="EventStatusList_SelectedIndexChanged"></asp:DropDownList>
        <br />
        <br />


        <asp:GridView ID="PendingAppointmentsGridView" runat="server"
            AutoGenerateColumns="False"
            OnRowEditing="PendingAppointmentsGridView_RowEditing"
            OnRowCancelingEdit="PendingAppointmentsGridView_RowCancelingEdit"
            OnRowUpdating="PendingAppointmentsGridView_RowUpdating"
            OnRowDataBound="PendingAppointmentsGridView_RowDataBound"
            DataKeyNames="AppointmentID" BackColor="White" BorderColor="#999999" BorderStyle="None" BorderWidth="1px" CellPadding="3" GridLines="Vertical">
            <RowStyle Height="40px" />
            <AlternatingRowStyle BackColor="#DCDCDC" />

            <Columns>

                <asp:TemplateField HeaderText="AppointmentID">
                    <ItemTemplate>
                        <asp:Label ID="AppointmentNumber" Text='<%# Eval("AppointmentID") %>' runat="server" Width="50px" />
                    </ItemTemplate>
                    <EditItemTemplate>
                        <asp:Label ID="LabelAppointmentNumber" Text='<%# Eval("AppointmentID") %>' runat="server" Width="50px" />
                    </EditItemTemplate>
                </asp:TemplateField>

                <asp:TemplateField HeaderText="Employee Assigned">
                    <ItemTemplate>
                        <asp:Label ID="EmployeeAssigned" Text='<%# Eval("UserName") %>' runat="server" Width="100px" />
                    </ItemTemplate>
                    <EditItemTemplate>
                        <asp:DropDownList ID="EmployeesDropDown2" runat="server" />
                        <asp:RequiredFieldValidator runat="server" ControlToValidate="EmployeesDropDown2" ID="ReqUserName" ErrorMessage="Enter a Name" CssClass="ErrorMessage" />
                    </EditItemTemplate>
                </asp:TemplateField>

                <asp:TemplateField HeaderText="Customer Name">
                    <ItemTemplate>
                        <asp:Label ID="customerName" Text='<%# Eval("CustomerName") %>' runat="server" Width="200px" />
                    </ItemTemplate>
                    <EditItemTemplate>
                        <asp:TextBox ID="txtCustomerName" Text='<%# Eval("CustomerName") %>' runat="server" Width="200px" />
                        <asp:RequiredFieldValidator runat="server" ControlToValidate="txtCustomerName" ID="ReqCustomerName" ErrorMessage="Enter a Name" CssClass="ErrorMessage" />
                    </EditItemTemplate>
                </asp:TemplateField>


                <asp:TemplateField HeaderText="Date of Appointment">
                    <ItemTemplate>
                        <asp:Label ID="DateOfAppointment" Text='<%# Eval("DateTime") %>' runat="server" Width="200px" />
                    </ItemTemplate>
                    <EditItemTemplate>
                        <asp:TextBox ID="txtAppointmentDate" Text='<%# Eval("DateTime") %>' runat="server" Width="200px" />
                        <asp:RequiredFieldValidator runat="server" ControlToValidate="txtAppointmentDate" ID="ReqDescription" ErrorMessage="Enter a Description" CssClass="ErrorMessage" />
                    </EditItemTemplate>
                </asp:TemplateField>

                <asp:TemplateField HeaderText="Location">
                    <ItemTemplate>
                        <asp:Label ID="AppointmentLocation" Text='<%# Eval("AptAddress") %>' runat="server" Width="150px" />
                    </ItemTemplate>
                    <EditItemTemplate>
                        <asp:TextBox ID="txtAppointmentLocation" Text='<%# Eval("AptAddress") %>' runat="server" Width="150px" />
                        <asp:RequiredFieldValidator runat="server" ControlToValidate="txtAppointmentLocation" ID="ReqIsForSale" ErrorMessage="Enter the For Sale Status" CssClass="ErrorMessage" />
                    </EditItemTemplate>
                </asp:TemplateField>

                <asp:TemplateField HeaderText="City">
                    <ItemTemplate>
                        <asp:Label ID="AppointmentCity" Text='<%# Eval("AptCity") %>' runat="server" Width="100px" />
                    </ItemTemplate>
                    <EditItemTemplate>
                        <asp:TextBox ID="txtAppointmentCity" Text='<%# Eval("AptCity") %>' runat="server" Width="100px" />
                        <asp:RequiredFieldValidator runat="server" ControlToValidate="txtAppointmentCity" ID="ReqQuantity" ErrorMessage="Enter the Quantity" CssClass="ErrorMessage" />
                    </EditItemTemplate>
                </asp:TemplateField>

                <asp:TemplateField HeaderText="State">
                    <ItemTemplate>
                        <asp:Label ID="AppointmentState" Text='<%# Eval("AptState") %>' runat="server" Width="50px" />
                    </ItemTemplate>
                    <EditItemTemplate>
                        <asp:TextBox ID="txtAppointmentState" Text='<%# Eval("AptState") %>' runat="server" Width="50px" />
                        <asp:RequiredFieldValidator runat="server" ControlToValidate="txtAppointmentState" ID="ReqStartDate" ErrorMessage="Enter a Start Date" CssClass="ErrorMessage" />
                    </EditItemTemplate>
                </asp:TemplateField>

                <asp:TemplateField HeaderText="ZIP">
                    <ItemTemplate>
                        <asp:Label ID="AppointmentZIP" Text='<%# Eval("AptZIP") %>' runat="server" Width="50px" />
                    </ItemTemplate>
                    <EditItemTemplate>
                        <asp:TextBox ID="txtAppointmentZIP" Text='<%# Eval("AptZIP") %>' runat="server" Width="50px" />
                    </EditItemTemplate>
                </asp:TemplateField>

                <asp:TemplateField HeaderText="Status">
                    <EditItemTemplate>
                        <asp:DropDownList ID="DropDownList1" runat="server">
                            <asp:ListItem>Pending</asp:ListItem>
                            <asp:ListItem>Completed</asp:ListItem>
                            <asp:ListItem>Scheduled</asp:ListItem>
                            <asp:ListItem>Cancelled</asp:ListItem>
                        </asp:DropDownList>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="AppointmentStatus" Text='<%# Eval("EventStatus") %>' runat="server" Width="100px" />
                    </ItemTemplate>
                </asp:TemplateField>

                <asp:TemplateField>
                    <ItemTemplate>
                        <asp:Button runat="server" Text="Edit" CausesValidation="false" CommandName="Edit" ToolTip="Edit" />
                    </ItemTemplate>
                    <EditItemTemplate>
                        <asp:Button runat="server" Text="Cancel" CausesValidation="false" ToolTip="Cancel" CommandName="Cancel" />
                        <asp:Button runat="server" Text="Update" ToolTip="Update" CommandName="Update" />
                    </EditItemTemplate>
                </asp:TemplateField>

            </Columns>
            <FooterStyle BackColor="#CCCCCC" ForeColor="Black" />
            <HeaderStyle BackColor="#000084" Font-Bold="True" ForeColor="White" />
            <PagerStyle BackColor="#999999" ForeColor="Black" HorizontalAlign="Left" />
            <RowStyle BackColor="#EEEEEE" ForeColor="Black" />
            <SelectedRowStyle BackColor="#008A8C" Font-Bold="True" ForeColor="White" />
            <SortedAscendingCellStyle BackColor="#F1F1F1" />
            <SortedAscendingHeaderStyle BackColor="#0000A9" />
            <SortedDescendingCellStyle BackColor="#CAC9C9" />
            <SortedDescendingHeaderStyle BackColor="#000065" />
        </asp:GridView>

        <asp:ValidationSummary runat="server" ForeColor="Red" ID="UpdatePromotionsSummary" DisplayMode="BulletList" />


        <br />
        <asp:Label ID="lblSucess" Text="" runat="server" ForeColor="Green" />
        <br />
        <asp:Label ID="lblError" Text="" runat="server" ForeColor="Red" />

        <div id="wrapper" style="width: 100%; margin: 20px 0px;">
            <div id="BestCustomersBacking" style="float: left; margin-bottom: 100px;">
                <h3>Top 20 Customers</h3>

                <asp:GridView ID="BestCustomersGridView" runat="server"
                    AutoGenerateColumns="False"
                    BackColor="White" BorderColor="#999999" BorderStyle="None" BorderWidth="1px" CellPadding="3" GridLines="Vertical">
                    <RowStyle Height="40px" />
                    <AlternatingRowStyle BackColor="#DCDCDC" />

                    <Columns>

                        <asp:BoundField DataField="FirstName" HeaderText="First Name" SortExpression="First Name" />
                        <asp:BoundField DataField="LastName" HeaderText="Last Name" SortExpression="Last Name" />
                        <asp:BoundField DataField="Email" HeaderText="Email" SortExpression="Email" />
                        <asp:BoundField DataField="Phone" HeaderText="Phone" SortExpression="Phone" />
                        <asp:BoundField DataField="TotalSpent" HeaderText="Total Spent" SortExpression="Total Spent" />

                    </Columns>
                    <HeaderStyle BackColor="#000084" Font-Bold="True" ForeColor="White" />
                    <PagerStyle BackColor="#999999" ForeColor="Black" HorizontalAlign="Left" />
                    <RowStyle BackColor="#EEEEEE" ForeColor="Black" />
                    <SelectedRowStyle BackColor="#008A8C" Font-Bold="True" ForeColor="White" />
                    <SortedAscendingCellStyle BackColor="#F1F1F1" />
                    <SortedAscendingHeaderStyle BackColor="#0000A9" />
                    <SortedDescendingCellStyle BackColor="#CAC9C9" />
                    <SortedDescendingHeaderStyle BackColor="#000065" />
                </asp:GridView>
            </div>

            <div id="InventoryLevelBacking" style="float: right;">
                <h3>Inventory Levels</h3>

                <asp:GridView ID="InventoryLevelsGridView" runat="server"
                    AutoGenerateColumns="False"
                    BackColor="White" BorderColor="#999999" BorderStyle="None" BorderWidth="1px" CellPadding="3" GridLines="Vertical">
                    <RowStyle Height="40px" />
                    <AlternatingRowStyle BackColor="#DCDCDC" />

                    <Columns>

                        <asp:BoundField DataField="UPC" HeaderText="Product Code" SortExpression="Product Code" />
                        <asp:BoundField DataField="Name" HeaderText="Name" SortExpression="Name" />
                        <asp:BoundField DataField="IsForSale" HeaderText="Is For Sale" SortExpression="IsForSale" />
                        <asp:BoundField DataField="Quantity" HeaderText="Quantity Remaining" SortExpression="Quantity" />

                    </Columns>
                    <HeaderStyle BackColor="#000084" Font-Bold="True" ForeColor="White" />
                    <PagerStyle BackColor="#999999" ForeColor="Black" HorizontalAlign="Left" />
                    <RowStyle BackColor="#EEEEEE" ForeColor="Black" />
                    <SelectedRowStyle BackColor="#008A8C" Font-Bold="True" ForeColor="White" />
                    <SortedAscendingCellStyle BackColor="#F1F1F1" />
                    <SortedAscendingHeaderStyle BackColor="#0000A9" />
                    <SortedDescendingCellStyle BackColor="#CAC9C9" />
                    <SortedDescendingHeaderStyle BackColor="#000065" />
                </asp:GridView>
            </div>
        </div>
</asp:Content>
