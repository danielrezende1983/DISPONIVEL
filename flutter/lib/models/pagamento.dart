import 'package:evento_gerente/helpers/obtenha.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class Pagamento extends ChangeNotifier{

  static const num statusPagamentoNaoConfirmadoCodigo = 0;
  static const num statusAguardandoConfirmacaoPagamentoCodigo = 1;
  static const num statusPagamentoConfirmadoCodigo = 2;
  static const num statusPagamentoDesativadoCodigo = 3;

  String idPagamento;
  String userTitular;
  String dataInicio;
  String dataFim;
  num status;
  num valor;
  String mensagem;
  String payId;
  String statusCielo;
  String dataHoraPagamento;
  String dataHoraCancelamento;

  final FirebaseFirestore firestore = FirebaseFirestore.instance;

  Pagamento({this.idPagamento, this.userTitular, this.dataInicio,
             this.dataFim, this.status, this.valor, this.mensagem,
             this.payId, this.statusCielo, this.dataHoraPagamento,
             this.dataHoraCancelamento}){
    valor = valor ?? 0;
    status = status ?? 0;
    mensagem = mensagem ?? '';
    dataFim = dataFim ?? '';
    payId = payId ?? '';
    statusCielo = statusCielo ?? '';
    dataHoraCancelamento = dataHoraCancelamento ?? '';
  }

  Pagamento.fromDocument(DocumentSnapshot document){

    if (document != null && document.data() != null) {

      idPagamento = document.id;
      userTitular = (document.data()['user_titular'] ?? '') as String;
      dataInicio = (document.data()['data_inicio'] ?? '') as String;
      dataFim = (document.data()['data_fim'] ?? '') as String;
      status = (document.data()['status'] ?? 0) as num;
      valor = (document.data()['valor'] ?? 0) as num;
      mensagem = (document.data()['mensagem'] ?? '') as String;
      payId = (document.data()['pay_id'] ?? '') as String;
      statusCielo = (document.data()['status_cielo'] ?? '') as String;
      dataHoraPagamento = (document.data()['data_hora_pagamento'] ?? '') as String;
      dataHoraCancelamento = (document.data()['data_hora_cancelamento'] ?? '') as String;

    }

  }

  Pagamento clone(){
    return Pagamento(
        idPagamento: idPagamento,
        userTitular: userTitular,
        dataInicio: dataInicio,
        dataFim: dataFim,
        status: status,
        mensagem: mensagem,
        valor: valor,
        payId: payId,
        statusCielo: statusCielo,
        dataHoraPagamento: dataHoraPagamento,
        dataHoraCancelamento: dataHoraCancelamento
    );
  }

  bool _prazoValido(){

    final String _dataAtual = obtenhaDataAtualFormatoBD();

    if (dataFim == null){
      return true;
    }else{
      if(_dataAtual.compareTo(dataFim) > 0){
        return false;
      }else{
        return true;
      }
    }

  }

  bool get liberado {
    switch(status){
      case statusPagamentoNaoConfirmadoCodigo:
        return false;
      case statusAguardandoConfirmacaoPagamentoCodigo:
        return _prazoValido();
      case statusPagamentoConfirmadoCodigo:
        return _prazoValido();
      case statusPagamentoDesativadoCodigo:
        return false;
      default:
        return false;
    }
  }

  bool _dataDentroPrazo(){

    if (dataFim == null){
      return false;
    }

    final String _dataAtual = obtenhaDataAtualFormatoBD();

    if(_dataAtual.compareTo(dataFim) > 0){
      return false;
    }else{
      return true;
    }

  }

  bool get podeGerarProximoPagamento {

    if(!_dataDentroPrazo()){
      return true;
    }

    if (payId.isNotEmpty){
      if(status == statusPagamentoNaoConfirmadoCodigo){
        return true;
      }
    }

    return false;

  }

  String get statusDescricao {
    switch(status){
      case statusPagamentoNaoConfirmadoCodigo:
        return 'Pagamento Não Confirmado';
      case statusAguardandoConfirmacaoPagamentoCodigo:
        return 'Aguardando Confirmação Pagamento';
      case statusPagamentoConfirmadoCodigo:
        return 'Pagamento Confirmado';
      case statusPagamentoDesativadoCodigo:
        return 'Pagamento Desativado';
      default:
        return '';
    }
  }

  Color get statusCor {
    switch(status){
      case statusPagamentoNaoConfirmadoCodigo:
        return Colors.red;
      case statusAguardandoConfirmacaoPagamentoCodigo:
        return Colors.blueAccent;
      case statusPagamentoConfirmadoCodigo:
        return Colors.green;
      case statusPagamentoDesativadoCodigo:
        return Colors.orange;
      default:
        return Colors.black;
    }
  }

  Future<void> save(String nomeTabelaColecao) async {

    final Map<String, dynamic> data = {
      'user_titular': userTitular,
      'data_inicio': dataInicio,
      'data_fim': dataFim,
      'valor': valor,
      'mensagem': mensagem,
      'status': status,
      'pay_id': payId,
      'status_cielo': statusCielo,
      'data_hora_pagamento': dataHoraPagamento,
      'data_hora_cancelamento': dataHoraCancelamento
    };

    if(idPagamento == null){

      final doc = await firestore.collection(nomeTabelaColecao)
          .doc(userTitular)
          .collection('meus_pagamentos')
          .add(data);

      idPagamento = doc.id;

    } else {

      await firestore.collection(nomeTabelaColecao)
          .doc(userTitular)
          .collection('meus_pagamentos')
          .doc(idPagamento)
          .update(data);

    }

    notifyListeners();

  }

}