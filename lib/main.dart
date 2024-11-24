import 'package:flutter/material.dart';
import 'telas/busca.dart';

void main() {
  runApp(MeuApp());
}

class MeuApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Receitas App',
      theme: ThemeData(
        primarySwatch: Colors.orange,
      ),
      home: TelaBusca(),
    );
  }
}