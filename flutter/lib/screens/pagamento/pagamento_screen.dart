import 'package:evento_gerente/helpers/alertas_snackbar.dart';
import 'package:evento_gerente/helpers/comum_screen.dart';
import 'package:evento_gerente/helpers/constantes.dart';
import 'package:evento_gerente/helpers/formato.dart';
import 'package:evento_gerente/helpers/obtenha.dart';
import 'package:evento_gerente/helpers/validators.dart';
import 'package:evento_gerente/models/cartao_credito_manager.dart';
import 'package:evento_gerente/models/loja_manager.dart';
import 'package:evento_gerente/models/pagamento.dart';
import 'package:evento_gerente/models/pagamento_manager.dart';
import 'package:evento_gerente/models/servidor_manager.dart';
import 'package:evento_gerente/models/usuario_vip_manager.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class PagamentoScreen extends StatelessWidget {

  const PagamentoScreen(this.nomeTabelaColecao);

  final String nomeTabelaColecao;

  @override
  Widget build(BuildContext context) {

    return Consumer<PagamentoManager>(
      builder: (_, pagamentoManager, __){

        return Scaffold(
          appBar: AppBar(
            title: const Text('Pagamento'),
          ),
          backgroundColor: Colors.white,
          body: ListView(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: <Widget>[
                    mostrarLabel('IDENTIFICAÇÃO DO PAGAMENTO:'),
                    mostrarConteudo(pagamentoManager.pagamentoSelecionado.idPagamento),
                    mostrarLabel('Status da CIELO:'),
                    mostrarConteudo(pagamentoManager.pagamentoSelecionado.statusCielo),
                    mostrarLabel('Identificação da CIELO:'),
                    mostrarConteudo(pagamentoManager.pagamentoSelecionado.payId),
                    mostrarLabel('Data e Hora do Pagamento:'),
                    mostrarConteudo(pagamentoManager.pagamentoSelecionado.dataHoraPagamento),
                    mostrarLabel('Data e Hora do Cancelamento:'),
                    mostrarConteudo(pagamentoManager.pagamentoSelecionado.dataHoraCancelamento),
                    mostrarLabel('Status:'),
                    _mostreStatusAssinatura(pagamentoManager.pagamentoSelecionado),
                    mostrarLabel('Data Início:'),
                    mostrarConteudo(formatoDataBDParaTela(pagamentoManager.pagamentoSelecionado.dataInicio)),
                    mostrarLabel('Data Fim:'),
                    mostrarConteudo(formatoDataBDParaTela(pagamentoManager.pagamentoSelecionado.dataFim)),
                    mostrarLabel('Valor:'),
                    mostrarConteudoEmReais(pagamentoManager.pagamentoSelecionado.valor),
                    mostrarLabel('Mensagem:'),
                    mostrarConteudo(pagamentoManager.pagamentoSelecionado.mensagem, cor: Colors.red),
                    const SizedBox(height: 20,),
                    _botaoPagamento(context, pagamentoManager.pagamentoSelecionado),
                    const SizedBox(height: 20,),
                    _botaoLiberarPagamento(context, pagamentoManager.pagamentoSelecionado),
                    const SizedBox(height: 20,),
                    _botaoCancelamentoPagamentoCielo(context, pagamentoManager.pagamentoSelecionado),
                    const SizedBox(height: 20,),
                    _botaoCancelamentoPagamentoGerente(context, pagamentoManager.pagamentoSelecionado),
                    const SizedBox(height: 30,),
                  ],
                ),
              ),
            ],
          ),
        );

      },
    );
  }

  Consumer2 _botaoCancelamentoPagamentoGerente(BuildContext context, Pagamento pagamento){

    return Consumer2<UsuarioVipManager, PagamentoManager>(
        builder: (_, usuarioVipManager, pagamentoManager, __){

          if(ehVip(usuarioVipManager.usuarioVipSelecionado)
              || pagamento.status != Pagamento.statusAguardandoConfirmacaoPagamentoCodigo
              || pagamento.payId.isNotEmpty){

            return Container();

          }else{

            return SizedBox(
              height: 44,
              child: RaisedButton(

                onPressed: !pagamentoManager.loading ? () async {

                  if(nomeTabelaColecao == nomeTabelaColecao_Servidores){
                    _cancelarPagamentoGerenteServidor(context, pagamentoManager, pagamento);
                  }else if(nomeTabelaColecao == nomeTabelaColecao_Lojas){
                    _cancelarPagamentoGerenteLoja(context, pagamentoManager, pagamento);
                  }

                } : null,

                color: Colors.red,
                disabledColor: Colors.red.withAlpha(100),
                textColor: Colors.white,
                child: pagamentoManager.loading
                    ? const CircularProgressIndicator(
                  valueColor: AlwaysStoppedAnimation(Colors.white),
                )
                    : const Text(
                  'Cancelar Pagamento',
                  style: TextStyle(fontSize: 18),
                ),
              ),
            );


          }

        }
    );

  }

  void _cancelarPagamentoGerenteServidor(
      BuildContext context,
      PagamentoManager pagamentoManager,
      Pagamento pagamento){

    pagamentoManager.cancelarPagamentoGerente(
        nomeTabelaColecao,
        pagamento.clone(),
        onPayFail: (e){
          alertasErros('$e');
        },
        onPaySuccess: (){
          context.read<ServidorManager>().servidorSelecionado.assinaturaAtiva = false;
          context.read<ServidorManager>().atualizaAtividadeAssinatura();
        }
    );

  }

  void _cancelarPagamentoGerenteLoja(
      BuildContext context,
      PagamentoManager pagamentoManager,
      Pagamento pagamento){

    pagamentoManager.cancelarPagamentoGerente(
        nomeTabelaColecao,
        pagamento.clone(),
        onPayFail: (e){
          alertasErros('$e');
        },
        onPaySuccess: (){
          context.read<LojaManager>().lojaSelecionada.assinaturaAtiva = false;
          context.read<LojaManager>().atualizaAtividadeAssinatura();
        }
    );

  }

  Consumer2 _botaoLiberarPagamento(BuildContext context, Pagamento pagamento){

    return Consumer2<UsuarioVipManager, PagamentoManager>(
        builder: (_, usuarioVipManager, pagamentoManager, __){

          if(ehVip(usuarioVipManager.usuarioVipSelecionado)
              || pagamento.status == Pagamento.statusPagamentoConfirmadoCodigo
              || pagamento.payId.isNotEmpty){

            return Container();

          }else{

            return SizedBox(
              height: 44,
              child: RaisedButton(

                onPressed: !pagamentoManager.loading ? () async {

                  final Pagamento pagamentoNovo = pagamento.clone();
                  pagamentoNovo.status = Pagamento.statusPagamentoDesativadoCodigo;
                  pagamentoNovo.dataHoraCancelamento = obtenhaDataHoraAtualFormatoBD();
                  pagamentoNovo.mensagem = 'Pagamento desativado pelo administrador.';

                  pagamentoManager.save(nomeTabelaColecao, pagamentoNovo);

                } : null,

                color: Colors.orange,
                disabledColor: Colors.orange.withAlpha(100),
                textColor: Colors.white,
                child: pagamentoManager.loading
                    ? const CircularProgressIndicator(
                  valueColor: AlwaysStoppedAnimation(Colors.white),
                )
                    : const Text(
                  'Desativar Pagamento',
                  style: TextStyle(fontSize: 18),
                ),
              ),
            );


          }

        }
    );

  }

  Consumer2 _botaoCancelamentoPagamentoCielo(BuildContext context, Pagamento pagamento){

    return Consumer2<UsuarioVipManager, PagamentoManager>(
        builder: (_, usuarioVipManager, pagamentoManager, __){

          if(ehVip(usuarioVipManager.usuarioVipSelecionado)
             || pagamento.status == Pagamento.statusPagamentoNaoConfirmadoCodigo
             || pagamento.payId.isEmpty){

            return Container();

          }else{

            return SizedBox(
              height: 44,
              child: RaisedButton(

                onPressed: !pagamentoManager.loading ? () async {

                  if(nomeTabelaColecao == nomeTabelaColecao_Servidores){
                    _cancelarPagamentoCieloServidor(context, pagamentoManager, pagamento);
                  }else if(nomeTabelaColecao == nomeTabelaColecao_Lojas){
                    _cancelarPagamentoCieloLoja(context, pagamentoManager, pagamento);
                  }

                } : null,

                color: Colors.red,
                disabledColor: Colors.red.withAlpha(100),
                textColor: Colors.white,
                child: pagamentoManager.loading
                    ? const CircularProgressIndicator(
                  valueColor: AlwaysStoppedAnimation(Colors.white),
                )
                    : const Text(
                  'Cancelar Pagamento CIELO',
                  style: TextStyle(fontSize: 18),
                ),
              ),
            );


          }

        }
    );

  }

  void _cancelarPagamentoCieloServidor(
      BuildContext context,
      PagamentoManager pagamentoManager,
      Pagamento pagamento){

    pagamentoManager.cancelarPagamentoCielo(
        nomeTabelaColecao,
        pagamento.clone(),
        onPayFail: (e){
          alertasErros('$e');
        },
        onPaySuccess: (){
          context.read<ServidorManager>().servidorSelecionado.assinaturaAtiva = false;
          context.read<ServidorManager>().atualizaAtividadeAssinatura();
        }
    );

  }

  void _cancelarPagamentoCieloLoja(
      BuildContext context,
      PagamentoManager pagamentoManager,
      Pagamento pagamento){

    pagamentoManager.cancelarPagamentoCielo(
        nomeTabelaColecao,
        pagamento.clone(),
        onPayFail: (e){
          alertasErros('$e');
        },
        onPaySuccess: (){
          context.read<LojaManager>().lojaSelecionada.assinaturaAtiva = false;
          context.read<LojaManager>().atualizaAtividadeAssinatura();
        }
    );

  }

  Consumer3 _botaoPagamento(BuildContext context, Pagamento pagamento){

    return Consumer3<UsuarioVipManager, PagamentoManager, CartaoCreditoManager>(
        builder: (_, usuarioVipManager, pagamentoManager, cartaoCreditoManager, __){

          if(ehVip(usuarioVipManager.usuarioVipSelecionado)
             || pagamento.status == Pagamento.statusPagamentoConfirmadoCodigo
             || pagamento.payId.isNotEmpty){

            return Container();

          }else{

            return SizedBox(
              height: 44,
              child: RaisedButton(

                onPressed: !pagamentoManager.loading ? () async {

                  if(nomeTabelaColecao == nomeTabelaColecao_Servidores){
                    _efetivandoPagamentoServidor(context, pagamentoManager, pagamento, cartaoCreditoManager);
                  }else if(nomeTabelaColecao == nomeTabelaColecao_Lojas){
                    _efetivandoPagamentoLoja(context, pagamentoManager, pagamento, cartaoCreditoManager);
                  }

                } : null,

                color: Theme.of(context).primaryColor,
                disabledColor: Theme.of(context).primaryColor.withAlpha(100),
                textColor: Colors.white,
                child: pagamentoManager.loading
                    ? const CircularProgressIndicator(
                  valueColor: AlwaysStoppedAnimation(Colors.white),
                )
                    : const Text(
                  'Fazer Pagamento',
                  style: TextStyle(fontSize: 18),
                ),
              ),
            );


          }

        }
    );

  }

  void _efetivandoPagamentoLoja(
      BuildContext context,
      PagamentoManager pagamentoManager,
      Pagamento pagamento,
      CartaoCreditoManager cartaoCreditoManager){

    pagamentoManager.efetivandoPagamento(
        nomeTabelaColecao,
        cartaoCreditoManager.cartaoSelecionado,
        pagamento.clone(),
        context.read<LojaManager>().lojaSelecionada.nome,
        onPayFail: (e){

          context.read<LojaManager>().lojaSelecionada.assinaturaAtiva = false;
          context.read<LojaManager>().atualizaAtividadeAssinatura();

          alertasErros('$e');

        },
        onPaySuccess: (){

          context.read<LojaManager>().lojaSelecionada.assinaturaAtiva = true;
          context.read<LojaManager>().atualizaAtividadeAssinatura();

        }
    );

  }

  void _efetivandoPagamentoServidor(
      BuildContext context,
      PagamentoManager pagamentoManager,
      Pagamento pagamento,
      CartaoCreditoManager cartaoCreditoManager){

    pagamentoManager.efetivandoPagamento(
        nomeTabelaColecao,
        cartaoCreditoManager.cartaoSelecionado,
        pagamento.clone(),
        context.read<ServidorManager>().servidorSelecionado.nome,
        onPayFail: (e){

          context.read<ServidorManager>().servidorSelecionado.assinaturaAtiva = false;
          context.read<ServidorManager>().atualizaAtividadeAssinatura();

          alertasErros('$e');

        },
        onPaySuccess: (){

          context.read<ServidorManager>().servidorSelecionado.assinaturaAtiva = true;
          context.read<ServidorManager>().atualizaAtividadeAssinatura();

        }
    );

  }

  Text _mostreStatusAssinatura(Pagamento pagamento){

    return Text(
      pagamento.statusDescricao,
      style: TextStyle(
        fontWeight: FontWeight.w800,
        color: pagamento.statusCor,
        fontSize: 16,
      ),
    );

  }

}
