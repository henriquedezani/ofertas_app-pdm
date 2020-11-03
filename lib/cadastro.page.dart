import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:oferta_app/model/oferta.model.dart';

class CadastroPage extends StatelessWidget {
  var formKey = GlobalKey<FormState>(); // ~id

  final database = FirebaseFirestore.instance;
  final auth = FirebaseAuth.instance;

  String validaCampo(String value) {
    if (value.isEmpty)
      return "Campo obrigatório";
    else
      return null;
  }

  String validaCampoNumerico(String value) {
    if (value.isEmpty)
      return "Campo obrigatório";
    else if (double.tryParse(value) == null)
      return "Campo deve ser numérico";
    else
      return null;
  }

  final oferta = Oferta();

  Future<void> cadastraOferta(BuildContext context) async {
    final user = auth.currentUser;
    await database.collection('ofertas').add({
      "nome": oferta.nome,
      "loja": oferta.loja,
      "data": DateTime.now(),
      "preco": oferta.preco,
      "descricao": oferta.descricao,
      "uid": user.uid,
      "user_nome": user.displayName,
    });
    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Nova Oferta"),
        actions: [
          IconButton(
            icon: Icon(Icons.save),
            tooltip: "Salvar",
            onPressed: () {
              if (formKey.currentState.validate()) {
                formKey.currentState.save();
                cadastraOferta(context);
              }
            },
          ),
        ],
      ),
      body: Container(
        margin: EdgeInsets.all(8),
        child: Form(
          key: formKey,
          child: Column(
            children: [
              Image.network(
                  'https://via.placeholder.com/200x200.png?text=Produto1'),
              SizedBox(height: 30),
              TextFormField(
                decoration: InputDecoration(
                  labelText: "Nome",
                  hintStyle: TextStyle(
                    color: Colors.red,
                  ),
                  hintText: "Nome",
                  border: OutlineInputBorder(),
                  prefixIcon: Icon(Icons.person),
                  suffixIcon: Icon(
                    Icons.check,
                    color: Colors.green,
                  ),
                ),
                readOnly: false,
                validator: (value) {
                  return validaCampo(value);
                },
                onSaved: (value) => oferta.nome = value,
              ),
              SizedBox(height: 20),
              TextFormField(
                decoration: InputDecoration(
                  labelText: "Loja",
                  border: OutlineInputBorder(),
                ),
                validator: (value) => validaCampo(value),
                onSaved: (value) => oferta.loja = value,
              ),
              SizedBox(height: 20),
              TextFormField(
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    labelText: "Preço",
                    // enabledBorder: OutlineInputBorder(),
                    border: OutlineInputBorder(),
                  ),
                  validator: validaCampoNumerico,
                  onSaved: (value) {
                    oferta.preco = double.tryParse(value) ?? 0;
                  }),
              SizedBox(height: 20),
              TextFormField(
                keyboardType: TextInputType.multiline,
                maxLines: 5,
                minLines: 3,
                decoration: InputDecoration(
                  labelText: "Descrição",
                  border: OutlineInputBorder(),
                ),
                validator: validaCampo,
                onSaved: (value) => oferta.descricao = value,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
