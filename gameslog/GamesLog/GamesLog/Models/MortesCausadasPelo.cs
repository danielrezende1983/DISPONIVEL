using GamesLog.Types;

namespace GamesLog.Models
{
    public class MortesCausadasPelo
    {
        public long IdGame { get; set; }
        public Dictionary<string, long> TotalMortePelo { get; set; }
    }
}
