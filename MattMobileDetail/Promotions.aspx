<%@ Page Title="" Language="C#" MasterPageFile="~/EmployeeContent.Master" AutoEventWireup="true" CodeBehind="Promotions.aspx.cs" Inherits="MattMobileDetail.Promotions" %>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <div class="container" style="height: 800px; width: 100%; margin: 20px; border: 1px solid black;">
        <div style="height: 800px; width: 47%; background-color: green; float: left; margin-top: 10px">
            <h3 style="margin: 0px; padding: 0px; text-align: center;">Deactivate a Promotions</h3>

            


        </div>

        <div style="height: 800px; width: 50%; float: right; margin: 10px 0px;">
            <div style="height: 395px; width: 100%; background-color: lightgrey;">
                <h3 style="margin: 0px; padding: 10px; text-align: center; ">Add A New Promotion</h3>
                Promotion Name: <asp:TextBox ID="NewPromoName" runat="server"></asp:TextBox> <br /><br />
                Start Date: <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox><br /><br />
                End Date: <asp:TextBox ID="TextBox2" runat="server"></asp:TextBox><br /><br />
                Description: <br />
                <asp:TextBox ID="NewDescription" runat="server" TextMode="MultiLine" Height="100px" Width="400px"></asp:TextBox><br />

                <asp:Button ID="CreateNewPromotion" runat="server" text="Create New Promotion" Width="200px"/>

            </div>

            <div style="height: 395px; width: 100%; background-color: yellow; margin-top: 10px;">
                <h3 style="margin: 0px; padding: 0px; text-align: center; ">Edit A Promotion</h3>

                Promotion to Edit:
                <asp:DropDownList ID="PromotionsDropDown" runat="server">
                </asp:DropDownList>
                <br />
                <br />  
            
                Promotion Name: <asp:TextBox ID="EditPromotionName" runat="server"></asp:TextBox> <br /><br />
                Start Date: <asp:TextBox ID="EditPromotionStartDate" runat="server"></asp:TextBox><br /><br />
                End Date: <asp:TextBox ID="EditPromotionEndDate" runat="server"></asp:TextBox><br /><br />
                Description: <br />
                <asp:TextBox ID="EditPromotionDescription" runat="server" TextMode="MultiLine" Height="100px" Width="400px"></asp:TextBox><br />


            </div>
        </div>
    </div>
</asp:Content>
