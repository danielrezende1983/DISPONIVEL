import 'package:brasil_fields/brasil_fields.dart';
import 'package:evento_gerente/helpers/comum_screen.dart';
import 'package:evento_gerente/helpers/constantes.dart';
import 'package:evento_gerente/helpers/mascaras.dart';
import 'package:evento_gerente/models/loja.dart';
import 'package:evento_gerente/models/loja_manager.dart';
import 'package:evento_gerente/models/usuario_vip.dart';
import 'package:evento_gerente/models/usuario_vip_manager.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class LojaScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    return Consumer2<LojaManager, UsuarioVipManager>(
      builder: (_, lojaManager, usuarioVipManager, __){

        return Scaffold(
          appBar: AppBar(
            title: const Text('Loja'),
          ),
          backgroundColor: Colors.white,
          body: ListView(
            children: <Widget>[
              mostrarListaImagensAspectRatio(
                  context,
                  lojaManager.lojaSelecionada?.images ?? [],
                  'images/servico_006_512.png'),
              Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: <Widget>[
                    mostrarLabel('ID:'),
                    mostrarConteudo(lojaManager.lojaSelecionada.userTitular),
                    _mostreStatusAssinatura(lojaManager.lojaSelecionada, usuarioVipManager.usuarioVipSelecionado),
                    mostrarLabel('Nome Servidor:'),
                    _mostreNome(lojaManager.lojaSelecionada),
                    _mostrarLabelCpfCnpj(lojaManager.lojaSelecionada),
                    _mostreCpfCnpj(lojaManager.lojaSelecionada),
                    mostrarLabel('Descrição:'),
                    _mostreDescricao(lojaManager.lojaSelecionada),
                    const SizedBox(height: 30,),
                    _botaoLocalizacao(context, lojaManager.lojaSelecionada),
                    const SizedBox(height: 10,),
                    _botaoContato(context, lojaManager.lojaSelecionada),
                    const SizedBox(height: 10,),
                    _botaoAssinatura(context, lojaManager),
                    const SizedBox(height: 20,),
                  ],
                ),
              ),
            ],
          ),
        );

      },
    );
  }

  SizedBox _botaoAssinatura(BuildContext context, LojaManager lojaManager){

    return SizedBox(
      height: 44,
      child: RaisedButton(

        onPressed: () {

          Navigator.of(context).pushNamed(
              '/assinatura',
              arguments: {
                'nomeTabelaColecao': nomeTabelaColecao_Lojas,
                'userTitular': lojaManager.lojaSelecionada.userTitular
              }
          );

        },

        color: Theme.of(context).primaryColor,
        disabledColor: Theme.of(context).primaryColor.withAlpha(100),
        textColor: Colors.white,
        child: const Text(
          'Assinatura',
          style: TextStyle(fontSize: 18),
        ),
      ),
    );

  }

  Text _mostreStatusAssinatura(Loja loja, UsuarioVip usuarioVip){

    String texto = loja.assinaturaAtiva ? 'Assinatura Ativa' : 'Assinatura Inativa';
    Color cor = loja.assinaturaAtiva ? Colors.green : Colors.red;

    if (usuarioVip != null){
      if (usuarioVip.userTitular != null){
        texto = 'VIP';
        cor = Colors.purple;
      }
    }

    return Text(
      texto,
      style: TextStyle(
        fontWeight: FontWeight.w800,
        color: cor,
        fontSize: 20,
      ),
    );

  }

  Text _mostreCpfCnpj(Loja loja){

    String valor;
    if(loja == null){
      valor = '';
    }else if(loja.ehCnpj == null){
      valor = '';
    }else if(loja.ehCnpj){

      if(loja.cnpj == null) {
        valor = mascaraCnpj;
      }if(loja.cnpj == 0){
        valor = mascaraCnpj;
      }else{
        valor = UtilBrasilFields.obterCnpj(loja.cnpj.toString());
      }

    }else{

      if(loja.cpf == null) {
        valor = mascaraCpf;
      }if(loja.cpf == 0){
        valor = mascaraCpf;
      }else{
        valor = UtilBrasilFields.obterCpf(loja.cpf.toString());
      }

    }

    return mostrarConteudo(valor);

  }

  Padding _mostrarLabelCpfCnpj(Loja loja){

    if(loja == null){
      return mostrarLabel('CPF:');
    }else if(loja.ehCnpj == null) {
      return mostrarLabel('CPF:');
    }else if(loja.ehCnpj){
      return mostrarLabel('CNPJ:');
    }

    return mostrarLabel('CPF:');

  }

  SizedBox _botaoContato(BuildContext context, Loja loja){

    return SizedBox(
      height: 44,
      child: RaisedButton(

        onPressed: () {

          Navigator.of(context).pushNamed(
              '/contato',
              arguments: {'contato': loja.getContato()}
          );

        },

        color: Theme.of(context).primaryColor,
        disabledColor: Theme.of(context).primaryColor.withAlpha(100),
        textColor: Colors.white,
        child: const Text(
          'Contato',
          style: TextStyle(fontSize: 18),
        ),
      ),
    );

  }

  SizedBox _botaoLocalizacao(BuildContext context, Loja loja){

    return SizedBox(
      height: 44,
      child: RaisedButton(

        onPressed: () {

          Navigator.of(context).pushNamed(
              '/localizacao',
              arguments: {'localizacao': loja.getLocalizacao()}
          );

        },

        color: Theme.of(context).primaryColor,
        disabledColor: Theme.of(context).primaryColor.withAlpha(100),
        textColor: Colors.white,
        child: const Text(
          'Localização',
          style: TextStyle(fontSize: 18),
        ),
      ),
    );

  }

  Text _mostreNome(Loja loja){

    String valor;
    if(loja == null){
      valor = '';
    }else if(loja.nome == null) {
      valor = '';
    }else{
      valor = loja.nome;
    }

    return mostrarConteudo(valor);

  }

  Text _mostreDescricao(Loja loja){

    String valor;
    if(loja == null){
      valor = '';
    }else if(loja.descricao == null) {
      valor = '';
    }else{
      valor = loja.descricao;
    }

    return mostrarConteudo(valor);

  }

}
