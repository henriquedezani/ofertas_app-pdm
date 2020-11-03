import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class EsqueceuSenhaPage extends StatelessWidget {
  var _formKey = GlobalKey<FormState>();
  var _scaffoldKey = GlobalKey<ScaffoldState>();

  final FirebaseAuth _auth = FirebaseAuth.instance; // singleton

  String email;

  Future enviaSenhaParaUsuario(BuildContext context) async {
    if (_formKey.currentState.validate()) {
      _formKey.currentState.save();
      if (await enviaSenhaParaUsuarioNoFirebase()) {
        Navigator.of(context).pop();
      }
    }
  }

  Future<bool> enviaSenhaParaUsuarioNoFirebase() async {
    try {
      await _auth.sendPasswordResetEmail(email: email);
      return true;
    } catch (ex) {
      exibeSnackBarComMensagemErro(ex.message);
      return false;
    }
  }

  void exibeSnackBarComMensagemErro(String erro) {
    final snackbar = SnackBar(
      content: Text(erro),
      backgroundColor: Colors.red,
      duration: Duration(seconds: 10),
    );
    _scaffoldKey.currentState.showSnackBar(
      snackbar,
    );
  }

  @override
  Widget build(BuildContext context) {
    double largura = MediaQuery.of(context).size.width; // largura da tela.
    return Scaffold(
      key: _scaffoldKey,
      body: Center(
        child: SingleChildScrollView(
          child: Form(
            key: _formKey,
            child: Container(
              width: largura > 600 ? 400 : largura,
              margin: EdgeInsets.all(20),
              child: Column(
                children: [
                  Container(
                    width: 300,
                    // child: Image.asset('assets/images/fatec.png'),
                  ),
                  SizedBox(
                    height: 50,
                  ),
                  TextFormField(
                    decoration: InputDecoration(
                      labelText: "E-mail",
                      hintText: "Digite seu e-mail institucional.",
                      border: OutlineInputBorder(),
                      prefixIcon: Icon(Icons.email),
                    ),
                    validator: (value) =>
                        value.isEmpty ? "Campo obrigatório" : null,
                    onSaved: (value) => email = value,
                  ),
                  Container(
                    width: double.infinity,
                    child: RaisedButton(
                      color: Theme.of(context).primaryColor,
                      child: Text(
                        "Enviar Senha",
                        style: TextStyle(color: Colors.white),
                      ),
                      onPressed: () => enviaSenhaParaUsuario(context),
                    ),
                  ),
                  FlatButton(
                    child: Text("Lembrou sua senha? Faça o login."),
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
