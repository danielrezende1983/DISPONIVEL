import 'package:cloud_firestore/cloud_firestore.dart';

class Usuario{

  Usuario({this.email, this.senha, this.nome, this.senhaConfirmada, this.id});

  Usuario.fromDocument(DocumentSnapshot document){

    if (document != null && document.data() != null) {
      id = document.id;
      nome = document.data()['nome'] as String;
      email = document.data()['email'] as String;
    }

  }

  String id;
  String email;
  String senha;
  String nome;

  String senhaConfirmada;

  bool gerente = false;

  DocumentReference get firestoreRef => FirebaseFirestore.instance.doc('users/$id');

  Future<void> saveData() async {

    await firestoreRef.set(toMap());

  }

  Map<String, dynamic> toMap(){
    return {
      'nome': nome,
      'email': email,
    };
  }

}