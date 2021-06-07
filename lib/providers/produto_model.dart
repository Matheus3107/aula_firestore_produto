import 'package:aula_firestore_produto/models/produto.dart';
import 'package:aula_firestore_produto/services/firestore_service.dart';
import 'package:flutter/foundation.dart';
import 'package:uuid/uuid.dart';

class ProdutoModel extends ChangeNotifier {
  final Firestoreservice = FirestoreService();

  String _nome;
  double _preco;
  String _produtoId;
  var uuid = Uuid();

  String get nome => _nome;
  double get preco => _preco;

  setNome(String pnome) {
    _nome = pnome;
    notifyListeners();
  }

  setPreco(String ppreco) {
    _preco = double.parse(ppreco);
    notifyListeners();
  }

  loadProduto(Produto produto) {
    _nome = produto.nome;
    _preco = produto.preco;
    _produtoId = produto.produtoId;
  }

  saveProduto() {
    //create
    if (_produtoId == null) {
      var novoProduto = Produto(nome: nome, preco: preco, produtoId: uuid.v4());
      Firestoreservice.saveProduto(novoProduto);
    } else {
      //Update
      var alteraproduto =
          Produto(nome: nome, preco: preco, produtoId: _produtoId);
      Firestoreservice.saveProduto(alteraproduto);
    }
  }

  removeProduto(String produtoId) {
    Firestoreservice.removeProduto(produtoId);
  }
}
