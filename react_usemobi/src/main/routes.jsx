import React from 'react'
import { Router, Route, Redirect, hashHistory } from 'react-router'

import Home from '../home/home'

import EventoTodos from '../eventoTodos/eventoTodos'
import EventoCasamento from '../eventoCasamento/eventoCasamento'
import EventoCasamentoTermoUso from '../eventoCasamento/eventoCasamentoTermoUso'
import EventoCasamentoPoliticaDados from '../eventoCasamento/eventoCasamentoPoliticaDados'

import ContatoComercial from '../contatoComercial/contatoComercial'
import ContatoSuporte from '../contatoSuporte/contatoSuporte'

export default props => (
    <Router history={hashHistory}>
        <Route path='/' component={Home} />
        <Route path='/eventoTodos' component={EventoTodos} />
        <Route path='/eventoCasamento' component={EventoCasamento} />
        <Route path='/eventoCasamentoTermoUso' component={EventoCasamentoTermoUso} />
        <Route path='/eventoCasamentoPoliticaDados' component={EventoCasamentoPoliticaDados}/>
        <Route path='/contatoComercial' component={ContatoComercial} />
        <Route path='/contatoSuporte' component={ContatoSuporte} />
        <Redirect from='*' to='/' />
    </Router>
)