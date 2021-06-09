using provaadmissional.codigo.controller;
using provaadmissional.codigo.models;
using provaadmissional.codigo.services;
using System;
using System.Collections.Generic;
using System.IO;

namespace provaadmissional
{
    class Program
    {

        private static ElevadorService _service;

        static void Main(string[] args)
        {

            String valorEntrada = File.ReadAllText(@"c:\input.json");
            //Console.WriteLine(valorEntrada);

            RespostaController controller = new RespostaController(valorEntrada);

            IList<Resposta> _listaRespostas = controller.listaResposta;            

            _service = new ElevadorService(_listaRespostas);

            mostreResultado();            

        }

        static private void mostreResultado()
        {
            mostreResultadoAndarMenosUtilizado();
            mostreResultadoElevadorMaisFrequentadoPeriodoMaiorFluxo();
            mostreResultadoElevadorMenosFrequentadoPeriodoMenorFluxo();
            mostreResultadoPeriodoMaiorFluxo();
            mostreResultadoPercentualUsoElevador();
        }

        static private void mostreResultadoAndarMenosUtilizado()
        {

            Console.WriteLine("");
            Console.WriteLine("Andares menos utilizados pelos usuários:");

            List<int> lista = _service.andarMenosUtilizado();

            if (lista != null)
            {
                foreach(int item in lista)
                {
                    Console.WriteLine(string.Format("Andar: {0}", item));
                }                
            }            

        }

        static private void mostreResultadoPeriodoMaiorFluxo()
        {

            Console.WriteLine("");
            Console.WriteLine("Período de maior utilização do conjunto de elevadores:");

            List<char> lista = _service.periodoMaiorUtilizacaoConjuntoElevadores();

            if (lista != null)
            {
                foreach (char item in lista)
                {
                    Console.WriteLine(string.Format("Turno: {0}", item));
                }
            }

        }

        static private void mostreResultadoElevadorMaisFrequentadoPeriodoMaiorFluxo()
        {

            Console.WriteLine("");
            Console.WriteLine("Elevador mais frequentado e o período que se encontra maior fluxo:");

            List<char> listaElevadorMaisFrequentado = _service.elevadorMaisFrequentado();
            List<char> listaPeriodoMaiorFluxo = _service.periodoMaiorFluxoElevadorMaisFrequentado();

            if (listaElevadorMaisFrequentado != null && listaElevadorMaisFrequentado.Count > 0)
            {
                Console.WriteLine(string.Format("Evelvador: {0}", listaElevadorMaisFrequentado[0]));

                if (listaPeriodoMaiorFluxo != null && listaPeriodoMaiorFluxo.Count > 0)
                {
                    Console.WriteLine(string.Format("Turno: {0}", listaPeriodoMaiorFluxo[0]));
                }

            }

        }

        static private void mostreResultadoElevadorMenosFrequentadoPeriodoMenorFluxo()
        {

            Console.WriteLine("");
            Console.WriteLine("Elevador menos frequentado e o período que se encontra menor fluxo:");

            List<char> listaElevadoMenosFrequentado = _service.elevadorMenosFrequentado();
            List<char> listaPeriodoMenorFluxo = _service.periodoMenorFluxoElevadorMenosFrequentado();

            if (listaElevadoMenosFrequentado != null && listaElevadoMenosFrequentado.Count > 0)
            {
                Console.WriteLine(string.Format("Evelvador: {0}", listaElevadoMenosFrequentado[0]));

                if (listaPeriodoMenorFluxo != null && listaPeriodoMenorFluxo.Count > 0)
                {
                    Console.WriteLine(string.Format("Turno: {0}", listaPeriodoMenorFluxo[0]));
                }

            }

        }

        static private void mostreResultadoPercentualUsoElevador()
        {

            Console.WriteLine("");
            Console.WriteLine("Qual o percentual de uso de cada elevador com relação a todos os serviços prestados:");

            mostreResultadoPercentualUsoElevadorA();
            mostreResultadoPercentualUsoElevadorB();
            mostreResultadoPercentualUsoElevadorC();
            mostreResultadoPercentualUsoElevadorD();
            mostreResultadoPercentualUsoElevadorE();

        }

        static private void mostreResultadoPercentualUsoElevadorA()
        {
            float percentual = _service.percentualDeUsoElevadorA();
            Console.WriteLine(string.Format("Elevador A: {0}%", percentual));
        }

        static private void mostreResultadoPercentualUsoElevadorB()
        {
            float percentual = _service.percentualDeUsoElevadorB();
            Console.WriteLine(string.Format("Elevador B: {0}%", percentual));
        }

        static private void mostreResultadoPercentualUsoElevadorC()
        {
            float percentual = _service.percentualDeUsoElevadorC();
            Console.WriteLine(string.Format("Elevador C: {0}%", percentual));
        }

        static private void mostreResultadoPercentualUsoElevadorD()
        {
            float percentual = _service.percentualDeUsoElevadorD();
            Console.WriteLine(string.Format("Elevador D: {0}%", percentual));
        }

        static private void mostreResultadoPercentualUsoElevadorE()
        {
            float percentual = _service.percentualDeUsoElevadorE();
            Console.WriteLine(string.Format("Elevador E: {0}%", percentual));
        }

    }
}
