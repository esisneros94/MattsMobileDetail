<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Reviews.aspx.cs" Inherits="MattMobileDetail.Reviews" ValidateRequest="true" %>
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
        <div class="jumbotron text-center">
            <h1>Reviews</h1>
            <p>Take a look at what Matt's happy customers have to say!</p>
        </div>

        <div class="container">
            <div class="row">
                <div class="col-sm-4">
                    <h3>★★★★★</h3>
                    <p>Matt has been keeping my car spotless for the past couple years, he really takes the time to make sure I am a satisfied customer.</p>
                </div>
                <div class="col-sm-4">
                    <h3>★★★★★</h3>
                    <p>Matt's attention to detail has made a huge impact on the longevity of my car's paint and interior. I absolutely reccomend!</p>
                </div>
                <div class="col-sm-4">
                    <h3>★★★★★</h3>
                    <p>Matt's business is so convenient. I love that he is able to come to my work and detail my car. </p>
                </div>
            </div>
        </div>
        <div class="button">
            <br />
            <asp:Button ID="ScheduleAppt" Text="Schedule An Appointment" runat="server" OnClick="ScheduleAppt_Click" ForeColor="White" BackColor="Green" Width="195px" />
        </div>
    </body>
    </html>
</asp:Content>
