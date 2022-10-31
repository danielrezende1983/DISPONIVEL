using GamesLog.Types;

namespace GamesLog.Models
{
    public class Game
    {
        public long Id { get; set; }
        public List<Log> Logs { get; set; }
    }
}
