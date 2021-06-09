import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Diferença Strings',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(title: 'Diferença Strings'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  final TextEditingController valorControler = TextEditingController();
  String resultado = '';

  //Entradas: O pássaro amarelo caiu. O pássaro vermelho caiu.
  //Saídas: O pássaro [amarel]o caiu. O pássaro [vermelh]o caiu.

  String _compareExpressoes(String expressao1, String expressao2) {

    var vetor1 = expressao1.split(' ');
    var vetor2 = expressao2.split(' ');

    String retorno = '';
    int indice = 0;

    for(String item1 in vetor1){

      if(indice >= vetor2.length) {
        retorno = retorno + ' ' + item1;
        continue;
      }

      if(item1.compareTo(vetor2[indice]) == 0){
        retorno = retorno + ' ' + item1;
      }else{
        retorno = retorno + ' ' + _comparePalavras(item1, vetor2[indice]);
      }

      indice++;

    }

    if(indice < vetor2.length) {
      for (var i = indice; i < vetor2.length; i++) {
        retorno = retorno + ' ' + vetor2[i];
      }
    }

    if(retorno.isNotEmpty){
      retorno = retorno + '.';
    }

    return retorno;

  }


  String _comparePalavras(String palavra1, String palavra2) {

    String string1 = '';
    String temporario1;
    String temporario2;
    String anterior = '';
    int inicio = 0;
    int fim = 1;
    bool abriuCochete = false;

    for (var i = 0; i < palavra1.length; i++) {

      try{
        temporario1 = palavra1.substring(inicio, fim);
      }catch(ex){
        temporario1 = '';
      }

      try{
        temporario2 = palavra2.substring(inicio, fim);
      }catch(ex){
        temporario2 = '';
      }

      if (temporario1 != temporario2){

        if (abriuCochete){

          if(anterior.isNotEmpty){

            string1 = string1 + anterior.substring(0, 1);

            anterior = '';
            inicio = i;
            fim = inicio + 1;
            i--;

          }else{
            anterior = temporario1;
            fim++;
          }

        }else{

          string1 = string1 + anterior + '[';
          abriuCochete = true;

          anterior = '';
          inicio = i;
          fim = inicio + 1;
          i--;

        }

      }else{

        if (abriuCochete){

          string1 = string1 +  ']' + anterior;
          abriuCochete = false;

          anterior = '';
          inicio = i;
          fim = inicio + 1;
          i--;

        }else{

          anterior = temporario1;
          fim++;

        }

      }

    }

    if (temporario1.isNotEmpty){
      string1 = string1 + temporario1;
      if (abriuCochete){
        string1 = string1 +  ']';
      }
    }

    return string1;

  }

  String _compare() {

    if (valorControler.text.isEmpty){
      return 'informe duas strings separadas por ponto';
    }else if(!valorControler.text.contains('.')){
      return 'informe duas strings separadas por ponto';
    }

    var vetor = valorControler.text.split('.');

    String expressao1 = vetor[0].trim();
    String expressao2 = vetor[1].trim();

    String retorno1 = _compareExpressoes(expressao1, expressao2);
    String retorno2 = _compareExpressoes(expressao2, expressao1);

    return '$retorno1 $retorno2';

  }

  void _diff() {

    setState(() {
      resultado = _compare();
    });

  }

  // ###################################################################################
  // ###################################################################################
  // ###################################################################################

  //Entrada: 100, 101, 102, 103, 104, 105, 110, 111, 113, 114, 115, 150
  //Saída: [100-105], [110-111], [113-115], [150]

  void _agrupamento() {

    setState(() {
      resultado = _agrupe();
    });

  }

  String _agrupe() {

    if (valorControler.text.isEmpty){
      return 'Informe pelo menos um número separados por virgula.';
    }

    return _agrupar(valorControler.text);

  }

  String _agrupar(String expressao) {
    var listaNumeros = expressao.split(',');
    String retorno = '';
    int numeroAtual = 0;
    int numeroAnterior = 0;
    bool cocheteAberto = false;
    bool ultimoAnteriorVerdadeiroAntesDeSairDoLoop = false;
    for(String itemNumero in listaNumeros){
      ultimoAnteriorVerdadeiroAntesDeSairDoLoop = false;
      numeroAtual = int.parse(itemNumero.trim());
      if ((numeroAtual - 1) == numeroAnterior){
        ultimoAnteriorVerdadeiroAntesDeSairDoLoop = true;
      }else{
        if(cocheteAberto){
          retorno = retorno + '-' + numeroAnterior.toString() + '], [' + numeroAtual.toString();
        }else{
          retorno = retorno + '[' + numeroAtual.toString();
          cocheteAberto = true;
        }
      }
      numeroAnterior = numeroAtual;
    }
    if(retorno.isNotEmpty){
      if(ultimoAnteriorVerdadeiroAntesDeSairDoLoop){
        retorno = retorno + '-' + numeroAnterior.toString() + ']';
      }else{
        retorno = retorno + ']';
      }
    }
    return retorno;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(10),
                child: TextFormField(
                  controller: valorControler,
                  style: const TextStyle(
                    fontSize: 20,
                  ),
                  decoration: const InputDecoration(
                    hintText: 'Texto',
                  ),
                  maxLines: null,
                ),
              ),
              const SizedBox(height: 20,),
              Text(
                resultado,
                style: TextStyle(fontSize: 22),
              ),
              const SizedBox(height: 30,),
              SizedBox(
                height: 44,
                child: RaisedButton(
                  color: Theme.of(context).primaryColor,
                  disabledColor: Theme.of(context).primaryColor.withAlpha(100),
                  textColor: Colors.white,
                  onPressed: _agrupamento,
                  child: const Text(
                    'AGRUPAR',
                    style: TextStyle(fontSize: 25),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

}
