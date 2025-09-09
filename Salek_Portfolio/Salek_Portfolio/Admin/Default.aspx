<%@ Page Title="Admin Dashboard" Language="C#" MasterPageFile="~/Site.Master"
    AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="Salek_Portfolio.Admin.Default" %>

<asp:Content ID="Main" ContentPlaceHolderID="MainContent" runat="server">
<section class="section">
  <div class="container">
    <h2 class="section__title">Admin Dashboard</h2>
    <p class="section__lead">Manage your portfolio content.</p>

    <div class="skills" style="grid-template-columns:repeat(3,minmax(0,1fr))">
      <a class="btn btn--ghost" href="<%: ResolveUrl("~/Admin/Skills.aspx") %>">
        <i class="fa-solid fa-wrench"></i> Manage Skills
      </a>
      <a class="btn btn--ghost" href="<%: ResolveUrl("~/Admin/Projects.aspx") %>">
        <i class="fa-solid fa-briefcase"></i> Manage Projects
      </a>
      <a class="btn btn--ghost" href="<%: ResolveUrl("~/Admin/Achievements.aspx") %>">
        <i class="fa-solid fa-trophy"></i> Manage Achievements
      </a>
    </div>

    <div class="divider"></div>
    <a class="btn btn--sm btn--ghost" href="<%: ResolveUrl("~/Logout.aspx") %>">
      <i class="fa-solid fa-right-from-bracket"></i> Sign out
    </a>
  </div>
</section>
</asp:Content>
