<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="MattMobileDetail.Login" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

    <!doctype html>
    <html>
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
        </style>
    </head>
    <body>
        <div class="jumbotron">
            <h2>Employee Login</h2>
            <asp:ValidationSummary ID="LoginErrorSummary" runat="server" DisplayMode="List" ShowSummary="true" HeaderText="Please do the following: " class="ErrorMessage" />

            <div>
                <h3>Email:</h3>
                <asp:TextBox ID="LoginEmail" Columns="80" MaxLength="80" Text="" runat="server" />
            </div>

            <div>
                <h3>Password:</h3>
                <asp:TextBox ID="LoginPW" type="password" Columns="32" MaxLength="16" Text="" runat="server" />
            </div>
            <br />
            <br />
            <div>
                <asp:Button ID="LoginUserButton" runat="server" Text="Login" Class="Button" />
            </div>



        </div>
    </body>
    </html>

</asp:Content>
