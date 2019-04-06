<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Reviews.aspx.cs" Inherits="MattMobileDetail.Reviews" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
     <html>
    <head>
        <style>
            .title{
                color:darkblue;
                text-align:center;
            }
            .button{
                text-align:center;
                width:auto;
            }
        </style>
    </head>
    <body>
        <div class="title">
            <h1>Reviews</h1>
        </div>
        <div class="image">
            <asp:GridView runat="server" ID="Review_Grid" AutoGenerateColumns="false" CellPadding="4" GridLines="Horizontal" HorizontalAlign="Center">
                <Columns>
                    <asp:BoundField HeaderText="Rating" ReadOnly="true"  />
                    <asp:BoundField DataField="" HeaderText="Customer" ReadOnly="true" />
                    <asp:BoundField DataField="" HeaderText="Comments" ReadOnly="true" />
                </Columns>
            </asp:GridView>
        </div>
        <div class="button">
            <br />
            <asp:Button ID="ScheduleAppt" Text="Schedule An Appointment" runat="server" OnClick="ScheduleAppt_Click" ForeColor="White" BackColor="Green" Width="195px" />
        </div>
    </body>
    </html>
</asp:Content>
