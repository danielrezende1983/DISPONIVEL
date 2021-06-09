import 'package:flutter/material.dart';

class Contato extends ChangeNotifier{

  String userTitular;
  String emailContato;
  int telefone1;
  int telefone2;
  String instagram;
  String site;

  Contato({this.userTitular, this.emailContato, this.telefone1, this.telefone2, this.instagram, this.site});

  Contato clone(){

    return Contato(
        userTitular: userTitular,
        emailContato: emailContato,
        telefone1: telefone1,
        telefone2: telefone2,
        instagram: instagram,
        site: site
    );

  }

}