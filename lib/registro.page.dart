import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class RegistroPage extends StatelessWidget {
  var _formKey = GlobalKey<FormState>();

  FirebaseAuth _auth = FirebaseAuth.instance;

  String validaCampo(String value) {
    if (value.isEmpty) return "Campo Obrigatório";
    return null;
  }

  String nome;
  String email;
  String senha;

  void registraUsuario(BuildContext context) {
    if (_formKey.currentState.validate()) {
      _formKey.currentState.save();
      createUserInFirebase(context);
    }
  }

  Future createUserInFirebase(BuildContext context) async {
    try {
      var result = await _auth.createUserWithEmailAndPassword(
          email: email, password: senha);
      await result.user.updateProfile(displayName: nome);
      Navigator.of(context).pushNamed('/lista');
    } on FirebaseAuthException catch (e) {
      exibeErro(context, e);
    }
  }

  void exibeErro(BuildContext context, FirebaseAuthException e) {
    AlertDialog alert = AlertDialog(
      actions: [
        FlatButton(
            child: Text('OK'),
            onPressed: () {
              Navigator.of(context).pop();
            })
      ],
      title: Text("Falha no registro"),
      content: Text(e.message),
    );
    showDialog(
      context: context,
      builder: (context) => alert,
    );
  }

  @override
  Widget build(BuildContext context) {
    var larguraTela = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          child: Container(
            width: larguraTela > 500 ? 400 : larguraTela,
            margin: EdgeInsets.all(20),
            child: Form(
              key: _formKey,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  CircleAvatar(
                    radius: 50,
                    child: Icon(Icons.person, size: 32, color: Colors.black),
                    backgroundColor: Colors.grey[300],
                  ),
                  Text("Clique para editar"),
                  SizedBox(height: 40),
                  TextFormField(
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: "Nome",
                    ),
                    validator: validaCampo,
                    onSaved: (value) => nome = value,
                  ),
                  SizedBox(
                    height: 6,
                  ),
                  TextFormField(
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: "E-mail",
                    ),
                    validator: validaCampo,
                    onSaved: (value) => email = value,
                  ),
                  SizedBox(
                    height: 6,
                  ),
                  TextFormField(
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: "Senha",
                    ),
                    obscureText: true,
                    validator: validaCampo,
                    onSaved: (value) => senha = value,
                  ),
                  SizedBox(
                    width: double.infinity,
                    child: RaisedButton(
                      color: Theme.of(context).primaryColor,
                      onPressed: () => registraUsuario(context),
                      child: Text(
                        "Registrar",
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
                  FlatButton(
                    child: Text("Já tem cadastro? Faça o login."),
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
