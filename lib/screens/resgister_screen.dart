import 'package:aula_firestore_produto/screens/produtos_screen.dart';
import 'package:aula_firestore_produto/services/autenticacao_service.dart';
import 'package:flutter/material.dart';

import 'package:firebase_auth/firebase_auth.dart';

class RegisterScreen extends StatefulWidget {
  @override
  _RegisterScreenState createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final _nameTextController = TextEditingController();
  final _emailTextController = TextEditingController();
  final _passwordTextController = TextEditingController();

  bool _isProcessing = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Register'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Column(
                children: <Widget>[
                  TextField(
                    controller: _nameTextController,
                    decoration: InputDecoration(
                      hintText: "Name",
                    ),
                  ),
                  SizedBox(height: 16.0),
                  TextField(
                    controller: _emailTextController,
                    decoration: InputDecoration(
                      hintText: "Email",
                    ),
                  ),
                  SizedBox(height: 16.0),
                  TextField(
                    controller: _passwordTextController,
                    obscureText: true,
                    decoration: InputDecoration(
                      hintText: "Password",
                    ),
                  ),
                  SizedBox(height: 32.0),
                  _isProcessing
                      ? CircularProgressIndicator()
                      : Row(
                          children: [
                            Expanded(
                              child: ElevatedButton(
                                onPressed: () async {
                                  setState(() {
                                    _isProcessing = true;
                                  });

                                  User user = await AutenticacaoService
                                      .registrarUsuario(
                                    nome: _nameTextController.text,
                                    email: _emailTextController.text,
                                    senha: _passwordTextController.text,
                                  );

                                  setState(() {
                                    _isProcessing = false;
                                  });

                                  if (user != null) {
                                    Navigator.of(context).pushAndRemoveUntil(
                                      MaterialPageRoute(
                                        builder: (context) => ProdutoScreen(),
                                      ),
                                      ModalRoute.withName('/'),
                                    );
                                  }
                                },
                                child: Text(
                                  'Sign up',
                                  style: TextStyle(color: Colors.white),
                                ),
                              ),
                            ),
                          ],
                        )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
