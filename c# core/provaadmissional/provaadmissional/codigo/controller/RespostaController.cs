using Newtonsoft.Json.Linq;
using provaadmissional.codigo.models;
using System;
using System.Collections.Generic;
using System.Text;

namespace provaadmissional.codigo.controller
{
    class RespostaController
    {

        IList<Resposta> _listaRespostas;

        public RespostaController(string valorEntrada)
        {

            JArray arrayRespostas = JArray.Parse(valorEntrada);

            _listaRespostas = new List<Resposta>();
            _listaRespostas = arrayRespostas.ToObject<IList<Resposta>>();

        }

        public IList<Resposta> listaResposta => _listaRespostas;

    }

}
