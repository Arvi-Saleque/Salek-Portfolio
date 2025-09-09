<%@ Page Title="Manage Projects" Language="C#" MasterPageFile="~/Site.Master"
    AutoEventWireup="true" CodeBehind="Projects.aspx.cs" Inherits="Salek_Portfolio.Admin.Projects" %>

<asp:Content ID="Main" ContentPlaceHolderID="MainContent" runat="server">
<section class="section">
  <div class="container">
    <h2 class="section__title">Projects</h2>
    <p class="section__lead">Add, edit, delete and reorder projects.</p>

    <asp:Label ID="lblMsgP" runat="server" CssClass="form-status" EnableViewState="false" />

    <!-- Add new -->
    <div class="about" style="grid-template-columns:1fr">
      <div class="contact__form">
        <div class="form-row">
          <label for="txtTitle">Title</label>
          <asp:TextBox ID="txtTitle" runat="server" CssClass="input" MaxLength="150" />
        </div>
        <div class="form-row">
          <label for="txtDesc">Description</label>
          <asp:TextBox ID="txtDesc" runat="server" CssClass="textarea" TextMode="MultiLine" Rows="3" />
        </div>
        <div class="form-row">
          <label for="txtImage">Image path</label>
          <asp:TextBox ID="txtImage" runat="server" CssClass="input" placeholder="Content/img/pro-1.jpg" />
        </div>
        <div class="form-row">
          <label for="txtLive">Live URL</label>
          <asp:TextBox ID="txtLive" runat="server" CssClass="input" />
        </div>
        <div class="form-row">
          <label for="txtCode">Code URL</label>
          <asp:TextBox ID="txtCode" runat="server" CssClass="input" />
        </div>
        <div class="form-row">
          <label for="txtTags">Tags (comma separated)</label>
          <asp:TextBox ID="txtTags" runat="server" CssClass="input" />
        </div>
        <div class="form-row">
          <label for="txtOrderP">Display order</label>
          <asp:TextBox ID="txtOrderP" runat="server" CssClass="input" />
        </div>
        <div class="form-row">
          <label><asp:CheckBox ID="chkActiveP" runat="server" Checked="true" /> Active</label>
        </div>
        <div class="form-actions">
          <asp:Button ID="btnAddP" runat="server" CssClass="btn" Text="Add project"
            OnClick="btnAddP_Click" UseSubmitBehavior="false" />
        </div>
      </div>
    </div>

    <div class="divider"></div>

    <!-- Grid -->
    <asp:GridView ID="gvProjects" runat="server" AutoGenerateColumns="False" CssClass="table"
        DataKeyNames="ProjectId" GridLines="None"
        OnRowEditing="gvProjects_RowEditing"
        OnRowCancelingEdit="gvProjects_RowCancelingEdit"
        OnRowUpdating="gvProjects_RowUpdating"
        OnRowDeleting="gvProjects_RowDeleting"
        OnRowCommand="gvProjects_RowCommand">
      <Columns>
        <%-- Reorder --%>
        <asp:TemplateField HeaderText="#">
          <ItemTemplate>
            <asp:LinkButton runat="server" CommandName="MoveUp" CommandArgument='<%# Eval("ProjectId") %>'
              CssClass="btn btn--sm btn--ghost">↑</asp:LinkButton>
            <asp:LinkButton runat="server" CommandName="MoveDown" CommandArgument='<%# Eval("ProjectId") %>'
              CssClass="btn btn--sm btn--ghost">↓</asp:LinkButton>
          </ItemTemplate>
        </asp:TemplateField>

        <asp:BoundField DataField="ProjectId" HeaderText="ID" ReadOnly="true" />

        <asp:TemplateField HeaderText="Title">
          <ItemTemplate><%# Eval("Title") %></ItemTemplate>
          <EditItemTemplate>
            <asp:TextBox ID="eTitle" runat="server" CssClass="input" Text='<%# Bind("Title") %>' />
          </EditItemTemplate>
        </asp:TemplateField>

        <asp:TemplateField HeaderText="Description">
          <ItemTemplate><%# Eval("Description") %></ItemTemplate>
          <EditItemTemplate>
            <asp:TextBox ID="eDesc" runat="server" CssClass="textarea" TextMode="MultiLine" Rows="2"
                         Text='<%# Bind("Description") %>' />
          </EditItemTemplate>
        </asp:TemplateField>

        <asp:TemplateField HeaderText="Image">
          <ItemTemplate><%# Eval("ImagePath") %></ItemTemplate>
          <EditItemTemplate>
            <asp:TextBox ID="eImage" runat="server" CssClass="input" Text='<%# Bind("ImagePath") %>' />
          </EditItemTemplate>
        </asp:TemplateField>

        <asp:TemplateField HeaderText="Live">
          <ItemTemplate><%# Eval("LiveUrl") %></ItemTemplate>
          <EditItemTemplate>
            <asp:TextBox ID="eLive" runat="server" CssClass="input" Text='<%# Bind("LiveUrl") %>' />
          </EditItemTemplate>
        </asp:TemplateField>

        <asp:TemplateField HeaderText="Code">
          <ItemTemplate><%# Eval("CodeUrl") %></ItemTemplate>
          <EditItemTemplate>
            <asp:TextBox ID="eCode" runat="server" CssClass="input" Text='<%# Bind("CodeUrl") %>' />
          </EditItemTemplate>
        </asp:TemplateField>

        <asp:TemplateField HeaderText="Tags">
          <ItemTemplate><%# Eval("Tags") %></ItemTemplate>
          <EditItemTemplate>
            <asp:TextBox ID="eTags" runat="server" CssClass="input" Text='<%# Bind("Tags") %>' />
          </EditItemTemplate>
        </asp:TemplateField>

        <asp:TemplateField HeaderText="Order">
          <ItemTemplate><%# Eval("DisplayOrder") %></ItemTemplate>
          <EditItemTemplate>
            <asp:TextBox ID="eOrder" runat="server" CssClass="input" Text='<%# Bind("DisplayOrder") %>' />
          </EditItemTemplate>
        </asp:TemplateField>

        <asp:TemplateField HeaderText="Active">
          <ItemTemplate>
            <asp:CheckBox runat="server" Checked='<%# Convert.ToBoolean(Eval("IsActive")) %>' Enabled="false" />
          </ItemTemplate>
          <EditItemTemplate>
            <asp:CheckBox ID="eActive" runat="server" Checked='<%# Bind("IsActive") %>' />
          </EditItemTemplate>
        </asp:TemplateField>

        <asp:CommandField ShowEditButton="true" ShowDeleteButton="true" />
      </Columns>
    </asp:GridView>

  </div>
</section>
</asp:Content>
