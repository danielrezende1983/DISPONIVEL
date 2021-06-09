import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:evento_gerente/models/loja.dart';
import 'package:flutter/material.dart';

class LojaManager extends ChangeNotifier{

  LojaManager(){
    //_loadAllServico();
  }

  final FirebaseFirestore firestore = FirebaseFirestore.instance;
  List<Loja> allLoja = [];
  Loja lojaSelecionada;

  String _search = '';
  String get search => _search;
  set search(String value){
    _search = value;
    notifyListeners();
  }

  bool _atualizar = false;
  bool get atualizar => _atualizar;
  set atualizar(bool value){
    _atualizar = value;
    notifyListeners();
  }

  bool _loading = false;
  bool get loading => _loading;
  set loading(bool value){
    _loading = value;
    notifyListeners();
  }

  List<Loja> listaFiltrada(){

    _carregaTodosServidores();

    final List<Loja> lista = [];

    if (search.isEmpty){

      lista.addAll(allLoja);

    }else{

      lista.addAll(allLoja.where(
              (item) {
                return item.nome.toLowerCase().contains(search.toLowerCase());
              })
      );

    }

    allLoja.sort((a, b) => a.nome.compareTo(b.nome));
    return lista;

  }

  Future<void> _carregaTodosServidores() async {

    if(allLoja == null || allLoja.isEmpty || atualizar){

        final QuerySnapshot snapDoc = await firestore.collection('loja').get();

        allLoja = snapDoc.docs.map((d) => Loja.fromDocument(d)).toList();

        atualizar = false;
        notifyListeners();

    }

  }

  void update(Loja loja){

    lojaSelecionada = loja;

    allLoja.removeWhere((item) => item.idLoja == loja.idLoja);
    allLoja.add(loja);
    notifyListeners();

  }


  Future<void> atualizaAtividadeAssinatura() async {

    await lojaSelecionada.atualizaAtividadeAssinatura();
    notifyListeners();

  }

}