import 'package:evento_gerente/comuns/custom_drawer/custom_drawer.dart';
import 'package:evento_gerente/helpers/validators.dart';
import 'package:evento_gerente/models/user_manager.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MenuServidoresScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Consumer<UserManager>(
        builder: (_, userManager, __){
          return Scaffold(
            drawer: CustomDrawer(),
            appBar: AppBar(
              title: const Text('Menu Servidores'),
            ),
            backgroundColor: Colors.white,
            body: ListView(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: <Widget>[
                      _botaoListaTodosServidores(context, userManager),
                      const SizedBox(height: 30,)
                    ],
                  ),
                ),
              ],
            ),
          );
        }
    );
  }

  SizedBox _botaoListaTodosServidores(BuildContext context, UserManager userManager){

    return SizedBox(
      height: 44,
      child: RaisedButton(
        onPressed: () async {

          if (usuarioEhGerente(context, userManager)){
            Navigator.of(context).pushNamed('/servidores');
          }

        },
        color: Theme.of(context).primaryColor,
        textColor: Colors.white,
        child: const Text(
          'LISTA TODOS SERVIDORES',
          style: TextStyle(fontSize: 16),
        ),
      ),
    );

  }

}
