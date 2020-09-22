import 'package:flutter/material.dart';

class CadastroPage extends StatelessWidget {
  var formKey = GlobalKey<FormState>(); // ~id

  String validaCampo(String value) {
    if (value.isEmpty)
      return "Campo obrigatório";
    else
      return null;
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
                // TODO: Salvar os dado no Banco de Dados (Firestore/Firebase)
                Navigator.of(context).pop();
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
              TextFormField(
                decoration: InputDecoration(labelText: "Nome"),
                readOnly: false,
                validator: (value) {
                  return validaCampo(value);
                },
                autovalidate: false,
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 6),
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey),
                ),
                child: TextFormField(
                  decoration: InputDecoration(
                    labelText: "Loja",
                    border: InputBorder.none,
                  ),
                  validator: (value) => validaCampo(value),
                ),
              ),
              TextFormField(
                keyboardType: TextInputType.number,
                decoration: InputDecoration(labelText: "Preço"),
                validator: validaCampo,
              ),
              TextFormField(
                keyboardType: TextInputType.multiline,
                maxLines: 5,
                minLines: 3,
                decoration: InputDecoration(labelText: "Descrição"),
                validator: validaCampo,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
