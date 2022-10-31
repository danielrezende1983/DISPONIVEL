using GamesLog.Types;

namespace GamesLog.Models
{
    public class Log
    {
        public long Id { get; set; }
        public string Linha { get; set; }

        public string Tempo { get; set; }
        public TiposLog.Tipo Tipo { get; set; }
        public string Conteudo { get; set; }        
    }
}
