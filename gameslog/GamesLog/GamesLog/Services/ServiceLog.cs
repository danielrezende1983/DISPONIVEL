using GamesLog.Models;
using GamesLog.Types;
using Microsoft.AspNetCore.Diagnostics;
using System.Linq;
using System.Text.RegularExpressions;

namespace GamesLog.Services
{
    public class ServiceLog
    {

        public List<Log> LoadLog()
        {
            //const string arquivo = "E:\\TESTES-PRIVADOS\\gameslog\\games.log";
            const string arquivo = "E:\\TESTES-PRIVADOS\\gameslog\\games - game 1.log";

            List<Log> lista = new List<Log>();
            Log log;
            long index = 1;

            var linhas = File.ReadAllLines(arquivo);

            foreach (var linha in linhas)
            {
                log = new Log();
                log.Id = index++;
                log.Linha = linha;

                if (linhaValida(linha))
                {
                    log.Tempo = GetTime(linha);
                    //Enum.GetName(typeof(TiposLog.Tipo.Item), 6);
                    log.Tipo = GetTipo(linha);
                    log.Conteudo = GetConteudo(linha);
                }
                else
                {
                    log.Tipo = TiposLog.Tipo.Erro;
                }                

                lista.Add(log);
            }

            return lista;

        }

        private Boolean linhaValida(string linha)
        {
            try
            {
                return linha.Substring(3, 1).Equals(":");
            }
            catch (Exception)
            {
                return false;
            }
        }

        private string GetTime(string linha)
        {
            try
            {
                return linha.Substring(0, 6); ;
            }
            catch (Exception)
            {
                return String.Empty;
            }            
        }

        private bool VerificaSeTemDoisCaracterDoisPontos(string linha)
        {
            string procurar = ":";
            MatchCollection matches = Regex.Matches(linha, procurar);
            return matches.Count == 2;
        }

        private string GetConteudo(string linha)
        {
            try
            {
                const string filtrarKill = "Kill: ";
                const string filtrarScore = "score: ";
                string conteudo = String.Empty;

                if (VerificaSeTemDoisCaracterDoisPontos(linha) && (linha.Length - linha.LastIndexOf(":") - 2) > 0)
                {
                     conteudo = linha.Substring(linha.LastIndexOf(":") + 2, linha.Length - linha.LastIndexOf(":") - 2);
                }
                else if (linha.Contains(filtrarKill))
                {                    
                    conteudo = linha.Substring(linha.LastIndexOf(filtrarKill) + filtrarKill.Length, linha.Length - linha.LastIndexOf(filtrarKill) - filtrarKill.Length);
                }
                else if (linha.Contains(filtrarScore))
                {
                    conteudo = linha.Substring(14, linha.Length - 14);
                }
                return conteudo;
            }
            catch (Exception)
            {
                return String.Empty;
            }
        }

        private TiposLog.Tipo GetTipo(string linha)
        {
            try
            {
                const string descricaoKill = "KILL";
                const string descricaoScore = "SCORE";

                string descricao = String.Empty;

                if (linha.ToUpper().Contains(descricaoKill))
                {
                    return TiposLog.Tipo.Kill;
                }
                else if (linha.ToUpper().Contains(descricaoScore))
                {
                    return TiposLog.Tipo.Score;
                }

                descricao = linha.Substring(7, linha.LastIndexOf(":") - 7);

                switch (descricao.ToUpper())
                {
                    case "INITGAME":
                        return TiposLog.Tipo.InitGame;
                        break;

                    case "SHUTDOWNGAME":
                        return TiposLog.Tipo.ShutdownGame;
                        break;

                    case "CLIENTCONNECT":
                        return TiposLog.Tipo.ClientConnect;
                        break;

                    case "CLIENTUSERINFOCHANGED":
                        return TiposLog.Tipo.ClientUserinfoChanged;
                        break;

                    case "CLIENTBEGIN":
                        return TiposLog.Tipo.ClientBegin;
                        break;

                    case "CLIENTDISCONNECT":
                        return TiposLog.Tipo.ClientDisconnect;
                        break;

                    case "ITEM":
                        return TiposLog.Tipo.Item;
                        break;

                    case "KILL":
                        return TiposLog.Tipo.Kill;
                        break;

                    case "SCORE":
                        return TiposLog.Tipo.Score;
                        break;

                    case "RED":
                        return TiposLog.Tipo.Red;
                        break;

                    case "SAY":
                        return TiposLog.Tipo.Say;
                        break;

                    case "SAIR":
                        return TiposLog.Tipo.Sair;
                        break;

                    case "VAZIO":
                        return TiposLog.Tipo.Vazio;
                        break;

                }

                return TiposLog.Tipo.Erro;
            }
            catch (Exception)
            {
                return TiposLog.Tipo.Erro;
            }
        }

        public IEnumerable<Game> GetGames()
        {
            try
            {
                long index = 1;
                List<Log> logs = new List<Log>();
                Game game = new Game();                
                game.Id = index++;                
                List<Game> games = new List<Game>();
                bool primeiro = true;

                foreach(var log in LoadLog())
                {
                    if (log.Tipo.Equals(TiposLog.Tipo.InitGame))
                    {
                        if (!primeiro)
                        {                            
                            game.Logs = logs;
                            games.Add(game);

                            logs = new List<Log>();
                            game = new Game();
                            game.Id = index++;
                        }
                        else
                        {
                            primeiro = false;
                        }                        
                    }

                    logs.Add(log);

                }

                game.Logs = logs;
                games.Add(game);
                return games;
            }
            catch (Exception)
            {
                return new List<Game>();
            }
        }

