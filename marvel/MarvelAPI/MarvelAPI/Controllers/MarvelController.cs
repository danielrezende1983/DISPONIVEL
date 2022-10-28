using MarvelAPI.Models;
using MarvelAPI.Services;
using Microsoft.AspNetCore.Mvc;

// For more information on enabling Web API for empty projects, visit https://go.microsoft.com/fwlink/?LinkID=397860

namespace MarvelAPI.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class MarvelController : ControllerBase
    {

        MarvelServico _marvelServico;

        public MarvelController()
        {
            _marvelServico = new MarvelServico();
        }

        [HttpGet]
        public IEnumerable<Personagem> Get()
        {
            return _marvelServico.GetPersonagens();
        }

        [HttpGet("getPersonagemPorId/{id}")]
        public IEnumerable<Personagem> Get(long id)
        {
            return _marvelServico.GetPersonagemPorId(id);
        }

        [HttpGet("getPersonagemPorNome/{nome}")]
        public IEnumerable<Personagem> Get(string nome)
        {
            return _marvelServico.GetPersonagemPorNome(nome);
        }

    }
}
