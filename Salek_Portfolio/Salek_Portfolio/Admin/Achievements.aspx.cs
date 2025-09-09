using Salek_Portfolio.Data;
using System;
using System.Web.UI.WebControls;

namespace Salek_Portfolio.Admin
{
    public partial class Achievements : System.Web.UI.Page
    {
        private readonly PortfolioRepository _repo = new PortfolioRepository();

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack) BindGrid();
        }

        private void BindGrid()
        {
            gvAchievements.DataSource = _repo.GetAchievementsAll();
            gvAchievements.DataBind();
        }

        protected void btnAddA_Click(object sender, EventArgs e)
        {
            var title = txtATitle.Text.Trim();
            if (string.IsNullOrWhiteSpace(title)) { lblMsgA.Text = "Title is required."; return; }

            DateTime? date = ParseDateOrNull(txtADate.Text);
            int order = string.IsNullOrWhiteSpace(txtAOrder.Text)
                        ? _repo.GetNextAchievementDisplayOrder()
                        : SafeInt(txtAOrder.Text, 10);

            _repo.InsertAchievement(
                title,
                NullIfEmpty(txtAOrg.Text),
                date,
                NullIfEmpty(txtADesc.Text),
                NullIfEmpty(txtAVerify.Text),
                NullIfEmpty(txtAIcon.Text),
                order,
                chkAActive.Checked
            );

            txtATitle.Text = txtAOrg.Text = txtADate.Text = txtADesc.Text =
            txtAVerify.Text = txtAIcon.Text = txtAOrder.Text = "";
            chkAActive.Checked = true;

            lblMsgA.Text = "Achievement added.";
            BindGrid();
        }

        protected void gvAchievements_RowEditing(object sender, GridViewEditEventArgs e)
        {
            gvAchievements.EditIndex = e.NewEditIndex;
            BindGrid();
        }

        protected void gvAchievements_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
        {
            gvAchievements.EditIndex = -1;
            BindGrid();
        }

        protected void gvAchievements_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {
            var row = gvAchievements.Rows[e.RowIndex];
            int id = (int)gvAchievements.DataKeys[e.RowIndex].Value;

            var title = ((TextBox)row.FindControl("eATitle")).Text.Trim();
            var org = ((TextBox)row.FindControl("eAOrg")).Text.Trim();
            var dateS = ((TextBox)row.FindControl("eADate")).Text.Trim();
            var desc = ((TextBox)row.FindControl("eADesc")).Text.Trim();
            var verify = ((TextBox)row.FindControl("eAVerify")).Text.Trim();
            var icon = ((TextBox)row.FindControl("eAIcon")).Text.Trim();
            var order = SafeInt(((TextBox)row.FindControl("eAOrder")).Text, 10);
            var active = ((CheckBox)row.FindControl("eAActive")).Checked;

            if (string.IsNullOrWhiteSpace(title)) { lblMsgA.Text = "Title is required."; return; }

            _repo.UpdateAchievement(id, title, NullIfEmpty(org), ParseDateOrNull(dateS),
                                    NullIfEmpty(desc), NullIfEmpty(verify), NullIfEmpty(icon),
                                    order, active);

            gvAchievements.EditIndex = -1;
            lblMsgA.Text = "Saved.";
            BindGrid();
        }

        protected void gvAchievements_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            int id = (int)gvAchievements.DataKeys[e.RowIndex].Value;
            _repo.DeleteAchievement(id);
            lblMsgA.Text = "Deleted.";
            BindGrid();
        }

        protected void gvAchievements_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName != "MoveUp" && e.CommandName != "MoveDown") return;
            int id = Convert.ToInt32(e.CommandArgument);
            _repo.MoveAchievement(id, e.CommandName == "MoveUp");
            BindGrid();
        }

        private static int SafeInt(string s, int fallback) =>
            int.TryParse(s, out var v) ? v : fallback;

        private static string NullIfEmpty(string s) =>
            string.IsNullOrWhiteSpace(s) ? null : s.Trim();

        // Accept "YYYY" or "YYYY-MM-DD"
        private static DateTime? ParseDateOrNull(string s)
        {
            if (string.IsNullOrWhiteSpace(s)) return null;
            s = s.Trim();
            if (s.Length == 4 && int.TryParse(s, out var y)) return new DateTime(y, 1, 1);
            if (DateTime.TryParse(s, out var d)) return d.Date;
            return null;
        }
    }
}
