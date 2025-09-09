using Salek_Portfolio.Data;
using System;
using System.Web.UI.WebControls;
using static System.Runtime.CompilerServices.RuntimeHelpers;

namespace Salek_Portfolio.Admin
{
    public partial class Projects : System.Web.UI.Page
    {
        private readonly PortfolioRepository _repo = new PortfolioRepository();

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack) BindGrid();
        }

        private void BindGrid()
        {
            gvProjects.DataSource = _repo.GetProjectsAll();
            gvProjects.DataBind();
        }

        protected void btnAddP_Click(object sender, EventArgs e)
        {
            var title = txtTitle.Text.Trim();
            if (string.IsNullOrWhiteSpace(title)) { lblMsgP.Text = "Title is required."; return; }

            var order = string.IsNullOrWhiteSpace(txtOrderP.Text)
                        ? _repo.GetNextProjectDisplayOrder()
                        : SafeInt(txtOrderP.Text, 10);

            _repo.InsertProject(
                title,
                string.IsNullOrWhiteSpace(txtDesc.Text) ? null : txtDesc.Text.Trim(),
                string.IsNullOrWhiteSpace(txtImage.Text) ? null : txtImage.Text.Trim(),
                string.IsNullOrWhiteSpace(txtLive.Text) ? null : txtLive.Text.Trim(),
                string.IsNullOrWhiteSpace(txtCode.Text) ? null : txtCode.Text.Trim(),
                string.IsNullOrWhiteSpace(txtTags.Text) ? null : txtTags.Text.Trim(),
                order,
                chkActiveP.Checked
            );

            // clear inputs
            txtTitle.Text = txtDesc.Text = txtImage.Text = txtLive.Text = txtCode.Text = txtTags.Text = txtOrderP.Text = "";
            chkActiveP.Checked = true;

            lblMsgP.Text = "Project added.";
            BindGrid();
        }

        protected void gvProjects_RowEditing(object sender, GridViewEditEventArgs e)
        {
            gvProjects.EditIndex = e.NewEditIndex;
            BindGrid();
        }

        protected void gvProjects_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
        {
            gvProjects.EditIndex = -1;
            BindGrid();
        }

        protected void gvProjects_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {
            var row = gvProjects.Rows[e.RowIndex];
            int id = (int)gvProjects.DataKeys[e.RowIndex].Value;

            var title = ((TextBox)row.FindControl("eTitle")).Text.Trim();
            var desc = ((TextBox)row.FindControl("eDesc")).Text.Trim();
            var img = ((TextBox)row.FindControl("eImage")).Text.Trim();
            var live = ((TextBox)row.FindControl("eLive")).Text.Trim();
            var code = ((TextBox)row.FindControl("eCode")).Text.Trim();
            var tags = ((TextBox)row.FindControl("eTags")).Text.Trim();
            var order = SafeInt(((TextBox)row.FindControl("eOrder")).Text, 10);
            var active = ((CheckBox)row.FindControl("eActive")).Checked;

            if (string.IsNullOrWhiteSpace(title)) { lblMsgP.Text = "Title is required."; return; }

            _repo.UpdateProject(id, title, string.IsNullOrWhiteSpace(desc) ? null : desc,
                                string.IsNullOrWhiteSpace(img) ? null : img,
                                string.IsNullOrWhiteSpace(live) ? null : live,
                                string.IsNullOrWhiteSpace(code) ? null : code,
                                string.IsNullOrWhiteSpace(tags) ? null : tags,
                                order, active);

            gvProjects.EditIndex = -1;
            lblMsgP.Text = "Saved.";
            BindGrid();
        }

        protected void gvProjects_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            int id = (int)gvProjects.DataKeys[e.RowIndex].Value;
            _repo.DeleteProject(id);
            lblMsgP.Text = "Deleted.";
            BindGrid();
        }

        protected void gvProjects_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName != "MoveUp" && e.CommandName != "MoveDown") return;
            int id = Convert.ToInt32(e.CommandArgument);
            _repo.MoveProject(id, e.CommandName == "MoveUp");
            BindGrid();
        }

        private static int SafeInt(string s, int fallback) =>
            int.TryParse(s, out var v) ? v : fallback;
    }
}
