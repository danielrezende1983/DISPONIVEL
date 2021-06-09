import 'dart:collection';

import 'package:cloud_functions/cloud_functions.dart';
import 'package:evento_gerente/models/cartao_credito.dart';
import 'package:flutter/widgets.dart';

class CieloPayment{

  final functions = CloudFunctions.instance;

  Future<String> authorize({CartaoCredito cartaoCredito, num preco, String idPagamento,
                            String nomeUsuario}) async {

    // 'amount' -> tem que ser informado em centavos;
    // 'amount': (preco * 100).toInt(), -> valor de produção
    // 'amount': (10 * 100).toInt(), -> valor para teste

    // 'softDescriptor' -> no máximo 13 caracters;
    // 'installments' -> número de parcelamento;

    final Map<String, dynamic> dataSale = {
      'merchantOrderId': idPagamento,
      'amount': (preco * 100).toInt(),
      'softDescriptor': 'UseMobi Sis',
      'installments': 1,
      'creditCard': cartaoCredito.toJson(),
      'paymentType': 'CreditCard',
      'nomeUsuario': nomeUsuario
    };

    try{

      final HttpsCallable callable = functions.getHttpsCallable(
          functionName: 'authorizeCreditCard'
      );

      callable.timeout = const Duration(seconds: 60);
      final response = await callable.call(dataSale);
      final retornoCielo = Map<String, dynamic>.from(response.data as LinkedHashMap);

      if (retornoCielo['success'] as bool){
        return retornoCielo['paymentId'] as String;
      }else{
        debugPrint('${retornoCielo['error']['message']}');
        return Future.error(retornoCielo['error']['message']);
      }

    }catch(e){
      debugPrint('$e');
      return Future.error('Falha ao autorizar o pagamento. Tente novamente.');
    }

  }

  Future<void> capture(String payId) async {

    final Map<String, dynamic> captureData = {
      'payId': payId
    };

    try{

      final HttpsCallable callable = functions.getHttpsCallable(
          functionName: 'captureCreditCard'
      );

      callable.timeout = const Duration(seconds: 60);
      final response = await callable.call(captureData);
      final retornoCielo = Map<String, dynamic>.from(response.data as LinkedHashMap);

      if (retornoCielo['success'] as bool){
        debugPrint('Captura realizada com sucesso.');
      }else{
        debugPrint('${retornoCielo['error']['message']}');
        return Future.error(retornoCielo['error']['message']);
      }

    }catch(e){
      debugPrint('$e');
      return Future.error('Falha ao capturar pagamento. Tente novamente.');
    }

  }

  Future<void> cancel(String payId) async {

    final Map<String, dynamic> cancelData = {
      'payId': payId
    };

    try{

      final HttpsCallable callable = functions.getHttpsCallable(
          functionName: 'cancelCreditCard'
      );

      callable.timeout = const Duration(seconds: 60);
      final response = await callable.call(cancelData);
      final retornoCielo = Map<String, dynamic>.from(response.data as LinkedHashMap);

      if (retornoCielo['success'] as bool){
        debugPrint('Cancelamento realizado com sucesso.');
      }else{
        debugPrint('${retornoCielo['error']['message']}');
        return Future.error(retornoCielo['error']['message']);
      }

    }catch(e){
      debugPrint('$e');
      return Future.error('Falha ao cancelar pagamento. Tente novamente.');
    }

  }

}