namespace GamesLog.Types
{
    public class TiposLog
    {

        public enum Tipo
        {
            InitGame,
            ShutdownGame,            
            ClientConnect,
            ClientUserinfoChanged,
            ClientBegin,
            ClientDisconnect,
            Item,
            Kill,            
            Score,
            Red,
            Say,
            Sair,
            Vazio,
            Erro
        }

    }
}
