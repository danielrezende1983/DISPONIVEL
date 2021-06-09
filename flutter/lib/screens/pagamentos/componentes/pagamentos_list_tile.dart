import 'package:evento_gerente/helpers/formato.dart';
import 'package:evento_gerente/models/pagamento.dart';
import 'package:evento_gerente/models/pagamento_manager.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class PagamentoListTile extends StatelessWidget {

  const PagamentoListTile(this.pagamento, this.nomeTabelaColecao);

  final Pagamento pagamento;
  final String nomeTabelaColecao;

  @override
  Widget build(BuildContext context) {

    return _corpo(context);

  }

  Consumer _corpo(BuildContext context){

    return Consumer<PagamentoManager>(
        builder: (_, pagamentoManager, __){

          return GestureDetector(
            onTap: (){

              pagamentoManager.pagamentoSelecionado = pagamento;
              Navigator.of(context).pushNamed(
                  '/servidor_pagamento',
                  arguments: {
                    'nomeTabelaColecaoVip': nomeTabelaColecao
                  }
              );

            },
            child: Card(
              shape:  RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8)
              ),
              child: Container(
                height: 100,
                padding: const EdgeInsets.all(8),
                child: Row(
                  children: <Widget>[
                    Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          '${formatoDataBDParaTela(pagamento.dataInicio)} - ${formatoDataBDParaTela(pagamento.dataFim)}',
                          style: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w800,
                          ),
                        ),
                        Text(
                          'R\$ ${pagamento.valor.toStringAsFixed(2)}',
                          style: TextStyle(
                            fontWeight: FontWeight.w800,
                            color: pagamento.valor == 0 ? Colors.grey : Colors.green,
                            fontSize: 15,
                          ),
                        ),
                        Text(
                          pagamento.statusDescricao,
                          style: TextStyle(
                            fontWeight: FontWeight.w800,
                            color: pagamento.statusCor,
                            fontSize: 15,
                          ),
                        ),
                        Text(
                          pagamento.dataHoraCancelamento.isEmpty ? pagamento.dataHoraPagamento : pagamento.dataHoraCancelamento,
                          style: const TextStyle(
                            fontSize: 10,
                            fontWeight: FontWeight.w800,
                          ),
                        ),
                        Text(
                          pagamento.idPagamento,
                          style: const TextStyle(
                            fontSize: 10,
                            fontWeight: FontWeight.w800,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          );

        }
    );

  }

}
