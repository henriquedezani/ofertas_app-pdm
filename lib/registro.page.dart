import 'package:flutter/material.dart';

class RegistroPage extends StatelessWidget {
  var _formKey = GlobalKey<FormState>();

  String validaCampo(String value) {
    if (value.isEmpty) return "Campo Obrigatório";
    return null;
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
                  ),
                  SizedBox(
                    width: double.infinity,
                    child: RaisedButton(
                      color: Theme.of(context).primaryColor,
                      onPressed: () {
                        bool _valido = _formKey.currentState.validate();

                        if (_valido) Navigator.of(context).pushNamed('/lista');
                      },
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
