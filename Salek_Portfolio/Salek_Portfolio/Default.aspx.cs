using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Salek_Portfolio.Data;
using System.Data;


namespace Salek_Portfolio
{
    public partial class _Default : Page
    {
        private readonly PortfolioRepository _repo = new PortfolioRepository();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                BindSkills();
                BindProjects();
                BindAchievements();
            }
        }

        protected void btnSend_Click(object sender, EventArgs e)
        {
            if (!Page.IsValid) return;
            lblFormStatus.Text = "Thanks! Your message has been received.";
        }

        private void BindSkills()
        {
            rptSkillsFrontend.DataSource = _repo.GetSkillsByCategory("Frontend");
            rptSkillsFrontend.DataBind();

            rptSkillsBackend.DataSource = _repo.GetSkillsByCategory("Backend");
            rptSkillsBackend.DataBind();

            rptSkillsDatabase.DataSource = _repo.GetSkillsByCategory("Database");
            rptSkillsDatabase.DataBind();
        }

        private void BindProjects()
        {
            rptProjects.DataSource = _repo.GetProjectsActive();
            rptProjects.DataBind();
        }

        private void BindAchievements()
        {
            rptAchievements.DataSource = _repo.GetAchievementsActive();
            rptAchievements.DataBind();
        }

        protected void rptProjects_ItemDataBound(object sender, RepeaterItemEventArgs e)
        {
            if (e.Item.ItemType != ListItemType.Item &&
                e.Item.ItemType != ListItemType.AlternatingItem) return;

            var row = e.Item.DataItem as System.Data.DataRowView;
            var tags = Convert.ToString(row["Tags"]) ?? string.Empty;

            var tagList = tags.Split(new[] { ',', ';' }, StringSplitOptions.RemoveEmptyEntries)
                              .Select(t => t.Trim())
                              .ToArray();

            var inner = (Repeater)e.Item.FindControl("rptTags");
            inner.DataSource = tagList;
            inner.DataBind();
        }



    }
}