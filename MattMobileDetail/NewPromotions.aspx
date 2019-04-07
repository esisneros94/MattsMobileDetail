<%@ Page Title="" Language="C#" MasterPageFile="~/EmployeeContent.Master" AutoEventWireup="true" CodeBehind="NewPromotions.aspx.cs" Inherits="MattMobileDetail.NewPromotions" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

    <div id="GridViewBacking" style="margin: 30px 0px; width: 100%; text-align: center; display: table">

        <asp:GridView ID="PromotionGridView" runat="server" Style="margin: 15px; text-align: center; display: table"
            AutoGenerateColumns="False"
            ShowFooter="True"
            OnRowCommand="PromotionGridView_RowCommand"
            
            OnRowEditing="PromotionGridView_RowEditing"
            OnRowCancelingEdit="PromotionGridView_RowCancelingEdit"
            OnRowUpdating="PromotionGridView_RowUpdating"
            DataKeyNames="PromotionID" BackColor="White" BorderColor="#999999" BorderStyle="None" BorderWidth="1px" CellPadding="3" GridLines="Vertical">
            <RowStyle Height="40px" />
            <FooterStyle Height="70px" />
            <AlternatingRowStyle BackColor="#DCDCDC" />

            <Columns>


                <asp:TemplateField HeaderText="Promotion Name">
                    <ItemTemplate>
                        <asp:Label ID="PromotionName" Text='<%# Eval("Name") %>' runat="server" Width="200px" />
                    </ItemTemplate>
                    <EditItemTemplate>
                        <asp:TextBox ID="txtBoxPromotionName" Text='<%# Eval("Name") %>' runat="server" Width="200px" />
                    </EditItemTemplate>
                    <FooterTemplate>
                        <asp:TextBox ID="NewPromotionName" runat="server" Width="200px" />
                    </FooterTemplate>
                </asp:TemplateField>


                <asp:TemplateField HeaderText="Promotion Description">
                    <ItemTemplate>
                        <asp:Label ID="LabelPromoDescription" Text='<%# Eval("Description") %>' runat="server" Width="300px" />
                    </ItemTemplate>
                    <EditItemTemplate>
                        <asp:TextBox ID="TextBoxPromotionDescription" TextMode="MultiLine" Text='<%# Eval("Description") %>' runat="server" Width="300px" />
                    </EditItemTemplate>
                    <FooterTemplate>
                        <asp:TextBox ID="NewPromotionDescr" TextMode="MultiLine" runat="server" Width="300px" />
                    </FooterTemplate>
                </asp:TemplateField>


                <asp:TemplateField HeaderText="Promotion Start Date">
                    <ItemTemplate>
                        <asp:Label ID="LabelPromoStart" Text='<%# Eval("StartDate") %>' runat="server" Width="250px" />
                    </ItemTemplate>
                    <EditItemTemplate>
                        <asp:TextBox ID="TextBoxPromotionStart" Text='<%# Eval("StartDate") %>' runat="server" Width="250px" />
                    </EditItemTemplate>
                    <FooterTemplate>
                        <asp:TextBox ID="NewStartDate" runat="server" Width="250px" />
                    </FooterTemplate>
                </asp:TemplateField>



                <asp:TemplateField HeaderText="Promotion End Date">
                    <ItemTemplate>
                        <asp:Label ID="LabelPromoDescriptionEnd" Text='<%# Eval("EndDate") %>' runat="server" Width="250px" />
                    </ItemTemplate>
                    <EditItemTemplate>
                        <asp:TextBox ID="TextBoxPromotionEnd" Text='<%# Eval("EndDate") %>' runat="server" Width="250px" />
                    </EditItemTemplate>
                    <FooterTemplate>
                        <asp:TextBox ID="NewPromotionEnd" runat="server" Width="250px" />
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
            <PagerStyle BackColor="#999999" ForeColor="Black" HorizontalAlign="Center" />
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
