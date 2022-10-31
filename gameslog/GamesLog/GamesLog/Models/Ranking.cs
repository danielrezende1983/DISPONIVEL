namespace GamesLog.Models
{
    public class Ranking
    {
        public long IdGame { get; set; }
        public Dictionary<string, long> Score { get; set; }
    }
}
