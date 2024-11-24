import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import '../config.dart';
import 'detalhes_receita.dart';

class TelaBusca extends StatefulWidget {
  @override
  _TelaBuscaState createState() => _TelaBuscaState();
}

class _TelaBuscaState extends State<TelaBusca> {
  TextEditingController _controller = TextEditingController();
  List _receitas = [];
  bool _carregando = false;

  Future<void> _buscarReceitas() async {
    setState(() {
      _carregando = true;
    });

    final String consulta = _controller.text;

    if (consulta.isEmpty) {
      setState(() {
        _receitas = [];
        _carregando = false;
      });
      return;
    }

    final response = await http.get(Uri.parse(
        'https://api.spoonacular.com/recipes/complexSearch?query=$consulta&apiKey=${Config.apiKey}'));

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      setState(() {
        _receitas = data['results'];
        _carregando = false;
      });
    } else {
      setState(() {
        _receitas = [];
        _carregando = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Buscar Receitas'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _controller,
              decoration: InputDecoration(
                labelText: 'Digite o nome da receita',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 10),
            ElevatedButton(
              onPressed: _buscarReceitas,
              child: Text('Buscar'),
            ),
            SizedBox(height: 20),
            _carregando
                ? Center(child: CircularProgressIndicator())
                : Expanded(
              child: ListView.builder(
                itemCount: _receitas.length,
                itemBuilder: (context, index) {
                  final receita = _receitas[index];
                  return ListTile(
                    title: Text(receita['title']),
                    leading: Image.network(receita['image']),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => TelaDetalhesReceita(
                            receitaId: receita['id'],
                          ),
                        ),
                      );
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
