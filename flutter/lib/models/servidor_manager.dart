import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:evento_gerente/models/servidor.dart';
import 'package:flutter/material.dart';

class ServidorManager extends ChangeNotifier{

  ServidorManager(){
    //_loadAllServico();
  }

  final FirebaseFirestore firestore = FirebaseFirestore.instance;
  List<Servidor> allServidor = [];
  Servidor servidorSelecionado;

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

  List<Servidor> listaFiltrada(){

    _carregaTodosServidores();

    final List<Servidor> lista = [];

    if (search.isEmpty){

      lista.addAll(allServidor);

    }else{

      lista.addAll(allServidor.where(
              (item) {
                return item.nome.toLowerCase().contains(search.toLowerCase());
              })
      );

    }

    allServidor.sort((a, b) => a.nome.compareTo(b.nome));
    return lista;

  }

  Future<void> _carregaTodosServidores() async {

    if(allServidor == null || allServidor.isEmpty || atualizar){

        final QuerySnapshot snapDoc = await firestore.collection('servidores').get();

        allServidor = snapDoc.docs.map((d) => Servidor.fromDocument(d)).toList();

        atualizar = false;
        notifyListeners();

    }

  }

  void update(Servidor servidor){

    servidorSelecionado = servidor;

    allServidor.removeWhere((item) => item.idServidor == servidor.idServidor);
    allServidor.add(servidor);
    notifyListeners();

  }


  Future<void> atualizaAtividadeAssinatura() async {

    await servidorSelecionado.atualizaAtividadeAssinatura();
    notifyListeners();

  }

}