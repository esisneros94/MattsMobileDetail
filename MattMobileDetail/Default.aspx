<%@ Page Title="Home Page" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="MattMobileDetail._Default" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">

    <!doctype html>

    <head>
        <style>
            .Button {
                width: 100%;
                height: 50px;
                border-radius: 12px;
                transition-duration: 0.4s;
                background-color: midnightblue;
                color: white;
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
            }

            .secondRow {
                margin: 10px 20px;
                background-color: white;
            }

            .secondRowButton {
                margin: 10px 20px;
                height: 50px;
                background-color: lightgray;
            }

            .thirdRow {
                margin: 20px;
                height: 250px;
            }
        </style>

    </head>


    <body class="MainSection">
        <div class="container">
            <div class="row">
                <div class="col-md-3 firstRow">
                    This is just a basic page.
                </div>
                <div class="col-md-1">
                </div>
                <div class="col-md-8 firstRow">
                    Just some more text

                </div>
            </div>
        </div>

        <div class="container">
            <div class="row">
                <div class="col-md-3 secondRowButton">
                    <asp:Button ID="ScheduleButton" runat="server" CssClass="Button" Text="Schedule an Appointment" onClick="RedirectToScheduleAppointment"/>
                </div>
                <div class="col-md-1">
                </div>
                <div class="col-md-8 secondRow">
                    <asp:PlaceHolder ID="PromotionsSpace" runat="server"
>

                    </asp:PlaceHolder>
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
                            Top 3 favorite movies
                        </div>
                        <div class="front">Facebook</div>
                    </div>
                </div>


                <div class="col-md-3 thirdRow">
                    <div class="flip3D">
                        <div class="back">
                            Top 3 favorite movies
                        </div>
                        <div class="frontInstagram">Instagram</div>
                    </div>
                </div>


                <div class="col-md-3 thirdRow">
                    <div class="flip3D">
                        <div class="back">
                            Top 3 favorite movies
                        </div>
                        <div class="frontSnapchat">Snapchat</div>
                    </div>
                </div>

                <div class="col-md-1">
                </div>
            </div>
        </div>
    </body>
    </html>

</asp:Content>

