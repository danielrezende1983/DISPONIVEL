import 'package:evento_gerente/models/cartao_credito_manager.dart';
import 'package:evento_gerente/screens/cartao_credito/componentes/card_text_fild.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CardBack extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    return _cartao();

  }

  Card _cartao(){

    return Card(
      clipBehavior: Clip.antiAlias,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      elevation: 16,
      child: Container(
        height: 200,
        color: const Color(0xFF1B4B52),
        child: Column(
          //crossAxisAlignment: CrossAxisAlignment.end,
          children: <Widget>[
            _faixaMagnetica(),
            _faixaSinza(),
          ],
        ),
      ),
    );

  }

  Container _faixaMagnetica(){

    return Container(
      color: Colors.black,
      height: 40,
      margin: const EdgeInsets.symmetric(vertical: 16),
    );

  }

  Row _faixaSinza(){

    return Row(
      //crossAxisAlignment: CrossAxisAlignment.end,
      children: <Widget>[
        Expanded(
          flex: 70,
          child: Container(
            color: Colors.grey[500],
            margin: const EdgeInsets.only(left: 12),
            padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 8),
            //alignment: Alignment.centerRight,
            child: _campoCodigoSeguranca(),
          ),
        ),
        Expanded(
          flex: 30,
          child: Container(),
        ),
      ],
    );

  }

  Consumer _campoCodigoSeguranca(){

    return Consumer<CartaoCreditoManager>(
        builder: (_, cartaoCreditoManager, __){

          String valor;
          if(cartaoCreditoManager == null){
            valor = '000';
          }else if(cartaoCreditoManager.cartaoSelecionado == null){
            valor = '000';
          }else if(cartaoCreditoManager.cartaoSelecionado.codigoSeguranca == null){
            valor = '000';
          }else if(cartaoCreditoManager.cartaoSelecionado.codigoSeguranca.isEmpty == null){
            valor = '000';
          }else{
            valor = cartaoCreditoManager?.cartaoSelecionado?.codigoSeguranca ?? '000';
          }

          return CardTextFild(
            negrito: true,
            textAlign: TextAlign.end,
            conteudo: valor,
            alinhamentoColuna: CrossAxisAlignment.end
          );

        }
    );

  }

}
