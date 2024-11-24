import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import '../config.dart';

class TelaDetalhesReceita extends StatefulWidget {
  final int receitaId;

  TelaDetalhesReceita({required this.receitaId});

  @override
  _TelaDetalhesReceitaState createState() => _TelaDetalhesReceitaState();
}

class _TelaDetalhesReceitaState extends State<TelaDetalhesReceita> {
  Map _detalhesReceita = {};
  bool _carregando = true;

  Future<void> _buscarDetalhesReceita() async {
    final response = await http.get(Uri.parse(
        'https://api.spoonacular.com/recipes/${widget.receitaId}/information?apiKey=${Config.apiKey}'));

    if (response.statusCode == 200) {
      setState(() {
        _detalhesReceita = jsonDecode(response.body);
        _carregando = false;
      });
    }
  }

  @override
  void initState() {
    super.initState();
    _buscarDetalhesReceita();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Detalhes da Receita'),
      ),
      body: _carregando
          ? Center(child: CircularProgressIndicator())
          : Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              _detalhesReceita['title'] ?? 'Título não disponível',
              style:
              TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            Image.network(_detalhesReceita['image'] ?? ''),
            SizedBox(height: 20),
            Text(
              'Ingredientes:',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            ...(_detalhesReceita['extendedIngredients'] != null
                ? _detalhesReceita['extendedIngredients']
                .map<Widget>((ingrediente) {
              return Text(ingrediente['original']);
            }).toList()
                : []),
            SizedBox(height: 20),
            Text(
              'Modo de Preparo:',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            Text(_detalhesReceita['instructions'] ??
                'Instruções não disponíveis'),
          ],
        ),
      ),
    );
  }
}
