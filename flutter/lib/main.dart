import 'package:evento_gerente/models/assinatura.dart';
import 'package:evento_gerente/models/assinatura_manager.dart';
import 'package:evento_gerente/models/cartao_credito_manager.dart';
import 'package:evento_gerente/models/contato.dart';
import 'package:evento_gerente/models/localizacao.dart';
import 'package:evento_gerente/models/loja_manager.dart';
import 'package:evento_gerente/models/pagamento_manager.dart';
import 'package:evento_gerente/models/servidor_manager.dart';
import 'package:evento_gerente/models/user_manager.dart';
import 'package:evento_gerente/models/usuario_vip_manager.dart';
import 'package:evento_gerente/screens/assinatura/assinatura_screen.dart';
import 'package:evento_gerente/screens/base/base_screen.dart';
import 'package:evento_gerente/screens/contato/contato_screen.dart';
import 'package:evento_gerente/screens/localizacao/localizacao_screen.dart';
import 'package:evento_gerente/screens/login/login_screen.dart';
import 'package:evento_gerente/screens/loja/loja_screen.dart';
import 'package:evento_gerente/screens/lojas/lojas_screen.dart';
import 'package:evento_gerente/screens/pagamento/pagamento_screen.dart';
import 'package:evento_gerente/screens/pagamentos/pagamentos_screen.dart';
import 'package:evento_gerente/screens/servidor/servidor_screen.dart';
import 'package:evento_gerente/screens/servidores/servidores_screen.dart';
import 'package:evento_gerente/screens/vip_edit/vip_edit_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:firebase_core/firebase_core.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp
  ]);

  runApp(MyApp());

}

class MyApp extends StatelessWidget{

  @override
  Widget build(BuildContext context){
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => UserManager(),
          lazy: false,
        ),
        ChangeNotifierProvider(
          create: (_) => ServidorManager(),
          lazy: false,
        ),
        ChangeNotifierProvider(
          create: (_) => UsuarioVipManager(),
          lazy: false,
        ),
        ChangeNotifierProvider(
          create: (_) => CartaoCreditoManager(),
          lazy: false,
        ),
        ChangeNotifierProvider(
          create: (_) => PagamentoManager(),
          lazy: false,
        ),
        ChangeNotifierProvider(
          create: (_) => AssinaturaManager(),
          lazy: false,
        ),
        ChangeNotifierProvider(
          create: (_) => LojaManager(),
          lazy: false,
        ),
      ],
      child: MaterialApp(
        title: "Gerente",
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primaryColor: Colors.blue,
          scaffoldBackgroundColor: Colors.blue,
          appBarTheme: const AppBarTheme(
              elevation: 0
          ),
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        //initialRoute: '/base', // define a pagina inicial
        onGenerateRoute: (settings){
          switch(settings.name){
            case '/login':
              return MaterialPageRoute(
                  builder: (_) => LoginScreen()
              );
            case '/servidores':
              return MaterialPageRoute(
                  builder: (_) => ServidoresScreen()
              );
            case '/servidor':
              return MaterialPageRoute(
                  builder: (_) => ServidorScreen()
              );
            case '/localizacao':
              final Map<String, dynamic> args = settings.arguments as Map<String, dynamic>;
              return MaterialPageRoute(
                  builder: (_) => LocalizacaoScreen(
                      args['localizacao'] as Localizacao
                  )
              );
            case '/contato':
              final Map<String, dynamic> args = settings.arguments as Map<String, dynamic>;
              return MaterialPageRoute(
                  builder: (_) => ContatoScreen(
                      args['contato'] as Contato
                  )
              );
            case '/assinatura':
              final Map<String, dynamic> args = settings.arguments as Map<String, dynamic>;
              return MaterialPageRoute(
                  builder: (_) => AssinaturaScreen(
                      args['nomeTabelaColecao'] as String,
                      args['userTitular'] as String
                  )
              );
            case '/pagamentos':
              final Map<String, dynamic> args = settings.arguments as Map<String, dynamic>;
              return MaterialPageRoute(
                  builder: (_) => PagamentosScreen(
                      args['nomeTabelaColecao'] as String,
                      args['assinatura'] as Assinatura
                  )
              );
            case '/servidor_pagamento':
              final Map<String, dynamic> args = settings.arguments as Map<String, dynamic>;
              return MaterialPageRoute(
                  builder: (_) => PagamentoScreen(
                      args['nomeTabelaColecaoVip'] as String
                  )
              );
            case '/vip_edit':
              final Map<String, dynamic> args = settings.arguments as Map<String, dynamic>;
              return MaterialPageRoute(
                  builder: (_) => VipEditScreen(
                    args['nomeTabelaColecaoVip'] as String
                  )
              );
            case '/lojas':
              return MaterialPageRoute(
                  builder: (_) => LojasScreen()
              );
            case '/loja':
              return MaterialPageRoute(
                  builder: (_) => LojaScreen()
              );
            case '/':
            default:
              return MaterialPageRoute(
                  builder: (_) => BaseScreen()
              );
          }
        },
      ),
    );
  }

}