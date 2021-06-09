import 'package:evento_gerente/comuns/custom_drawer/drawer_tile.dart';
import 'package:flutter/material.dart';

import 'custom_drawer_header.dart';

class CustomDrawer extends StatelessWidget{

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Colors.lightBlue[100],
                  Colors.lightBlueAccent[100],
                ],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
              )
            ),
          ),
          ListView(
            children: <Widget>[
              CustomDrawerHeader(),
              const Divider(),
              const DrawerTile(
                dadosIcone: Icons.perm_contact_cal,
                titulo: 'Perfil',
                pagina: 0,
              ),
              const DrawerTile(
                dadosIcone: Icons.location_on,
                titulo: 'Menu Servidores',
                pagina: 1,
              ),
              const DrawerTile(
                dadosIcone: Icons.phone,
                titulo: 'Menu Lojas',
                pagina: 2,
              ),
              // const DrawerTile(
              //   dadosIcone: Icons.home_repair_service_rounded,
              //   titulo: 'Serviços e Insumos',
              //   pagina: 3,
              // ),
              // const DrawerTile(
              //   dadosIcone: Icons.payment,
              //   titulo: 'Pagamento',
              //   pagina: 4,
              // ),
              // const DrawerTile(
              //   dadosIcone: Icons.settings,
              //   titulo: 'Configuração',
              //   pagina: 5,
              // ),
            ],
          ),
        ],
      ),
    );
  }

}