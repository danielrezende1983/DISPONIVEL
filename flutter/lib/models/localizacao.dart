import 'package:flutter/material.dart';

class Localizacao extends ChangeNotifier{

  String userTitular;
  String cidade;
  String endereco;
  String estado;
  int cep;

  Localizacao({this.userTitular, this.cidade, this.endereco, this.estado, this.cep});

  Localizacao clone(){
    return Localizacao(
        userTitular: userTitular,
        cidade: cidade,
        endereco: endereco,
        estado: estado,
        cep: cep
    );
  }

}