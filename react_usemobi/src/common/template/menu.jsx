import React from 'react'
import MenuItem from './menuItem'
import MenuTree from './menuTree'

export default props => (
    <ul className='sidebar-menu'>

        <MenuItem path='#' label='Home' icon='home' />        

        <MenuTree label='Protudos' icon='th-large'>

            <MenuTree label='Eventos' icon=''>

                <MenuItem path='#eventoTodos' label='Todos' icon='' />

                <MenuTree label='Evento Casamento' icon=''>
                    <MenuItem path='#eventoCasamento' label='Produto' icon='' />
                    <MenuItem path='#eventoCasamentoTermoUso' label='Termos de Uso' icon='' />
                    <MenuItem path='#eventoCasamentoPoliticaDados' label='Politica de Dados' icon='' />
                </MenuTree>

            </MenuTree>            

        </MenuTree>

        <MenuTree label='Contatos' icon='phone'>
            <MenuItem path='#contatoComercial' label='Comercial' icon='' />
            <MenuItem path='#contatoSuporte' label='Suporte' icon='' />
        </MenuTree>
        
    </ul>
)