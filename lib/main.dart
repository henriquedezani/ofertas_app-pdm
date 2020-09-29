import 'package:flutter/material.dart';
import 'package:oferta_app/login.page.dart';
import 'package:oferta_app/lista.page.dart';
import 'package:oferta_app/cadastro.page.dart';

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
        '/lista': (context) => ListaPage(),
        '/cadastro': (context) => CadastroPage(),
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
