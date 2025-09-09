<%@ Page Title="Admin Login" Language="C#" MasterPageFile="~/Site.Master"
    AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="Salek_Portfolio.Login" %>

<asp:Content ID="Main" ContentPlaceHolderID="MainContent" runat="server">
<section class="section">
  <div class="container" style="max-width:520px">
    <h2 class="section__title">Admin login</h2>
    <p class="section__lead">Enter your credentials to access the dashboard.</p>

    <div class="contact__form">
      <asp:ValidationSummary runat="server" ValidationGroup="Login" CssClass="val-summary" />

      <div class="form-row">
        <label for="txtUser">Username</label>
        <asp:TextBox ID="txtUser" runat="server" CssClass="input" MaxLength="60" />
        <asp:RequiredFieldValidator runat="server" ControlToValidate="txtUser"
            ErrorMessage="Username is required" CssClass="val" ValidationGroup="Login" />
      </div>

      <div class="form-row">
        <label for="txtPass">Password</label>
        <asp:TextBox ID="txtPass" runat="server" CssClass="input" TextMode="Password" MaxLength="100" />
        <asp:RequiredFieldValidator runat="server" ControlToValidate="txtPass"
            ErrorMessage="Password is required" CssClass="val" ValidationGroup="Login" />
      </div>

      <div class="form-actions">
        <asp:Button ID="btnLogin" runat="server" CssClass="btn" Text="Sign in"
            UseSubmitBehavior="false" ValidationGroup="Login" OnClick="btnLogin_Click" />
        <asp:Label ID="lblLoginError" runat="server" CssClass="val" />
      </div>
    </div>
  </div>
</section>
</asp:Content>
