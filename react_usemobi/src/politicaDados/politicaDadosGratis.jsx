import React from 'react'

import Titulo from '../common/widget/titulo'
import Conteudo from '../common/widget/conteudo'
import SubTitulo from '../common/widget/subTitulo'

export default props => (
    <div>
        
        <Conteudo texto={'Esta política descreve as informações que ' + 
            'processamos para viabilizar a operação dos produtos oferecidos ' + 
            'pela Empresa UseMobi Sistemas LTDA. Você pode encontrar ' + 
            'informações e ferramentas adicionais nas Configurações do ' + 
            'aplicativo ' + props.nomeAplicativo + '.'}/>

        <Titulo css="titulo-termo" texto={'Não aplicação da politica de dados'} />

        <Conteudo texto={'Esta Política de Dados não se aplica para sites ' + 
            'de terceiros, ainda que você os acesse por links contidos no ' + 
            'aplicativo ' + props.nomeAplicativo + '. A EMPRESA UseMobi ' + 
            'Sistemas LTDA NÃO SE RESPONSABILIZA POR ESTES SITES E CONTEÚDOS ' + 
            'E, AINDA, NÃO COMPARTILHA, SUBSCREVE, MONITORA, VALIDA OU ' + 
            'ACEITA A FORMA COMO ESSES SITES OU FERRAMENTAS DE ARMAZENAMENTO ' + 
            'DE CONTEÚDO COLETAM, PROCESSAM E TRANSFEREM SUAS INFORMAÇÕES ' + 
            'PESSOAIS. Recomendamos que você consulte as respectivas ' + 
            'políticas de privacidade para se informar adequadamente a ' + 
            'respeito do uso de suas informações pessoais por outros sites ' + 
            'ou outras ferramentas.'}/>

        <Titulo css="titulo-termo" texto={'I. Quais tipos de informações coletamos?'} />

        <Conteudo texto={'Para fornecer os Produtos da Empresa UseMobi ' + 
            'Sistemas LTDA, precisamos processar informações sobre você. Os ' + 
            'tipos de informações que coletamos dependem de como você usa ' + 
            'nossos Produtos. Para saber mais sobre como acessar e excluir ' + 
            'as informações que coletamos, acesse as Configurações do ' + 
            'aplicativo ' + props.nomeAplicativo + '.'}/>

        <Titulo css="titulo-termo" texto={'Coisas que você e outras pessoas fazem e fornecem'} />

        <SubTitulo texto={'- Informações e conteúdo que você fornece'} />

        <Conteudo texto={'Coletamos o conteúdo, comunicações e outras ' + 
            'informações que você fornece quando usa nossos Produtos, ' + 
            'inclusive quando você se cadastra para criar uma conta, cria ' + 
            'ou compartilha conteúdo, envia mensagens ou se comunica com ' + 
            'outras pessoas. Isso pode incluir informações presentes ou sobre ' + 
            'o conteúdo que você fornece (como metadados), como a localização ' + 
            'de uma foto ou a data em que um arquivo foi criado. Isso pode ' + 
            'incluir também o que você vê por meio dos recursos que ' + 
            'fornecemos, como nossa câmera, de modo que possamos realizar ' + 
            'ações como sugerir máscaras e filtros de que você pode gostar, ' + 
            'ou dar dicas sobre o uso de formatos da câmera. Nossos sistemas ' + 
            'processam automaticamente o conteúdo e as comunicações que você ' + 
            'e outras pessoas fornecem a fim de analisar o contexto e o ' + 
            'conteúdo incluído nesses itens para as finalidades descritas ' + 
            'abaixo. Saiba mais sobre como controlar quem pode ver o conteúdo ' + 
            'que você compartilha. Dados com proteções especiais: é possível ' + 
            'optar por fornecer informações nos campos de perfil. Essas e ' + 
            'outras informações (como origem racial ou étnica, crenças ' + 
            'filosóficas ou filiações sindicais) podem estar sujeitas a ' + 
            'proteções especiais de acordo com as leis do seu país.'}/>

        <SubTitulo texto={'- Redes e conexões'} />

        <Conteudo texto={'Coletamos informações sobre as pessoas, páginas, ' + 
            'contas, hashtags e grupos com que você se conecta e sobre ' + 
            'como você interage com eles em nossos Produtos, por exemplo, ' + 
            'as pessoas com quem você mais se comunica ou os grupos dos ' + 
            'quais você faz parte. Também coletamos informações de contato ' + 
            'se você optar por carregar, sincronizar ou importá-las de um ' + 
            'dispositivo (como uma agenda de contatos, registro de chamadas ' + 
            'ou histórico de SMS), que usamos para ações como ajudar você ' + 
            'e outras pessoas a encontrar pessoas que talvez vocês conheçam ' + 
            'e para as outras finalidades listadas abaixo.'}/>

        <SubTitulo texto={'- Seu uso'} />

        <Conteudo texto={'Coletamos informações sobre como você usa nossos ' + 
            'Produtos, como o tipo de conteúdo que você visualiza ou com o ' + 
            'qual se envolve; os recursos que você usa; as ações que você ' + 
            'realiza; as pessoas ou contas com que você interage; e o tempo, ' + 
            'frequência e duração das suas atividades. Por exemplo, ' + 
            'registramos quando você está usando e a última vez que usou ' + 
            'nossos Produtos, quais publicações, vídeos e outro conteúdo ' + 
            'você visualizou nos nossos Produtos. Nós também coletamos ' + 
            'informações sobre como você usa recursos como nossa câmera.'}/>

        <SubTitulo texto={'- Informações sobre transações realizadas em ' + 
            'nossos Produtos'} />

        <Conteudo texto={'Se você usa nossos Produtos para compras ou outras ' + 
            'transações financeiras (como quando você faz uma compra em um ' + 
            'jogo ou realiza uma doação), nós coletamos informações sobre a ' + 
            'compra ou transação. Isso inclui informações de pagamento, como ' + 
            'o seu número do cartão de crédito ou débito e outras informações ' + 
            'sobre o cartão; outras informações de conta e autenticação; ' + 
            'detalhes de cobrança, entrega e contato.'}/>

        <SubTitulo texto={'- O que os outros fazem e informações que eles ' + 
            'fornecem sobre você'} />

        <Conteudo texto={'Também recebemos e analisamos conteúdo, ' + 
            'comunicações e informações que outras pessoas fornecem quando ' + 
            'usam nossos Produtos. Isso pode incluir informações sobre você, ' + 
            'como quando outras pessoas compartilham ou comentam seu evento, ' + 
            'enviam uma mensagem a você ou carregam, sincronizam ou importam ' + 
            'as suas informações de contato.'}/>

        <Titulo css="titulo-termo" texto={'Informações de dispositivo'} />

        <Conteudo texto={'Conforme descrito abaixo, coletamos informações ' + 
            'de e sobre computadores, telefones, TVs conectadas e outros ' + 
            'dispositivos conectados à Web que você usa e que se integram ' + 
            'aos nossos Produtos, e combinamos essas informações dos ' + 
            'diferentes dispositivos que você utiliza. Por exemplo, usamos ' + 
            'as informações coletadas sobre seu uso de nossos Produtos em ' + 
            'seu telefone para personalizar melhor o conteúdo (inclusive ' + 
            'anúncios) ou os recursos que você vê quando usa nossos Produtos ' + 
            'em outro dispositivo, como seu laptop ou tablet, ou para avaliar ' + 
            'se você, em resposta a um anúncio que exibimos em seu telefone, ' + 
            'realizou uma ação em um dispositivo diferente.'}/>

        <Conteudo texto={'As informações que obtemos desses dispositivos incluem:'}/>

        <SubTitulo texto={'- Atributos do dispositivo:'} />

        <Conteudo texto={'Informações como o sistema operacional, as ' + 
            'versões do hardware e software, nível da bateria, força do ' + 
            'sinal, espaço de armazenamento disponível, tipo de navegador, ' + 
            'nomes e tipos de arquivo e de aplicativo, e plugins.'}/>

        <SubTitulo texto={'- Operações do dispositivo:'} />

        <Conteudo texto={'Informações sobre operações e comportamentos ' + 
            'realizados no dispositivo, tais como se uma janela está em ' + 
            'primeiro ou segundo plano, ou movimentos do cursor (que podem ' + 
            'ajudar a distinguir humanos de bots).'}/>

        <SubTitulo texto={'- Identificadores:'} />

        <Conteudo texto={'Identificadores exclusivos, IDs do dispositivo e ' + 
            'outros identificadores, como de jogos, aplicativos ou contas ' + 
            'que você usa, e IDs de Família de Dispositivo (ou outros ' + 
            'identificadores exclusivos dos Produtos da Empresa UseMobi ' + 
            'Sistemas LTDA ao mesmo dispositivo ou à mesma conta).'}/>

        <SubTitulo texto={'- Sinais do dispositivo:'} />

        <Conteudo texto={'Sinais de Bluetooth e informações sobre pontos de ' + 
            'acesso de Wi-Fi nas proximidades, beacons e torres de celular.'}/>

        <SubTitulo texto={'- Dados das configurações do dispositivo:'} />

        <Conteudo texto={'Informações que você permite que nós recebamos ' + 
            'por meio das configurações do dispositivo que você ativa, como ' + 
            'o acesso à sua localização GPS, câmera ou fotos.'}/>

        <SubTitulo texto={'- Rede e conexões:'} />

        <Conteudo texto={'Informações como o nome de sua operadora móvel ' + 
            'ou provedor de serviço de internet, idioma, fuso horário, ' + 
            'número do celular, endereço IP, velocidade de conexão e, ' + 
            'em alguns casos, informações sobre outros dispositivos que ' + 
            'estão nas proximidades ou em sua rede, de forma que nós possamos ' + 
            'fazer coisas como ajudar você a realizar o streaming de um ' + 
            'vídeo de seu celular para sua TV.'}/>

        <SubTitulo texto={'- Dados de Cookies:'}/>

        <Conteudo texto={'Dados de cookies armazenados em seu dispositivo, ' + 
            'inclusive configurações e IDs de cookies.'}/>

        <Titulo css="titulo-termo" texto={'II. Como usamos essas informações?'}/>

        <Conteudo texto={'Usamos as informações que temos (em consonância ' + 
            'com as escolhas feitas por você) conforme descrito abaixo ' + 
            'e para fornecer e viabilizar a operação dos Produtos da ' + 
            'Empresa UseMobi Sistemas LTDA e serviços relacionados ' + 
            'descritos nos Termos da Empresa UseMobi Sistemas LTDA e ' + 
            'nos Termos do aplicativo ' + props.nomeAplicativo + '. ' + 
            'Veja como:'}/>
        
        <Titulo css="titulo-termo" texto={'Fornecer, personalizar e aprimorar nossos Produtos'}/>

        <Conteudo texto={'Usamos as informações que temos para oferecer ' + 
            'nossos Produtos, inclusive para personalizar recursos e ' + 
            'conteúdo (dados dentro do aplicativo aplicativo ' 
            + props.nomeAplicativo + ') e fazer sugestões a você (como ' + 
            'grupos ou eventos pelos quais você possa se interessar ou ' + 
            'tópicos que você talvez queira seguir) dentro e fora de nossos ' + 
            'Produtos. Para criar Produtos personalizados que sejam únicos ' + 
            'e relevantes para você, usamos suas conexões, preferências, ' + 
            'atividades e seus interesses com base nos dados que coletamos ' + 
            'e dos quais tomamos conhecimento por seu intermédio e de outras ' + 
            'pessoas (inclusive dados com proteções especiais que você opte ' + 
            'por fornecer); como você usa e interage com nossos Produtos; e ' + 
            'as pessoas, as coisas ou os lugares com os quais você esteja ' + 
            'conectado e nos quais tenha interesse, dentro e fora dos nossos ' + 
            'Produtos. Saiba mais sobre como usamos informações pessoais ' + 
            'para personalizar sua experiência nos produtos da Empresa ' + 
            'UseMobi Sistemas LTDA, inclusive recursos, conteúdo e ' + 
            'recomendações nos Produtos da Empresa UseMobi Sistemas LTDA.'}/>

        <SubTitulo texto={'- Informações em Produtos da Empresa UseMobi ' + 
            'Sistemas LTDA e dispositivos:'}/>

        <Conteudo texto={'Conectamos informações sobre suas atividades ' + 
            'nos diferentes Produtos da Empresa UseMobi Sistemas LTDA e ' + 
            'dispositivos para fornecer uma experiência mais personalizada ' + 
            'e consistente em todos os Produtos da Empresa UseMobi ' + 
            'Sistemas LTDA que você usa, onde quer que sejam utilizados. ' + 
            'Também podemos tornar a sua experiência mais integrada, por ' + 
            'exemplo, preenchendo automaticamente suas informações de ' + 
            'registro (como seu número de telefone) a partir de um Produto ' + 
            'da Empresa UseMobi Sistemas LTDA quando você se cadastrar ' + 
            'para criar uma conta em um Produto diferente.'}/>

        <SubTitulo texto={'- Informações relacionadas à localização:'}/>

        <Conteudo texto={'Usamos informações relacionadas à localização, ' + 
            'como sua localização atual, onde você mora, os lugares que ' + 
            'você gosta de frequentar, bem como as empresas e pessoas ' + 
            'das quais você está próximo, a fim de fornecer, personalizar ' + 
            'e aprimorar nossos Produtos, inclusive os anúncios, para ' + 
            'você e outras pessoas. As informações relacionadas à ' + 
            'localização podem ser baseadas em coisas, como a localização ' + 
            'precisa do dispositivo (caso você tenha nos concedido ' + 
            'permissão para coletar esse dado), endereços IP e informações ' + 
            'sobre o uso dos Produtos da Empresa UseMobi Sistemas LTDA ' + 
            'por você e por outras pessoas (como check-ins ou eventos dos ' + 
            'quais você participa).'}/>

        <SubTitulo texto={'- Pesquisa e desenvolvimento de produtos:'}/>
        
        <Conteudo texto={'Usamos as informações que temos para desenvolver, ' + 
            'testar e aprimorar nossos Produtos, inclusive realizando ' + 
            'enquetes e pesquisas, e testando e resolvendo problemas ' + 
            'relativos a novos produtos e recursos.'}/>

        <SubTitulo texto={'- Reconhecimento facial:'}/>

        <Conteudo texto={'Se você tiver esse recurso ativado, nós usamos ' + 
            'a tecnologia de reconhecimento facial para reconhecer você ' + 
            'em fotos, vídeos e experiências da câmera. Os modelos de ' + 
            'reconhecimento facial que criamos podem representar dados ' + 
            'com proteções especiais nos termos da legislação de seu ' + 
            'país. Se introduzirmos a tecnologia de reconhecimento facial ' + 
            'em sua experiência do aplicativo ' + props.nomeAplicativo + ', ' + 
            'nós informaremos você previamente e você terá controle sobre ' + 
            'nosso uso dessa tecnologia para você.'}/>

        <SubTitulo texto={'- Anúncios e outro conteúdo patrocinado:'}/>

        <Conteudo texto={'Usamos as informações que temos sobre você, ' + 
            'inclusive informações sobre seus interesses, ações e ' + 
            'conexões, para selecionar e personalizar anúncios, ofertas ' + 
            'e outros conteúdos patrocinados que exibimos para você.'}/>

        <Titulo css="titulo-termo" texto={'Fornecer mensuração, análises e outros serviços ' + 
            'comerciais'}/>

        <Conteudo texto={'Usamos as informações que temos (inclusive sua ' + 
            'atividade fora de nossos Produtos, como os sites que você ' + 
            'visita e os anúncios que você vê) para ajudar os anunciantes ' + 
            'e outros parceiros a medir a eficácia e a distribuição dos ' + 
            'anúncios e serviços deles, e também para entender os tipos ' + 
            'de pessoas que usam tais serviços e como elas interagem com ' + 
            'os respectivos sites, aplicativos e serviços.'}/>

        <Titulo css="titulo-termo" texto={'Promover segurança e integridade'}/>
        
        <Conteudo texto={'Usamos as informações que temos para verificar ' + 
            'contas e atividades, combater condutas danosas, detectar ' + 
            'e prevenir spam e outras experiências negativas, manter ' + 
            'a integridade de nossos Produtos e promover a segurança ' + 
            'dentro e fora dos Produtos da Empresa UseMobi Sistemas LTDA. ' + 
            'Por exemplo, usamos os dados que temos para investigar ' + 
            'atividades suspeitas ou violações de nossos termos ou ' + 
            'políticas, ou para detectar quando alguém precisa de ajuda.'}/>

        <Titulo css="titulo-termo" texto={'Comunicar com você'}/>

        <Conteudo texto={'Usamos as informações que temos para enviar a ' + 
            'você comunicações de marketing, para nos comunicarmos com ' + 
            'você sobre nossos Produtos e para informar você sobre nossas ' + 
            'políticas e termos. Também usamos suas informações para ' + 
            'responder quando você entra em contato conosco.'}/>

        <Titulo css="titulo-termo" texto={'III. Como essas informações são compartilhadas?'}/>

        <Conteudo texto={'Suas informações são compartilhadas com outras ' + 
            'pessoas das seguintes maneiras:'}/>

        <Titulo css="titulo-termo" texto={'Compartilhamento nos Produtos da Empresa UseMobi ' + 
            'Sistemas LTDA'}/>

        <SubTitulo texto={'- Pessoas e contas com quem você compartilha e ' + 
            'se comunica'}/>

        <Conteudo texto={'Quando você compartilha e se comunica usando ' + 
            'nossos Produtos, você escolhe o público para aquilo que ' + 
            'compartilha. Por exemplo, quando você publica em algum ' + 
            'produto da Empresa UseMobi Sistemas LTDA, seleciona o ' + 
            'público que verá a publicação, como um grupo, todos os seus ' + 
            'contatos, o público ou uma lista personalizada de pessoas. ' + 
            'Sua rede também pode ver as ações que você realizou em nossos ' + 
            'Produtos, incluindo o envolvimento com anúncios e conteúdo ' + 
            'patrocinado. Também permitimos que outras contas vejam quem ' + 
            'vizualizou uma informação em algum produto da Empresa UseMobi ' + 
            'Sistemas LTDA.'}/>

        <Conteudo texto={'Informações públicas podem ser vistas por ' + 
            'qualquer pessoa, dentro e fora de nossos Produtos, inclusive ' + 
            'se essa pessoa não tiver uma conta. Isso inclui seu nome de ' + 
            'usuário do aplicativo ' + props.nomeAplicativo + '; qualquer ' + 
            'informação que você compartilha publicamente; informações de ' + 
            'seu perfil público em um dos produtos da Empresa UseMobi ' + 
            'Sistemas LTDA; e o conteúdo que você compartilha em uma ' + 
            'Página que pertence a Empresa UseMobi Sistemas LTDA, conta ' + 
            'pública de algum produto da Empresa UseMobi Sistemas LTDA ' + 
            'ou qualquer outro fórum público, como o Marketplace da ' + 
            'Empresa UseMobi Sistemas LTDA. Você e nós podemos fornecer ' + 
            'acesso ou enviar informações públicas para qualquer pessoa ' + 
            'dentro e fora de nossos Produtos, inclusive em outros ' + 
            'Produtos da Empresa UseMobi Sistemas LTDA, em resultados ' + 
            'de pesquisas ou por meio de ferramentas e APIs. É possível ' + 
            'também visualizar, acessar, compartilhar novamente ou baixar ' + 
            'informações públicas por meio de serviços de terceiros, ' + 
            'como mecanismos de pesquisa, APIs e mídia offline como a TV, ' + 
            'e por meio de aplicativos, sites e outros serviços que se ' + 
            'integram a nossos Produtos.'}/>

        <SubTitulo texto={'- Conteúdo que outras pessoas compartilham ' + 
            'ou compartilham novamente sobre você'}/>

        <Conteudo texto={'Você deve ponderar com quem escolhe compartilhar, ' + 
            'porque as pessoas que podem visualizar suas atividades em ' + 
            'nossos Produtos podem decidir compartilhá-las com terceiros ' + 
            'dentro e fora de nossos Produtos, inclusive com pessoas e ' + 
            'empresas fora do público com o qual você compartilhou. Por ' + 
            'exemplo, quando você compartilha uma publicação ou envia ' + 
            'uma mensagem para amigos ou contas específicas, eles podem ' + 
            'baixar, fazer uma captura de tela ou compartilhar novamente ' + 
            'tal conteúdo com terceiros dentro ou fora de nossos Produtos, ' + 
            'pessoalmente ou em experiências de realidade virtual. Além ' + 
            'disso, quando você comenta a publicação ou reage ao conteúdo ' + 
            'de alguém, seu comentário ou reação fica visível para qualquer ' + 
            'um que possa ver o conteúdo dessa pessoa, e ela pode alterar ' + 
            'o público posteriormente.'}/>

        <Conteudo texto={'As pessoas também podem usar nossos Produtos ' + 
            'para criar e compartilhar conteúdo sobre você com o público ' + 
            'que escolherem. Por exemplo, as pessoas podem compartilhar ' + 
            'uma foto sua em uma história, mencionar ou marcar você em ' + 
            'uma localização em uma publicação, ou compartilhar ' + 
            'informações sobre você nas publicações ou mensagens delas. ' + 
            'Caso você se sinta desconfortável com o que as outras ' + 
            'pessoas compartilharam sobre você em nossos Produtos, ' + 
            'saiba como denunciar o conteúdo.'}/>

        <SubTitulo texto={'- Informações sobre seu status ativo ou ' + 
            'presença em nossos Produtos'}/>

        <Conteudo texto={'As pessoas em suas redes podem ver sinais ' + 
            'informando se você está ativo em nossos Produtos, inclusive ' + 
            'se você está ativo no momento no aplicativo ' 
            + props.nomeAplicativo + ', ou outro produto da Empresa ' + 
            'UseMobi Sistemas LTDA, ou quando você usou pela última ' + 
            'vez nossos Produtos.'}/>

        <SubTitulo texto={'- Novo proprietário'}/>

        <Conteudo texto={'Se a propriedade ou o controle total ou parcial ' + 
            'de nossos Produtos ou respectivos ativos mudar, poderemos ' + 
            'transferir suas informações para o novo proprietário.'}/>

        <Titulo css="titulo-termo" texto={'Compartilhamento com Parceiros externos'}/>

        <Conteudo texto={'Trabalhamos com parceiros externos que nos ' + 
            'ajudam a fornecer e a aprimorar nossos Produtos ou que ' + 
            'usam as Ferramentas da Empresa UseMobi Sistemas LTDA para ' + 
            'ampliar os negócios, o que possibilita a operação de nossas ' + 
            'empresas e o fornecimento de serviços gratuitos para pessoas ' + 
            'do mundo inteiro. Não vendemos nenhuma de suas informações ' + 
            'para ninguém e jamais o faremos. Também impomos fortes ' + 
            'restrições sobre como nossos parceiros podem usar e divulgar ' + 
            'os dados que fornecemos. Aqui estão os tipos de terceiros ' + 
            'com os quais compartilhamos informações:'}/>

        <SubTitulo texto={'- Parceiros que usam nossos serviços de análise'}/>

        <Conteudo texto={'Fornecemos estatísticas agregadas e insights ' + 
            'que ajudam pessoas e empresas a entender como os usuários ' + 
            'estão se envolvendo com as publicações, classificados, ' + 
            'Páginas, vídeos, produtos, prestações de serviços e outros ' + 
            'conteúdos delas dentro e fora dos Produtos da Empresa ' + 
            'UseMobi Sistemas LTDA. Por exemplo, administradores de ' + 
            'Página e perfis comerciais do aplicativo ' 
            + props.nomeAplicativo + ' recebem informações sobre o número ' + 
            'de pessoas ou contas que visualizaram, reagiram ou comentaram ' + 
            'nas publicações deles, bem como dados demográficos agregados ' + 
            'e outras informações que os ajudam a entender as interações ' + 
            'com a respectiva Página ou conta.'}/>

        <SubTitulo texto={'- Anunciantes'}/>

        <Conteudo texto={'Fornecemos aos anunciantes relatórios sobre ' + 
            'os tipos de pessoas que visualizaram os anúncios deles e ' + 
            'sobre o desempenho de tais anúncios, mas não compartilhamos ' + 
            'informações que identifiquem você pessoalmente (informações ' + 
            'como seu nome ou endereço de email que possa ser usado ' + 
            'por si só para contatar ou identificar você), a menos que ' + 
            'você nos dê permissão para tanto. Por exemplo, fornecemos ' + 
            'dados demográficos gerais e informações sobre interesses ' + 
            'aos anunciantes (como a informação de que um anúncio foi ' + 
            'visto por uma mulher com idade entre 25 e 34 anos que mora ' + 
            'em Goiânia e gosta de engenharia de software) para ajudá-los ' + 
            'a entender melhor o público deles. Também confirmamos quais ' + 
            'anúncios da Empresa UseMobi Sistemas LTDA ' + 
            'levaram você a fazer uma compra ou ' + 
            'executar uma ação com um anunciante.'}/>

        <SubTitulo texto={'- Parceiros de mensuração'}/>

        <Conteudo texto={'Compartilhamos informações sobre você com ' + 
            'empresas que as agregam para fornecer análises e relatórios ' + 
            'de mensuração a nossos parceiros.'}/>

        <SubTitulo texto={'- Parceiros que oferecem bens e serviços em nossos Produtos'}/>

        <Conteudo texto={'Quando você se inscreve para receber conteúdo ' + 
            'premium, ou quando compra algo de um vendedor em nossos ' + 
            'Produtos, o criador do conteúdo ou vendedor pode receber ' + 
            'suas informações públicas e outras informações que você ' + 
            'compartilhar com ele, bem como informações necessárias para ' + 
            'concluir a transação, como detalhes de envio e contato.'}/>

        <SubTitulo texto={'- Fornecedores e provedores de serviços'}/>

        <Conteudo texto={'Fornecemos informações e conteúdo para ' + 
            'fornecedores e provedores de serviços que viabilizam a operação ' + 
            'de nosso negócio, seja fornecendo serviços de infraestrutura ' + 
            'técnica, analisando como nossos Produtos são usados, oferecendo ' + 
            'atendimento ao cliente, facilitando pagamentos ou realizando ' + 
            'pesquisas.'}/>

        <SubTitulo texto={'- Pesquisadores e acadêmicos'}/>

        <Conteudo texto={'Também fornecemos informações e conteúdo a ' + 
            'parceiros de pesquisa e acadêmicos para a realização de ' + 
            'pesquisas que promovam conhecimento e inovação viabilizadores ' + 
            'de nosso negócio ou missão e que intensifiquem a descoberta e ' + 
            'a inovação acerca de tópicos de bem-estar social geral, avanço ' + 
            'tecnológico, interesse público, saúde e bem-estar.'}/>

        <SubTitulo texto={'- Aplicação da lei ou solicitações legais'}/>

        <Conteudo texto={'Compartilhamos informações com autoridades ' + 
            'responsáveis pela aplicação da lei ou em resposta a ' + 
            'solicitações legais nas circunstâncias descritas abaixo. ' + 
            'Saiba mais sobre como controlar as informações pessoais que ' + 
            'você ou outras pessoas compartilham com parceiros externos ' + 
            'nas Configurações do aplicativo ' + props.nomeAplicativo + '.'}/>

        <Titulo css="titulo-termo" texto={'IV. Como faço para controlar ou excluir ' + 
            'informações sobre mim?'}/>

        <Conteudo texto={'Concedemos a você a capacidade de acessar, ' + 
            'retificar, portar e apagar seus dados.'}/>

        <Conteudo texto={'Armazenamos dados até que eles não sejam mais ' + 
            'necessários para fornecermos nossos serviços e Produtos ' + 
            'da Empresa UseMobi Sistemas LTDA, ou até que sua conta seja ' + 
            'excluída — o que ocorrer primeiro. Esta é uma determinação ' + 
            'que varia de acordo com cada caso e depende de fatores como ' + 
            'a natureza dos dados, o motivo pelo qual são coletados e ' + 
            'processados, e necessidades de retenção operacional ou legal ' + 
            'relevantes. Por exemplo, quando você pesquisa algo no ' + 
            'aplicativo ' + props.nomeAplicativo + ', pode acessar e ' + 
            'excluir essa consulta do seu histórico de pesquisa a qualquer ' + 
            'momento, mas o registro dessa pesquisa será excluído após ' + 
            'seis meses. Se você nos enviar uma cópia de seu documento ' + 
            'de identificação emitido pelo governo para fins de verificação ' + 
            'da conta, excluiremos essa cópia 30 dias após a análise, a ' + 
            'menos que haja estipulação em contrário. Saiba mais sobre a ' + 
            'exclusão do conteúdo compartilhado por você e de dados de ' + 
            'cookies obtidos por meio de plugins sociais.'}/>

        <Conteudo texto={'Quando você exclui sua conta, nós excluímos ' + 
            'o conteúdo que você publicou, como fotos e atualizações ' + 
            'de status, e não será possível recuperar essas informações. ' + 
            'As informações que outras pessoas compartilharam sobre você ' + 
            'não fazem parte de sua conta e não serão excluídas. Caso ' + 
            'você não deseje excluir sua conta, mas queira parar de usar ' + 
            'os Produtos temporariamente, é possível desativar a conta. ' + 
            'Para excluir sua conta a qualquer momento, acesse as ' + 
            'Configurações do aplicativo ' + props.nomeAplicativo + '.'}/>

        <Titulo css="titulo-termo" texto={'V. Como respondemos a requisições legais ou ' + 
            'prevenimos danos?'}/>

        <Conteudo texto={'Acessamos, preservamos e compartilhamos suas ' + 
            'informações com reguladores, autoridades ou outros:'}/>

        <Conteudo texto={'- Em resposta a uma requisição legal (como um ' + 
            'mandado de busca, uma ordem judicial ou intimação) se nós ' + 
            'acreditarmos de boa-fé que a lei exige que assim façamos. ' + 
            'Isso pode incluir a resposta a solicitações legais de ' + 
            'jurisdições fora do Brasil quando acreditarmos de boa-fé que ' + 
            'a resposta é exigida por lei na jurisdição em questão, afeta ' + 
            'usuários na jurisdição em questão e é consistente com ' + 
            'padrões reconhecidos internacionalmente.'}/>

        <Conteudo texto={'- Quando acreditamos de boa-fé que elas são ' + 
            'necessárias para: detectar, prevenir e resolver questões ' + 
            'de fraude, uso não autorizado dos Produtos, violações de ' + 
            'nossos termos ou políticas ou outra atividade ilegal ou ' + 
            'prejudicial; para nos proteger (e proteger nossos direitos, ' + 
            'propriedades ou Produtos), a você ou a outras pessoas, ' + 
            'inclusive como parte de investigações ou inquéritos ' + 
            'regulatórios, ou para evitar morte ou danos corporais ' + 
            'iminentes. Por exemplo, se relevante, fornecemos e recebemos ' + 
            'informações de parceiros externos sobre a confiabilidade de ' + 
            'sua conta, a fim de prevenir fraude, abuso ou outra ' + 
            'atividade nociva dentro e fora de nossos Produtos.'}/>

        <Conteudo texto={'As informações que recebemos sobre você ' + 
            '(incluindo dados de transações financeiras relacionadas a ' + 
            'compras feitas em produtos da Empresa UseMobi Sistemas ' + 
            'LTDA) podem ser acessadas e preservadas por um período maior ' + 
            'quando forem objeto de uma requisição ou obrigação legal, ' + 
            'investigação governamental, investigações de possíveis ' + 
            'violações de nossos termos ou políticas, ou para de outra ' + 
            'forma impedir danos. Também retemos informações de contas ' + 
            'desativadas por violação de nossos termos por, no mínimo, ' + 
            'um ano, a fim de prevenir repetição de abuso ou outras ' + 
            'violações dos termos.'}/>

        <Titulo css="titulo-termo" texto={'VI. Como operamos e transferimos dados como ' + 
            'parte de nossos serviços globais?'}/>

        <Conteudo texto={'Compartilhamos informações globalmente, tanto ' + 
            'internamente na Empresa UseMobi Sistemas LTDA, quanto ' + 
            'externamente com nossos parceiros e com aqueles com quem ' + 
            'você se conecta e compartilha no mundo todo em conformidade ' + 
            'com esta política. Suas informações podem, por exemplo, ' + 
            'ser transferidas ou transmitidas para, ou armazenadas e ' + 
            'processadas no Brasil ou outros países fora de onde você ' + 
            'mora, para os fins descritos nesta política. Essas ' + 
            'transferências de dados são necessárias para fornecer os ' + 
            'serviços estipulados nos Termos da Empresa UseMobi Sistemas ' + 
            'LTDA e nos Termos do aplicativo ' + props.nomeAplicativo + 
            ', bem como para operar globalmente e fornecer nossos Produtos ' + 
            'a você. Utilizamos cláusulas contratuais padrão, seguimos as ' + 
            'decisões de adequação da Comissão Europeia em relação a ' + 
            'determinados países, conforme aplicável, e obtemos seu ' + 
            'consentimento para essas transferências de dados para o Brasil ' + 
            'e outros países.'}/>

        <Titulo css="titulo-termo" texto={'VII. Como notificaremos você sobre mudanças ' + 
            'nesta política?'}/>

        <Conteudo texto={'Notificaremos você antes de fazer alterações ' + 
            'nesta política e daremos a você a oportunidade de analisar ' + 
            'a política revisada antes de decidir continuar usando nossos ' + 
            'Produtos.'}/>

        <Titulo css="titulo-termo" texto={'VIII. Como entrar em contato com a Empresa ' + 
            'UseMobi Sistemas LTDA em caso de dúvidas'}/>

        <Conteudo texto={'Saiba mais sobre como a privacidade funciona ' + 
            'no aplicativo ' + props.nomeAplicativo + '. Se tiver dúvidas ' + 
            'sobre esta política, você pode nos contatar conforme ' + 
            'descrito abaixo.'}/>

        <Conteudo texto={'Você pode entrar em contato conosco pelo email ' + 
            'suporte@usemobi.com.br.'}/>

        <Titulo css="titulo-termo" texto={'Dados de Crianças e Adolescentes'}/>
        
        <Conteudo texto={'O aplicativo ' + props.nomeAplicativo + ' não ' + 
            'coleta ou armazena intencionalmente dados ou informações ' + 
            'pessoais de crianças ou adolescentes menores de 18 (dezoito) ' + 
            'anos. Mediante notificação ou descoberta, a Empresa UseMobi ' + 
            'Sistemas LTDA empreenderá todos os esforços razoáveis para ' + 
            'apagar ou destruir qualquer informação pessoal que possa ter ' + 
            'sido coletada ou armazenada sem nosso conhecimento ou ' + 
            'consentimento.'}/>

        <Titulo css="titulo-termo" texto={'Aviso de privacidade do Brasil'}/>

        <Conteudo texto={'Esta seção se aplica a atividades de tratamento ' + 
            'de dados pessoais de acordo com as leis brasileiras e ' + 
            'complementa esta Política de Dados.'}/>

        <Conteudo texto={'De acordo com a Lei Geral de Proteção de Dados ' + 
            'Pessoais do Brasil ("LGPD"), você tem o direito de acessar, ' + 
            'retificar, solicitar a portabilidade de seus dados e apagar ' + 
            'seus dados, além de autorizar o tratamento desses dados por ' + 
            'nós. Saiba mais sobre seus direitos e veja como você pode ' + 
            'exercê-los nas configurações do aplicativo ' + 
            props.nomeAplicativo + '. Em determinadas circunstâncias, ' + 
            'você também tem o direito de contestar e restringir o ' + 
            'tratamento de seus dados pessoais ou de revogar seu ' + 
            'consentimento quando tratamos dados fornecidos por você com ' + 
            'base nesse consentimento. Esta Política de Dados fornece ' + 
            'informações sobre como compartilhamos dados com terceiros.'}/>

        <Conteudo texto={'O controlador de dados responsável por suas ' + 
            'informações é a Empresa UseMobi Sistemas LTDA. Entre em ' + 
            'contato com o encarregado de Proteção de Dados da Empresa ' + 
            'UseMobi Sistemas LTDA. Você também tem o direito de ' + 
            'peticionar em relação aos seus dados perante a Autoridade ' + 
            'Nacional de Proteção de Dados ("ANPD"). Para isso, entre ' + 
            'em contato diretamente com a ANPD.'}/>

        <Conteudo texto={'Esta seção passará a valer a partir da data ' + 
            'em que a LGPD entrar em vigor.'}/>

        <Titulo css="titulo-termo" texto={'EU AUTORIZO'} />

        <Conteudo texto={'EU AUTORIZO O CONTROLADOR DE DADOS RESPONSÁVEL ' + 
            'POR MINHAS INFORMAÇÕES NA EMPRESA UseMobi Sistemas LTDA A ' + 
            'MANTER OS DADOS PESSOAIS E SENSIVEIS DISPONIVEIS E VISIVEIS ' + 
            'A OUTROS USUÁRIOS, FORNECEDORES OU PRESTADORES DE SERVIÇOS ' + 
            'QUE SE RELACIONAM COM A EMPRESA UseMobi Sistemas LTDA.'}/>

        <Titulo css="titulo-termo" texto={'ATUALIZAÇÃO'} />

        <Conteudo texto={'Última revisão: 23 de Julho de 2021.'}/>
        
        <Conteudo texto={'.'}/>
        <Conteudo texto={'.'}/>

    </div>
)