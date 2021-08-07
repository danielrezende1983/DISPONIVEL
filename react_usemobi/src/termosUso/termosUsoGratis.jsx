import React from 'react'

import Titulo from '../common/widget/titulo'
import Conteudo from '../common/widget/conteudo'
import SubTitulo from '../common/widget/subTitulo'

export default props => (
    <div>
        
        <Titulo css="titulo-termo" texto={'Bem-vindo(a) ao ' + props.nomeAplicativo + '!'} />

        <Conteudo texto={'Estes Termos de Uso governam seu uso do ' + props.nomeAplicativo + ', exceto quando ' 
            + 'afirmamos explicitamente que outros termos (e não estes) se aplicam, e fornecem informações sobre ' 
            + 'o Serviço do ' + props.nomeAplicativo + ', descritas abaixo. Quando você cria uma conta do ' + props.nomeAplicativo + ' ou ' 
            + 'usa o ' + props.nomeAplicativo + ', concorda com estes termos.'}/>

        <Conteudo texto={'O Serviço ' + props.nomeAplicativo + ' é um dos Produtos da empresa UseMobi Sistemas LTDA, ' 
            + 'fornecido a você pelo UseMobi Sistemas LTDA. Estes Termos de Uso, por conseguinte, constituem ' 
            + 'um acordo entre você e a empresa UseMobi Sistemas LTDA.'}/>

        <Titulo css="titulo-termo" texto={'O Serviço do aplicativo ' + props.nomeAplicativo} />

        <Conteudo texto={'Concordamos em fornecer a você o Serviço do aplicativo ' 
            + props.nomeAplicativo + '. O Serviço inclui todos os produtos, ' 
            + 'recursos, aplicativos, serviços, tecnologias e software do aplicativo ' 
            + props.nomeAplicativo + ' que fornecemos para promover a missão do aplicativo ' 
            + props.nomeAplicativo + ': fortalecer o relacionamento entre o ' 
            + 'anfitrião e seus convidados. O Serviço é composto pelos seguintes ' 
            + 'aspectos:'}/>

        <SubTitulo texto={'- Oferecer oportunidades personalizadas de criar, conectar, comunicar e encontrar.'} />

        <Conteudo texto={'As pessoas são diferentes. Queremos fortalecer seus ' 
            + 'relacionamentos por meio de experiências compartilhadas realmente ' 
            + 'importantes para você. Por isso, desenvolvemos sistemas que ' 
            + 'tentam entender com quem e com o que você e as outras pessoas ' 
            + 'se importam, e usamos essas informações para ajudá-lo a criar, ' 
            + 'encontrar, compartilhar e participar de experiências importantes ' 
            + 'para você.'}/>

        <SubTitulo texto={'- Promover um ambiente seguro, inclusivo e positivo.'} />

        <Conteudo texto={'Desenvolvemos e usamos ferramentas e oferecemos para ' 
            + 'os membros de nossa comunidade recursos que contribuem para ' 
            + 'tornar as experiências deles positivas e inclusivas, inclusive ' 
            + 'quando achamos que eles podem precisar de ajuda. Também temos ' 
            + 'equipes e sistemas que trabalham para combater abusos e violações ' 
            + 'de nossos Termos e Políticas, bem como condutas enganosas e ' 
            + 'prejudiciais. Usamos todas as informações que temos, inclusive ' 
            + 'suas informações, para tentar manter nossa plataforma segura. ' 
            + 'Também podemos compartilhar informações sobre uso inadequado ou ' 
            + 'conteúdo prejudicial com outros aplicativos da Empresa UseMobi Sistemas LTDA ' 
            + 'ou autoridades responsáveis pela aplicação da lei. Saiba mais ' 
            + 'na Política de Dados.'}/>

        <SubTitulo texto={'- Fornecer experiências consistentes e contínuas em outros Produtos da Empresa UseMobi Sistemas LTDA.'} />

        <Conteudo texto={'O aplicativo ' + props.nomeAplicativo + ' faz parte da ' 
            + 'Empresa UseMobi Sistemas LTDA, compartilhando com elas tecnologia, ' 
            + 'sistemas e informações, inclusive as informações que temos sobre ' 
            + 'você (saiba mais na Política de Dados), para fornecer serviços ' 
            + 'que sejam melhores e mais seguros. Também fornecemos meios de ' 
            + 'interagir nos Produtos da Empresa UseMobi Sistemas LTDA que você ' 
            + 'usa, além de sistemas projetados para alcançar uma experiência ' 
            + 'consistente e contínua entre todos esses Produtos.'}/>        

        <SubTitulo texto={'- Garantir acesso ao nosso Serviço.'} />

        <Conteudo texto={'Para operar nosso Serviço Global, precisamos armazenar ' 
            + 'e transferir dados entre nossos sistemas ao redor do mundo, ' 
            + 'inclusive fora de seu país de residência. O uso dessa ' 
            + 'infraestrutura global é necessário e essencial para fornecer ' 
            + 'nosso Serviço. Essa infraestrutura pode pertencer ou ser ' 
            + 'operada pela Empresa UseMobi Sistemas LTDA ou pertencer a outras empresas.'}/>

        <SubTitulo texto={'- Conectar você com marcas, produtos e serviços de maneiras importantes para você.'} />

        <Conteudo texto={'Usamos dados do aplicativo ' + props.nomeAplicativo + ' e de ' 
            + 'outros Produtos da Empresa UseMobi Sistemas LTDA, bem como de ' 
            + 'parceiros, para exibir a você anúncios, ofertas e outros conteúdos ' 
            + 'patrocinados que acreditamos ser significativos para você. E ' 
            + 'tentamos fazer com que esse conteúdo seja tão relevante quanto ' 
            + 'todas as suas outras experiências no aplicativo ' + props.nomeAplicativo + '.'}/>

        <SubTitulo texto={'- Pesquisa e inovação.'} />

        <Conteudo texto={'Usamos as informações que temos para estudar nosso ' 
            + 'serviço, e colaborar com terceiros, em pesquisas para tornar ' 
            + 'nosso serviço melhor e contribuir para o bem-estar de nossa ' 
            + 'comunidade.'}/>

        <Titulo css="titulo-termo" texto={'Como nosso Serviço é financiado'} />

        <Conteudo texto={'Em vez de pagar pelo uso do aplicativo ' + props.nomeAplicativo 
            + ', usando o serviço previsto nestes Termos, você reconhece que ' 
            + 'podemos lhe mostrar anúncios que empresas e organizações nos ' 
            + 'pagam para promover dentro e fora dos Produtos da Empresa ' 
            + 'UseMobi Sistemas LTDA. Usamos seus dados pessoais, como ' 
            + 'informações sobre suas atividades e interesses, para lhe mostrar ' 
            + 'anúncios mais relevantes.'}/>

        <Conteudo texto={'Mostramos anúncios úteis e relevantes sem que os ' 
            + 'anunciantes saibam quem você é. Não vendemos seus dados pessoais. ' 
            + 'Permitimos que os anunciantes nos informem, por exemplo, sua ' 
            + 'meta de negócios e o tipo de público que desejam alcançar com o ' 
            + 'anúncio. Então, mostramos o anúncio para pessoas que podem estar ' 
            + 'interessadas.'}/>

        <Conteudo texto={'Também oferecemos aos anunciantes relatórios sobre o ' 
            + 'desempenho dos anúncios para ajudá-los a entender como as ' 
            + 'pessoas estão interagindo com o conteúdo dentro e fora ' 
            + 'do aplicativo ' + props.nomeAplicativo + '. Por exemplo, fornecemos dados ' 
            + 'demográficos e informações de interesse gerais aos anunciantes ' 
            + 'para ajudá-los a entender melhor o público deles. Não ' 
            + 'compartilhamos informações que identifiquem você diretamente ' 
            + '(como seu nome ou endereço de email, que alguém poderia usar ' 
            + 'para entrar em contato com você ou identificar quem você é), a ' 
            + 'menos que você nos dê permissão.'}/>

        <Conteudo texto={'É possível que você veja conteúdo de marca ' 
            + 'no aplicativo ' + props.nomeAplicativo + ' publicado por ' 
            + 'proprietários de contas que promovem produtos ou serviços ' 
            + 'baseados em um relacionamento comercial com o parceiro de ' 
            + 'negócios mencionado em tal conteúdo.'}/>

        <Titulo css="titulo-termo" texto={'A Política de Dados'} />

        <Conteudo texto={'Fornecer nosso serviço exige a coleta e o uso de suas ' 
            + 'informações. A Política de Dados explica como coletamos, ' 
            + 'usamos e compartilhamos informações nos produtos da empresa ' 
            + 'UseMobi Sistemas LTDA. Ela também explica as muitas formas ' 
            + 'pelas quais você pode controlar suas informações, inclusive ' 
            + 'nas Configurações de Privacidade e Segurança do aplicativo ' 
            + props.nomeAplicativo + '. Você deve concordar com a Política de ' 
            + 'Dados para usar o aplicativo ' + props.nomeAplicativo + '.'}/>

        <Titulo css="titulo-termo" texto={'Seus compromissos'} />

        <Conteudo texto={'Em troca de nosso compromisso em fornecer o serviço, ' 
            + 'exigimos que você se comprometa com o exposto a seguir.'}/>

        <SubTitulo texto={'Quem pode usar o aplicativo ' + props.nomeAplicativo} />

        <Conteudo texto={'Queremos que nosso serviço seja o mais aberto e ' 
            + 'inclusivo possível, mas também desejamos que ele seja seguro ' 
            + 'e esteja em conformidade com a lei. Por isso, precisamos que ' 
            + 'você se comprometa em relação a algumas restrições para fazer ' 
            + 'parte da comunidade do aplicativo ' + props.nomeAplicativo + '.'}/>

        <Conteudo texto={'- Você deve ter pelo menos 18 anos ou a idade ' 
            + 'mínima legal em seu país para usar o aplicativo ' 
            + props.nomeAplicativo + '.'}/>

        <Conteudo texto={'- Você não pode estar proibido de receber qualquer ' 
            + 'aspecto do nosso serviço nos termos da legislação aplicável ou ' 
            + 'se envolver em pagamentos relativos ao serviço caso tenha seu ' 
            + 'nome em uma lista de terceiros não autorizados a tanto.'}/>

        <Conteudo texto={'- Sua conta não pode ter sido desativada por nós ' 
            + 'por violação da lei ou de qualquer uma das nossas políticas.'}/>

        <Conteudo texto={'- Você não pode ter sido condenado por crime sexual.'}/>

        <SubTitulo texto={'Como você não pode usar o aplicativo ' + props.nomeAplicativo} />

        <Conteudo texto={'Fornecer um Serviço aberto e seguro para uma ' 
            + 'comunidade ampla exige que todos nós façamos nossa parte.'}/>

        <Conteudo texto={'- Você não pode se passar por outras pessoas ou ' 
            + 'fornecer informações imprecisas. Você precisa revelar ' 
            + 'sua identidade no aplicativo ' + props.nomeAplicativo + ', e ' 
            + 'deve nos fornecer informações atualizadas e precisas (inclusive ' 
            + 'informações de registro), que podem incluir dados pessoais. ' 
            + 'Além disso, você não deve se passar por alguém ou algo que ' 
            + 'você não seja, e você não pode criar uma conta para outra ' 
            + 'pessoa, a menos que tenha a permissão expressa dela.'}/>

        <Conteudo texto={'- Você não pode fazer algo ilícito, enganoso, ' 
            + 'fraudulento ou com finalidade ilegal ou não autorizada.'}/>

        <Conteudo texto={'- Você não pode violar (ou ajudar ou incentivar ' 
            + 'outras pessoas a violar) estes Termos ou nossas políticas, ' 
            + 'inclusive, em especial, as Diretrizes da Comunidade do ' 
            + 'aplicativo ' + props.nomeAplicativo + '. Se você publicar ' 
            + 'conteúdo de marca, deverá cumprir nossas Políticas de ' 
            + 'Conteúdo de Marca, que exigem o uso da nossa ferramenta ' 
            + 'para conteúdo de marca. Saiba como denunciar condutas ' 
            + 'ou conteúdo em nossa Central de Ajuda.'}/>

        <Conteudo texto={'- Você não pode fazer algo que interfira ou ' 
            + 'afete a operação pretendida do Serviço. Isso inclui usar ' 
            + 'indevidamente qualquer canal de denúncia, contestação ou ' 
            + 'recurso. Por exemplo, fazer denúncias ou recursos ' 
            + 'fraudulentos ou sem fundamentos.'}/>

        <Conteudo texto={'- Você não pode fazer algo que interfira ou afete ' 
            + 'a operação pretendida do Serviço. Isso inclui criar contas ' 
            + 'ou coletar informações de modo automatizado sem nossa ' 
            + 'permissão expressa.'}/>
        
        <Conteudo texto={'- Você não pode vender, licenciar ou comprar ' 
            + 'nenhuma conta ou dado obtido de nós ou de nosso Serviço. ' 
            + 'Isso inclui tentativas de comprar, vender ou transferir ' 
            + 'qualquer elemento de sua conta (incluindo seu nome de ' 
            + 'usuário), solicitar, coletar ou usar credenciais de login ' 
            + 'ou selos de outros usuários, solicitar ou coletar nomes ' 
            + 'de usuário e senhas do aplicativo ' + props.nomeAplicativo 
            + ' ou apropriar-se indevidamente de tokens de acesso.'}/>

        <Conteudo texto={'- Você não pode publicar informações privadas ' 
            + 'ou confidenciais de outra pessoa sem permissão ou fazer ' 
            + 'qualquer coisa que viole os direitos de outra pessoa, ' 
            + 'incluindo os direitos de propriedade intelectual ' 
            + '(por exemplo, violação de direitos autorais, violação ' 
            + 'de marca comercial, falsificação ou bens pirateados). ' 
            + 'Você pode usar o conteúdo criado por outra pessoa de ' 
            + 'acordo com as exceções e as limitações de direitos ' 
            + 'autorais e de direitos relacionados nos termos da lei ' 
            + 'aplicável. Você declara que possui ou que obteve todos ' 
            + 'os direitos necessários referentes ao conteúdo que publica ' 
            + 'ou compartilha.'}/>

        <Conteudo texto={'- Você não pode modificar, traduzir, criar ' 
            + 'trabalhos derivados nem aplicar engenharia reversa em ' 
            + 'nossos produtos ou seus componentes.'}/>

        <SubTitulo texto={'Permissões que você nos concede'} />

        <Conteudo texto={'Como parte de nosso acordo, você também nos concede ' 
            + 'permissões necessárias para fornecermos o Serviço.'}/>

        <Conteudo texto={'- Não reivindicamos a propriedade do seu conteúdo, ' 
            + 'mas você nos concede uma licença para usá-lo. Nada muda com ' 
            + 'relação aos seus direitos sobre seu conteúdo. Não reivindicamos ' 
            + 'a propriedade do seu conteúdo que você publica no Serviço ou ' 
            + 'por meio dele. Além disso, você tem liberdade para compartilhar ' 
            + 'seu conteúdo com qualquer outra pessoa, onde quiser. Contudo, ' 
            + 'requeremos que você nos conceda determinadas permissões legais ' 
            + '(conhecidas como "licença") para fornecermos o Serviço. Quando ' 
            + 'compartilha, publica ou carrega conteúdo protegido por direitos ' 
            + 'de propriedade intelectual (como fotos ou vídeos) em nosso ' 
            + 'Serviço ou em conexão com ele, você nos concede uma licença ' 
            + 'não exclusiva, gratuita, transferível, sublicenciável e válida ' 
            + 'mundialmente para hospedar, usar, distribuir, modificar, ' 
            + 'veicular, copiar, exibir ou executar publicamente, traduzir ' 
            + 'e criar trabalhos derivados de seu conteúdo (de modo ' 
            + 'consistente com suas configurações de privacidade e do ' 
            + 'aplicativo). Esta licença se encerrará quando seu conteúdo ' 
            + 'for excluído de nossos sistemas. Você pode excluir o conteúdo ' 
            + 'individualmente ou todo o conteúdo de uma vez excluindo sua ' 
            + 'conta. Para saber mais sobre como usamos as informações e ' 
            + 'sobre como controlar ou excluir seu conteúdo, acesse a ' 
            + 'Política de Dados e visite a Central de Ajuda do aplicativo ' 
            + props.nomeAplicativo + '.'}/>

        <Conteudo texto={'- Permissão para usar seu nome de usuário, foto do ' 
            + 'perfil e informações sobre seus relacionamentos e ações com ' 
            + 'contas, anúncios e conteúdo patrocinado. Você nos concede ' 
            + 'permissão para mostrar seu nome de usuário, foto do perfil e ' 
            + 'informações sobre suas ações ou relacionamentos ao lado de ou ' 
            + 'relacionados a contas, anúncios, ofertas e outro conteúdo ' 
            + 'patrocinado que você segue ou com o qual interage, que sejam ' 
            + 'exibidos nos Produtos da Empresa UseMobi Sistemas LTDA, sem o ' 
            + 'pagamento de qualquer remuneração a você. Por exemplo, podemos ' 
            + 'mostrar que você utilizou um produto ou serviço de uma ' 
            + 'publicação patrocinada criada por uma marca que nos pagou para ' 
            + 'exibir os anúncios dela no aplicativo ' + props.nomeAplicativo 
            + '. Da mesma forma que executar ações em outros conteúdos e ' 
            + 'vincular outras contas, executar ações em conteúdo patrocinado ' 
            + 'e vincular contas patrocinadas são atos que podem ser vistos ' 
            + 'somente por pessoas com permissão para ver ou se vinculcar tal ' 
            + 'usuário ou conteúdo. Também respeitaremos suas configurações de ' 
            + 'anúncios. Saiba mais sobre as configurações de anúncios.'}/>

        <Conteudo texto={'- Você concorda que podemos baixar e instalar ' 
            + 'atualizações do Serviço em seu dispositivo.'}/>

        <Titulo css="titulo-termo" texto={'Direitos adicionais que nós mantemos'} />

        <Conteudo texto={'- Se você selecionar um nome de usuário ou ' 
            + 'identificador semelhante para sua conta, nós podemos ' 
            + 'alterá-lo se acreditarmos ser adequado ou necessário (por ' 
            + 'exemplo, se ele violar a propriedade intelectual de outra ' 
            + 'pessoa ou se passar por outro usuário).'}/>

        <Conteudo texto={'- Se você usar conteúdo protegido por direitos de ' 
            + 'propriedade intelectual que detemos e disponibilizamos em ' 
            + 'nosso Serviço (por exemplo, imagens, desenhos, vídeos ou ' 
            + 'sons que nós fornecemos e você adiciona ao conteúdo que cria ' 
            + 'ou compartilha), nós manteremos todos os direitos sobre nosso ' 
            + 'conteúdo (mas não sobre o seu).'}/>

        <Conteudo texto={'- Você só pode usar nossa propriedade intelectual, ' 
            + 'nossas marcas ou marcas semelhantes conforme expressamente ' 
            + 'autorizado por nossas Diretrizes de Marca ou com nossa ' 
            + 'permissão prévia por escrito.'}/>

        <Conteudo texto={'- Você deve obter nossa permissão escrita ou sob ' 
            + 'uma licença de código-fonte aberto para modificar, criar ' 
            + 'trabalhos derivados, descompilar ou de outra forma tentar ' 
            + 'extrair o código-fonte de nós.'}/>

        <Titulo css="titulo-termo" texto={'Remoção de conteúdo e desativação ou encerramento ' 
            + 'de sua conta'} />

        <Conteudo texto={'- Poderemos remover qualquer conteúdo ou informação ' 
            + 'que você compartilhar no Serviço se acreditarmos que tal ' 
            + 'conteúdo viola estes Termos de Uso ou nossas políticas ' 
            + '(incluindo nossas Diretrizes da Comunidade do aplicativo ' 
            + props.nomeAplicativo + ') ou estivermos autorizados ou obrigados ' 
            + 'por lei a fazê-lo. Poderemos recusar fornecer ou parar de ' 
            + 'fornecer imediatamente todo o Serviço ou parte dele para você ' 
            + '(incluindo encerramento ou desativação do seu acesso aos ' 
            + 'Produtos da Empresa UseMobi Sistemas LTDA) a fim de proteger ' 
            + 'nossos serviços ou nossa comunidade, ou se você criar risco ou ' 
            + 'exposição legal para nós, violar estes Termos de Uso ou nossas ' 
            + 'políticas (incluindo nossas Diretrizes da Comunidade do ' 
            + 'aplicativo ' + props.nomeAplicativo + '), violar repetidamente ' 
            + 'os direitos de propriedade intelectual de outras pessoas ou em ' 
            + 'caso de permissão ou exigência legal nesse sentido. Também ' 
            + 'poderemos encerrar ou alterar o Serviço, remover ou bloquear o ' 
            + 'conteúdo ou as informações compartilhadas no Serviço ou parar ' 
            + 'de fornecer todo o Serviço ou parte dele se determinarmos que ' 
            + 'isso é razoavelmente necessário para evitar ou reduzir impactos ' 
            + 'legais ou regulatórios adversos para nós. Se acreditar que a ' 
            + 'sua conta foi encerrada por engano ou se quiser desativar ou ' 
            + 'excluir permanentemente a conta, acesse a nossa Central de ' 
            + 'Ajuda. Quando você solicita a exclusão de um conteúdo que ' 
            + 'publicou ou a exclusão da sua conta, o processo se inicia ' 
            + 'automaticamente em até 30 dias após a sua solicitação. É ' 
            + 'possível que a exclusão do conteúdo ocorra em até 90 dias após ' 
            + 'o início do processo de exclusão. Apesar de o processo de ' 
            + 'exclusão de determinado conteúdo já ter começado, o conteúdo ' 
            + 'não é mais visível aos demais usuários, mas ele permanece ' 
            + 'sujeito a estes Termos de Uso e à nossa Política de Dados. ' 
            + 'Após a exclusão do conteúdo, talvez levemos mais 90 dias para ' 
            + 'removê-lo de nossos sistemas de backup e de recuperação de ' 
            + 'desastres.'}/>

        <Conteudo texto={'- Caso você exclua sua conta ou nós a desativemos, ' 
            + 'estes Termos levarão à dissolução do acordo entre você e nós. ' 
            + 'Contudo, esta seção e a seção abaixo denominada “Nosso acordo ' 
            + 'e o que ocorrerá em caso de discordância” ainda se aplicarão ' 
            + 'mesmo após o encerramento, desativação ou exclusão da sua ' 
            + 'conta.'}/>

        <Titulo css="titulo-termo" texto={'Nosso Acordo e o que acontecerá se nós discordarmos'} />

        <SubTitulo texto={'Nosso acordo'} />

        <Conteudo texto={'- Se algum aspecto deste acordo for inexequível, ' 
            + 'os demais aspectos deste permanecerão em vigor.'}/>

        <Conteudo texto={'- Quaisquer alterações ou renúncias relativas ' 
            + 'a este acordo devem ser feitas por escrito e assinadas por ' 
            + 'nós. Se falharmos em executar qualquer aspecto deste acordo, ' 
            + 'isso não será considerado uma renúncia.'}/>

        <Conteudo texto={'- Nós nos reservamos a todos os direitos não ' 
            + 'concedidos expressamente a você.'}/>

        <SubTitulo texto={'Quem tem direitos por força deste acordo'} />

        <Conteudo texto={'- Este acordo não concede direitos a quaisquer ' 
            + 'terceiros.'}/>

        <Conteudo texto={'- Você não pode transferir seus direitos ou ' 
            + 'obrigações decorrentes deste acordo sem nosso consentimento.'}/>

        <Conteudo texto={'- Nossos direitos e obrigações podem ser cedidos ' 
            + 'a outras pessoas. Por exemplo, isso poderia ocorrer em caso ' 
            + 'de alteração de propriedade (como em uma fusão, aquisição ' 
            + 'ou venda de ativos) ou de acordo com a lei.'}/>

        <SubTitulo texto={'Quem é responsável caso algo aconteça'} />

        <Conteudo texto={'- Nosso Serviço é fornecido "no estado em que se ' 
            + 'encontra", e não podemos garantir que ele será seguro e ' 
            + 'funcionará perfeitamente o tempo todo. NO LIMITE PERMITIDO ' 
            + 'POR LEI, TAMBÉM NOS EXIMIMOS DE TODAS AS GARANTIAS, ' 
            + 'EXPLÍCITAS OU IMPLÍCITAS, INCLUSIVE AS GARANTIAS IMPLÍCITAS ' 
            + 'DE COMERCIABILIDADE, ADEQUAÇÃO A UMA DETERMINADA FINALIDADE, ' 
            + 'TÍTULO E NÃO VIOLAÇÃO.'}/>

        <Conteudo texto={'- Também não controlamos o que as pessoas ou ' 
            + 'terceiros fazem ou mencionam e não somos responsáveis pelas ' 
            + 'respectivas (inclusive as suas) condutas ou ações, online ou ' 
            + 'offline, nem pelo conteúdo (inclusive conteúdo censurável ou ' 
            + 'ilícito). Também não somos responsáveis pelos serviços e ' 
            + 'recursos oferecidos por outras pessoas ou empresas, mesmo ' 
            + 'que você os acesse por meio do nosso Serviço.'}/>

        <Conteudo texto={'- Nossa responsabilidade por qualquer ocorrência ' 
            + 'no Serviço será limitada tanto quanto permitido por lei. Não ' 
            + 'temos como prever todos os impactos possíveis que um problema ' 
            + 'com nosso Serviço possa causar. Você concorda que nós não ' 
            + 'seremos responsáveis por qualquer perda de lucro, receitas, ' 
            + 'informação ou dados, ou, ainda, por danos eventuais, ' 
            + 'especiais, indiretos, exemplares, punitivos ou acidentais ' 
            + 'decorrentes de ou relativos a estes Termos, ainda que saibamos ' 
            + 'que eles são possíveis. Isso se aplica inclusive se nós ' 
            + 'excluirmos seu conteúdo, informações ou conta.'}/>
        
        <SubTitulo texto={'Como lidaremos com contestações'} />

        <Conteudo texto={'- Se você for um consumidor, as leis do país em ' 
            + 'que reside serão aplicáveis a qualquer reclamação, causa da ' 
            + 'ação ou contestação que tiver contra nós decorrente de ou ' 
            + 'relacionada a estes Termos ("reclamação"), e você poderá ' 
            + 'resolver sua reclamação em qualquer tribunal competente.'}/>
        
        <SubTitulo texto={'Material não solicitado'} />

        <Conteudo texto={'- Seu feedback e outras sugestões são sempre ' 
            + 'bem-vindos, mas podemos usá-los sem qualquer restrição ou ' 
            + 'obrigação de compensá-lo por eles e não temos o dever de ' 
            + 'manter a confidencialidade em relação a eles.'}/>

        <Titulo css="titulo-termo" texto={'Vedações de Uso'} />

        <Conteudo texto={'Você não deve inserir, transmitir, difundir ou ' 
            + 'disponibilizar a terceiros por meio do aplicativo ' 
            + props.nomeAplicativo + ' qualquer tipo de material ou informação ' 
            + 'que sejam contrários à legislação vigente, à moral, à ordem ' 
            + 'pública, a este termo de uso, às políticas da Empresa UseMobi ' 
            + 'Sistemas LTDA e às Condições Particulares aplicáveis. Dentre ' 
            + 'outros, não é permitido (i) "spam", "e-mail de correntes", ' 
            + '"marketing piramidal" e publicidade fora das áreas concebidas ' 
            + 'para tal uso; (ii) conteúdo falso, ambíguo, inexato, ou que ' 
            + 'possam induzir a erro eventuais receptores de referida ' 
            + 'informação; (iii) conteúdo que implique em violação ao sigilo ' 
            + 'das comunicações e à privacidade; (iv) senhas de acesso às ' 
            + 'distintas utilidades e/ou conteúdo do aplicativo ' 
            + props.nomeAplicativo + ' que sejam de titularidade de outros ' 
            + 'usuários.'}/>

        <Titulo css="titulo-termo" texto={'Atualização destes Termos'} />

        <Conteudo texto={'Podemos alterar nosso Serviço e nossas políticas, ' 
            + 'e podemos precisar alterar estes Termos para que eles reflitam ' 
            + 'precisamente nosso Serviço e nossas políticas. Salvo quando ' 
            + 'a lei estabelecer o contrário, você será notificado (por ' 
            + 'exemplo, por meio de nosso Serviço) antes de alterarmos estes ' 
            + 'Termos e terá a oportunidade de analisá-los antes que entrem ' 
            + 'em vigor. Por isso, se você continuar usando o Serviço, estará ' 
            + 'vinculado aos Termos atualizados. Se você não quiser concordar ' 
            + 'com estes ou com quaisquer outros Termos atualizados, poderá ' 
            + 'excluir sua conta a qualquer momento.'}/>

        <Titulo css="titulo-termo" texto={'ATUALIZAÇÃO'} />

        <Conteudo texto={'Última revisão: 23 de Julho de 2021.'}/>
        
        <Conteudo texto={'.'}/>
        <Conteudo texto={'.'}/>
        
    </div>
)