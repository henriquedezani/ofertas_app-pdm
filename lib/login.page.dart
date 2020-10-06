import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
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
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  TextFormField(
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: "E-mail",
                    ),
                  ),
                  SizedBox(
                    height: 6,
                  ),
                  TextFormField(
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: "Senha",
                    ),
                  ),
                  SizedBox(
                    width: double.infinity,
                    child: RaisedButton(
                      color: Theme.of(context).primaryColor,
                      onPressed: () {
                        Navigator.of(context).pushNamed('/lista');
                      },
                      child: Text(
                        "Entrar",
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
                  FlatButton(
                    child: Text("Não tem cadastro? Clique aqui."),
                    onPressed: () {
                      Navigator.of(context).pushNamed('/registro');
                    },
                  ),
                  SizedBox(
                    height: 40,
                  ),
                  Text("ou faça login usando as redes sociais"),
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      // GestureDetector(child: Container(), onTap: () { })
                      RaisedButton(
                        onPressed: () {},
                        color: Colors.red[400],
                        child: Row(
                          children: [
                            Icon(Icons.g_translate, color: Colors.white),
                            SizedBox(
                              width: 6,
                            ),
                            Text(
                              "Google",
                              style: TextStyle(
                                color: Colors.white,
                              ),
                            )
                          ],
                        ),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      RaisedButton(
                        onPressed: () {},
                        color: Colors.blue[800],
                        child: Text(
                          "Facebook",
                          style: TextStyle(
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ],
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
