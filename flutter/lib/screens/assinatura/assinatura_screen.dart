import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:evento_gerente/comuns/custom_drawer/widgets_comuns.dart';
import 'package:evento_gerente/helpers/comum_screen.dart';
import 'package:evento_gerente/helpers/constantes.dart';
import 'package:evento_gerente/helpers/formato.dart';
import 'package:evento_gerente/models/assinatura.dart';
import 'package:evento_gerente/models/pagamento_manager.dart';
import 'package:evento_gerente/models/usuario_vip.dart';
import 'package:evento_gerente/models/usuario_vip_manager.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AssinaturaScreen extends StatelessWidget {

  const AssinaturaScreen(this.nomeTabelaColecao, this.userTitular);

  final String nomeTabelaColecao;
  final String userTitular;

  @override
  Widget build(BuildContext context) {

    return FutureBuilder<DocumentSnapshot>(
      future: FirebaseFirestore.instance.doc('$nomeTabelaColecao/$userTitular/assinatura/$userTitular').get(),
      builder: (BuildContext contextFutureBuilder, AsyncSnapshot<DocumentSnapshot> snapshot){

        if (snapshot == null) {
          return Container();
        } if (snapshot.data == null){
          return Container();
        }else if (snapshot.hasError) {
          return Container();
        }else{

          if (snapshot.connectionState == ConnectionState.done) {

            final Assinatura assinatura = Assinatura.fromDocument(snapshot.data);

            return _corpo(context, assinatura);

          }

        }

        return statusDeCarregandoListTile();

      },
    );
  }

  Scaffold _corpo(BuildContext context, Assinatura assinatura){

    return Scaffold(
      appBar: AppBar(
        title: const Text('Assinatura'),
      ),
      backgroundColor: Colors.white,
      body: ListView(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                mostrarLabel('Status:'),
                _mostreStatusAssinatura(assinatura),
                mostrarLabel('Data Ativação:'),
                mostrarConteudo(formatoDataBDParaTela(assinatura.dataAtivacao)),
                mostrarLabel('Data Cancelamento:'),
                mostrarConteudo(formatoDataBDParaTela(assinatura.dataCancelamento)),
                mostrarLabel('Valor:'),
                mostrarConteudoEmReais(assinatura.valor),
                const SizedBox(height: 30,),
                _botaoVip(context),
                const SizedBox(height: 20,),
                _botaoPagamento(context, assinatura),
                const SizedBox(height: 30,),
              ],
            ),
          ),
        ],
      ),
    );

  }

  Consumer _botaoPagamento(BuildContext context, Assinatura assinatura){

    return Consumer<PagamentoManager>(
      builder: (_, pagamentoManager, __){

        return SizedBox(
          height: 44,
          child: RaisedButton(
            onPressed: () {

              pagamentoManager.atualizar = true;
              Navigator.of(context).pushNamed(
                  '/pagamentos',
                  arguments: {
                    'nomeTabelaColecao': nomeTabelaColecao,
                    'assinatura': assinatura
                  }
              );

            },
            color: Theme.of(context).primaryColor,
            disabledColor: Theme.of(context).primaryColor.withAlpha(100),
            textColor: Colors.white,
            child: const Text(
              'Pagamentos',
              style: TextStyle(fontSize: 18),
            ),
          ),
        );


      },
    );

  }

  Consumer _botaoVip(BuildContext context){

    return Consumer<UsuarioVipManager>(
        builder: (_, usuarioVipManager, __){

          return SizedBox(
            height: 44,
            child: RaisedButton(

              onPressed: (){

                String nomeTabelaColecaoVip = '';
                if (nomeTabelaColecao == nomeTabelaColecao_Servidores){
                  nomeTabelaColecaoVip = nomeTabelaColecao_VipServidor;
                }else if (nomeTabelaColecao == nomeTabelaColecao_Lojas) {
                  nomeTabelaColecaoVip = nomeTabelaColecao_VipLoja;
                }

                Navigator.of(context).pushNamed(
                    '/vip_edit',
                    arguments: {
                      'nomeTabelaColecaoVip': nomeTabelaColecaoVip
                    }
                );

              },

              color: _corBotaoVip(context, usuarioVipManager.usuarioVipSelecionado),
              disabledColor: _corDesabilitadoBotaoVip(context, usuarioVipManager.usuarioVipSelecionado),
              textColor: Colors.white,
              child: Text(
                _textoBotaoVip(usuarioVipManager.usuarioVipSelecionado),
                style: const TextStyle(fontSize: 18),
              ),
            ),
          );

        }
    );

  }

  Color _corDesabilitadoBotaoVip(BuildContext context, UsuarioVip usuarioVip){

    if (_ehVip(usuarioVip)){
      return Colors.red.withAlpha(100);
    }

    return Theme.of(context).primaryColor.withAlpha(100);

  }

  Color _corBotaoVip(BuildContext context, UsuarioVip usuarioVip){

    if (_ehVip(usuarioVip)){
      return Colors.red;
    }

    return Theme.of(context).primaryColor;

  }

  bool _ehVip(UsuarioVip usuarioVip){

    if (usuarioVip != null){
      if (usuarioVip.userTitular != null){
        return true;
      }
    }

    return false;

  }

  String _textoBotaoVip(UsuarioVip usuarioVip){

    if (_ehVip(usuarioVip)){
      return 'Retirar VIP';
    }

    return 'Ativar VIP';

  }

  Consumer _mostreStatusAssinatura(Assinatura assinatura){

    return Consumer<UsuarioVipManager>(
      builder: (_, usuarioVipManager, __){

        String texto = assinatura.statusDescricao;
        Color cor = assinatura.statusCor;

        if (_ehVip(usuarioVipManager.usuarioVipSelecionado)){
          texto = 'VIP';
          cor = Colors.purple;
        }

        return Text(
          texto,
          style: TextStyle(
            fontWeight: FontWeight.w800,
            color: cor,
            fontSize: 16,
          ),
        );

      },
    );

  }

}
