using MarvelAPI.Models;
using MarvelAPI.Utils;
using System.Data;
using System.Data.SqlClient;

namespace MarvelAPI.Dao
{
    public class DaoFavorito
    {

        public List<Favorito> GetTodos()
        {
            return GetComum(0, string.Empty);
        }

        public List<Favorito> GetPorId(int id)
        {
            return GetComum(id, string.Empty);
        }

        public List<Favorito> GetPorNome(string nome)
        {
            return GetComum(0, nome);
        }

        private List<Favorito> GetComum(int id, string nome)
        {
            List<Favorito> listaPersonagens = new List<Favorito>();

            try
            {
                using (SqlConnection conn = new SqlConnection(UtilsBD.strConexao))
                {
                    conn.Open();
                    bool primeiroAdicionado = false;
                    string sqlQuery = "SELECT * FROM Favorito  ";

                    if(id > 0)
                    {
                        sqlQuery = sqlQuery + " WHERE Id = " + id;
                        primeiroAdicionado = true;
                    }

                    if (!string.IsNullOrEmpty(nome))
                    {
                        if (primeiroAdicionado)
                        {
                            sqlQuery = sqlQuery + " AND Nome = '" + nome + "'";
                        }
                        else
                        {
                            sqlQuery = sqlQuery + " WHERE Nome = '" + nome + "'";
                        }                        
                    }

                    using (SqlCommand cmd = new SqlCommand(sqlQuery, conn))
                    {
                        cmd.CommandType = CommandType.Text;

                        using (SqlDataReader reader = cmd.ExecuteReader())
                        {
                            if (reader != null)
                            {
                                while (reader.Read())
                                {
                                    var personagem = new Favorito();
                                    personagem.Id = UtilsBD.ValorInt16(reader, "Id");
                                    personagem.Nome = UtilsBD.ValorString(reader, "Nome");
                                    listaPersonagens.Add(personagem);
                                }
                            }
                        }
                    }
                }

                return listaPersonagens;

            }
            catch (Exception)
            {
                throw;
            }

        }

        public void Insert(Favorito personagem)
        {
            
            try
            {
                using (SqlConnection conn = new SqlConnection(UtilsBD.strConexao))
                {
                    conn.Open();

                    using (SqlCommand cmd = new SqlCommand("INSERT INTO Favorito (Id, Nome) VALUES (@ID, @NOME);", conn))
                    {
                        cmd.CommandType = CommandType.Text;

                        cmd.Parameters.AddWithValue("@ID", personagem.Id);
                        cmd.Parameters.AddWithValue("@NOME", personagem.Nome);

                        cmd.ExecuteNonQuery();
                    }
                }

            }
            catch (Exception)
            {
                throw;
            }

        }

        public void DeletePorId(int id)
        {
            Delete("DELETE FROM Favorito WHERE Id = " + id);
        }

        public void DeletePorNome(string nome)
        {
            Delete("DELETE FROM Favorito WHERE Nome = '" + nome + "'");
        }

        private void Delete(string sqlQuery)
        {

            try
            {
                using (SqlConnection conn = new SqlConnection(UtilsBD.strConexao))
                {
                    conn.Open();

                    using (SqlCommand cmd = new SqlCommand(sqlQuery, conn))
                    {
                        cmd.CommandType = CommandType.Text;
                        cmd.ExecuteNonQuery();
                    }
                }

            }
            catch (Exception)
            {
                throw;
            }

        }

    }
}
