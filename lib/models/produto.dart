class Produto {
  final String produtoId;
  final String nome;
  final double preco;

  Produto({this.produtoId, this.nome, this.preco});

  Map<String, dynamic> toMap() {
    return {'produtoId': produtoId, 'nome': nome, 'preco': preco};
  }

  Produto.fromFirestore(Map<String, dynamic> firestoredocument)
      : produtoId = firestoredocument['produtoId'],
        nome = firestoredocument['nome'],
        preco = firestoredocument['preco'];
}
