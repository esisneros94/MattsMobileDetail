<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="FAQ.aspx.cs" Inherits="MattMobileDetail.FAQ" %>

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
        <div class="container" style="margin: 20px 0px;">
            <div class="row TitleRows">
                <div>
                    Have questions?
                </div>
            </div>
            <div class="row TitleRows">
                <div>
                    Get some answers to what people ask us the most!
                </div>
            </div>
            <div class="row" style="border: 1px solid black;">
                <div>
                    <button type="button" class="Button" data-toggle="collapse" data-target="#demo">This will be a question</button>
                    <div id="demo" class="collapse">
                        Lorem ipsum dolor sit amet, consectetur adipisicing elit,
                        sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam,
                        quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.
                    </div>
                </div>
                <div>
                    <button type="button" class="Button" data-toggle="collapse" data-target="#demo2">This will be a question</button>
                    <div id="demo2" class="collapse">
                        Lorem ipsum dolor sit amet, consectetur adipisicing elit,
                        sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam,
                        quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.
                    </div>
                </div>
                <div>
                    <button type="button" class="Button" data-toggle="collapse" data-target="#demo3">This will be a question</button>
                    <div id="demo3" class="collapse">
                        Lorem ipsum dolor sit amet, consectetur adipisicing elit,
                        sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam,
                        quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.
                    </div>
                </div>
                <div>
                    <button type="button" class="Button" data-toggle="collapse" data-target="#demo4">This will be a question</button>
                    <div id="demo4" class="collapse">
                        Lorem ipsum dolor sit amet, consectetur adipisicing elit,
                        sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam,
                        quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.
                    </div>
                </div>
                <div>
                    <button type="button" class="Button" data-toggle="collapse" data-target="#demo5">This will be a question</button>
                    <div id="demo5" class="collapse">
                        Lorem ipsum dolor sit amet, consectetur adipisicing elit,
                        sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam,
                        quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.
                    </div>
                </div>
                <div>
                    <button type="button" class="Button" data-toggle="collapse" data-target="#demo6">This will be a question</button>
                    <div id="demo6" class="collapse">
                        Lorem ipsum dolor sit amet, consectetur adipisicing elit,
                        sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam,
                        quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.
                    </div>
                </div>
            </div>
        </div>

    </body>
    </html>



</asp:Content>
