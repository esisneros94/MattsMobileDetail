<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Services.aspx.cs" Inherits="MattMobileDetail.Services" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

     <!Doctype html>
    <html>
    <head>
        <style>
            .title{
                color:darkblue;
                text-align:center;
            }
            .image{
                left:0;
                width:100%;
                color:white;
                image-resolution:from-image;
                image-orientation: from-image;
                align-self: center;
                text-align:center;
            }
            .button{
                text-align:center;
            }
        </style>
    </head>
    <body>
        <div class="title">
            <h1>Services</h1>
        </div>
        <div class="image">
            <asp:Image ID="Services_Table" ImageUrl="~/Services_MMD.png" runat="server" ImageAlign="Middle" /> <%--NEED TO INCREASE SIZE--%>
            <br />
            <br />
        </div>
        <div class="button">
            <asp:Button ID="ScheduleAppt" Text="Schedule An Appointment" runat="server" OnClick="ScheduleAppt_Click" ForeColor="White" BackColor="Green" />
        </div>
    </body>
    </html>

</asp:Content>
