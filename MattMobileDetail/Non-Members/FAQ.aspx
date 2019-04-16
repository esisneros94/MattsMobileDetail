<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="FAQ.aspx.cs" Inherits="MattMobileDetail.FAQ" ValidateRequest="true" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <!Doctype html>
    <html>
    <head>
        <style>
            .Button {
                width: 100%;
                height: 40px;
                text-align: left;
                transition-duration: 0.4s;
                background-color: #368BC1;
                color: white;
            }

                .Button:hover {
                    background-color: midnightblue;
                    color: white;
                }

            .TitleRows {
                border: 1px solid black;
                text-align: center;
                height: 50px;
                background-color: lightgray;
                text-align: center;
                padding: 10px;
            }
        </style>

    </head>
    <body>
        <div class="title">
            <h1>Frequently Asked Questions</h1>
        </div>
        <div class="container" style="margin: 20px 0px;">
            <div class="row TitleRows">
                <div>
                    Below are the most commonly asked questions, please follow up with Matt if your answer is not listed below.
                </div>
            </div>
            <div class="row" style="border: 1px solid black;">
                <div>
                    <button type="button" class="Button" data-toggle="collapse" data-target="#demo">What are your Prices? </button>
                    <div id="demo" class="collapse">
                        <div style="margin: 10px 0px;">Prices range from $50 to $140 depending on what package is chosen. <a href="Services.aspx">Services Page</a> </div>
                        <%--Would like to add space between FAQs--%>
                    </div>
                </div>
                <div>
                    <button type="button" class="Button" data-toggle="collapse" data-target="#demo2">What does each package include?</button>
                    <div id="demo2" class="collapse">
                        <div style="margin: 10px 0px;">
                            Visit services page to see the specific package details. <a href="~/Non-Members/Services.aspx">Services Page</a>
                        </div>
                    </div>
                </div>
                <div>
                    <button type="button" class="Button" data-toggle="collapse" data-target="#demo3">Do you come to me? Or do I need to come to you? </button>
                    <div id="demo3" class="collapse">
                        <div style="margin: 10px 0px;">
                            Matt’s Mobile Detailing is completely mobile meaning we come to you!
                        </div>
                    </div>
                </div>
                <div>
                    <button type="button" class="Button" data-toggle="collapse" data-target="#demo4">How long is it going to take?</button>
                    <div id="demo4" class="collapse">
                        <div style="margin: 10px 0px;">
                            The Basic Detail usually takes around an hour and the Full Detail takes right around 2 hours depending on the condition.
                        </div>
                    </div>
                </div>
                <div>
                    <button type="button" class="Button" data-toggle="collapse" data-target="#demo5">Do you accept card, cash, Venmo, apple pay? </button>
                    <div id="demo5" class="collapse">
                        <div style="margin: 10px 0px;">
                        All forms of payment are accepted. There is a 4 percent credit card fee when paying through apple square.
                        </div>
                    </div>
                </div>
                <div>
                    <button type="button" class="Button" data-toggle="collapse" data-target="#demo6">Do you detail on weekends? </button>
                    <div id="demo6" class="collapse">
                        <div style="margin: 10px 0px;">
                        Matt’s Mobile Detailing is open 7 days a week! Sun up to sundown. Check out the schedule an appointment page to see
                        my weekly schedule. <a href="~/Non-Members/ScheduleAppointment.aspx">Appointment Page</a>
                        </div>
                    </div>
                </div>
                <div>
                    <button type="button" class="Button" data-toggle="collapse" data-target="#demo7">How far do you travel to a detail? </button>
                    <div id="demo7" class="collapse">
                        <div style="margin: 10px 0px;">
                        Travel is usually within a 30-mile radius, although Matt has clients in Las Cruces, Santa Fe, and Belen.
                        </div>
                    </div>
                </div>
                <div>
                    <button type="button" class="Button" data-toggle="collapse" data-target="#demo8">Is there a multiple car in one area discount? </button>
                    <div id="demo8" class="collapse">
                        <div style="margin: 10px 0px;">
                        Yes! If there are multiple cars in one area that need detailing same day a discount will be applied.
                        </div>
                    </div>
                </div>
            </div>
        </div>

    </body>
    </html>



</asp:Content>
