import React from 'react'

import Icone from '../assets/casamento_006_128.png'

import Titulo from '../common/widget/titulo'
import Content from '../common/template/content'
import Row from '../common/layout/row'
import CardImagemRota from '../common/widget/cardImagemRota'

export default props => (
    <div>
        <Titulo css="titulo" texto='EVENTOS' />
        <Content>
            <Row>
                <CardImagemRota cols='12 4'
                                icone={Icone}
                                nomeAplicativo='Evento Casamento'
                                descricao='Gerenciar cerimônia de casamento.' 
                                path='#eventoCasamento'
                />                
            </Row>                     
        </Content>
    </div>
)