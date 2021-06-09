import 'package:evento_gerente/comuns/custom_drawer/custom_drawer.dart';
import 'package:evento_gerente/helpers/comum_screen.dart';
import 'package:evento_gerente/models/user_manager.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class PerfilScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Consumer<UserManager>(
        builder: (_, userManager, __){
          return Scaffold(
            drawer: CustomDrawer(),
            appBar: AppBar(
              title: const Text('Perfil'),
            ),
            backgroundColor: Colors.white,
            body: ListView(
              children: <Widget>[
                Container(
                  height: 350,
                  // decoration: BoxDecoration(
                  //   image: mostrarListaImagensDecorationImage(
                  //       userManager?.perfilServidor?.images ?? [],
                  //       'images/usuarios_013_500.png'
                  //   ),
                  // ),
                ),
                Padding(
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: <Widget>[
                      mostrarLabel('Nome:'),
                      _mostreNome(userManager),
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

  Text _mostreNome(UserManager userManager){

    String valor;
    if(userManager == null){
      valor = '';
    }else if(userManager.usuario == null){
      valor = '';
    }else if(userManager.usuario.nome == null){
      valor = '';
    }else{
      valor = userManager.usuario.nome;
    }

    return mostrarConteudo(valor);

  }

}
