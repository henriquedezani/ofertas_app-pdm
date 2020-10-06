import 'package:flutter/material.dart';

class ListaPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Ofertas"),
      ),
      body: ListView(
        children: [
          ItemOferta(),
          ItemOferta(),
          ItemOferta(),
          ItemOferta(),
          ItemOferta(),
          ItemOferta(),
          ItemOferta(),
          ItemOferta(),
          ItemOferta(),
          ItemOferta(),
          ItemOferta(),
        ],
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
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).pushNamed('/detalhe');
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
                    "Computador Intel i9 16GB",
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    "www.americanas.com.br",
                    style: TextStyle(
                      fontSize: 12,
                      color: Colors.grey[600],
                    ),
                  ),
                  Text(
                    "R\$ 1.234,00",
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
                              "Felipe da Silva Pestana",
                              style: TextStyle(
                                fontSize: 12,
                              ),
                            ),
                            Text(
                              "25 de agosto de 2020",
                              style: TextStyle(
                                fontSize: 11,
                                color: Colors.grey[500],
                              ),
                            ),
                          ],
                        ),
                      ),
                      Icon(Icons.thumb_up),
                      Text("(23)"),
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
