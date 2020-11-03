import 'package:cloud_firestore/cloud_firestore.dart';

class Oferta {
  String nome;
  String loja;
  String descricao;
  double preco;
  int likes;
  String uid;
  String userNome;
  Timestamp data;

  Oferta({this.nome, this.loja = '', this.descricao, this.preco, this.likes});

  Oferta.fromJson(Map<String, dynamic> json) {
    this.nome = json['nome'];
    this.loja = json['loja'];
    this.descricao = json['descricao'];
    this.preco = json['preco'];
    this.likes = json['likes'] ?? 0;
    this.uid = json['uid'];
    this.userNome = json['user_nome'] ?? '';
    this.data = json['data'];
  }
}

// snapshot.data.docs[index].data() =
// Map<String, dynamic> {
//    "nome": "Mouse Gamer",
//    "loja": "Apple",
//    "preco": 123.00,
// }

// if (json['likes'] == null)
//   this.likes = 0;
// else
//   this.likes = json['likes']

// this.likes = json['likes'] == null ? 0 : json['likes'];

// this.likes = json['likes'] ?? 0;
