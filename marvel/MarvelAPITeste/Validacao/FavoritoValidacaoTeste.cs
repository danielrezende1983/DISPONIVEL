using MarvelAPI.Validacao;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Xunit;

namespace MarvelAPI.Teste.Validacao
{
    public class FavoritoValidacaoTeste
    {

        [Fact]
        public void Validar()
        {
            Assert.Equals(
                "Favoritar no máximo 5 personagens.",
                new FavoritoValidacao().Validar());
            
        }

    }
}
