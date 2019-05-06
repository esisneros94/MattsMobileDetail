<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="MattMobileDetail.Login" ValidateRequest="true" %>

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

            .ErrorMessage {
                color: red;
            }
        </style>
    </head>
    <body >
        <div class="jumbotron">
            <asp:Label ID="FinalError" runat="server" Text="" CssClass="ErrorMessage"></asp:Label>
            <h2>Employee Login</h2>
            <asp:ValidationSummary ID="LoginErrorSummary" runat="server" DisplayMode="List" ShowSummary="true" HeaderText="Please do the following: " class="ErrorMessage" />

            <div>
                <h3>Username:</h3>
                <asp:TextBox ID="LoginEmail" Columns="80" MaxLength="80" Text="" runat="server" style="width: 800px;"/>

                <asp:RequiredFieldValidator ID="requiredEmail" runat="server" ControlToValidate="LoginEmail" ErrorMessage="Enter username" Class="ErrorMessage" />
                <asp:RegularExpressionValidator runat="server" ID="regexUsername" ControlToValidate="LoginEmail" ErrorMessage="Invalid username" ValidationExpression="^[^<=*'>]+$" Class="ErrorMessage" /><br />
                </div>

            <div>
                <h3>Password:</h3>
                <asp:TextBox ID="LoginPW" type="password" Columns="32" MaxLength="32" Text="" runat="server" style="width: 400px"/>
                <asp:RequiredFieldValidator ID="requiredPassword" runat="server" ControlToValidate="LoginPW" ErrorMessage="Enter password" Class="ErrorMessage" /> 
                <asp:RegularExpressionValidator runat="server" ID="regexPassword" ControlToValidate="LoginPW" ErrorMessage="Invalid password" ValidationExpression="^[^<=*'>]+$" Class="ErrorMessage" /><br />
                </div>
            <br />
            <br />
            <div>
                <asp:Button ID="LoginUserButton" runat="server" Text="Login" Class="Button" OnClick="RedirectToFAQ" />
            </div>
        </body>
    </html>
</asp:Content>
