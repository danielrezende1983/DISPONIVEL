import 'package:evento_gerente/screens/cartao_credito/componentes/card_back.dart';
import 'package:evento_gerente/screens/cartao_credito/componentes/card_front.dart';
import 'package:flip_card/flip_card.dart';
import 'package:flutter/material.dart';

class CartaoCreditoWidget extends StatelessWidget {

  final GlobalKey<FlipCardState> cardKey = GlobalKey<FlipCardState>();

  @override
  Widget build(BuildContext context) {

    return _corpo(context);

  }

  Padding _corpo(BuildContext context){

    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 16, 16, 8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: <Widget>[
          _cartaoCredito(),
          _botaoVirarCartao(context),
        ],
      ),
    );

  }

  FlipCard _cartaoCredito(){

    return FlipCard(
      key: cardKey,
      //direction: FlipDirection.HORIZONTAL,
      flipOnTouch: false,
      speed: 700,
      front: CardFront(),
      back: CardBack(),
    );

  }

  FlatButton _botaoVirarCartao(BuildContext context){

    return FlatButton(
        onPressed: (){
          cardKey.currentState.toggleCard();
        },
        //padding: EdgeInsets.zero,
        textColor: Theme.of(context).primaryColor,
        child: const Text('Virar Cartão')
    );

  }

}
