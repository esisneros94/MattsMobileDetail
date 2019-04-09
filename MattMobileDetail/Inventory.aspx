<%@ Page Title="" Language="C#" MasterPageFile="~/EmployeeContent.Master" AutoEventWireup="true" CodeBehind="Inventory.aspx.cs" Inherits="MattMobileDetail.Inventory" %>
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
    <div id="GridViewBacking" style="margin: 30px 0px; width: 100%; text-align: left; display: table">

        <asp:GridView ID="InventoryGridView" runat="server" Style="margin: 15px; text-align: left; display: table"
            AutoGenerateColumns="False"
            ShowFooter="True"
            OnRowCommand="InventoryGridView_RowCommand"
            
            OnRowEditing="InventoryGridView_RowEditing"
            OnRowCancelingEdit="InventoryGridView_RowCancelingEdit"
            OnRowUpdating="InventoryGridView_RowUpdating"
            DataKeyNames="UPC" BackColor="White" BorderColor="#999999" BorderStyle="None" BorderWidth="1px" CellPadding="3" GridLines="Vertical">
            <RowStyle Height="40px" />
            <FooterStyle Height="70px" />
            <AlternatingRowStyle BackColor="#DCDCDC" />

            <Columns>

                <asp:TemplateField HeaderText="UPC">
                    <ItemTemplate>
                        <asp:Label ID="InventoryUPC" Text='<%# Eval("UPC") %>' runat="server" Width="200px" />
                        </ItemTemplate>
                    <EditItemTemplate>
                        <asp:TextBox ID="txtBoxInventoryUPC" Text='<%# Eval("UPC") %>' runat="server" Width="200px" />
                        <asp:RequiredFieldValidator runat="server" ControlToValidate="txtBoxInventoryUPC" ID="ReqUPC" ErrorMessage="Enter a UPC" CssClass="ErrorMessage"/>
                    </EditItemTemplate>
                    <FooterTemplate>
                        <asp:TextBox ID="NewInventoryUPC" runat="server" Width="200px" />
                    </FooterTemplate>
                </asp:TemplateField>

                <asp:TemplateField HeaderText="Item Name">
                    <ItemTemplate>
                        <asp:Label ID="InventoryName" Text='<%# Eval("Name") %>' runat="server" Width="200px" />
                    </ItemTemplate>
                    <EditItemTemplate>
                        <asp:TextBox ID="txtBoxInventoryName" Text='<%# Eval("Name") %>' runat="server" Width="200px" />
                        <asp:RequiredFieldValidator runat="server" ControlToValidate="txtBoxInventoryName" ID="ReqName" ErrorMessage="Enter a Name" CssClass="ErrorMessage"/>
                    </EditItemTemplate>
                    <FooterTemplate>
                        <asp:TextBox ID="NewInventoryName" runat="server" Width="200px" />
                    </FooterTemplate>
                </asp:TemplateField>


                <asp:TemplateField HeaderText="Description">
                    <ItemTemplate>
                        <asp:Label ID="LabelPromoDescription" Text='<%# Eval("Description") %>' runat="server" Width="300px" />
                    </ItemTemplate>
                    <EditItemTemplate>
                        <asp:TextBox ID="txtBoxInventoryDescription" TextMode="MultiLine" Text='<%# Eval("Description") %>' runat="server" Width="300px" />
                        <asp:RequiredFieldValidator runat="server" ControlToValidate="txtBoxInventoryDescription" ID="ReqDescription" ErrorMessage="Enter a Description" CssClass="ErrorMessage"/>
                    </EditItemTemplate>
                    <FooterTemplate>
                        <asp:TextBox ID="NewInventoryDescription" TextMode="MultiLine" runat="server" Width="300px" />
                    </FooterTemplate>
                </asp:TemplateField>

                <asp:TemplateField HeaderText="Is For Sale">
                    <ItemTemplate>
                        <asp:Label ID="InventoryIsForSale" Text='<%# Eval("IsForSale") %>' runat="server" Width="200px" />
                    </ItemTemplate>
                    <EditItemTemplate>
                        <asp:TextBox ID="txtBoxInventoryIsForSale" Text='<%# Eval("IsForSale") %>' runat="server" Width="200px" />
                        <asp:RequiredFieldValidator runat="server" ControlToValidate="txtBoxInventoryIsForSale" ID="ReqIsForSale" ErrorMessage="Enter the For Sale Status" CssClass="ErrorMessage"/>
                    </EditItemTemplate>
                    <FooterTemplate>
                        <asp:TextBox ID="NewInventoryIsForSale" runat="server" Width="200px" />
                    </FooterTemplate>
                </asp:TemplateField>

                <asp:TemplateField HeaderText="Quantity">
                    <ItemTemplate>
                        <asp:Label ID="InventoryQuantity" Text='<%# Eval("Quantity") %>' runat="server" Width="200px" />
                    </ItemTemplate>
                    <EditItemTemplate>
                        <asp:TextBox ID="txtBoxInventoryQuantity" Text='<%# Eval("Quantity") %>' runat="server" Width="200px" />
                        <asp:RequiredFieldValidator runat="server" ControlToValidate="txtBoxInventoryQuantity" ID="ReqQuantity" ErrorMessage="Enter the Quantity" CssClass="ErrorMessage"/>
                    </EditItemTemplate>
                    <FooterTemplate>
                        <asp:TextBox ID="NewInventoryQuantity" runat="server" Width="200px" />
                    </FooterTemplate>
                </asp:TemplateField>

                <asp:TemplateField HeaderText="Inventory Start Date">
                    <ItemTemplate>
                        <asp:Label ID="LabelPromoStart" Text='<%# Eval("StartDate") %>' runat="server" Width="250px" />
                    </ItemTemplate>
                    <EditItemTemplate>
                        <asp:TextBox ID="txtBoxInventoryStartDate" Text='<%# Eval("StartDate") %>' runat="server" Width="250px" />
                        <asp:RequiredFieldValidator runat="server" ControlToValidate="txtBoxInventoryStartDate" ID="ReqStartDate" ErrorMessage="Enter a Start Date" CssClass="ErrorMessage"/>
                    </EditItemTemplate>
                    <FooterTemplate>
                        <asp:TextBox ID="NewInventoryStartDate" runat="server" Width="250px" />
                    </FooterTemplate>
                </asp:TemplateField>



                <asp:TemplateField HeaderText="Inventory End Date">
                    <ItemTemplate>
                        <asp:Label ID="LabelPromoDescriptionEnd" Text='<%# Eval("EndDate") %>' runat="server" Width="250px" />
                    </ItemTemplate>
                    <EditItemTemplate>
                        <asp:TextBox ID="txtBoxInventoryEndDate" Text='<%# Eval("EndDate") %>' runat="server" Width="250px" />
                    </EditItemTemplate>
                    <FooterTemplate>
                        <asp:TextBox ID="NewInventoryEndDate" runat="server" Width="250px" />
                    </FooterTemplate>
                </asp:TemplateField>

                <asp:TemplateField>
                    <ItemTemplate>
                        <asp:Button runat="server" Text="Edit" CommandName="Edit" ToolTip="Edit" />
                    </ItemTemplate>
                    <EditItemTemplate>
                        <asp:Button runat="server" Text="Cancel" ToolTip="Cancel" CommandName="Cancel" />
                        <asp:Button runat="server" Text="Update" ToolTip="Update" CommandName="Update" />
                    </EditItemTemplate>
                    <FooterTemplate>
                        <asp:Button Text="Add New" runat="server" CommandName="AddNew" />
                    </FooterTemplate>
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

        <br />
        <asp:Label ID="lblSucess" Text="" runat="server" ForeColor="Green" />
        <br />
        <asp:Label ID="lblError" Text="" runat="server" ForeColor="Red" />

    </div>
        </html>
</asp:Content>
