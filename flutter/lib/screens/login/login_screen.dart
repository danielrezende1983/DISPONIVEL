import 'package:evento_gerente/helpers/alertas_dialog.dart';
import 'package:evento_gerente/helpers/validators.dart';
import 'package:evento_gerente/models/user_manager.dart';
import 'package:evento_gerente/models/usuario.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class LoginScreen extends StatelessWidget {

  final TextEditingController emailController = TextEditingController();
  final TextEditingController senhaController = TextEditingController();

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () => alertaMensagem(context, 'Faça login'),
      child: Scaffold(
        key: scaffoldKey,
        appBar: AppBar(
          title: const Text('Entrar'),
          centerTitle: true,
        ),
        body: Center(
          child: Card(
            margin: const EdgeInsets.symmetric(horizontal: 16),
            child: Form(
              key: formKey,
              child: Consumer<UserManager>(
                builder: (_, userManager, __){
                  return ListView(
                    padding: const EdgeInsets.all(16),
                    shrinkWrap: true, // define a menor altura possível.
                    children: <Widget>[
                      TextFormField(
                        controller: emailController,
                        enabled: !userManager.loading,
                        decoration: const InputDecoration(hintText: 'E-mail'),
                        keyboardType: TextInputType.emailAddress,
                        autocorrect: false,
                        validator: (email){
                          if (!emailValid(email)){
                            return 'E-mail inválido';
                          }else if (email.toLowerCase().compareTo('usemobisistemas@gmail.com') != 0){
                            return 'Não é email de GERENTE';
                          }
                          return null;
                        },
                      ),
                      const SizedBox(height: 16,),
                      TextFormField(
                        controller: senhaController,
                        enabled: !userManager.loading,
                        decoration: const InputDecoration(hintText: 'Senha'),
                        autocorrect: false,
                        obscureText: true,
                        validator: (senha){
                          if (senha.isEmpty || senha.length < 6) {
                            return 'Senha inválida';
                          }
                          return null;
                        },
                      ),
                      const SizedBox(height: 16,),
                      SizedBox(
                        height: 44,
                        child: RaisedButton(
                          onPressed: userManager.loading ? null : (){
                            if (formKey.currentState.validate()){
                              userManager.signIn(
                                  usuario: Usuario(
                                      email: emailController.text,
                                      senha: senhaController.text
                                  ),
                                  onFalha: (e){
                                    scaffoldKey.currentState.showSnackBar(
                                        SnackBar(
                                          content: Text('Falha ao entrar: $e'),
                                          backgroundColor: Colors.red,
                                          duration: const Duration(seconds: 3),
                                        )
                                    );
                                  },
                                  onSucesso: (){
                                    Navigator.of(context).pop();
                                  }
                              );
                            }
                          },
                          color: Theme.of(context).primaryColor,
                          disabledColor: Theme.of(context).primaryColor.withAlpha(100),
                          textColor: Colors.white,
                          child: userManager.loading ? const CircularProgressIndicator(
                            valueColor: AlwaysStoppedAnimation(Colors.white),
                          ) :
                            const Text(
                            'Entrar',
                            style: TextStyle(
                                fontSize: 18
                            ),
                          ),
                        ),
                      ),
                    ],
                  );
                },
              ),
            ),
          ),
        ),
      ),
    );
  }

}
