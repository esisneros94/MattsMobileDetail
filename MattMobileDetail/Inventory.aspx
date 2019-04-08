<%@ Page Title="" Language="C#" MasterPageFile="~/EmployeeContent.Master" AutoEventWireup="true" CodeBehind="Inventory.aspx.cs" Inherits="MattMobileDetail.Inventory" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

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
                        <asp:TextBox ID="TextBoxInventoryDescription" TextMode="MultiLine" Text='<%# Eval("Description") %>' runat="server" Width="300px" />
                    </EditItemTemplate>
                    <FooterTemplate>
                        <asp:TextBox ID="NewInventoryDescr" TextMode="MultiLine" runat="server" Width="300px" />
                    </FooterTemplate>
                </asp:TemplateField>

                <asp:TemplateField HeaderText="Is For Sale">
                    <ItemTemplate>
                        <asp:Label ID="InventoryForSale" Text='<%# Eval("IsForSale") %>' runat="server" Width="200px" />
                    </ItemTemplate>
                    <EditItemTemplate>
                        <asp:TextBox ID="txtBoxInventoryForSale" Text='<%# Eval("IsForSale") %>' runat="server" Width="200px" />
                    </EditItemTemplate>
                    <FooterTemplate>
                        <asp:TextBox ID="NewInventoryForSale" runat="server" Width="200px" />
                    </FooterTemplate>
                </asp:TemplateField>

                <asp:TemplateField HeaderText="Quantity">
                    <ItemTemplate>
                        <asp:Label ID="InventoryQuantity" Text='<%# Eval("Quantity") %>' runat="server" Width="200px" />
                    </ItemTemplate>
                    <EditItemTemplate>
                        <asp:TextBox ID="txtBoxInventoryQuantity" Text='<%# Eval("Quantity") %>' runat="server" Width="200px" />
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
                        <asp:TextBox ID="TextBoxInventoryStart" Text='<%# Eval("StartDate") %>' runat="server" Width="250px" />
                    </EditItemTemplate>
                    <FooterTemplate>
                        <asp:TextBox ID="NewStartDate" runat="server" Width="250px" />
                    </FooterTemplate>
                </asp:TemplateField>



                <asp:TemplateField HeaderText="Inventory End Date">
                    <ItemTemplate>
                        <asp:Label ID="LabelPromoDescriptionEnd" Text='<%# Eval("EndDate") %>' runat="server" Width="250px" />
                    </ItemTemplate>
                    <EditItemTemplate>
                        <asp:TextBox ID="TextBoxInventoryEnd" Text='<%# Eval("EndDate") %>' runat="server" Width="250px" />
                    </EditItemTemplate>
                    <FooterTemplate>
                        <asp:TextBox ID="NewInventoryEnd" runat="server" Width="250px" />
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

</asp:Content>
