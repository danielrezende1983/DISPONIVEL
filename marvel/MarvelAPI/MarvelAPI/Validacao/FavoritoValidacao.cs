using MarvelAPI.Models;
using MarvelAPI.Repositorio;

namespace MarvelAPI.Validacao
{
    public class FavoritoValidacao
    {

        public List<string> validar()
        {
            List<string> listaInconsistencias = new List<string>();
            FavoritoRepositorio repositorio = new FavoritoRepositorio();

            List<Favorito> listaFavoritos = repositorio.GetTodos();
            if (listaFavoritos.Count >= 5)
            {
                listaInconsistencias.Add("Favoritar no máximo 5 personagens.");
            }

            return listaInconsistencias;
        }

    }
}
