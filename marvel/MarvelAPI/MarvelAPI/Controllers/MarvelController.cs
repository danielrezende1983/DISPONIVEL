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

        // GET: api/<MarvelController>
        [HttpGet]
        public IEnumerable<Personagem> Get()
        {
            return _marvelServico.GetPersonagens();
        }

        // GET api/<MarvelController>/5
        [HttpGet("{id}")]
        public string Get(int id)
        {
            return "value";
        }

        //// POST api/<MarvelController>
        //[HttpPost]
        //public void Post([FromBody] string value)
        //{
        //}

        //// PUT api/<MarvelController>/5
        //[HttpPut("{id}")]
        //public void Put(int id, [FromBody] string value)
        //{
        //}

        //// DELETE api/<MarvelController>/5
        //[HttpDelete("{id}")]
        //public void Delete(int id)
        //{
        //}
    }
}
