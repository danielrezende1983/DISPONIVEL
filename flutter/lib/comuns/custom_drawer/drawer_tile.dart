import 'package:evento_gerente/models/page_manager.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class DrawerTile extends StatelessWidget{

  const DrawerTile({this.dadosIcone, this.titulo, this.pagina});

  final IconData dadosIcone;
  final String titulo;
  final int pagina;

  @override
  Widget build(BuildContext context) {

    final int paginaAtual = context.watch<PageManager>().pagina;
    final Color corPrimaria = Theme.of(context).primaryColor;

    return InkWell(
      onTap: () {
        context.read<PageManager>().setPage(pagina);
      },
      child: SizedBox(
        height: 60,
        child: Row(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 32),
              child: Icon(
                dadosIcone,
                size: 32,
                color: paginaAtual == pagina ? corPrimaria : Colors.grey[800],
              ),
            ),
            Text(
              titulo,
              style: TextStyle(
                fontSize: 16,
                color: paginaAtual == pagina ? corPrimaria : Colors.grey[800],
              ),
            )
          ],
        ),
      ),
    );
  }

}