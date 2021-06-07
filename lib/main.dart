import 'package:aula_firestore_produto/providers/produto_model.dart';
import 'package:aula_firestore_produto/screens/login_screen.dart';
import 'package:aula_firestore_produto/screens/produtos_screen.dart';
import 'package:aula_firestore_produto/services/firestore_service.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final firestoreservice = FirestoreService();

    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => ProdutoModel()),
        StreamProvider(create: (context) => firestoreservice.getProdutos()),
      ],
      child: MaterialApp(
        title: 'Flutter Firestore',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: LoginScreen(),
      ),
    );
  }
}
