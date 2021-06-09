import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:evento_gerente/comuns/custom_drawer/widgets_comuns.dart';
import 'package:evento_gerente/helpers/comum_screen.dart';
import 'package:evento_gerente/helpers/funcoes_strings.dart';
import 'package:evento_gerente/models/loja.dart';
import 'package:evento_gerente/models/loja_manager.dart';
import 'package:evento_gerente/models/usuario_vip.dart';
import 'package:evento_gerente/models/usuario_vip_manager.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class LojaListTile extends StatelessWidget {

  const LojaListTile(this.loja);

  final Loja loja;

  @override
  Widget build(BuildContext context) {

    return FutureBuilder<DocumentSnapshot>(
      future: FirebaseFirestore.instance.doc('users_vip_loja/${loja.userTitular}').get(),
      builder: (BuildContext contextFutureBuilder, AsyncSnapshot<DocumentSnapshot> snapshot){

        if (snapshot == null) {
          return _corpo(context, null);
        } if (snapshot.data == null){
          return _corpo(context, null);
        }else if (snapshot.hasError) {
          return _corpo(context, null);
        }else{

          if (snapshot.connectionState == ConnectionState.done) {

            final UsuarioVip usuarioVip = UsuarioVip.fromDocument(snapshot.data);

            return _corpo(context, usuarioVip);

          }

        }

        return statusDeCarregandoListTile();

      },
    );

  }

  Consumer2 _corpo(BuildContext context, UsuarioVip usuarioVip){

    return Consumer2<LojaManager, UsuarioVipManager>(
        builder: (_, lojaManager, usuarioVipManager, __){

          return GestureDetector(
            onTap: (){

              lojaManager.lojaSelecionada = loja;
              usuarioVipManager.usuarioVipSelecionado = usuarioVip;
              Navigator.of(context).pushNamed('/loja');

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
                    Container(
                      width: 80,
                      height: 80,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        image: mostrarListaImagensDecorationImage(loja?.images, 'images/servico_006_512.png'),
                      ),
                    ),
                    const SizedBox(width: 16,),
                    Expanded(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            truncar(loja.nome, 25),
                            style: const TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w800,
                            ),
                          ),
                          _tipoAssinatura(usuarioVip),
                          Text(
                            truncar('${loja.estado} - ${loja.cidade}', 25),
                            style: TextStyle(
                                fontSize: 12,
                                color: Theme.of(context).primaryColor
                            ),
                          ),
                          _usuarioTitular(),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );

        }
    );

  }

  Text _usuarioTitular(){

    return Text(
      truncar(loja.userTitular, 40),
      style: const TextStyle(
        fontSize: 10,
        fontWeight: FontWeight.w800,
      ),
    );

  }

  Text _tipoAssinatura(UsuarioVip usuarioVip){

    String texto = loja.assinaturaAtiva ? 'Assinatura Ativa' : 'Assinatura Inativa';
    Color cor = loja.assinaturaAtiva ? Colors.green : Colors.red;

    if (usuarioVip != null){
      if (usuarioVip.userTitular != null){
        texto = 'VIP';
        cor = Colors.purple;
      }
    }

    return Text(
      texto,
      style: TextStyle(
        fontWeight: FontWeight.w800,
        color: cor,
        fontSize: 15,
      ),
    );

  }

}
