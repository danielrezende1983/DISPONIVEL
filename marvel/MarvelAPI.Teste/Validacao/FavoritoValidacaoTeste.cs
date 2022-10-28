using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace MarvelAPI.Teste.Validacao
{
    public class FavoritoValidacaoTeste
    {

        MarvelAPI.Validacao.FavoritoValidacao _validacao;

        public FavoritoValidacaoTeste()
        {
            _validacao = new MarvelAPI.Validacao.FavoritoValidacao();
        }


        [SetUp]
        public void Setup()
        {
        }

        [Test]
        public void Validar_Teste()
        {
            string msg = _validacao.Validar()[0];
            Assert.Equals("Favoritar no máximo 5 personagens.", msg);
        }

    }
}
