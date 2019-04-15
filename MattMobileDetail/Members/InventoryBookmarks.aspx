<%@ Page Title="" Language="C#" MasterPageFile="~/EmployeeContent.Master" AutoEventWireup="true" CodeBehind="InventoryBookmarks.aspx.cs" Inherits="MattMobileDetail.InventoryBookmarks" ValidateRequest="true" %>
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

        <asp:GridView ID="InventoryBookmarkGridView" runat="server" Style="margin: 15px; text-align: left; display: table"
            AutoGenerateColumns="False"
            ShowFooter="True"
            OnRowCommand="InventoryBookmarkGridView_RowCommand"
            
            OnRowEditing="InventoryBookmarkGridView_RowEditing"
            OnRowCancelingEdit="InventoryBookmarkGridView_RowCancelingEdit"
            OnRowUpdating="InventoryBookmarkGridView_RowUpdating"
            DataKeyNames="URL" BackColor="White" BorderColor="#999999" BorderStyle="None" BorderWidth="1px" CellPadding="3" GridLines="Vertical">
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
                        <asp:RequiredFieldValidator runat="server" ControlToValidate="txtBoxInventoryName" ID="Reqname" ErrorMessage="Enter a Name" CssClass="ErrorMessage"/>
                    </EditItemTemplate>
                    <FooterTemplate>
                        <asp:TextBox ID="NewInventoryName" runat="server" Width="200px" />
                    </FooterTemplate>
                </asp:TemplateField>

                <asp:TemplateField HeaderText="Vendor">
                    <ItemTemplate>
                        <asp:Label ID="InventoryBookmarkVendor" Text='<%# Eval("Vendor") %>' runat="server" Width="200px" />
                    </ItemTemplate>
                    <EditItemTemplate>
                        <asp:TextBox ID="txtBoxInventoryBookmarkVendor" Text='<%# Eval("Vendor") %>' runat="server" Width="200px" />
                        <asp:RequiredFieldValidator runat="server" ControlToValidate="txtBoxInventoryBookmarkVendor" ID="ReqVendor" ErrorMessage="Enter a Vendor" CssClass="ErrorMessage"/>
                    </EditItemTemplate>
                    <FooterTemplate>
                        <asp:TextBox ID="NewInventoryBookmarkVendor" runat="server" Width="200px" />
                    </FooterTemplate>
                </asp:TemplateField>

                <asp:TemplateField HeaderText="URL">
                    <ItemTemplate>
                        <asp:Label ID="InventoryBookmarkURL" Text='<%# Eval("URL") %>' runat="server" Width="200px" />
                    </ItemTemplate>
                    <EditItemTemplate>
                        <asp:TextBox ID="txtBoxInventoryBookmarkURL" Text='<%# Eval("URL") %>' runat="server" Width="200px" />
                        <asp:RequiredFieldValidator runat="server" ControlToValidate="txtBoxInventoryBookmarkURL" ID="ReqURL" ErrorMessage="Enter a URL" CssClass="ErrorMessage"/>
                    </EditItemTemplate>
                    <FooterTemplate>
                        <asp:TextBox ID="NewInventoryBookmarkURL" runat="server" Width="200px" />
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

