using GamesLog.Types;

namespace GamesLog.Models
{
    public class MortesPorCausa
    {
        public long IdGame { get; set; }
        public Dictionary<TiposMortes.Tipo, long> TotalMortePorTipo { get; set; }        
    }
}
