import 'package:flutter/material.dart';
import 'package:oferta_app/login.page.dart';
import 'package:oferta_app/lista.page.dart';

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
      },
      initialRoute: '/',
    );
  }
}
