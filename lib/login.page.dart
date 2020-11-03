import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

class LoginPage extends StatelessWidget {
  var _formKey = GlobalKey<FormState>();
  var _scaffoldKey = GlobalKey<ScaffoldState>();

  FirebaseAuth _auth = FirebaseAuth.instance;

  String email;
  String senha;

  Future efetuaLogin(BuildContext context) async {
    if (_formKey.currentState.validate()) {
      _formKey.currentState.save();
      await loginComEmailESenha(context);
    }
  }

  Future loginComEmailESenha(BuildContext context) async {
    try {
      await _auth.signInWithEmailAndPassword(email: email, password: senha);
      Navigator.of(context).pushReplacementNamed('/lista');
    } on FirebaseAuthException catch (ex) {
      var _snackBar = SnackBar(
        content: Text(ex.message),
        backgroundColor: Colors.red,
        duration: Duration(seconds: 10),
      );
      _scaffoldKey.currentState.showSnackBar(_snackBar);
    }
  }

  Future loginComGoogle(BuildContext context) async {
    // Trigger the authentication flow
    final GoogleSignInAccount googleUser = await GoogleSignIn(
            clientId:
                '741208960981-igr435vtgrf8a4r1gd2bkq18qmt603gt.apps.googleusercontent.com')
        .signIn();

    // Obtain the auth details from the request
    final GoogleSignInAuthentication googleAuth =
        await googleUser.authentication;

    // Create a new credential
    final GoogleAuthCredential credential = GoogleAuthProvider.credential(
      accessToken: googleAuth.accessToken,
      idToken: googleAuth.idToken,
    );

    // Once signed in, return the UserCredential
    await _auth.signInWithCredential(credential);
    Navigator.of(context).pushReplacementNamed('/lista');
  }

  @override
  Widget build(BuildContext context) {
    var larguraTela = MediaQuery.of(context).size.width;
    return Scaffold(
      key: _scaffoldKey,
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
                  TextFormField(
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: "E-mail",
                    ),
                    onSaved: (value) =>
                        email = value, // executa ao invocar formkey.c..save();
                  ),
                  SizedBox(
                    height: 6,
                  ),
                  TextFormField(
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: "Senha",
                    ),
                    onSaved: (value) => senha = value,
                    obscureText: true,
                  ),
                  SizedBox(
                    width: double.infinity,
                    child: RaisedButton(
                      color: Theme.of(context).primaryColor,
                      onPressed: () => efetuaLogin(context),
                      child: Text(
                        "Entrar",
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      FlatButton(
                        child: Text("Novo usuário."),
                        onPressed: () {
                          Navigator.of(context).pushNamed('/registro');
                        },
                      ),
                      FlatButton(
                        child: Text("Esqueceu a senha?"),
                        onPressed: () {
                          Navigator.of(context).pushNamed('/esqueceusenha');
                        },
                      ),
                    ],
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
                        onPressed: () => loginComGoogle(context),
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
