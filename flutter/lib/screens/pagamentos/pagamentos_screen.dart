import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:evento_gerente/comuns/custom_drawer/widgets_comuns.dart';
import 'package:evento_gerente/helpers/constantes.dart';
import 'package:evento_gerente/helpers/obtenha.dart';
import 'package:evento_gerente/helpers/validators.dart';
import 'package:evento_gerente/models/assinatura.dart';
import 'package:evento_gerente/models/cartao_credito.dart';
import 'package:evento_gerente/models/cartao_credito_manager.dart';
import 'package:evento_gerente/models/loja_manager.dart';
import 'package:evento_gerente/models/pagamento.dart';
import 'package:evento_gerente/models/pagamento_manager.dart';
import 'package:evento_gerente/models/servidor_manager.dart';
import 'package:evento_gerente/models/usuario_vip_manager.dart';
import 'package:evento_gerente/screens/base/componentes/search_dialog.dart';
import 'package:evento_gerente/screens/cartao_credito/cartao_credito_widget.dart';
import 'package:evento_gerente/screens/pagamentos/componentes/pagamentos_list_tile.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

enum OrderOptions {atualizar}

// ignore: must_be_immutable
class PagamentosScreen extends StatelessWidget {

  PagamentosScreen(this.nomeTabelaColecao, this.assinatura){
    _ultimoPagamento = null;
  }

  final String nomeTabelaColecao;
  final Assinatura assinatura;
  Pagamento _ultimoPagamento;

  @override
  Widget build(BuildContext context) {

    return FutureBuilder<DocumentSnapshot>(
      future: FirebaseFirestore.instance.doc('cartao_credito/${assinatura.userTitular}').get(),
      builder: (BuildContext contextFutureBuilder, AsyncSnapshot<DocumentSnapshot> snapshot){

        if (snapshot == null) {
          return _tela(context);
        } if (snapshot.data == null){
          return _tela(context);
        }else if (snapshot.hasError) {
          return _tela(context);
        }else{

          if (snapshot.connectionState == ConnectionState.done) {

            final CartaoCredito cartaoCredito = CartaoCredito.fromDocument(snapshot.data);

            return Consumer<CartaoCreditoManager>(
              builder: (_, cartaoCreditoManager, __){

                cartaoCreditoManager.cartaoSelecionado = cartaoCredito;
                return _tela(context);

              },
            );

          }

        }

        return statusDeCarregandoListTile();

      },
    );

  }

