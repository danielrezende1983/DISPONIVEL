import 'package:evento_gerente/helpers/obtenha.dart';
import 'package:evento_gerente/models/cartao_credito.dart';
import 'package:evento_gerente/models/pagamento.dart';
import 'package:evento_gerente/services/cielo_payment.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class PagamentoManager extends ChangeNotifier{

  PagamentoManager() {
    //allServicoNoiva = null;
  }

  final CieloPayment cieloPayment = CieloPayment();
  final FirebaseFirestore firestore = FirebaseFirestore.instance;
  List<Pagamento> allPagamentos = [];
  Pagamento pagamentoSelecionado;

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

  Future<void> _carregueTodos(String nomeTabelaColecao, String userTitular) async {

    if(allPagamentos == null || allPagamentos.isEmpty || atualizar){

      final QuerySnapshot snapDoc = await firestore.collection(nomeTabelaColecao)
          .doc(userTitular)
          .collection('meus_pagamentos')
          .get();

      allPagamentos = snapDoc.docs.map((item) => Pagamento.fromDocument(item)).toList();

      atualizar = false;
      notifyListeners();

    }

  }

  Future<List<Pagamento>> carregueListaOrdenadaOrdemDecrescente(String nomeTabelaColecao, String userTitular) async {

    final List<Pagamento> listaOrdenada = [];

    atualizar = true;
    await _carregueTodos(nomeTabelaColecao, userTitular);

    listaOrdenada.addAll(allPagamentos);

    listaOrdenada.sort((a, b) => b.dataInicio.compareTo(a.dataInicio));

    return listaOrdenada;

  }

  List<Pagamento> listaFiltrada(String nomeTabelaColecao, String userTitular){

    final List<Pagamento> listaFiltrada = [];

    _carregueTodos(nomeTabelaColecao, userTitular);

    listaFiltrada.addAll(allPagamentos);

    listaFiltrada.sort((a, b) => b.dataHoraPagamento.compareTo(a.dataHoraPagamento));
    return listaFiltrada;

  }

  void update(Pagamento pagamento){

    pagamentoSelecionado = pagamento;

    allPagamentos.removeWhere((item) => item.idPagamento == pagamento.idPagamento);
    allPagamentos.add(pagamento);
    notifyListeners();

  }

  Future<void> save(String nomeTabelaColecao, Pagamento pagamento) async {

    loading = true;
    notifyListeners();

    await pagamento.save(nomeTabelaColecao);

    update(pagamento);

    loading = false;
    notifyListeners();

  }

  Future<void> efetivandoPagamento(String nomeTabelaColecao, CartaoCredito cartaoCredito, Pagamento pagamento,
                                   String nome, {Function onPayFail, Function onPaySuccess}) async {

    loading = true;
    notifyListeners();

    String payId;
    bool autorizado = false;

    try{

      payId = await cieloPayment.authorize(
          cartaoCredito: cartaoCredito,
          preco: pagamento.valor,
          idPagamento: pagamento.idPagamento,
          nomeUsuario: nome
      );

      pagamento.status = Pagamento.statusAguardandoConfirmacaoPagamentoCodigo;
      pagamento.mensagem = '';
      pagamento.payId = payId;
      pagamento.statusCielo = 'Pagamento Autorizado';
      autorizado = true;

    }catch(e){
      pagamento.status = Pagamento.statusPagamentoNaoConfirmadoCodigo;
      pagamento.mensagem = '$e';
      pagamento.payId = '';
      pagamento.statusCielo = 'Pagamento Não Autorizado';
      onPayFail(e);
    }

    pagamento.dataHoraPagamento = obtenhaDataHoraAtualFormatoBD();
    pagamento.dataHoraCancelamento = '';
    await pagamento.save(nomeTabelaColecao);
    update(pagamento);

    if (!autorizado) {
      loading = false;
      return;
    }

    try{

      await cieloPayment.capture(payId);

      pagamento.status = Pagamento.statusPagamentoConfirmadoCodigo;
      pagamento.mensagem = '';
      pagamento.statusCielo = 'Pagamento Capturado';

    }catch(e){
      cieloPayment.cancel(payId);
      pagamento.status = Pagamento.statusPagamentoNaoConfirmadoCodigo;
      pagamento.mensagem = '$e';
      pagamento.statusCielo = 'Pagamento Não Capturado';
      onPayFail(e);
    }

    pagamento.dataHoraPagamento = obtenhaDataHoraAtualFormatoBD();
    pagamento.dataHoraCancelamento = '';
    await pagamento.save(nomeTabelaColecao);
    update(pagamento);

    onPaySuccess();
    loading = false;
    notifyListeners();

  }

  Future<void> cancelarPagamentoCielo(String nomeTabelaColecao, Pagamento pagamento, {Function onPayFail, Function onPaySuccess}) async {

    loading = true;
    notifyListeners();

    try{

      await CieloPayment().cancel(pagamento.payId);

      pagamento.status = Pagamento.statusPagamentoNaoConfirmadoCodigo;
      pagamento.mensagem = 'Pagamento Cancelado';
      pagamento.statusCielo = 'Pagamento Cancelado';

    }catch(e){
      pagamento.mensagem = '$e';
      onPayFail(e);
    }

    pagamento.dataHoraCancelamento = obtenhaDataHoraAtualFormatoBD();
    await pagamento.save(nomeTabelaColecao);
    update(pagamento);

    onPaySuccess();
    loading = false;
    notifyListeners();

  }

  Future<void> cancelarPagamentoGerente(String nomeTabelaColecao, Pagamento pagamento, {Function onPayFail, Function onPaySuccess}) async {

    loading = true;
    notifyListeners();

    try{

      pagamento.status = Pagamento.statusPagamentoNaoConfirmadoCodigo;
      pagamento.mensagem = 'Pagamento Cancelado';

    }catch(e){
      pagamento.mensagem = '$e';
      onPayFail(e);
    }

    pagamento.dataHoraCancelamento = obtenhaDataHoraAtualFormatoBD();
    await pagamento.save(nomeTabelaColecao);
    update(pagamento);

    onPaySuccess();
    loading = false;
    notifyListeners();

  }

}