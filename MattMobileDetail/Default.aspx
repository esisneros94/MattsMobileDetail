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


            .flip3D {
                width: 240px;
                height: 200px;
                margin: 10px;
                float: left;
            }

                .flip3D > .front {
                    position: absolute;
                    transform: perspective( 600px) rotateY( 0deg );
                    background: #0682e0;
                    width: 240px;
                    height: 200px;
                    text-align: center;
                    border-radius: 7px;
                    backface-visibility: hidden;
                    transition: transform .5s linear 0s;
                }

                .flip3D > .frontSnapchat {
                    position: absolute;
                    transform: perspective( 600px) rotateY( 0deg );
                    background: #ffff80;
                    width: 240px;
                    height: 200px;
                    text-align: center;
                    border-radius: 7px;
                    backface-visibility: hidden;
                    transition: transform .5s linear 0s;
                }

                .flip3D > .frontInstagram {
                    position: absolute;
                    transform: perspective( 600px) rotateY( 0deg );
                    background: #a64dff;
                    width: 240px;
                    height: 200px;
                    text-align: center;
                    border-radius: 7px;
                    backface-visibility: hidden;
                    transition: transform .5s linear 0s;
                }

                .flip3D > .back {
                    position: absolute;
                    transform: perspective( 600px) rotateY( 180deg );
                    background: #80BFFF;
                    width: 240px;
                    height: 200px;
                    border-radius: 7px;
                    backface-visibility: hidden;
                    transition: transform .5s linear 0s;
                }

                .flip3D:hover > .front {
                    transform: perspective( 600px) rotateY( -180deg );
                    background: #ff0000;
                }

                .flip3D:hover > .frontSnapchat {
                    transform: perspective( 600px) rotateY( -180deg );
                    background: #ff0000;
                }

                .flip3D:hover > .frontInstagram {
                    transform: perspective( 600px) rotateY( -180deg );
                    background: #a64dff;
                }

                .flip3D:hover > .back {
                    transform: perspective( 600px) rotateY( 0deg );
                    background: #ff0000;
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

        <div class="container">
            <div class="row">
                <div class="col-md-1">
                </div>
                <div class="col-md-3 thirdRow">
                    <div class="flip3D">
                        <div class="back">
                            Facebook https://www.facebook.com/MattsMobileDetailingABQ/
                        </div>
                        <div class="front">Facebook</div>
                    </div>
                </div>


                <div class="col-md-3 thirdRow">
                    <div class="flip3D">
                        <div class="back">
                            Instagram https://www.instagram.com/matts_mobile_detail/
                        </div>
                        <div class="frontInstagram">Instagram</div>
                    </div>
                </div>


                <div class="col-md-3 thirdRow">
                    <div class="flip3D">
                        <div class="back">
                        </div>
                        <div class="frontSnapchat">Snapchat</div>
                    </div>
                </div>
                <%--YOUTUBE AND TWITTER ACCOUNTS AS WELL - waiting on links--%>
                <div class="col-md-1">
                </div>
            </div>
        </div>
    </body>
    </html>

</asp:Content>

