import 'package:flutter/material.dart';
import 'package:oferta_app/detalhe.page.dart';
import 'package:oferta_app/esqueceu_senha.page.dart';
import 'package:oferta_app/login.page.dart';
import 'package:oferta_app/lista.page.dart';
import 'package:oferta_app/cadastro.page.dart';
import 'package:oferta_app/registro.page.dart';

void main() {
  runApp(MyApp()); // Qual é a classe que eu quero executar inicialmente?
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // home: LoginPage(),
      routes: {
        '/': (context) => LoginPage(),
        '/registro': (context) => RegistroPage(),
        '/lista': (context) => ListaPage(),
        '/cadastro': (context) => CadastroPage(),
        '/detalhe': (context) => DetalhePage(),
        '/esqueceusenha': (context) => EsqueceuSenhaPage(),
      },
      initialRoute: '/',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          // primaryColor: Colors.yellow[800],
          textTheme: TextTheme(
        bodyText1: TextStyle(
          fontWeight: FontWeight.bold,
        ),
      )),
    );
  }
}
