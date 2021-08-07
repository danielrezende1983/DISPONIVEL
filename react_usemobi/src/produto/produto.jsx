import React from 'react'

import Titulo from '../common/widget/titulo'
import SubTitulo from '../common/widget/subTitulo'
import Conteudo from '../common/widget/conteudo'
import ConteudoComArray from '../common/widget/conteudoComArray'
import IconeAplicativo from '../common/widget/iconeAplicativo'

export default props => (
    <div>
        
        <Titulo css="titulo" texto={props.nomeAplicativo} />

        <IconeAplicativo imagem={props.icone} />

        <SubTitulo texto='Descrição:' />
        <ConteudoComArray arrayTextos={props.arrayDescricao}/>       

        <SubTitulo texto='Principais recursos:' />
        <ConteudoComArray arrayTextos={props.arrayRecursos}/>       

        <SubTitulo texto={'Então, o que você está esperando? Baixe e divirta-se!'}/>

        <Conteudo texto={'.'}/>
        
    </div>
) 