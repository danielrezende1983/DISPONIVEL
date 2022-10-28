using MarvelAPI.Models;
using System.Data;
using System.Data.SqlClient;

namespace MarvelAPI.Utils
{

    public static class UtilsBD
    {

        public static readonly string strConexao = @"Data Source=DR\SQLEXPRESS;Initial Catalog=marvel;Integrated Security=True";

        public static string ValorString(SqlDataReader reader, string nomeCAmpo)
        {
            try
            {
                return reader[nomeCAmpo].ToString();
            }
            catch (Exception)
            {
                return string.Empty;
            }

        }

        public static Int16 ValorInt16(SqlDataReader reader, string nomeCAmpo)
        {
            try
            {
                return Convert.ToInt16(reader[nomeCAmpo].ToString());
            }
            catch (Exception)
            {
                return 0;
            }

        }

    }

}
