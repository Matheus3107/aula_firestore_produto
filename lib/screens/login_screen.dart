import 'package:aula_firestore_produto/screens/produtos_screen.dart';
import 'package:aula_firestore_produto/screens/resgister_screen.dart';
import 'package:aula_firestore_produto/services/autenticacao_service.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _emailTextController = TextEditingController();
  final _passwordTextController = TextEditingController();

  bool _isProcessing = false;

  @override
  void initState() {
    User user = FirebaseAuth.instance.currentUser;

    /*if (user != null) {
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(
          builder: (context) => ProfileScreen(
            user: user,
          ),
        ),
      );
    }*/
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Firebase Authentication'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.only(bottom: 24.0),
              child: Text(
                'Login',
                style: Theme.of(context).textTheme.headline1,
              ),
            ),
            Column(
              children: <Widget>[
                TextField(
                  controller: _emailTextController,
                  decoration: InputDecoration(
                    hintText: "Email",
                  ),
                ),
                SizedBox(height: 8.0),
                TextField(
                  controller: _passwordTextController,
                  obscureText: true,
                  decoration: InputDecoration(
                    hintText: "Password",
                  ),
                ),
                SizedBox(height: 24.0),
                _isProcessing
                    ? CircularProgressIndicator()
                    : Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                            child: ElevatedButton(
                              onPressed: () async {
                                setState(() {
                                  _isProcessing = true;
                                });

                                User user =
                                    await AutenticacaoService.signInUsuario(
                                  email: _emailTextController.text,
                                  senha: _passwordTextController.text,
                                );

                                setState(() {
                                  _isProcessing = false;
                                });

                                if (user != null) {
                                  Navigator.of(context).pushReplacement(
                                    MaterialPageRoute(
                                      builder: (context) => ProdutoScreen(),
                                    ),
                                  );
                                }
                              },
                              child: Text(
                                'Sign In',
                                style: TextStyle(color: Colors.white),
                              ),
                            ),
                          ),
                          SizedBox(width: 24.0),
                          Expanded(
                            child: ElevatedButton(
                              onPressed: () {
                                Navigator.of(context).push(
                                  MaterialPageRoute(
                                    builder: (context) => RegisterScreen(),
                                  ),
                                );
                              },
                              child: Text(
                                'Register',
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
    );
  }
}
