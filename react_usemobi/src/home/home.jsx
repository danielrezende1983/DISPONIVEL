import React, { Component } from 'react'

import Content from '../common/template/content'
import Row from '../common/layout/row'

import CardImagemRota from '../common/widget/cardImagemRota'
import IconeAplicativo from '../common/widget/iconeAplicativo'

import Titulo from '../common/widget/titulo'
import SubTitulo from '../common/widget/subTitulo'
import Conteudo from '../common/widget/conteudo'

import Logo from '../assets/logo_use_mobi_03_256_dark.png' 
import ImagemGooglePlay from '../assets/google_play_001_256.png'
import ImagemAppleStore from '../assets/apple_store_001_256.png'


class Home extends Component {
    render() {
        return (
            <div>

                <Titulo css="titulo" texto='UseMobi Sistemas LTDA' />

                <IconeAplicativo imagem={Logo} />
                
                <SubTitulo texto='Especialistas em desenvolvimento de soluções para aplicativos em dispositivos Androis e IOS.' />

                <SubTitulo texto='Desenvolvemos seus aplicativos especificamente para seu negócio!' />
                
                <SubTitulo texto='Entre em contato e solicite um orçamento.' />

                <IconeAplicativo imagem={ImagemGooglePlay} />

                <IconeAplicativo imagem={ImagemAppleStore} />                

                <Conteudo texto='.' />

            </div>
        )
    }
}

export default Home