import 'package:brasil_fields/brasil_fields.dart';
import 'package:evento_gerente/helpers/comum_screen.dart';
import 'package:evento_gerente/models/localizacao.dart';
import 'package:flutter/material.dart';

class LocalizacaoScreen extends StatelessWidget {

  const LocalizacaoScreen(this.localizacao);

  final Localizacao localizacao;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Localização'),
      ),
      backgroundColor: Colors.white,
      body: ListView(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                mostrarLabel('CEP:'),
                _mostreCep(),
                mostrarLabel('Estado:'),
                _mostreEstado(),
                mostrarLabel('Cidade:'),
                _mostreCidade(),
                mostrarLabel('Endereço:'),
                _mostreEndereco(),
                const SizedBox(height: 30,)
              ],
            ),
          ),
        ],
      ),
    );
  }

  Text _mostreEndereco(){

    String valor;
    if(localizacao == null){
      valor = '';
    }else if(localizacao.endereco == null) {
      valor = '';
    }else{
      valor = localizacao.endereco;
    }

    return mostrarConteudo(valor);

  }

  Text _mostreCidade(){

    String valor;
    if(localizacao == null){
      valor = '';
    }else if(localizacao.cidade == null) {
      valor = '';
    }else{
      valor = localizacao.cidade;
    }

    return mostrarConteudo(valor);

  }

  Text _mostreEstado(){

    String valor;
    if(localizacao == null){
      valor = '';
    }else if(localizacao.estado == null) {
      valor = '';
    }else{
      valor = localizacao.estado;
    }

    return mostrarConteudo(valor);

  }

  Text _mostreCep(){

    String valor;
    if(localizacao == null){
      valor = '';
    }else if(localizacao.cep == null) {
      valor = '';
    }else if(localizacao.cep == 0){
      valor = '';
    }else if(localizacao.cep.toString().length < 8){
      valor = localizacao.cep.toString();
    }else{
      valor = UtilBrasilFields.obterCep(localizacao.cep.toString());
    }

    return mostrarConteudo(valor);

  }

}
