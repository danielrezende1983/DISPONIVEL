using MarvelAPI.Models;
using Newtonsoft.Json;
using Newtonsoft.Json.Linq;
using System.Text.Json.Nodes;

namespace MarvelAPI.Services
{
    public class MarvelServico
    {
        const string TIMESTAMP = "1666875737";
        const string API_KEY_PUBLICA = "53b0ff21d82d834c399f5eb3c83c88ae";
        const string MD5 = "bca32beb5225f9562bf7bf08e7ca426a"; // CONTEM A CHAVE PRIVADA

        const string HOST_WEB_SERVICE = "https://gateway.marvel.com:443/";
        const string URL_WEB_SERVICE_PERSONAGENS = "v1/public/characters?ts=TIMESTAMP&apikey=API_KEY_PUBLICA&hash=MD5";

        public List<Personagem> GetPersonagens()
        {
            List<Personagem> listaPersonagens = new List<Personagem>();
            Personagem personagem;

            try
            {

                string getUrl = URL_WEB_SERVICE_PERSONAGENS.Replace("TIMESTAMP", TIMESTAMP)
                    .Replace("API_KEY_PUBLICA", API_KEY_PUBLICA)
                    .Replace("MD5", MD5);

                using (var client = new HttpClient())
                {
                    client.BaseAddress = new Uri(HOST_WEB_SERVICE);
                    client.DefaultRequestHeaders.Accept.Clear();
                    client.DefaultRequestHeaders.Accept.Add(new System.Net.Http.Headers.MediaTypeWithQualityHeaderValue("application/json"));

                    HttpResponseMessage response;

                    try
                    {
                        response = client.GetAsync(getUrl).GetAwaiter().GetResult();
                    }
                    catch (HttpRequestException)
                    {
                        response = null;
                    }

                    if(response == null || !response.IsSuccessStatusCode)
                    {
                        return listaPersonagens;
                    }

                    string conteudo = response.Content.ReadAsStringAsync().Result;
                    dynamic resultado = JsonConvert.DeserializeObject(conteudo);

                    foreach (var item in resultado.data.results)
                    {
                        personagem = new Personagem();

                        personagem.Id = item.id;
                        personagem.Nome = item.name;
                        personagem.Descricao = item.description;
                        personagem.UrlImagem = item.thumbnail.path + "." + item.thumbnail.extension;
                        personagem.UrlWiki = item.urls[1].url;

                        listaPersonagens.Add(personagem);
                    }

                    return listaPersonagens;
                }

            }
            catch(Exception)
            {
                throw;
            }

        }

    }
}
