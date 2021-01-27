import 'package:flutter/material.dart';
import 'package:flutter_quiz_basics/result.dart';
import './quiz.dart';
// void main() {
//   runApp(MyApp());
// }

//OR
void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _MyAppState();
  }
}

class _MyAppState extends State<MyApp> {
  var _questionIndex = 0;
  final _questions = [
    {
      'questionText': 'What\s your favorite color?',
      'answers': [
        {'text': 'black', 'score': 10},
        {'text': 'blue', 'score': 8},
        {'text': 'red', 'score': 6},
        {'text': 'green', 'score': 4},
      ],
    },
    {
      'questionText': 'What\s your favourite animal?',
      'answers': [
        {'text': 'cow', 'score': 10},
        {'text': 'buffalo', 'score': 8},
        {'text': 'pork', 'score': 6},
        {'text': 'chicken', 'score': 4},
      ],
    },
    {
      'questionText': 'What\s your favourite modder?',
      'answers': [
        {'text': 'wyro', 'score': 10},
        {'text': 'abhi', 'score': 8},
        {'text': 'owl', 'score': 6},
        {'text': 'wichaya', 'score': 4},
      ],
    },
  ];

  int _totalScore = 0;

  void answerQuestions(int score) {
    _totalScore = _totalScore + score;
    //_totalScore += score
    setState(() {
      _questionIndex = _questionIndex + 1;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('My First App'),
          centerTitle: true,
        ),
        body: _questionIndex < _questions.length
            ? Quiz(
                answerQuestions: answerQuestions,
                questionIndex: _questionIndex,
                questions: _questions,
              )
            : Result(_totalScore),
      ),
    );
  }
}
