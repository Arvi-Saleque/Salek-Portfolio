<%@ Page Title="Manage Achievements" Language="C#" MasterPageFile="~/Site.Master"
    AutoEventWireup="true" CodeBehind="Achievements.aspx.cs" Inherits="Salek_Portfolio.Admin.Achievements" %>

<asp:Content ID="Main" ContentPlaceHolderID="MainContent" runat="server">
<section class="section">
  <div class="container">
    <h2 class="section__title">Achievements</h2>
    <p class="section__lead">Add, edit, delete and reorder achievements.</p>

    <asp:Label ID="lblMsgA" runat="server" CssClass="form-status" EnableViewState="false" />

    <!-- Add new -->
    <div class="about" style="grid-template-columns:1fr">
      <div class="contact__form">
        <div class="form-row">
          <label for="txtATitle">Title</label>
          <asp:TextBox ID="txtATitle" runat="server" CssClass="input" MaxLength="150" />
        </div>
        <div class="form-row">
          <label for="txtAOrg">Organization</label>
          <asp:TextBox ID="txtAOrg" runat="server" CssClass="input" MaxLength="120" />
        </div>
        <div class="form-row">
          <label for="txtADate">Award date (YYYY or YYYY-MM-DD)</label>
          <asp:TextBox ID="txtADate" runat="server" CssClass="input" />
        </div>
        <div class="form-row">
          <label for="txtADesc">Description</label>
          <asp:TextBox ID="txtADesc" runat="server" CssClass="textarea" TextMode="MultiLine" Rows="3" />
        </div>
        <div class="form-row">
          <label for="txtAVerify">Verify URL</label>
          <asp:TextBox ID="txtAVerify" runat="server" CssClass="input" />
        </div>
        <div class="form-row">
          <label for="txtAIcon">Icon (Font Awesome class, e.g. fa-trophy)</label>
          <asp:TextBox ID="txtAIcon" runat="server" CssClass="input" />
        </div>
        <div class="form-row">
          <label for="txtAOrder">Display order</label>
          <asp:TextBox ID="txtAOrder" runat="server" CssClass="input" />
        </div>
        <div class="form-row">
          <label><asp:CheckBox ID="chkAActive" runat="server" Checked="true" /> Active</label>
        </div>
        <div class="form-actions">
          <asp:Button ID="btnAddA" runat="server" CssClass="btn" Text="Add achievement"
            OnClick="btnAddA_Click" UseSubmitBehavior="false" />
        </div>
      </div>
    </div>

    <div class="divider"></div>

    <!-- Grid -->
    <asp:GridView ID="gvAchievements" runat="server" AutoGenerateColumns="False" CssClass="table"
        DataKeyNames="AchievementId" GridLines="None"
        OnRowEditing="gvAchievements_RowEditing"
        OnRowCancelingEdit="gvAchievements_RowCancelingEdit"
        OnRowUpdating="gvAchievements_RowUpdating"
        OnRowDeleting="gvAchievements_RowDeleting"
        OnRowCommand="gvAchievements_RowCommand">
      <Columns>
        <%-- Reorder --%>
        <asp:TemplateField HeaderText="#">
          <ItemTemplate>
            <asp:LinkButton runat="server" CommandName="MoveUp" CommandArgument='<%# Eval("AchievementId") %>'
              CssClass="btn btn--sm btn--ghost">↑</asp:LinkButton>
            <asp:LinkButton runat="server" CommandName="MoveDown" CommandArgument='<%# Eval("AchievementId") %>'
              CssClass="btn btn--sm btn--ghost">↓</asp:LinkButton>
          </ItemTemplate>
        </asp:TemplateField>

        <asp:BoundField DataField="AchievementId" HeaderText="ID" ReadOnly="true" />

        <asp:TemplateField HeaderText="Title">
          <ItemTemplate><%# Eval("Title") %></ItemTemplate>
          <EditItemTemplate>
            <asp:TextBox ID="eATitle" runat="server" CssClass="input" Text='<%# Bind("Title") %>' />
          </EditItemTemplate>
        </asp:TemplateField>

        <asp:TemplateField HeaderText="Organization">
          <ItemTemplate><%# Eval("Organization") %></ItemTemplate>
          <EditItemTemplate>
            <asp:TextBox ID="eAOrg" runat="server" CssClass="input" Text='<%# Bind("Organization") %>' />
          </EditItemTemplate>
        </asp:TemplateField>

        <asp:TemplateField HeaderText="Award date">
          <ItemTemplate><%# Eval("AwardDate", "{0:yyyy-MM-dd}") %></ItemTemplate>
          <EditItemTemplate>
            <asp:TextBox ID="eADate" runat="server" CssClass="input" Text='<%# Bind("AwardDate", "{0:yyyy-MM-dd}") %>' />
          </EditItemTemplate>
        </asp:TemplateField>

        <asp:TemplateField HeaderText="Description">
          <ItemTemplate><%# Eval("Description") %></ItemTemplate>
          <EditItemTemplate>
            <asp:TextBox ID="eADesc" runat="server" CssClass="textarea" TextMode="MultiLine" Rows="2"
              Text='<%# Bind("Description") %>' />
          </EditItemTemplate>
        </asp:TemplateField>

        <asp:TemplateField HeaderText="Verify">
          <ItemTemplate><%# Eval("VerifyUrl") %></ItemTemplate>
          <EditItemTemplate>
            <asp:TextBox ID="eAVerify" runat="server" CssClass="input" Text='<%# Bind("VerifyUrl") %>' />
          </EditItemTemplate>
        </asp:TemplateField>

        <asp:TemplateField HeaderText="Icon">
          <ItemTemplate><%# Eval("Icon") %></ItemTemplate>
          <EditItemTemplate>
            <asp:TextBox ID="eAIcon" runat="server" CssClass="input" Text='<%# Bind("Icon") %>' />
          </EditItemTemplate>
        </asp:TemplateField>

        <asp:TemplateField HeaderText="Order">
          <ItemTemplate><%# Eval("DisplayOrder") %></ItemTemplate>
          <EditItemTemplate>
            <asp:TextBox ID="eAOrder" runat="server" CssClass="input" Text='<%# Bind("DisplayOrder") %>' />
          </EditItemTemplate>
        </asp:TemplateField>

        <asp:TemplateField HeaderText="Active">
          <ItemTemplate>
            <asp:CheckBox runat="server" Checked='<%# Convert.ToBoolean(Eval("IsActive")) %>' Enabled="false" />
          </ItemTemplate>
          <EditItemTemplate>
            <asp:CheckBox ID="eAActive" runat="server" Checked='<%# Bind("IsActive") %>' />
          </EditItemTemplate>
        </asp:TemplateField>

        <asp:CommandField ShowEditButton="true" ShowDeleteButton="true" />
      </Columns>
    </asp:GridView>

  </div>
</section>
</asp:Content>
