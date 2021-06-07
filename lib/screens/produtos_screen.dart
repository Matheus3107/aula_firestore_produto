import 'package:aula_firestore_produto/models/produto.dart';
import 'package:aula_firestore_produto/screens/edit_produto_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ProdutoScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final produtos = Provider.of<List<Produto>>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text('Produtos'),
        actions: [
          IconButton(
            icon: Icon(
              Icons.add,
              size: 30,
            ),
            onPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => EditProdutoScreen(),
                ),
              );
            },
          ),
        ],
      ),
      body: (produtos != null)
          ? ListView.builder(
              itemCount: produtos.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(produtos[index].nome),
                  trailing: Text(produtos[index].preco.toString()),
                  onTap: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) =>
                            EditProdutoScreen(produtos[index]),
                      ),
                    );
                  },
                );
              },
            )
          : Center(
              child: CircularProgressIndicator(),
            ),
    );
  }
}
