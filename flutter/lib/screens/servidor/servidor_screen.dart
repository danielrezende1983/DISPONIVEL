import 'package:brasil_fields/brasil_fields.dart';
import 'package:evento_gerente/helpers/comum_screen.dart';
import 'package:evento_gerente/helpers/constantes.dart';
import 'package:evento_gerente/helpers/mascaras.dart';
import 'package:evento_gerente/models/servidor.dart';
import 'package:evento_gerente/models/servidor_manager.dart';
import 'package:evento_gerente/models/usuario_vip.dart';
import 'package:evento_gerente/models/usuario_vip_manager.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ServidorScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    return Consumer2<ServidorManager, UsuarioVipManager>(
      builder: (_, servidorManager, usuarioVipManager, __){

        return Scaffold(
          appBar: AppBar(
            title: const Text('Servidor'),
          ),
          backgroundColor: Colors.white,
          body: ListView(
            children: <Widget>[
              mostrarListaImagensAspectRatio(
                  context,
                  servidorManager.servidorSelecionado?.images ?? [],
                  'images/servico_006_512.png'),
              Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: <Widget>[
                    mostrarLabel('ID:'),
                    mostrarConteudo(servidorManager.servidorSelecionado.userTitular),
                    _mostreStatusAssinatura(servidorManager.servidorSelecionado, usuarioVipManager.usuarioVipSelecionado),
                    mostrarLabel('Nome Servidor:'),
                    _mostreNome(servidorManager.servidorSelecionado),
                    _mostrarLabelCpfCnpj(servidorManager.servidorSelecionado),
                    _mostreCpfCnpj(servidorManager.servidorSelecionado),
                    mostrarLabel('Descrição:'),
                    _mostreDescricao(servidorManager.servidorSelecionado),
                    const SizedBox(height: 30,),
                    _botaoLocalizacao(context, servidorManager.servidorSelecionado),
                    const SizedBox(height: 10,),
                    _botaoContato(context, servidorManager.servidorSelecionado),
                    const SizedBox(height: 10,),
                    _botaoAssinatura(context, servidorManager),
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

  SizedBox _botaoAssinatura(BuildContext context, ServidorManager servidorManager){

    return SizedBox(
      height: 44,
      child: RaisedButton(

        onPressed: () {

          Navigator.of(context).pushNamed(
              '/assinatura',
              arguments: {
                'nomeTabelaColecao': nomeTabelaColecao_Servidores,
                'userTitular': servidorManager.servidorSelecionado.userTitular
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

  Text _mostreStatusAssinatura(Servidor servidor, UsuarioVip usuarioVip){

    String texto = servidor.assinaturaAtiva ? 'Assinatura Ativa' : 'Assinatura Inativa';
    Color cor = servidor.assinaturaAtiva ? Colors.green : Colors.red;

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

  Text _mostreCpfCnpj(Servidor servidor){

    String valor;
    if(servidor == null){
      valor = '';
    }else if(servidor.ehCnpj == null){
      valor = '';
    }else if(servidor.ehCnpj){

      if(servidor.cnpj == null) {
        valor = mascaraCnpj;
      }if(servidor.cnpj == 0){
        valor = mascaraCnpj;
      }else{
        valor = UtilBrasilFields.obterCnpj(servidor.cnpj.toString());
      }

    }else{

      if(servidor.cpf == null) {
        valor = mascaraCpf;
      }if(servidor.cpf == 0){
        valor = mascaraCpf;
      }else{
        valor = UtilBrasilFields.obterCpf(servidor.cpf.toString());
      }

    }

    return mostrarConteudo(valor);

  }

  Padding _mostrarLabelCpfCnpj(Servidor servidor){

    if(servidor == null){
      return mostrarLabel('CPF:');
    }else if(servidor.ehCnpj == null) {
      return mostrarLabel('CPF:');
    }else if(servidor.ehCnpj){
      return mostrarLabel('CNPJ:');
    }

    return mostrarLabel('CPF:');

  }

  SizedBox _botaoContato(BuildContext context, Servidor servidor){

    return SizedBox(
      height: 44,
      child: RaisedButton(

        onPressed: () {

          Navigator.of(context).pushNamed(
              '/contato',
              arguments: {'contato': servidor.getContato()}
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

  SizedBox _botaoLocalizacao(BuildContext context, Servidor servidor){

    return SizedBox(
      height: 44,
      child: RaisedButton(

        onPressed: () {

          Navigator.of(context).pushNamed(
              '/localizacao',
              arguments: {'localizacao': servidor.getLocalizacao()}
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

  Text _mostreNome(Servidor servidor){

    String valor;
    if(servidor == null){
      valor = '';
    }else if(servidor.nome == null) {
      valor = '';
    }else{
      valor = servidor.nome;
    }

    return mostrarConteudo(valor);

  }

  Text _mostreDescricao(Servidor servidor){

    String valor;
    if(servidor == null){
      valor = '';
    }else if(servidor.descricao == null) {
      valor = '';
    }else{
      valor = servidor.descricao;
    }

    return mostrarConteudo(valor);

  }

}
