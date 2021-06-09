using provaadmissional.codigo.models;
using ProvaAdmissionalCSharpApisul;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace provaadmissional.codigo.services
{
    class ElevadorService : IElevadorService
    {

        IList<Resposta> _listaRespostas;
        Dictionary<int, int> _dicionarioAcessoPorAndares;
        Dictionary<char, int> _dicionarioFrequenciaPorElevadores;
        Dictionary<char, int> _dicionarioFluxoPorPeriodo;
        List<char> _listaElevadores = new List<char> { 'A', 'B', 'C', 'D', 'E' };
        List<char> _listaPeriodos = new List<char> { 'M', 'V', 'N' };

        public ElevadorService(IList<Resposta> listaRespostas)
        {
            _listaRespostas = listaRespostas;
        }

        public List<int> andarMenosUtilizado()
        {

            List<int> lista = new List<int>();

            if (!listaRespostasValida()) return lista;

            prepareDicionarioPorAcessoAndares();
            int menor = 9999;

            foreach(KeyValuePair<int, int> item in _dicionarioAcessoPorAndares)
            {

                if (item.Value < menor) {

                    menor = item.Value;
                    lista = new List<int>();
                    lista.Add(item.Key);

                }
                else if (item.Value == menor)
                {
                    lista.Add(item.Key);
                }                

            }
            
            return lista;

        }

        public List<char> elevadorMaisFrequentado()
        {

            List<char> lista = new List<char>();

            if (!listaRespostasValida()) return lista;

            prepareDicionarioPorElevadoresMaisFrequentados();
            int maior = 0;

            foreach (KeyValuePair<char, int> item in _dicionarioFrequenciaPorElevadores)
            {

                if (item.Value > maior)
                {

                    maior = item.Value;
                    lista = new List<char>();
                    lista.Add(item.Key);

                }
                else if (item.Value == maior)
                {
                    lista.Add(item.Key);
                }

            }

            return lista;

        }

        public List<char> elevadorMenosFrequentado()
        {

            List<char> lista = new List<char>();

            if (!listaRespostasValida()) return lista;

            prepareDicionarioPorElevadoresMaisFrequentados();
            int menor = 9999;

            foreach (KeyValuePair<char, int> item in _dicionarioFrequenciaPorElevadores)
            {

                if (item.Value < menor)
                {

                    menor = item.Value;
                    lista = new List<char>();
                    lista.Add(item.Key);

                }
                else if (item.Value == menor)
                {
                    lista.Add(item.Key);
                }

            }

            return lista;

        }

        public float percentualDeUsoElevadorA()
        {
            if (!dadosParaCalculoPercentualValido('A')) return 0;
            return calcularPercentual(_dicionarioFrequenciaPorElevadores['A']);
        }

        public float percentualDeUsoElevadorB()
        {
            if (!dadosParaCalculoPercentualValido('B')) return 0;
            return calcularPercentual(_dicionarioFrequenciaPorElevadores['B']);
        }

        public float percentualDeUsoElevadorC()
        {
            if (!dadosParaCalculoPercentualValido('C')) return 0;
            return calcularPercentual(_dicionarioFrequenciaPorElevadores['C']);
        }

        public float percentualDeUsoElevadorD()
        {
            if (!dadosParaCalculoPercentualValido('D')) return 0;
            return calcularPercentual(_dicionarioFrequenciaPorElevadores['D']);
        }

        public float percentualDeUsoElevadorE()
        {
            if (!dadosParaCalculoPercentualValido('E')) return 0;
            return calcularPercentual(_dicionarioFrequenciaPorElevadores['E']);
        }

        public List<char> periodoMaiorFluxoElevadorMaisFrequentado()
        {

            List<char> listaPeriodoMaiorFluxo = new List<char>();
            List<char> listaElevadorMaisFrequentado = elevadorMaisFrequentado();

            if (listaElevadorMaisFrequentado == null) return listaPeriodoMaiorFluxo;
            if (listaElevadorMaisFrequentado.Count == 0) return listaPeriodoMaiorFluxo;

            Dictionary<char, int> dicionarioPeriodo;
            int maior = 0;

            dicionarioPeriodo = prepareSubDicionarioPorPeriodo(listaElevadorMaisFrequentado[0]);

            foreach (KeyValuePair<char, int> item in dicionarioPeriodo)
            {

                if (item.Value > maior)
                {

                    maior = item.Value;
                    listaPeriodoMaiorFluxo = new List<char>();
                    listaPeriodoMaiorFluxo.Add(item.Key);

                }
                else if (item.Value == maior)
                {
                    listaPeriodoMaiorFluxo.Add(item.Key);
                }

            }

            return listaPeriodoMaiorFluxo;

        }

        public List<char> periodoMaiorUtilizacaoConjuntoElevadores()
        {

            List<char> lista = new List<char>();

            if (!listaRespostasValida()) return lista;

            prepareDicionarioPorPeriodoMaiorFluxo();
            int maior = 0;

            foreach (KeyValuePair<char, int> item in _dicionarioFluxoPorPeriodo)
            {

                if (item.Value > maior)
                {

                    maior = item.Value;
                    lista = new List<char>();
                    lista.Add(item.Key);

                }
                else if (item.Value == maior)
                {
                    lista.Add(item.Key);
                }

            }

            return lista;

        }

        public List<char> periodoMenorFluxoElevadorMenosFrequentado()
        {
            List<char> listaPeriodoMenorFluxo = new List<char>();
            List<char> listaElevadorMenosFrequentado = elevadorMenosFrequentado();

            if (listaElevadorMenosFrequentado == null) return listaPeriodoMenorFluxo;
            if (listaElevadorMenosFrequentado.Count == 0) return listaPeriodoMenorFluxo;

            Dictionary<char, int> dicionarioPeriodo;
            int menor = 9999;

            dicionarioPeriodo = prepareSubDicionarioPorPeriodo(listaElevadorMenosFrequentado[0]);

            foreach (KeyValuePair<char, int> item in dicionarioPeriodo)
            {

                if (item.Value < menor)
                {

                    menor = item.Value;
                    listaPeriodoMenorFluxo = new List<char>();
                    listaPeriodoMenorFluxo.Add(item.Key);

                }
                else if (item.Value == menor)
                {
                    listaPeriodoMenorFluxo.Add(item.Key);
                }

            }

            return listaPeriodoMenorFluxo;

        }

        private Dictionary<char, int> prepareSubDicionarioPorPeriodo(char elevador)
        {

            Dictionary<char, int> dicionario = new Dictionary<char, int>();
            int quantidade = 0;

            foreach (char item in _listaPeriodos)
            {

                quantidade = (from itemResp in _listaRespostas
                              where itemResp.elevador == elevador && itemResp.turno == item
                              select itemResp).Count();

                dicionario.Add(item, quantidade);

            }

            return dicionario;

        }

        private bool dadosParaCalculoPercentualValido(char elevador)
        {

            if (!listaRespostasValida()) return false;

            prepareDicionarioPorElevadoresMaisFrequentados();

            if (_dicionarioFrequenciaPorElevadores == null) return false;
            if (_dicionarioFrequenciaPorElevadores.Count == 0) return false;
            if (!_dicionarioFrequenciaPorElevadores.ContainsKey(elevador)) return false;
            if (_dicionarioFrequenciaPorElevadores[elevador] == 0) return false;

            return true;

        }

        private float calcularPercentual(int quantidade)
        {
            float quantidadeFloat = quantidade;
            return (quantidadeFloat / _listaRespostas.Count) * 100;
        }

        private bool listaRespostasValida()
        {
            if (_listaRespostas == null) return false;
            if (_listaRespostas.Count == 0) return false;
            return true;
        }

        private void prepareDicionarioPorAcessoAndares()
        {

            if (_dicionarioAcessoPorAndares != null) return;            

            _dicionarioAcessoPorAndares = new Dictionary<int, int>();
            int quantidade = 0;

            for (int i = 0; i < 16; i++)
            {

                quantidade = (from itemResp in _listaRespostas
                              where itemResp.andar == i
                              select itemResp).Count();

                _dicionarioAcessoPorAndares.Add(i, quantidade);

            }

        }

        private void prepareDicionarioPorElevadoresMaisFrequentados()
        {

            if (_dicionarioFrequenciaPorElevadores != null) return;

            _dicionarioFrequenciaPorElevadores = new Dictionary<char, int>();
            int quantidade = 0;

            foreach (char item in _listaElevadores)
            {

                quantidade = (from itemResp in _listaRespostas
                              where itemResp.elevador == item
                              select itemResp).Count();

                _dicionarioFrequenciaPorElevadores.Add(item, quantidade);

            }

        }

        private void prepareDicionarioPorPeriodoMaiorFluxo()
        {

            if (_dicionarioFluxoPorPeriodo != null) return;

            _dicionarioFluxoPorPeriodo = new Dictionary<char, int>();
            int quantidade = 0;

            foreach (char item in _listaPeriodos)
            {

                quantidade = (from itemResp in _listaRespostas
                              where itemResp.turno == item
                              select itemResp).Count();

                _dicionarioFluxoPorPeriodo.Add(item, quantidade);

            }

        }

    }

}
