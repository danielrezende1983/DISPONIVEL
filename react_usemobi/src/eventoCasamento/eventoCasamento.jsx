import React from 'react'

import Icone from '../assets/casamento_006_128.png'
import Produto from '../produto/produto'

const ARRAY_DESCRICAO = [
    'Um incrível aplicativo Evento Casamento para organizar e gerenciar sua cerimônia de casamento.',
    'Divulgue a celebração do seu dia especial enviando convite aos seus amigos e familiares depois ' 
        + 'de preparar o evento de sua cerimônia.'
];

const ARRAY_RECURSOS = [
    '- Montar seu perfil que identificará você entre seus convidados.',
    '- Prepare seu evento cerimônia, com fotos, data, local, traje, e outros, para ' 
        + 'que seus convidados também visualize e participe deste momento.', 
    '- Montar sua própria lista de presentes. Você poderá cadastrar um presente novo ' 
        + 'ou selecionar um presente de uma lista fornecida por um de nossos parceiros ' 
        + 'lojistas devidamente cadastros no app Evento Loja.',
    '- Montar sua lista de serviços e produtos que você utilizará em sua cerimônia, de ' 
        + 'forma que já visualize o seu valor investido até o momento automáticamente. ' 
        + 'Você poderá cadastrar um serviço ou um produto contratado novo ou selecionar ' 
        + 'um serviço ou produto de uma lista fornecida por um de nossos parceiros ' 
        + 'prestadores de serviços devidamente cadastrado no app Evento Serviços e Insumos.',
    '- Montar sua própria lista de convidados para a cerimônia de casamento, que ' 
        + 'possibilitara saber instantaneamente ao todo quantos convidados confirmaram ' 
        + 'presença. Você poderá cadastrar um convidado novo informando a quantidade ' 
        + 'de acompanhantes, ou poderá convidar um amigo ou familiar selecionar um ' 
        + 'convidado devidamente cadastrado no app Evento Convidado.'
];

export default props => (
    <Produto nomeAplicativo='Evento Casamento'
             icone={Icone}
             arrayDescricao={ARRAY_DESCRICAO}
             arrayRecursos={ARRAY_RECURSOS}
    />
)