        public IEnumerable<TotalMortes> GetTotalMortesPorGame()
        {
            List<TotalMortes> listaTotalMortes = new List<TotalMortes>();
            TotalMortes totalMortes;

            try
            {
                foreach (var game in GetGames())
                {
                    totalMortes = new TotalMortes();

                    totalMortes.IdGame = game.Id;
                    totalMortes.TotalMorte = game.Logs.FindAll(l => l.Tipo.Equals(TiposLog.Tipo.Kill)).Count;

                    listaTotalMortes.Add(totalMortes);
                }

                return listaTotalMortes;
            }
            catch (Exception)
            {
                return new List<TotalMortes>();
            }
        }

        public IEnumerable<MortesPorCausa> GetTotalMortesPorCausa()
        {
            List<MortesPorCausa> listaMortesPorCausa = new List<MortesPorCausa>();
            MortesPorCausa mortesPorCausa;
            Dictionary<TiposMortes.Tipo, long> dic;
            long totalMortes = 0;

            try
            {
                foreach (var game in GetGames())
                {
                    dic = new Dictionary<TiposMortes.Tipo, long>();

                    foreach (TiposMortes.Tipo tipo in Enum.GetValues(typeof(TiposMortes.Tipo)))
                    {
                        totalMortes = game.Logs.FindAll(l => l.Tipo.Equals(TiposLog.Tipo.Kill) && l.Conteudo.Contains(Enum.GetName(typeof(TiposMortes.Tipo), tipo))).Count;
                        if(totalMortes > 0)
                        {
                            dic.Add(tipo, totalMortes);
                        }                        
                    }

                    mortesPorCausa = new MortesPorCausa();

                    mortesPorCausa.IdGame = game.Id;
                    mortesPorCausa.TotalMortePorTipo = dic;

                    listaMortesPorCausa.Add(mortesPorCausa);
                }

                return listaMortesPorCausa;
            }
            catch (Exception)
            {
                return new List<MortesPorCausa>();
            }
        }

        public IEnumerable<MortesCausadasPelo> GetTotalMortesCausadasPelo()
        {
            List<MortesCausadasPelo> listaMortesCausadaPelo = new List<MortesCausadasPelo>();
            MortesCausadasPelo mortesCausadaPelo;
            Dictionary<string, long> dic;            
            string esperto = string.Empty;

            try
            {
                foreach (var game in GetGames())
                {
                    dic = new Dictionary<string, long>();

                    foreach (Log log in game.Logs)
                    {
                        if (!log.Tipo.Equals(TiposLog.Tipo.Kill))
                        {
                            continue;
                        }
                        if (string.IsNullOrEmpty(log.Conteudo.Trim()))
                        {
                            continue;
                        }

                        esperto = GetEsperto(log.Conteudo);

                        if (dic.ContainsKey(esperto))
                        {
                            dic[esperto] = dic[esperto] + 1;
                        }
                        else
                        {
                            dic.Add(esperto, 1);
                        }
                    }

                    mortesCausadaPelo = new MortesCausadasPelo();

                    mortesCausadaPelo.IdGame = game.Id;
                    mortesCausadaPelo.TotalMortePelo = dic;

                    listaMortesCausadaPelo.Add(mortesCausadaPelo);
                }

                return listaMortesCausadaPelo;
            }
            catch (Exception)
            {
                return new List<MortesCausadasPelo>();
            }
        }

        private string GetEsperto(string conteudo)
        {
            try
            {
                const string by = "by";
                return conteudo.Substring(conteudo.LastIndexOf(by) + by.Length + 1, conteudo.Length - conteudo.LastIndexOf(by) - by.Length - 1);
            }
            catch (Exception)
            {
                return String.Empty;
            }
        }

        public IEnumerable<Ranking> GetRanking()
        {
            List<Ranking> listaRanking = new List<Ranking>();
            Ranking ranking;
            Dictionary<string, long> dic;
            string nome = string.Empty;
            long score = 0;

            try
            {
                foreach (var game in GetGames())
                {
                    dic = new Dictionary<string, long>();

                    foreach (Log log in game.Logs)
                    {
                        if (!log.Tipo.Equals(TiposLog.Tipo.Score))
                        {
                            continue;
                        }
                        if (string.IsNullOrEmpty(log.Conteudo.Trim()))
                        {
                            continue;
                        }

                        nome = GetNomeScore(log.Conteudo);
                        score = GetScore(log.Conteudo);

                        dic.Add(nome, score);
                        
                    }

                    ranking = new Ranking();

                    ranking.IdGame = game.Id;
                    ranking.Score = dic;

                    listaRanking.Add(ranking);
                }

                return listaRanking;
            }
            catch (Exception)
            {
                return new List<Ranking>();
            }
        }

        private int GetScore(string conteudo)
        {
            try
            {
                return Convert.ToInt32(conteudo.Substring(0, 3).Trim());
            }
            catch (Exception)
            {
                return 0;
            }
        }

        private string GetNomeScore(string conteudo)
        {
            try
            {
                const string CLIENTE = "client: ";
                return conteudo.Substring(conteudo.LastIndexOf(CLIENTE) + CLIENTE.Length + 2, conteudo.Length - conteudo.LastIndexOf(CLIENTE) - CLIENTE.Length - 2);
            }
            catch (Exception)
            {
                return String.Empty;
            }
        }

    }   

}
