import React, { Component } from 'react'

import ContentHeader from '../common/template/contentHeader'
import Content from '../common/template/content'
import ValueBoxContato from '../common/widget/valueBoxContato'
import Row from '../common/layout/row'

class Home extends Component {
    render() {
        return (
            <div>
                <ContentHeader title='Contato Suporte' />
                <Content>
                    <Row>
                        <ValueBoxContato cols='12 4' color='green' icon='whatsapp'
                                         value='(62) 98338-5007' text='WhatsApp' />
                        <ValueBoxContato cols='12 4' color='blue' icon='paper-plane'
                                         value='suporte@usemobi.com.br' text='e-Mail' />
                        <ValueBoxContato cols='12 4' color='red' icon='hourglass-half'
                                         value='Seg–Sex : 9h às 17h' text='Horário' />                        
                    </Row>                     
                </Content>
            </div>
        )
    }
}

export default Home