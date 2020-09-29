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
                autovalidate: false,
              ),
              SizedBox(height: 20),
              TextFormField(
                decoration: InputDecoration(
                  labelText: "Loja",
                  border: OutlineInputBorder(),
                ),
                validator: (value) => validaCampo(value),
              ),
              SizedBox(height: 20),
              TextFormField(
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  labelText: "Preço",
                  // enabledBorder: OutlineInputBorder(),
                  border: OutlineInputBorder(),
                ),
                validator: validaCampo,
              ),
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
              ),
            ],
          ),
        ),
      ),
    );
  }
}
