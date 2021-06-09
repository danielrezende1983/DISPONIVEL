import 'package:evento_gerente/models/page_manager.dart';
import 'package:evento_gerente/screens/menu_loja/menu_loja_screen.dart';
import 'package:evento_gerente/screens/menu_servidores/menu_servidores_screen.dart';
import 'package:evento_gerente/screens/perfil/perfil_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class BaseScreen extends StatelessWidget{

  final PageController pageController = PageController();

  @override
  Widget build(BuildContext context) {
    return Provider(
      create: (_) => PageManager(pageController),
      child: PageView(
        controller: pageController,
        physics: const NeverScrollableScrollPhysics(),
        children: <Widget>[
          PerfilScreen(),
          MenuServidoresScreen(),
          MenuLojasScreen(),
        ]
      ),
    );
  }

}
