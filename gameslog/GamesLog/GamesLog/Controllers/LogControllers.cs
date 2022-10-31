using GamesLog.Models;
using GamesLog.Services;
using Microsoft.AspNetCore.Mvc;

// For more information on enabling Web API for empty projects, visit https://go.microsoft.com/fwlink/?LinkID=397860

namespace GamesLog.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class LogControllers : ControllerBase
    {

        ServiceLog _serviceLog;

        public LogControllers()
        {
            _serviceLog = new ServiceLog();
        }

        [HttpGet("GetGames/")]
        public IEnumerable<Game> GetGames()
        {
            return _serviceLog.GetGames();
        }

        [HttpGet("GetTotalMortesPorCausa/")]
        public IEnumerable<MortesPorCausa> GetTotalMortesPorCausa()
        {
            return _serviceLog.GetTotalMortesPorCausa();
        }

        [HttpGet("GetTotalMortesCausadasPelo/")]
        public IEnumerable<MortesCausadasPelo> GetTotalMortesCausadasPelo()
        {
            return _serviceLog.GetTotalMortesCausadasPelo();
        }

        [HttpGet("GetRanking/")]
        public IEnumerable<Ranking> GetRanking()
        {
            return _serviceLog.GetRanking();
        }

    }
}
