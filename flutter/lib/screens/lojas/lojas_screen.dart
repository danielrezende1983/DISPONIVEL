import 'package:evento_gerente/models/loja_manager.dart';
import 'package:evento_gerente/models/servidor_manager.dart';
import 'package:evento_gerente/models/user_manager.dart';
import 'package:evento_gerente/screens/base/componentes/search_dialog.dart';
import 'package:evento_gerente/screens/lojas/componentes/loja_list_tile.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

enum OrderOptions {atualizar}

class LojasScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Consumer<ServidorManager>(
          builder: (_, servidorManager, __){
            if (servidorManager.search.isEmpty){
              return const Text('Lojas');
            }else{
              return LayoutBuilder(
                  builder: (_, constraints){
                    return GestureDetector(
                      onTap: () async {
                        final search = await showDialog<String>(
                            context: context,
                            builder: (_) => SearchDialog(servidorManager.search)
                        );
                        if (search != null){
                          servidorManager.search = search;
                        }
                      },
                      // ignore: sized_box_for_whitespace
                      child: Container(
                          width: constraints.biggest.width,
                          child: Text(
                            servidorManager.search,
                            textAlign: TextAlign.center,
                          )
                      ),
                    );
                  }
              );
            }
          },
        ),
        centerTitle: true,
        actions: <Widget>[
          Consumer<ServidorManager>(
              builder: (_, servidorManager, __){
                if(servidorManager.search.isEmpty){
                  return IconButton(
                    icon: const Icon(Icons.search),
                    onPressed: () async {
                      final search = await showDialog<String>(
                          context: context,
                          builder: (_) => SearchDialog(servidorManager.search)
                      );
                      if (search != null){
                        servidorManager.search = search;
                      }
                    },
                  );
                }else{
                  return IconButton(
                    icon: const Icon(Icons.close),
                    onPressed: () async {
                      servidorManager.search = '';
                    },
                  );
                }
              }
          ),
          Consumer2<UserManager, ServidorManager>(
              builder: (_, userManager, servidorManager, __){
                return PopupMenuButton<OrderOptions>(
                  itemBuilder: (context) => <PopupMenuEntry<OrderOptions>>[
                    const PopupMenuItem<OrderOptions>(
                      value: OrderOptions.atualizar,
                      child: ListTile(
                        leading: Icon(Icons.refresh),
                        title: Text('Atualizar'),
                      ),
                    ),
                  ],
                  onSelected: (OrderOptions opcaoSelecionada) {
                    switch(opcaoSelecionada){
                      case OrderOptions.atualizar:
                        servidorManager.atualizar = true;
                        break;
                    }
                  },
                );
              }
          ),
        ],
      ),
      body: Consumer<LojaManager>(
        builder: (_, lojaManager, __){

          final listaLojas = lojaManager.listaFiltrada();

          return ListView.builder(
              padding: const EdgeInsets.all(4),
              itemCount: listaLojas.length,
              itemBuilder: (_, index){
                return LojaListTile(listaLojas[index]);
              }
          );

        },
      ),
    );
  }
}
