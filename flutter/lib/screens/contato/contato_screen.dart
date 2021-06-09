import 'package:evento_gerente/helpers/comum_screen.dart';
import 'package:evento_gerente/helpers/formato.dart';
import 'package:evento_gerente/models/contato.dart';
import 'package:flutter/material.dart';

class ContatoScreen extends StatelessWidget {

  const ContatoScreen(this.contato);

  final Contato contato;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Contato'),
      ),
      backgroundColor: Colors.white,
      body: ListView(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                mostrarLabel('Email:'),
                _mostreEmail(),
                mostrarLabel('Telefone 1:'),
                _mostreTelefone1(),
                mostrarLabel('Telefone 2:'),
                _mostreTelefone2(),
                mostrarLabel('Instagram:'),
                _mostreInstagram(context),
                mostrarLabel('Site:'),
                _mostreSite(context, ),
                const SizedBox(height: 30,)
              ],
            ),
          ),
        ],
      ),
    );
  }

  GestureDetector _mostreSite(BuildContext context){

    String valor;
    if(contato == null){
      valor = '';
    }else if(contato.site == null) {
      valor = '';
    }else{
      valor = contato.site;
    }

    return mostrarConteudoDeLink(context, valor);

  }

  GestureDetector _mostreInstagram(BuildContext context){

    String valor;
    if(contato == null){
      valor = '';
    }else if(contato.instagram == null) {
      valor = '';
    }else{
      valor = contato.instagram;
    }

    return mostrarConteudoDeLink(context, valor);

  }

  Text _mostreEmail(){

    String valor;
    if(contato == null){
      valor = '';
    }else if(contato.emailContato == null) {
      valor = '';
    }else{
      valor = contato.emailContato;
    }

    return mostrarConteudo(valor);

  }

  Text _mostreTelefone2(){

    String valor;
    if(contato == null){
      valor = '';
    }else if(contato.telefone2 == null) {
      valor = '';
    }else if(contato.telefone2 == 0){
      valor = '';
    }else{
      valor = contato.telefone2.toString();
    }

    return mostrarConteudo(formatoTelefone(valor));

  }

  Text _mostreTelefone1(){

    String valor;
    if(contato == null){
      valor = '';
    }else if(contato.telefone1 == null) {
      valor = '';
    }else if(contato.telefone1 == 0){
      valor = '';
    }else{
      valor = contato.telefone1.toString();
    }

    return mostrarConteudo(formatoTelefone(valor));

  }

}
