import 'package:flutter/material.dart';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:oferta_app/model/oferta.model.dart';

class ListaPage extends StatelessWidget {
  FirebaseAuth _auth = FirebaseAuth.instance;
  FirebaseFirestore _database = FirebaseFirestore.instance;

  Future sair(BuildContext context) async {
    await _auth.signOut();
    Navigator.of(context).pushNamedAndRemoveUntil('/', (route) => false);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Ofertas"),
        actions: [
          IconButton(
            icon: Icon(Icons.power_settings_new),
            onPressed: () => sair(context),
          ),
        ],
      ),
      body: StreamBuilder(
        stream: _database.collection('ofertas').snapshots(),
        builder: (_, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (snapshot.hasError) return Text('Erro');
          if (!snapshot.hasData)
            return Center(child: CircularProgressIndicator());

          return ListView.builder(
            itemCount: snapshot.data.docs.length,
            itemBuilder: (_, index) {
              var _oferta = Oferta.fromJson(snapshot.data.docs[index].data());
              return ItemOferta(_oferta);
            },
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        backgroundColor: Theme.of(context).primaryColor,
        tooltip: "Nova Oferta",
        onPressed: () {
          Navigator.of(context).pushNamed('/cadastro');
        },
      ),
    );
  }
}

class ItemOferta extends StatelessWidget {
  final Oferta oferta;

  ItemOferta(this.oferta);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).pushNamed('/detalhe', arguments: oferta.nome);
      },
      child: Container(
        margin: EdgeInsets.fromLTRB(20, 10, 20, 10),
        padding: EdgeInsets.all(8),
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Color.fromRGBO(0, 0, 0, 0.2),
              offset: Offset(2, 2),
              blurRadius: 6,
            ),
          ],
          borderRadius: BorderRadius.circular(6),
        ),
        child: Row(
          // mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.network(
                'https://via.placeholder.com/100x100.png?text=Produto1'),
            SizedBox(width: 8),
            // EXPANDIR O TAMANHO DO WIDGET PARA O MÁXIMO PERMITIDO.
            Expanded(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    oferta.nome,
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    oferta.loja,
                    style: TextStyle(
                      fontSize: 12,
                      color: Colors.grey[600],
                    ),
                  ),
                  Text(
                    "R\$ ${oferta.preco}",
                    style: TextStyle(
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  SizedBox(height: 18),
                  Row(
                    // mainAxisSize: MainAxisSize.max,
                    children: [
                      CircleAvatar(
                        radius: 16,
                        backgroundColor: Colors.grey[300],
                        child: Icon(
                          Icons.person,
                          color: Colors.grey[500],
                        ),
                      ),
                      // EXPANDE O WIDGET PARA O TAMANHO MÁXIMO PERTMITIDO.
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              oferta.userNome,
                              style: TextStyle(
                                fontSize: 12,
                              ),
                            ),
                            Text(
                              oferta.data.toDate().toIso8601String(),
                              style: TextStyle(
                                fontSize: 11,
                                color: Colors.grey[500],
                              ),
                            ),
                          ],
                        ),
                      ),
                      Icon(Icons.thumb_up),
                      Text("(${oferta.likes})"),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
