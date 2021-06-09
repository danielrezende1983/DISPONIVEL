import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:evento_gerente/models/contato.dart';
import 'package:evento_gerente/models/localizacao.dart';
import 'package:flutter/material.dart';

class Loja extends ChangeNotifier{

  String idLoja;
  List<String> images;
  String nome;
  String userTitular;
  String descricao;
  String email;
  bool ehCnpj;
  num cpf;
  num cnpj;
  bool assinaturaAtiva;

  // dados de localização
  int cep;
  String estado;
  String cidade;
  String endereco;

  // dados de contato
  String emailContato;
  int telefone1;
  int telefone2;
  String instagram;
  String site;

  List<dynamic> newImages;

  final FirebaseFirestore firestore = FirebaseFirestore.instance;

  DocumentReference get firestoreRef => firestore.doc('loja/$idLoja');

  Loja({this.idLoja, this.images, this.nome, this.userTitular, this.email, this.descricao, this.ehCnpj, this.cpf, this.cnpj,
    this.estado, this.cidade, this.cep, this.endereco, this.assinaturaAtiva,
    this.emailContato, this.telefone1, this.telefone2, this.instagram, this.site}){
    images = images ?? [];
    assinaturaAtiva = assinaturaAtiva ?? false;
  }

  Loja clone(){
    return Loja(
        idLoja: idLoja,
        images: images,
        nome: nome,
        userTitular: userTitular,
        email: email,
        descricao: descricao,
        ehCnpj: ehCnpj,
        cpf: cpf,
        cnpj: cnpj,
        estado: estado,
        cidade: cidade,
        cep: cep,
        endereco: endereco,
        emailContato: emailContato,
        telefone1: telefone1,
        telefone2: telefone2,
        instagram: instagram,
        assinaturaAtiva: assinaturaAtiva,
        site: site
    );
  }

  Loja.fromDocument(DocumentSnapshot document){
    if (document != null && document.data() != null) {

      idLoja = document.id;
      nome = (document.data()['nome'] ?? '') as String;
      userTitular = (document.data()['user_titular'] ?? '') as String;
      if(document.data()['images'] == null){
        images = [];
      }else{
        images = List<String>.from(document.data()['images'] as List<dynamic>);
      }
      email = (document.data()['email'] ?? '') as String;
      descricao = (document.data()['descricao'] ?? '') as String;
      ehCnpj = (document.data()['eh_cnpj'] ?? false) as bool;
      cpf = (document.data()['cpf'] ?? 0) as num;
      cnpj = (document.data()['cnpj'] ?? 0) as num;
      assinaturaAtiva = (document.data()['assinatura_ativa'] ?? false) as bool;

      // dados de localização
      cidade = (document.data()['cidade'] ?? '') as String;
      endereco = (document.data()['endereco'] ?? '') as String;
      estado = (document.data()['estado'] ?? '') as String;
      cep = (document.data()['cep'] ?? 0) as int;

      // dados de contato
      emailContato = (document.data()['emailContato'] ?? '') as String;
      telefone1 = (document.data()['telefone1'] ?? 0) as int;
      telefone2 = (document.data()['telefone2'] ?? 0) as int;
      instagram = (document.data()['instagram'] ?? '') as String;
      site = (document.data()['site'] ?? '') as String;

    }else{
      images = [];
    }

  }

  Future<void> atualizaAtividadeAssinatura() async {

    await firestore.doc('loja/$userTitular').update({'assinatura_ativa': assinaturaAtiva});

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