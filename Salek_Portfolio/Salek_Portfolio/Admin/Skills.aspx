<%@ Page Title="Manage Skills" Language="C#" MasterPageFile="~/Site.Master"
    AutoEventWireup="true" CodeBehind="Skills.aspx.cs" Inherits="Salek_Portfolio.Admin.Skills" %>

<asp:Content ID="Main" ContentPlaceHolderID="MainContent" runat="server">
<section class="section">
  <div class="container">
    <h2 class="section__title">Skills</h2>
    <p class="section__lead">Add, edit, delete and reorder skills.</p>

    <asp:ValidationSummary runat="server" ValidationGroup="Add" CssClass="val-summary" />
    <asp:Label ID="lblMsg" runat="server" CssClass="form-status" EnableViewState="false" />

    <!-- Add new -->
    <div class="about" style="grid-template-columns:1fr">
      <div class="contact__form">
        <div class="form-row">
          <label for="txtNewName">Name</label>
          <asp:TextBox ID="txtNewName" runat="server" CssClass="input" MaxLength="100" />
          <asp:RequiredFieldValidator runat="server" ControlToValidate="txtNewName"
            ErrorMessage="Name required" CssClass="val" ValidationGroup="Add" />
        </div>

        <div class="form-row">
          <label for="ddlNewCategory">Category</label>
          <asp:DropDownList ID="ddlNewCategory" runat="server" CssClass="input">
            <asp:ListItem>Frontend</asp:ListItem>
            <asp:ListItem>Backend</asp:ListItem>
            <asp:ListItem>Database</asp:ListItem>
          </asp:DropDownList>
        </div>

        <div class="form-row">
          <label for="txtNewProf">Proficiency (0–100)</label>
          <asp:TextBox ID="txtNewProf" runat="server" CssClass="input" Text="80" />
          <asp:RangeValidator runat="server" ControlToValidate="txtNewProf"
            MinimumValue="0" MaximumValue="100" Type="Integer"
            ErrorMessage="0–100 only" CssClass="val" ValidationGroup="Add" />
        </div>

        <div class="form-row">
          <label for="txtNewOrder">Display order</label>
          <asp:TextBox ID="txtNewOrder" runat="server" CssClass="input" Text="" />
        </div>

        <div class="form-row">
          <label><asp:CheckBox ID="chkNewActive" runat="server" Checked="true" /> Active</label>
        </div>

        <div class="form-actions">
          <asp:Button ID="btnAdd" runat="server" CssClass="btn" Text="Add skill"
            OnClick="btnAdd_Click" ValidationGroup="Add" UseSubmitBehavior="false" />
        </div>
      </div>
    </div>

    <div class="divider"></div>

    <!-- Grid -->
    <asp:GridView ID="gvSkills" runat="server" AutoGenerateColumns="False" CssClass="table"
    DataKeyNames="SkillId,Category" GridLines="None"
    OnRowEditing="gvSkills_RowEditing"
    OnRowCancelingEdit="gvSkills_RowCancelingEdit"
    OnRowUpdating="gvSkills_RowUpdating"
    OnRowDeleting="gvSkills_RowDeleting"
    OnRowCommand="gvSkills_RowCommand"
    OnRowDataBound="gvSkills_RowDataBound">

  <Columns>
    <%-- Reorder --%>
    <asp:TemplateField HeaderText="#">
      <ItemTemplate>
        <asp:LinkButton runat="server" CommandName="MoveUp" CommandArgument='<%# Eval("SkillId") %>'
            CssClass="btn btn--sm btn--ghost" ToolTip="Move up">↑</asp:LinkButton>
        <asp:LinkButton runat="server" CommandName="MoveDown" CommandArgument='<%# Eval("SkillId") %>'
            CssClass="btn btn--sm btn--ghost" ToolTip="Move down">↓</asp:LinkButton>
      </ItemTemplate>
    </asp:TemplateField>

    <asp:BoundField DataField="SkillId" HeaderText="ID" ReadOnly="true" />

    <asp:TemplateField HeaderText="Name">
      <ItemTemplate><%# Eval("Name") %></ItemTemplate>
      <EditItemTemplate>
        <asp:TextBox ID="txtName" runat="server" CssClass="input" Text='<%# Bind("Name") %>' MaxLength="100" />
      </EditItemTemplate>
    </asp:TemplateField>

    <asp:TemplateField HeaderText="Category">
      <ItemTemplate><%# Eval("Category") %></ItemTemplate>
      <EditItemTemplate>
        <asp:DropDownList ID="ddlCategory" runat="server" CssClass="input">
          <asp:ListItem>Frontend</asp:ListItem>
          <asp:ListItem>Backend</asp:ListItem>
          <asp:ListItem>Database</asp:ListItem>
        </asp:DropDownList>
      </EditItemTemplate>
    </asp:TemplateField>

    <asp:TemplateField HeaderText="Proficiency">
      <ItemTemplate><%# Eval("Proficiency") %>%</ItemTemplate>
      <EditItemTemplate>
        <asp:TextBox ID="txtProf" runat="server" CssClass="input" Text='<%# Bind("Proficiency") %>' />
      </EditItemTemplate>
    </asp:TemplateField>

    <asp:TemplateField HeaderText="Order">
      <ItemTemplate><%# Eval("DisplayOrder") %></ItemTemplate>
      <EditItemTemplate>
        <asp:TextBox ID="txtOrder" runat="server" CssClass="input" Text='<%# Bind("DisplayOrder") %>' />
      </EditItemTemplate>
    </asp:TemplateField>

    <asp:TemplateField HeaderText="Active">
      <ItemTemplate>
        <asp:CheckBox runat="server" Checked='<%# Convert.ToBoolean(Eval("IsActive")) %>' Enabled="false" />
      </ItemTemplate>
      <EditItemTemplate>
        <asp:CheckBox ID="chkActive" runat="server" Checked='<%# Bind("IsActive") %>' />
      </EditItemTemplate>
    </asp:TemplateField>

    <asp:CommandField ShowEditButton="true" ShowDeleteButton="true" />
  </Columns>
</asp:GridView>


  </div>
</section>
</asp:Content>
