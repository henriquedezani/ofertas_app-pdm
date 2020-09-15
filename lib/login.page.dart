import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Login"),
      ),
      body: FlatButton(
        child: Text("Fazer Login"),
        onPressed: () {
          Navigator.of(context).pushNamed('/lista');
        },
      ),
    );
  }
}

// RaisedButton, OutlineButton, FlatButton
