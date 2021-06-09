import 'package:evento_gerente/helpers/obtenha.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class Assinatura extends ChangeNotifier{

  static const num statusCancelada = 0;
  static const num statusAtivada = 1;

  String idAssinatura;
  String userTitular;
  String dataAtivacao;
  String dataCancelamento;
  num status;
  num valor;

  final FirebaseFirestore firestore = FirebaseFirestore.instance;

  Assinatura({this.idAssinatura, this.userTitular, this.dataAtivacao,
              this.dataCancelamento, this.status, this.valor}){
    valor = valor ?? 0;
    status = status ?? 0;
  }

  Assinatura.fromDocument(DocumentSnapshot document){

    if (document != null && document.data() != null) {

      idAssinatura = document.id;
      userTitular = (document.data()['user_titular'] ?? '') as String;
      dataAtivacao = (document.data()['data_ativacao'] ?? '') as String;
      dataCancelamento = (document.data()['data_cancelamento'] ?? '') as String;
      status = (document.data()['status'] ?? 0) as num;
      valor = (document.data()['valor'] ?? 0) as num;

    }

  }

  Assinatura clone(){
    return Assinatura(
        idAssinatura: idAssinatura,
        userTitular: userTitular,
        dataAtivacao: dataAtivacao,
        dataCancelamento: dataCancelamento,
        status: status,
        valor: valor
    );
  }

  bool _prazoValido(){

    final String _dataAtual = obtenhaDataAtualFormatoBD();

    if (dataCancelamento.isNotEmpty){
      return false;
    }else{

      if(dataAtivacao.isEmpty) {
        return false;
      }else if(_dataAtual.compareTo(dataAtivacao) < 0) {
        return false;
      }else{
        return true;
      }

    }

  }

  bool get liberada {
    switch(status){
      case statusCancelada:
        return false;
      case statusAtivada:
        return _prazoValido();
      default:
        return false;
    }
  }

  String get statusDescricao {
    switch(status){
      case statusCancelada:
        return 'Assinatura Cancelada';
      case statusAtivada:
        return 'Assinatura Ativa';
      default:
        return 'AINDA NÃO FEZ ASSINATURA';
    }
  }

  Color get statusCor {
    switch(status){
      case statusCancelada:
        return Colors.red;
      case statusAtivada:
        return Colors.green;
      default:
        return Colors.purple;
    }
  }

  Future<void> save(String nomeTabelaColecao) async {

    final Map<String, dynamic> data = {
      'user_titular': userTitular,
      'data_ativacao': dataAtivacao,
      'data_cancelamento': dataCancelamento,
      'valor': valor,
      'status': status
    };

    await firestore.collection(nomeTabelaColecao)
        .doc(userTitular)
        .collection('assinatura')
        .doc(userTitular)
        .set(data);

    notifyListeners();

  }

  Future<Assinatura> consulta(String nomeTabelaColecao, String userTitular) async {

    try{

      final DocumentSnapshot docSnapshot = await firestore.doc('$nomeTabelaColecao/$userTitular/assinatura/$userTitular').get();
      return Assinatura.fromDocument(docSnapshot);

    }catch(ex){
      return null;
    }

  }

}