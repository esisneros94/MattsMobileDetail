<%@ Page Title="" Language="C#" MasterPageFile="~/EmployeeContent.Master" AutoEventWireup="true" CodeBehind="NewPromotions.aspx.cs" Inherits="MattMobileDetail.NewPromotions" ValidateRequest="true" %>

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
                        <asp:RequiredFieldValidator ID="ReqUpdateName" ControlToValidate="txtBoxPromotionName" runat="server" ErrorMessage="Please enter a Name" Text="*" ForeColor="Red"></asp:RequiredFieldValidator>
                    </EditItemTemplate>
                    <FooterTemplate>
                        <asp:TextBox ID="NewPromotionName" runat="server" Width="180px" />
                        <asp:RequiredFieldValidator ID="ReqNewName" ValidationGroup="Insert" ControlToValidate="NewPromotionName" runat="server" ErrorMessage="Please enter a Name" Text="*" ForeColor="Red"></asp:RequiredFieldValidator>
                    </FooterTemplate>
                </asp:TemplateField>


                <asp:TemplateField HeaderText="Promotion Description">
                    <ItemTemplate>
                        <asp:Label ID="LabelPromoDescription" Text='<%# Eval("Description") %>' runat="server" Width="300px" />
                    </ItemTemplate>
                    <EditItemTemplate>
                        <asp:TextBox ID="TextBoxPromotionDescription" TextMode="MultiLine" Text='<%# Eval("Description") %>' runat="server" Width="300px" />
                        <asp:RequiredFieldValidator ID="ReqUpdateDescription" ControlToValidate="TextBoxPromotionDescription" runat="server" ErrorMessage="Please enter a description" Text="*" ForeColor="Red"></asp:RequiredFieldValidator>
                    </EditItemTemplate>
                    <FooterTemplate>
                        <asp:TextBox ID="NewPromotionDescr" TextMode="MultiLine" runat="server" Width="300px"  />
                        <asp:RequiredFieldValidator ID="ReqDescription"  ValidationGroup="Insert" ControlToValidate="NewPromotionDescr" runat="server" ErrorMessage="Please enter a description" Text="*" ForeColor="Red"></asp:RequiredFieldValidator>
                    </FooterTemplate>
                </asp:TemplateField>


                <asp:TemplateField HeaderText="Promotion Start Date">
                    <ItemTemplate>
                        <asp:Label ID="LabelPromoStart" Text='<%# Eval("StartDate") %>' runat="server" Width="250px" />
                    </ItemTemplate>
                    <EditItemTemplate>
                        <asp:TextBox ID="TextBoxPromotionStart" Text='<%# Eval("StartDate") %>' runat="server" Width="250px" />
                        <asp:RequiredFieldValidator ID="ReqUpdateStart" ControlToValidate="TextBoxPromotionStart" runat="server" ErrorMessage="Please enter a start date" Text="*" ForeColor="Red"></asp:RequiredFieldValidator>
                    </EditItemTemplate>
                    <FooterTemplate>
                        <asp:TextBox ID="NewStartDate"  runat="server" Width="220px" />
                        <asp:RequiredFieldValidator ID="ReqStartDate" ValidationGroup="Insert" ControlToValidate="NewStartDate" runat="server" ErrorMessage="Please enter a start date" Text="*" ForeColor="Red"></asp:RequiredFieldValidator>
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
                        <asp:TextBox ID="NewPromotionEnd" runat="server" Width="220px" />
                    </FooterTemplate>
                </asp:TemplateField>

                <asp:TemplateField>
                    <ItemTemplate>
                        <asp:Button runat="server" Text="Edit" CausesValidation="false" CommandName="Edit" ToolTip="Edit" />
                    </ItemTemplate>
                    <EditItemTemplate>
                        <asp:Button runat="server" Text="Cancel" CausesValidation="false" ToolTip="Cancel" CommandName="Cancel" />
                        <asp:Button runat="server" Text="Update" ToolTip="Update" CommandName="Update" />
                    </EditItemTemplate>
                    <FooterTemplate>
                        <asp:Button Text="Add New" ValidationGroup="Insert" runat="server" CommandName="AddNew" />
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

    <asp:ValidationSummary runat="server" ValidationGroup="Insert" ForeColor="Red" ID="PromotionsValidationSummary" DisplayMode="BulletList"/>
    <asp:ValidationSummary runat="server" ForeColor="Red" ID="UpdatePromotionsSummary" DisplayMode="BulletList"/>
    


</asp:Content>
