import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:credit_card_type_detector/credit_card_type_detector.dart';
import 'package:flutter/material.dart';

class CartaoCredito extends ChangeNotifier{

  final FirebaseFirestore firestore = FirebaseFirestore.instance;

  String idCartao;
  String userTitular;
  String nome;
  String numero;
  String dataValidade;
  String codigoSeguranca;
  String bandeira;

  void setUserTitular(String valor) => userTitular = valor;
  void setNome(String valor) => nome = valor;
  void setCodigoSeguranca(String valor) => codigoSeguranca = valor;
  void setDataValidade(String valor) => dataValidade = valor;
  void setNumero(String valor) {
    numero = valor;
    bandeira = detectCCType(valor.replaceAll(' ', '')).toString().toUpperCase().split(".").last;
  }

  Map<String, dynamic> toJson(){
    return {
      'cardNumber': numero.replaceAll(' ', ''),
      'holder': nome,
      'expirationDate': dataValidade,
      'securityCode': codigoSeguranca,
      'brand': bandeira
    };
  }

  CartaoCredito({this.numero, this.nome, this.userTitular,
                 this.dataValidade, this.codigoSeguranca,
                 this.bandeira}){
    idCartao = userTitular;
  }

  CartaoCredito clone(){
    return CartaoCredito(
        userTitular: userTitular,
        nome: nome,
        numero: numero,
        dataValidade: dataValidade,
        bandeira: bandeira,
        codigoSeguranca: codigoSeguranca
    );
  }

  CartaoCredito.fromDocument(DocumentSnapshot document){

    if (document != null && document.data() != null) {

      idCartao = document.id;
      nome = (document.data()['nome'] ?? '') as String;
      userTitular = (document.data()['user_titular'] ?? '') as String;
      numero = (document.data()['numero'] ?? '') as String;
      codigoSeguranca = (document.data()['codigo_seguranca'] ?? '') as String;
      dataValidade = (document.data()['data_validade'] ?? '') as String;
      bandeira = (document.data()['bandeira'] ?? '') as String;

      bandeira = bandeira.toUpperCase().split(".").last;

    }

  }

  Future<void> save() async {

    final Map<String, dynamic> data = {

      'user_titular': userTitular,
      'nome': nome,
      'numero': numero,
      'codigo_seguranca': codigoSeguranca,
      'bandeira': bandeira,
      'data_validade': dataValidade

    };

    await firestore.doc('cartao_credito/$userTitular').set(data);

    notifyListeners();

  }

}