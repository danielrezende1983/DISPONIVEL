using MarvelAPI.Models;
using MarvelAPI.Repositorio;
using MarvelAPI.Validacao;
using Microsoft.AspNetCore.Mvc;

namespace MarvelAPI.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class FavoritoController : ControllerBase
    {

        private readonly FavoritoRepositorio _repositorio;
        private readonly FavoritoValidacao _validacao;

        public FavoritoController()
        {
            _repositorio = new FavoritoRepositorio();
            _validacao = new FavoritoValidacao();
        }

        [HttpGet]
        public IEnumerable<Favorito> Get()
        {
            return _repositorio.GetTodos();
        }

        [HttpGet("{id}/getPorId")]
        public IEnumerable<Favorito> Get(int id)
        {
            return _repositorio.GetPorId(id);
        }

        [HttpGet("{nome}/getPorNome")]        
        public IEnumerable<Favorito> Get(string nome)
        {
            return _repositorio.GetPorNome(nome);
        }

        [HttpGet()]
        [Route("getValidacao/")]
        public IEnumerable<string> GetValidacao()
        {
            return _validacao.Validar();
        }

        [HttpPost]
        public void Post([FromBody] Favorito favorito)
        {
            if(_validacao.Validar().Count == 0)
            {
                _repositorio.Insert(favorito);
            }            
        }

        [HttpDelete("{id}/desfavoritarPorId")]
        public void Delete(int id)
        {
            _repositorio.DeletePorId(id);
        }

        [HttpDelete("{nome}/desfavoritarPorNome")]
        public void Delete(string nome)
        {
            _repositorio.DeletePorNome(nome);
        }

    }
}
