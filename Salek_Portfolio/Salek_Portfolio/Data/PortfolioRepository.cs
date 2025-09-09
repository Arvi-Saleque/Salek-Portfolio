using System;
using System.Data;
using System.Data.SqlClient;

namespace Salek_Portfolio.Data
{
    public class PortfolioRepository
    {
        /* ---------- READ (public site) ---------- */

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

        /* ---------- ADMIN: Skills grid ---------- */

        public DataTable GetSkillsAll()
        {
            return Db.Table(@"
                SELECT SkillId, [Name], Category, Proficiency, DisplayOrder, IsActive
                FROM dbo.Skills
                ORDER BY Category, DisplayOrder, [Name];");
        }

        public int InsertSkill(string name, string category, int proficiency, int displayOrder, bool isActive)
        {
            var id = Db.Scalar(@"
                INSERT INTO dbo.Skills([Name], Category, Proficiency, DisplayOrder, IsActive)
                VALUES(@n,@c,@p,@o,@a);
                SELECT SCOPE_IDENTITY();",
                new SqlParameter("@n", name),
                new SqlParameter("@c", (object)category ?? DBNull.Value),
                new SqlParameter("@p", proficiency),
                new SqlParameter("@o", displayOrder),
                new SqlParameter("@a", isActive));
            return Convert.ToInt32(id);
        }

        public int UpdateSkill(int id, string name, string category, int proficiency, int displayOrder, bool isActive)
        {
            return Db.Execute(@"
                UPDATE dbo.Skills
                SET [Name]=@n, Category=@c, Proficiency=@p, DisplayOrder=@o, IsActive=@a, UpdatedAt=SYSUTCDATETIME()
                WHERE SkillId=@id;",
                new SqlParameter("@n", name),
                new SqlParameter("@c", (object)category ?? DBNull.Value),
                new SqlParameter("@p", proficiency),
                new SqlParameter("@o", displayOrder),
                new SqlParameter("@a", isActive),
                new SqlParameter("@id", id));
        }

        public int DeleteSkill(int id)
        {
            return Db.Execute("DELETE FROM dbo.Skills WHERE SkillId=@id;", new SqlParameter("@id", id));
        }

        public int GetNextSkillDisplayOrder(string category)
        {
            var val = Db.Scalar("SELECT ISNULL(MAX(DisplayOrder),0)+10 FROM dbo.Skills WHERE Category=@c;",
                new SqlParameter("@c", (object)category ?? DBNull.Value));
            return Convert.ToInt32(val);
        }

        public void MoveSkill(int id, string category, bool up)
        {
            using (var con = new SqlConnection(Db.CS))
            {
                con.Open();
                using (var tx = con.BeginTransaction())
                using (var cmd = new SqlCommand() { Connection = con, Transaction = tx })
                {
                    // current order
                    cmd.CommandText = "SELECT DisplayOrder FROM dbo.Skills WHERE SkillId=@id;";
                    cmd.Parameters.AddWithValue("@id", id);
                    var currentOrder = Convert.ToInt32(cmd.ExecuteScalar());

                    // neighbour
                    cmd.Parameters.Clear();
                    cmd.CommandText = up
                        ? @"SELECT TOP 1 SkillId, DisplayOrder FROM dbo.Skills
                            WHERE Category = @c AND DisplayOrder < @o ORDER BY DisplayOrder DESC;"
                        : @"SELECT TOP 1 SkillId, DisplayOrder FROM dbo.Skills
                            WHERE Category = @c AND DisplayOrder > @o ORDER BY DisplayOrder ASC;";
                    cmd.Parameters.AddWithValue("@c", (object)category ?? DBNull.Value);
                    cmd.Parameters.AddWithValue("@o", currentOrder);

                    int? neighborId = null; int neighborOrder = 0;
                    using (var r = cmd.ExecuteReader())
                        if (r.Read()) { neighborId = r.GetInt32(0); neighborOrder = r.GetInt32(1); }

                    if (neighborId == null) { tx.Rollback(); return; }

                    // swap
                    cmd.Parameters.Clear();
                    cmd.CommandText = "UPDATE dbo.Skills SET DisplayOrder=@o WHERE SkillId=@id;";
                    cmd.Parameters.AddWithValue("@o", neighborOrder);
                    cmd.Parameters.AddWithValue("@id", id);
                    cmd.ExecuteNonQuery();

                    cmd.Parameters.Clear();
                    cmd.CommandText = "UPDATE dbo.Skills SET DisplayOrder=@o WHERE SkillId=@id;";
                    cmd.Parameters.AddWithValue("@o", currentOrder);
                    cmd.Parameters.AddWithValue("@id", neighborId.Value);
                    cmd.ExecuteNonQuery();

                    tx.Commit();
                }
            }
        }

        /* ---------- ADMIN: Projects grid ---------- */
        public System.Data.DataTable GetProjectsAll()
        {
            return Db.Table(@"
        SELECT ProjectId, Title, [Description], ImagePath, LiveUrl, CodeUrl, Tags,
               DisplayOrder, IsActive
        FROM dbo.Projects
        ORDER BY DisplayOrder, Title;");
        }

        public int InsertProject(string title, string description, string imagePath,
            string liveUrl, string codeUrl, string tags, int displayOrder, bool isActive)
        {
            var id = Db.Scalar(@"
        INSERT INTO dbo.Projects (Title, [Description], ImagePath, LiveUrl, CodeUrl, Tags, DisplayOrder, IsActive)
        VALUES (@t,@d,@i,@l,@c,@g,@o,@a);
        SELECT SCOPE_IDENTITY();",
                new SqlParameter("@t", title),
                new SqlParameter("@d", (object)description ?? DBNull.Value),
                new SqlParameter("@i", (object)imagePath ?? DBNull.Value),
                new SqlParameter("@l", (object)liveUrl ?? DBNull.Value),
                new SqlParameter("@c", (object)codeUrl ?? DBNull.Value),
                new SqlParameter("@g", (object)tags ?? DBNull.Value),
                new SqlParameter("@o", displayOrder),
                new SqlParameter("@a", isActive));
            return Convert.ToInt32(id);
        }

        public int UpdateProject(int id, string title, string description, string imagePath,
            string liveUrl, string codeUrl, string tags, int displayOrder, bool isActive)
        {
            return Db.Execute(@"
        UPDATE dbo.Projects SET
            Title=@t, [Description]=@d, ImagePath=@i, LiveUrl=@l, CodeUrl=@c, Tags=@g,
            DisplayOrder=@o, IsActive=@a, UpdatedAt=SYSUTCDATETIME()
        WHERE ProjectId=@id;",
                new SqlParameter("@t", title),
                new SqlParameter("@d", (object)description ?? DBNull.Value),
                new SqlParameter("@i", (object)imagePath ?? DBNull.Value),
                new SqlParameter("@l", (object)liveUrl ?? DBNull.Value),
                new SqlParameter("@c", (object)codeUrl ?? DBNull.Value),
                new SqlParameter("@g", (object)tags ?? DBNull.Value),
                new SqlParameter("@o", displayOrder),
                new SqlParameter("@a", isActive),
                new SqlParameter("@id", id));
        }

        public int DeleteProject(int id)
        {
            return Db.Execute("DELETE FROM dbo.Projects WHERE ProjectId=@id;", new SqlParameter("@id", id));
        }

        public int GetNextProjectDisplayOrder()
        {
            var val = Db.Scalar("SELECT ISNULL(MAX(DisplayOrder),0)+10 FROM dbo.Projects;");
            return Convert.ToInt32(val);
        }

        public void MoveProject(int id, bool up)
        {
            using (var con = new SqlConnection(Db.CS))
            {
                con.Open();
                using (var tx = con.BeginTransaction())
                using (var cmd = new SqlCommand() { Connection = con, Transaction = tx })
                {
                    // current order
                    cmd.CommandText = "SELECT DisplayOrder FROM dbo.Projects WHERE ProjectId=@id;";
                    cmd.Parameters.AddWithValue("@id", id);
                    var currentOrder = Convert.ToInt32(cmd.ExecuteScalar());

                    // neighbour (no category here)
                    cmd.Parameters.Clear();
                    cmd.CommandText = up
                        ? @"SELECT TOP 1 ProjectId, DisplayOrder FROM dbo.Projects
                    WHERE DisplayOrder < @o ORDER BY DisplayOrder DESC;"
                        : @"SELECT TOP 1 ProjectId, DisplayOrder FROM dbo.Projects
                    WHERE DisplayOrder > @o ORDER BY DisplayOrder ASC;";
                    cmd.Parameters.AddWithValue("@o", currentOrder);

                    int? nid = null; int norder = 0;
                    using (var r = cmd.ExecuteReader())
                        if (r.Read()) { nid = r.GetInt32(0); norder = r.GetInt32(1); }
                    if (nid == null) { tx.Rollback(); return; }

                    // swap
                    cmd.Parameters.Clear();
                    cmd.CommandText = "UPDATE dbo.Projects SET DisplayOrder=@o WHERE ProjectId=@id;";
                    cmd.Parameters.AddWithValue("@o", norder);
                    cmd.Parameters.AddWithValue("@id", id);
                    cmd.ExecuteNonQuery();

                    cmd.Parameters.Clear();
                    cmd.CommandText = "UPDATE dbo.Projects SET DisplayOrder=@o WHERE ProjectId=@id;";
                    cmd.Parameters.AddWithValue("@o", currentOrder);
                    cmd.Parameters.AddWithValue("@id", nid.Value);
                    cmd.ExecuteNonQuery();

                    tx.Commit();
                }
            }
        }

    }
}
