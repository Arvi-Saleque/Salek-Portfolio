using System.Data;
using System.Data.SqlClient;

namespace Salek_Portfolio.Data
{
    public class PortfolioRepository
    {
        public DataTable GetSkillsByCategory(string category)
        {
            return Db.Table(@"
                SELECT SkillId, [Name], Proficiency
                FROM dbo.Skills
                WHERE IsActive = 1 AND Category = @cat
                ORDER BY DisplayOrder, [Name];",
                new SqlParameter("@cat", category));
        }

        public DataTable GetProjectsActive()
        {
            return Db.Table(@"
                SELECT ProjectId, Title, [Description], ImagePath, LiveUrl, CodeUrl, Tags
                FROM dbo.Projects
                WHERE IsActive = 1
                ORDER BY DisplayOrder, Title;");
        }

        public DataTable GetAchievementsActive()
        {
            return Db.Table(@"
                SELECT AchievementId, Title, Organization, AwardDate, [Description], VerifyUrl, Icon
                FROM dbo.Achievements
                WHERE IsActive = 1
                ORDER BY DisplayOrder, Title;");
        }
    }
}
