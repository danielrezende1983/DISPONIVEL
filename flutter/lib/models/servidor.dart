import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:evento_gerente/models/contato.dart';
import 'package:evento_gerente/models/localizacao.dart';
import 'package:flutter/material.dart';

class Servidor extends ChangeNotifier{

  final FirebaseFirestore firestore = FirebaseFirestore.instance;
  
  String idServidor;
  String userTitular;
  String cidade;
  String descricao;
  String email;
  String emailContato;
  String endereco;
  String estado;
  List<String> images;
  String instagram;
  String nome;
  String site;
  int telefone1;
  int telefone2;
  int cep;
  bool ehCnpj;
  num cpf;
  num cnpj;
  bool assinaturaAtiva;

  Servidor({this.idServidor, this.userTitular,
    this.cidade, this.descricao, this.email, this.emailContato,
    this.endereco, this.estado, this.cpf, this.cnpj,
    this.images, this.instagram, this.nome, this.site,
    this.telefone1, this.cep, this.telefone2, this.ehCnpj,
    this.assinaturaAtiva}){
    images = images ?? [];
  }

  Servidor.fromDocument(DocumentSnapshot document){

    if (document != null && document.data() != null) {
      idServidor = document.id;
      userTitular = (document.data()['user_titular'] ?? '') as String;
      cidade = (document.data()['cidade'] ?? '') as String;
      descricao = (document.data()['descricao'] ?? '') as String;
      email = (document.data()['email'] ?? '') as String;
      emailContato = (document.data()['emailContato'] ?? '') as String;
      endereco = (document.data()['endereco'] ?? '') as String;
      estado = (document.data()['estado'] ?? '') as String;
      instagram = (document.data()['instagram'] ?? '') as String;
      nome = (document.data()['nome'] ?? '') as String;
      site = (document.data()['site'] ?? '') as String;
      telefone1 = (document.data()['telefone1'] ?? 0) as int;
      telefone2 = (document.data()['telefone2'] ?? 0) as int;
      cep = (document.data()['cep'] ?? 0) as int;
      ehCnpj = (document.data()['eh_cnpj'] ?? false) as bool;
      cpf = (document.data()['cpf'] ?? 0) as num;
      cnpj = (document.data()['cnpj'] ?? 0) as num;
      assinaturaAtiva = (document.data()['assinatura_ativa'] ?? false) as bool;

      if (document.data()['images'] != null){
        images = List<String>.from(document.data()['images'] as List<dynamic>);
      }else{
        images = [];
      }

    }else{
      images = [];
    }

  }

  Servidor clone(){
    return Servidor(
        idServidor: idServidor,
        userTitular: userTitular,
        cidade: cidade,
        descricao: descricao,
        email: email,
        emailContato: emailContato,
        endereco: endereco,
        estado: estado,
        images: List.from(images), // clona a lista
        instagram: instagram,
        nome: nome,
        site: site,
        telefone1: telefone1,
        telefone2: telefone2,
        ehCnpj: ehCnpj,
        cpf: cpf,
        cnpj: cnpj,
        assinaturaAtiva: assinaturaAtiva,
        cep: cep
    );
  }

  Future<void> atualizaAtividadeAssinatura() async {

    await firestore.doc('servidores/$userTitular').update({'assinatura_ativa': assinaturaAtiva});

  }

  Localizacao getLocalizacao(){

    return Localizacao(
      userTitular: userTitular,
      cep: cep,
      estado: estado,
      cidade: cidade,
      endereco: endereco
    );

  }

  Contato getContato(){

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