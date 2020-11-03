import 'package:flutter/material.dart';

class DetalhePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    String nome = ModalRoute.of(context).settings.arguments;

    return Scaffold(
      appBar: AppBar(),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: 300,
            width: double.infinity,
            child: Image.network(
              "https://conteudo.imguol.com.br/c/bol/fotos/e4/2018/12/15/homem-aranha-1544839682796_956x506.jpg",
              fit: BoxFit.cover,
            ),
          ),
          SizedBox(height: 10),
          Text(
            nome,
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
          Text(
            "www.americanas.com.br",
            style: TextStyle(
              fontSize: 12,
              color: Colors.grey,
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Icon(Icons.star),
              Text(
                "R\$ 1.234,00",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
          SizedBox(height: 20),
          Text("Descrição do produto"),
          SizedBox(height: 30),
          Container(
            margin: EdgeInsets.all(20),
            width: double.infinity,
            child: RaisedButton(
              onPressed: () {},
              child: Text("Ir para oferta"),
            ),
          ),
        ],
      ),
    );
  }
}
