using MarvelAPI.Dao;
using MarvelAPI.Models;

namespace MarvelAPI.Repositorio
{
    public class FavoritoRepositorio
    {

        private readonly DaoFavorito _daoFavorito;

        public FavoritoRepositorio()
        {
            _daoFavorito = new DaoFavorito();
        }

        public List<Favorito> GetPorId(int id)
        {
            return _daoFavorito.GetPorId(id);
        }

        public List<Favorito> GetPorNome(string nome)
        {
            return _daoFavorito.GetPorNome(nome);
        }

        public List<Favorito> GetTodos()
        {
            return _daoFavorito.GetTodos();
        }

        public void Insert(Favorito favorito)
        {
            _daoFavorito.Insert(favorito);
        }

        public void DeletePorId(int id)
        {
            _daoFavorito.DeletePorId(id);
        }

        public void DeletePorNome(string nome)
        {
            _daoFavorito.DeletePorNome(nome);
        }

    }
}
