import 'package:evento_gerente/models/cartao_credito_manager.dart';
import 'package:evento_gerente/screens/cartao_credito/componentes/card_text_fild.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CardFront extends StatelessWidget {

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
        padding: const EdgeInsets.all(24),
        child: Row(
          children: <Widget>[
            _campos(),
          ],
        ),
      ),
    );

  }

  Expanded _campos(){

    return Expanded(
      child: Consumer<CartaoCreditoManager>(
        builder: (_, cartaoCreditoManager, __){

          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              _numero(cartaoCreditoManager),
              _dataValidade(cartaoCreditoManager),
              _titular(cartaoCreditoManager),
            ],
          );

        },
      ),
    );

  }

  CardTextFild _numero(CartaoCreditoManager cartaoCreditoManager){

    String valor;
    if(cartaoCreditoManager == null){
      valor = '0000 0000 0000 0000';
    }else if(cartaoCreditoManager.cartaoSelecionado == null){
      valor = '0000 0000 0000 0000';
    }else if(cartaoCreditoManager.cartaoSelecionado.numero == null){
      valor = '0000 0000 0000 0000';
    }else if(cartaoCreditoManager.cartaoSelecionado.numero.isEmpty == null){
      valor = '0000 0000 0000 0000';
    }else{
      valor = cartaoCreditoManager?.cartaoSelecionado?.numero ?? '0000 0000 0000 0000';
    }

    return CardTextFild(
      title: 'Número',
      conteudo: valor,
      negrito: true
    );

  }

  CardTextFild _dataValidade(CartaoCreditoManager cartaoCreditoManager){

    String valor;
    if(cartaoCreditoManager == null){
      valor = '00/0000';
    }else if(cartaoCreditoManager.cartaoSelecionado == null){
      valor = '00/0000';
    }else if(cartaoCreditoManager.cartaoSelecionado.dataValidade == null){
      valor = '00/0000';
    }else if(cartaoCreditoManager.cartaoSelecionado.dataValidade.isEmpty == null){
      valor = '00/0000';
    }else{
      valor = cartaoCreditoManager?.cartaoSelecionado?.dataValidade ?? '00/0000';
    }

    return CardTextFild(
      title: 'Validade',
      conteudo: valor,
      negrito: false
    );

  }

  CardTextFild _titular(CartaoCreditoManager cartaoCreditoManager){

    String valor;
    if(cartaoCreditoManager == null){
      valor = 'Nome do titular';
    }else if(cartaoCreditoManager.cartaoSelecionado == null){
      valor = 'Nome do titular';
    }else if(cartaoCreditoManager.cartaoSelecionado.nome == null){
      valor = 'Nome do titular';
    }else if(cartaoCreditoManager.cartaoSelecionado.nome.isEmpty == null){
      valor = 'Nome do titular';
    }else{
      valor = cartaoCreditoManager?.cartaoSelecionado?.nome ?? 'Nome do titular';
    }

    return CardTextFild(
      title: 'Titular',
      conteudo: valor,
      negrito: true
    );

  }

}

