using Salek_Portfolio.Data;
using System;
using System.Data;
using System.Data.SqlClient;
using System.Web.UI.WebControls;

namespace Salek_Portfolio.Admin
{
    public partial class Skills : System.Web.UI.Page
    {
        private readonly PortfolioRepository _repo = new PortfolioRepository();

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack) BindGrid();
        }

        private void BindGrid()
        {
            gvSkills.DataSource = _repo.GetSkillsAll();
            gvSkills.DataBind();
        }

        protected void btnAdd_Click(object sender, EventArgs e)
        {
            if (!Page.IsValid) return;

            var name = txtNewName.Text.Trim();
            var category = ddlNewCategory.SelectedValue;
            int prof = SafeInt(txtNewProf.Text, 80);
            int order = string.IsNullOrWhiteSpace(txtNewOrder.Text)
                        ? _repo.GetNextSkillDisplayOrder(category)
                        : SafeInt(txtNewOrder.Text, 10);
            bool active = chkNewActive.Checked;

            try
            {
                _repo.InsertSkill(name, category, prof, order, active);
                txtNewName.Text = ""; txtNewOrder.Text = "";
                lblMsg.Text = "Skill added.";
                BindGrid();
            }
            catch (SqlException ex) when (ex.Number == 2627 || ex.Number == 2601)
            {
                lblMsg.Text = "A skill with that Name/Category already exists.";
            }
        }

        protected void gvSkills_RowEditing(object sender, GridViewEditEventArgs e)
        {
            gvSkills.EditIndex = e.NewEditIndex;
            BindGrid();
        }

        protected void gvSkills_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
        {
            gvSkills.EditIndex = -1;
            BindGrid();
        }

        protected void gvSkills_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {
            var row = gvSkills.Rows[e.RowIndex];
            int id = (int)gvSkills.DataKeys[e.RowIndex].Values["SkillId"];

            var txtName = (TextBox)row.FindControl("txtName");
            var ddlCat = (DropDownList)row.FindControl("ddlCategory");
            var txtProf = (TextBox)row.FindControl("txtProf");
            var txtOrder = (TextBox)row.FindControl("txtOrder");
            var chkAct = (CheckBox)row.FindControl("chkActive");

            int prof = SafeInt(txtProf.Text, 80);
            int order = SafeInt(txtOrder.Text, 10);

            try
            {
                _repo.UpdateSkill(id, txtName.Text.Trim(), ddlCat.SelectedValue, prof, order, chkAct.Checked);
                gvSkills.EditIndex = -1;
                lblMsg.Text = "Saved.";
                BindGrid();
            }
            catch (SqlException ex) when (ex.Number == 2627 || ex.Number == 2601)
            {
                lblMsg.Text = "Duplicate Name/Category.";
            }
        }

        protected void gvSkills_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            int id = (int)gvSkills.DataKeys[e.RowIndex].Values["SkillId"];
            _repo.DeleteSkill(id);
            lblMsg.Text = "Deleted.";
            BindGrid();
        }

        protected void gvSkills_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName != "MoveUp" && e.CommandName != "MoveDown") return;

            int id = Convert.ToInt32(e.CommandArgument);
            // Need category to move within same category
            GridViewRow row = ((LinkButton)e.CommandSource).NamingContainer as GridViewRow;
            string category = Convert.ToString(gvSkills.DataKeys[row.RowIndex].Values["Category"]);

            _repo.MoveSkill(id, category, e.CommandName == "MoveUp");
            BindGrid();
        }

        protected void gvSkills_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.DataRow && (e.Row.RowState & DataControlRowState.Edit) > 0)
            {
                var ddl = (DropDownList)e.Row.FindControl("ddlCategory");
                var drv = (DataRowView)e.Row.DataItem;
                var current = Convert.ToString(drv["Category"]);
                if (ddl != null && ddl.Items.FindByText(current) != null)
                    ddl.SelectedValue = current;
            }
        }

        private static int SafeInt(string s, int fallback)
        {
            return int.TryParse(s, out var v) ? v : fallback;
        }
    }
}
