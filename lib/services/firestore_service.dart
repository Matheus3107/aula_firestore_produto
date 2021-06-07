import 'package:aula_firestore_produto/models/produto.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class FirestoreService {
  FirebaseFirestore _db = FirebaseFirestore.instance;

  Future<void> saveProduto(Produto produto) {
    return _db
        .collection('produtos')
        .doc(produto.produtoId)
        .set(produto.toMap());
    //set: insere ou alterar
  }

  Future<void> removeProduto(String produtoId) {
    return _db.collection('produtos').doc(produtoId).delete();
  }

  Stream<List<Produto>> getProdutos() {
    return _db.collection('produtos').snapshots().map((snapshot) => snapshot
        .docs
        .map((document) => Produto.fromFirestore(document.data()))
        .toList());
  }
}
