import 'package:flutter/material.dart';

import './question.dart';
import './answer.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _MyAppState();
  }
}

class _MyAppState extends State<MyApp> {
  var _perguntaIndex = 0;
  void _reposta() {
    setState(() {
      if (_perguntaIndex == 0) {
        _perguntaIndex = 1;
      } else if (_perguntaIndex == 1) {
        _perguntaIndex = 2;
      } else {
        _perguntaIndex = 0;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    var questions = [
      {
        'questionText': 'O que Camila deve comprar para Renato no Jantar',
        'answers': ['Hamburguer', 'Shawarma', 'Pizza', 'Frango Frito']
      },
      {
        'questionText': 'Qual seu animal favorito',
        'answers': ['Cavalo', 'Cachorro', 'Lontra', 'Peixe']
      },
      {
        'questionText': 'Quantos estados tem o Brasil',
        'answers': ['27', '28', '26', '25']
      },
    ];
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Quiz'),
        ),
        body: Column(
          children: <Widget>[
            Question(
              questions[_perguntaIndex]['questionText'],
            ),
            ...(questions[_perguntaIndex]['answers'] as List<String>)
                .map((answer) {
              return Answer(_reposta, answer);
            }).toList()

            // Answer(_reposta),
            // Answer(_reposta),
          ],
        ),
      ),
    );
  }
}
