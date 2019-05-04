<%@ Page Title="Home Page" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="MattMobileDetail._Default" ValidateRequest="true" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">

    <!doctype html>

    <head>
        <style>
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

            .ImageButton {
                width:125px;
                height:125px;
                align-content:center;

            }

                .ImageButton:hover {
                    width:175px;
                    height:175px;
                }

            .MainSection {
                background-color: lightgray;
                background-size: cover;
            }

            .firstRow {
                margin: 20px;
                height: 250px;
                background-color: white;
                border: 1px solid black;
            }

            .firstRowPicture {
                margin: 20px;
                background-color: white;
            }

            .secondRow {
                margin: 10px 0px;
                background-color: white;
                border: 1px solid black;
            }

            .secondRowButton {
                margin: 10px 0px;
                margin-left: 60px;
                height: 50px;
                align-content: center;
                }

            .thirdRow {
                margin: 20px;
                height: 250px;
            }

            .bordering {
                border: 1px solid black;
            }

            
        </style>

    </head>


    <body>
        <div class="container">
            <div class="row">
                <div class="col-md-3 firstRowPicture">
                    <img src="Pictures/Matts Car Logo.jpg" style="width: 350px; height: 250px" />
                </div>
                <div class="col-md-1">
                </div>
                <div class="col-md-7 firstRow">
                    Just some more text

                </div>
            </div>
        </div>
        
        <div class="container">
            <div class="row">
                <div class="col-md-3 secondRowButton">
                    <asp:Button ID="ScheduleButton" runat="server" CssClass="Button" Text="Schedule an Appointment" OnClick="RedirectToScheduleAppointment" />
                </div>
                <div class="col-md-1">
                </div>
                <div class="col-md-7 secondRow">
                    <h4 style="text-align: center; color: green">Current Promotions!!</h4>


                    <asp:PlaceHolder ID="PromotionsSpace" runat="server"></asp:PlaceHolder>
                </div>
            </div>
        </div>
        
        <br />
        <br />
        <br />

        <div class="container">
            <div class="row">
                <div class="col-md-1">
                </div>

                <div class="col-md-3 thirdRow">
                    <asp:ImageButton class="ImageButton" ID="btFacebook" OnClick="btFacebook_Click" runat="server" ImageUrl="~/Pictures/facebook.png" Height="125px" Width="125px" ToolTip="Matt's Mobile Detailing ABQ" />
                </div>

                <div class="col-md-3 thirdRow">
                    <asp:ImageButton class="ImageButton" ID="btInstagram" OnClick="ntInstagram_Click" runat="server" ImageUrl="~/Pictures/instagram.png" Height="125px" Width="125px" ToolTip="Matts_Mobile_Detailing" />
                </div>

                <div class="col-md-3 thirdRow">
                    <asp:ImageButton class="ImageButton" ID="btSnapchat" OnClick="btSnapchat_Click" runat="server" ImageUrl="~/Pictures/snapchat.png" Height="125px" Width="125px" ToolTip="mo9omick" />
                </div>

                <%--YOUTUBE AND TWITTER ACCOUNTS AS WELL - waiting on links--%>
                <div class="col-md-1">
                </div>
            </div>
        </div>
    </body>
    </html>

</asp:Content>

