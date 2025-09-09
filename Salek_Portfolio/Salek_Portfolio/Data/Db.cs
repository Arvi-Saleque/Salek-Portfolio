using System.Configuration;
using System.Data;
using System.Data.SqlClient;

namespace Salek_Portfolio.Data
{
    public static class Db
    {
        public static string CS => ConfigurationManager
            .ConnectionStrings["PortfolioDb"].ConnectionString;

        public static DataTable Table(string sql, params SqlParameter[] parameters)
        {
            using (var con = new SqlConnection(CS))
            using (var cmd = new SqlCommand(sql, con))
            using (var da = new SqlDataAdapter(cmd))
            {
                if (parameters != null && parameters.Length > 0)
                    cmd.Parameters.AddRange(parameters);

                var dt = new DataTable();
                da.Fill(dt);
                return dt;
            }
        }
    }
}
