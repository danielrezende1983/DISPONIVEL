import 'package:evento_gerente/models/assinatura.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class AssinaturaManager extends ChangeNotifier{

  AssinaturaManager() {
    //allServicoNoiva = null;
  }

  final FirebaseFirestore firestore = FirebaseFirestore.instance;
  Assinatura assinaturaSelecionada;

  bool _loading = false;
  bool get loading => _loading;
  set loading(bool value){
    _loading = value;
    notifyListeners();
  }

  Future<void> carregueAssinatura(String nomeTabelaColecao, String userTitular) async {

    final Assinatura assinatura = Assinatura();
    assinaturaSelecionada = await assinatura.consulta(nomeTabelaColecao, userTitular);
    notifyListeners();

  }

  void update(Assinatura assinatura){

    assinaturaSelecionada = assinatura;
    notifyListeners();

  }

  Future<void> save(String nomeTabelaColecao, Assinatura assinatura) async {

    loading = true;
    notifyListeners();

    await assinatura.save(nomeTabelaColecao);
    update(assinatura);

    loading = false;
    notifyListeners();

  }

}