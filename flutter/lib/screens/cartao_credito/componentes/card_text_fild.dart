import 'package:evento_gerente/helpers/funcoes_strings.dart';
import 'package:flutter/material.dart';

class CardTextFild extends StatelessWidget {

  const CardTextFild({
    this.title,
    this.conteudo,
    this.negrito,
    this.textAlign = TextAlign.start,
    this.alinhamentoColuna = CrossAxisAlignment.start
  });

  final String title;
  final String conteudo;
  final bool negrito;
  final TextAlign textAlign;
  final CrossAxisAlignment alinhamentoColuna;

  @override
  Widget build(BuildContext context) {

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 2),
      child: Column(
        crossAxisAlignment: alinhamentoColuna,
        children: <Widget>[
          if(title != null) _label(),
          _labelConteudo(),
        ],
      ),
    );

  }

  Text _labelConteudo(){

    return Text(
      truncar(conteudo, 30),
      style: TextStyle(
        fontSize: 13,
        fontWeight: negrito ? FontWeight.bold : FontWeight.w500,
        color: Colors.white,
      ),
      textAlign: textAlign,
    );

  }

  Text _label(){

    return Text(
      title ?? '',
      style: const TextStyle(
        fontSize: 13,
        fontWeight: FontWeight.w400,
        color: Colors.white,
      ),
    );

  }

}