  Scaffold _tela(BuildContext context){

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: _titulo(context),
      body: _corpo(context),
    );

  }

  ListView _corpo(BuildContext context){

    return ListView(
      children: <Widget>[
        CartaoCreditoWidget(),
        Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              _mostrarValorCobrado(),
              const SizedBox(height: 5,),
              _botaoGerarProximoPagamento(context),
              const SizedBox(height: 20,),
              _listaPagamentos(context),
              //const SizedBox(height: 5,),
            ],
          ),
        ),
      ],
    );

  }

  bool _podeGerarProximoPagamento(){

    if(_ultimoPagamento == null){
      return true;
    }

    return _ultimoPagamento.podeGerarProximoPagamento;

  }

  Consumer3 _botaoGerarProximoPagamento(BuildContext context){

    return Consumer3<UsuarioVipManager, PagamentoManager, ServidorManager>(
      builder: (_, usuarioVipManager, pagamentoManager, servidorManager, __){

        if(ehVip(usuarioVipManager.usuarioVipSelecionado)){
          return Container();
        }

        if(assinatura == null){
          return Container();
        }
        if(assinatura.status == Assinatura.statusCancelada){
          return Container();
        }

        if(!_podeGerarProximoPagamento()){
          return Container();
        }

        return _podeMostrarBotao(context, pagamentoManager, servidorManager);

      },
    );

  }

  Widget _podeMostrarBotao(BuildContext context, PagamentoManager pagamentoManager, ServidorManager servidorManager){

    if(_ultimoPagamento != null){
      if(_ultimoPagamento.status == Pagamento.statusAguardandoConfirmacaoPagamentoCodigo){
        return Container();
      }
    }

    return SizedBox(
      height: 44,
      child: RaisedButton(

        onPressed: !pagamentoManager.loading ? () async {

          final Pagamento pagamentoNovo = _prepareNovoPagamento();
          pagamentoManager.save(nomeTabelaColecao, pagamentoNovo);

          servidorManager.servidorSelecionado.assinaturaAtiva = true;
          servidorManager.atualizaAtividadeAssinatura();

        } : null,

        color: Theme.of(context).primaryColor,
        disabledColor: Theme.of(context).primaryColor.withAlpha(100),
        textColor: Colors.white,
        child: pagamentoManager.loading
            ? const CircularProgressIndicator(
          valueColor: AlwaysStoppedAnimation(Colors.white),
        )
            : const Text(
          'Gerar Próximo Pagamento',
          style: TextStyle(fontSize: 18),
        ),
      ),
    );

  }

  Pagamento _prepareNovoPagamento(){

    final Pagamento pagamentoNovo = Pagamento(
        userTitular: assinatura.userTitular
    );

    if(_ultimoPagamento == null) {

      final String dataInicio = obtenhaDataInicialDaVigenciaFormatoBD();
      pagamentoNovo.dataInicio = dataInicio;

    }else{

      if (_ultimoPagamento.payId.isNotEmpty && _ultimoPagamento.status != Pagamento.statusPagamentoConfirmadoCodigo){
        pagamentoNovo.dataInicio = _ultimoPagamento.dataInicio;
      }else{
        pagamentoNovo.dataInicio = obtenhaProximaDataInicialDaVigenciaFormatoBD(_ultimoPagamento.dataInicio);
      }

    }

    pagamentoNovo.dataFim = obtenhaDataFinalDaVigenciaFormatoBD(pagamentoNovo.dataInicio);
    pagamentoNovo.valor = valorDaAssinaturaServidor;
    pagamentoNovo.status = Pagamento.statusAguardandoConfirmacaoPagamentoCodigo;
    pagamentoNovo.dataHoraPagamento = obtenhaDataHoraAtualFormatoBD();
    pagamentoNovo.dataHoraCancelamento = '';

    return pagamentoNovo;

  }

  Row _mostrarValorCobrado(){

    return Row(
      children: <Widget>[
        Expanded(
          flex: 70,
          child: Container(
            color: Colors.grey[500],
            //margin: const EdgeInsets.only(left: 16),
            padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 8),
            //alignment: Alignment.centerRight,
            child: const Text(
              'Cobrado Mensalmente',
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ),
        Expanded(
          flex: 30,
          child: Container(
            color: Colors.grey[500],
            //margin: const EdgeInsets.only(right: 16),
            padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 8),
            alignment: Alignment.centerRight,
            child: Text(
              'R\$ ${_valorDaAssinatura().toString()}',
              textAlign: TextAlign.end,
              style: const TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ),
      ],
    );

  }

  num _valorDaAssinatura(){

    if(nomeTabelaColecao == nomeTabelaColecao_Servidores){
      return valorDaAssinaturaServidor;
    }else if(nomeTabelaColecao == nomeTabelaColecao_Lojas){
      return valorDaAssinaturaloja;
    }

    return 0.0;

  }

  String _obtenhaUsuarioDaTabelaColecao(BuildContext context){

    if(nomeTabelaColecao == nomeTabelaColecao_Servidores){
      return context.read<ServidorManager>().servidorSelecionado.userTitular;
    }else if(nomeTabelaColecao == nomeTabelaColecao_Lojas){
      return context.read<LojaManager>().lojaSelecionada.userTitular;
    }

    return '';

  }

  Consumer _listaPagamentos(BuildContext context){

    return Consumer<PagamentoManager>(
      builder: (_, pagamentoManager, __){

        final listaPagamento = pagamentoManager.listaFiltrada(nomeTabelaColecao, _obtenhaUsuarioDaTabelaColecao(context));

        _obtenhaUltimoPagamento(listaPagamento);

        return Container(
          padding: const EdgeInsets.only(top: 10, bottom: 10),
          height: 300, //_tamanhoContainerLista(listaPagamento.length),
          color: Theme.of(context).primaryColor,
          child: ListView.builder(
              padding: const EdgeInsets.all(4),
              itemCount: listaPagamento.length,
              itemBuilder: (_, index){
                return PagamentoListTile(listaPagamento[index], nomeTabelaColecao);
              }
          ),
        );

      },
    );

  }

  void _obtenhaUltimoPagamento(List<Pagamento> listaPagamento){

    if(listaPagamento != null){

      if(listaPagamento.isNotEmpty){

        _ultimoPagamento = listaPagamento.first;

      }

    }

  }

  AppBar _titulo(BuildContext context){

    return AppBar(
      title: Consumer<PagamentoManager>(
        builder: (_, pagamentoManager, __){
          if (pagamentoManager.search.isEmpty){
            return const Text('Pagamentos');
          }else{
            return LayoutBuilder(
                builder: (_, constraints){
                  return GestureDetector(
                    onTap: () async {
                      final search = await showDialog<String>(
                          context: context,
                          builder: (_) => SearchDialog(pagamentoManager.search)
                      );
                      if (search != null){
                        pagamentoManager.search = search;
                      }
                    },
                    // ignore: sized_box_for_whitespace
                    child: Container(
                        width: constraints.biggest.width,
                        child: Text(
                          pagamentoManager.search,
                          textAlign: TextAlign.center,
                        )
                    ),
                  );
                }
            );
          }
        },
      ),
      centerTitle: true,
      actions: <Widget>[
        Consumer<PagamentoManager>(
            builder: (_, pagamentoManager, __){
              if(pagamentoManager.search.isEmpty){
                return IconButton(
                  icon: const Icon(Icons.search),
                  onPressed: () async {
                    final search = await showDialog<String>(
                        context: context,
                        builder: (_) => SearchDialog(pagamentoManager.search)
                    );
                    if (search != null){
                      pagamentoManager.search = search;
                    }
                  },
                );
              }else{
                return IconButton(
                  icon: const Icon(Icons.close),
                  onPressed: () async {
                    pagamentoManager.search = '';
                  },
                );
              }
            }
        ),
        Consumer<PagamentoManager>(
            builder: (_, pagamentoManager, __){
              return PopupMenuButton<OrderOptions>(
                itemBuilder: (context) => <PopupMenuEntry<OrderOptions>>[
                  const PopupMenuItem<OrderOptions>(
                    value: OrderOptions.atualizar,
                    child: ListTile(
                      leading: Icon(Icons.refresh),
                      title: Text('Atualizar'),
                    ),
                  ),
                ],
                onSelected: (OrderOptions opcaoSelecionada) {
                  switch(opcaoSelecionada){
                    case OrderOptions.atualizar:
                      pagamentoManager.atualizar = true;
                      break;
                  }
                },
              );
            }
        ),
      ],
    );

  }

}
