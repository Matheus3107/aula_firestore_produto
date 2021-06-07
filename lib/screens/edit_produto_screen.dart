import 'package:aula_firestore_produto/models/produto.dart';
import 'package:aula_firestore_produto/providers/produto_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class EditProdutoScreen extends StatefulWidget {
  final Produto produto;

  EditProdutoScreen([this.produto]);
  @override
  _EditProdutoScreenState createState() => _EditProdutoScreenState();
}

class _EditProdutoScreenState extends State<EditProdutoScreen> {
  final nomecontroller = TextEditingController();
  final precocontroller = TextEditingController();

  @override
  void initState() {
    if (widget.produto == null) {
      //Novo Produto
      nomecontroller.text = "";
      precocontroller.text = "";

      final produtoprovider = Provider.of<ProdutoModel>(context, listen: false);
      produtoprovider.loadProduto(Produto());
    } else {
      //Aletrar produto
      nomecontroller.text = widget.produto.nome;
      precocontroller.text = widget.produto.preco.toString();

      final produtoprovider = Provider.of<ProdutoModel>(context, listen: false);
      produtoprovider.loadProduto(widget.produto);
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final produtoprovider = Provider.of<ProdutoModel>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text("Editar Produto"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView(
          children: [
            TextField(
              controller: nomecontroller,
              decoration: InputDecoration(hintText: 'Nome Produto'),
              onChanged: (value) => produtoprovider.setNome(value),
            ),
            TextField(
              controller: nomecontroller,
              decoration: InputDecoration(hintText: 'Preco Produto'),
              onChanged: (value) => produtoprovider.setPreco(value),
            ),
            SizedBox(
              height: 20.0,
            ),
            TextButton(
              onPressed: () {
                produtoprovider.saveProduto();
                Navigator.of(context).pop();
              },
              child: Text('Salvar'),
            ),
            (widget.produto != null)
                ? TextButton(
                    onPressed: () {
                      produtoprovider.removeProduto(widget.produto.produtoId);
                      Navigator.of(context).pop();
                    },
                    child: Text("Excluir"),
                  )
                : Container(),
          ],
        ),
      ),
    );
  }
}
