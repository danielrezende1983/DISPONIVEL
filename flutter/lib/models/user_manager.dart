import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:evento_gerente/helpers/firebase_errors.dart';
import 'package:evento_gerente/models/usuario.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:firebase_auth/firebase_auth.dart';

class UserManager extends ChangeNotifier {

  final FirebaseAuth auth = FirebaseAuth.instance;
  final FirebaseFirestore fireStore = FirebaseFirestore.instance;

  Usuario usuario;

  UserManager(){
    _loadCurrentUser();
  }

  bool _loading = false;
  bool get loading => _loading;
  set loading(bool value){
    _loading = value;
    notifyListeners();
  }

  bool get isLoggedIn => usuario != null;

  // logando
  Future<void> signIn({Usuario usuario, Function onFalha, Function onSucesso}) async {

    loading = true;

    try{

      final UserCredential result = await auth.signInWithEmailAndPassword(email: usuario.email, password: usuario.senha);

      await _loadCurrentUser(user: result.user);

      onSucesso();

    } on PlatformException catch (ex){
      onFalha(getErrorPorCodigo(ex.code));

    }catch (ex){
      onFalha(getErrorPorCodigo(ex.hashCode.toString()));
    }

    loading = false;

  }

  // cadastrando
  Future<void> signUp({Usuario usuario, Function onFalha, Function onSucesso}) async {

    loading = true;

    try{

      final UserCredential result = await auth.createUserWithEmailAndPassword(email: usuario.email, password: usuario.senha);

      usuario.id = result.user.uid;
      this.usuario = usuario;
      await usuario.saveData();

      notifyListeners();
      onSucesso();

    } on PlatformException catch (ex){
      onFalha(getErrorPorCodigo(ex.code));

    }catch (ex){
      onFalha(getErrorPorCodigo(ex.hashCode.toString()));
    }

    loading = false;

  }

  Future<void> _loadCurrentUser({User user}) async {

    final User currentUser = user ??  auth.currentUser;

    if (currentUser != null){

      final DocumentSnapshot docUser = await fireStore.collection('users').doc(currentUser.uid).get();
      usuario = Usuario.fromDocument(docUser);

      usuario.gerente = await _carregueGerente(currentUser.uid);

      notifyListeners();
      return true;

    }

  }

  Future<bool> _carregueGerente(String idUser) async {

    try{

      final doc = await fireStore.collection('users_gerente')
          .doc(idUser)
          .get();

      if(doc.exists){
        return true;
      }else{
        return false;
      }

    }catch(ex){
      return false;
    }

  }

  Future<void> signOut() async {
    await auth.signOut();
    usuario = null;
    notifyListeners();
  }

  bool get ehGerente => usuario != null && usuario.gerente;

}

