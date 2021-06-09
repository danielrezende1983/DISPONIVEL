import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:evento_gerente/models/cartao_credito.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CartaoCreditoManager extends ChangeNotifier{

  CartaoCreditoManager(){
    //_carregueCartao();
  }

  final FirebaseFirestore firestore = FirebaseFirestore.instance;
  CartaoCredito cartaoSelecionado;

  bool _loading = false;
  bool get loading => _loading;
  set loading(bool value){
    _loading = value;
    notifyListeners();
  }

  Future<void> carregueCartao(String userTitular) async {

    if(cartaoSelecionado == null){

      try{

        final DocumentReference firestoreRef = firestore.doc('cartao_credito/$userTitular');

        final DocumentSnapshot docSnapshot = await firestoreRef.get();
        cartaoSelecionado = CartaoCredito.fromDocument(docSnapshot);

      }catch(ex){
        cartaoSelecionado = null;
      }

    }

    notifyListeners();

  }

  Future<void> save(CartaoCredito cartao) async {

    loading = true;
    notifyListeners();

    await cartao.save();

    cartaoSelecionado = cartao;

    loading = false;
    notifyListeners();

  }

}