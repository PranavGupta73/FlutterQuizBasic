import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import './question.dart';
import './answer.dart';
import 'dart:ui';

void main() {
  runApp(MyApp());
}

class QuestionsAndAnswers {
  String question = '';
  List<String> answers = ['', '', '', ''];
  String correctAnswer = "";

  //List<String> answers=[];
  //String answer1,answer2,answer3,answer4;
  QuestionsAndAnswers(
      String question, String a, String b, String c, String d, String ans) {
    this.question = question;
    answers[0] = a;
    answers[1] = b;
    answers[2] = c;
    answers[3] = d;
    correctAnswer = ans;
  }
}

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return MyAppState();
  }
}

class MyAppState extends State<MyApp> {
  var questionindex = 0;
  int compareScore = 0;
  String displayMessage = 'Chose an option to begin the quiz';

  void _answerQuestion() {
    setState(() {
      questionindex++;
      if (score > compareScore) {
        compareScore = score;
        displayMessage = 'Correct Answer';
      } else {
        displayMessage = 'Incorrect Answer';
      }
    });
    print(questionindex);
  }

  void _resetQuiz() {
    setState(() {
      displayMessage = 'Previous Score: $score';
      questionindex = 0;
      score = 0;
      compareScore = 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    var questions = [
      {
        'Question': 'Which Hokage sealed the nine-tailed fox inside Naruto?',
        'Answers': [
          'Fourth Hokage',
          'First Hokage',
          'Fourth Hokage',
          'Fourth Hokage'
        ],
      },
      {
        'Question': 'What\'s your favourite anime?',
        'Answers': ['One Piece', 'Naruto', 'AoT', 'Black Clover'],
      },
      {
        'Question': 'What\'s your favourite anime character from one piece?',
        'Answers': ['Luffy', 'Nami', 'Zoro', 'Sanji'],
      }
    ];
    List<QuestionsAndAnswers> ques = [];
    ques.add(QuestionsAndAnswers(
        'Which Hokage sealed the nine-tailed fox inside Naruto ?',
        'Fourth Hokage',
        'First Hokage',
        'Third Hokage',
        'Second Hokage',
        'Fourth Hokage'));
    ques.add(QuestionsAndAnswers(
        'Who tricked Naruto into stealing a sacred scroll?',
        'Iruka',
        'Mizuki',
        'Sasuke',
        'Zabuza',
        'Mizuki'));
    ques.add(QuestionsAndAnswers('Which character can only use taijutsu?',
        'Rock Lee', 'Sasuke Uchiha', 'Naruto Uzumaki', 'Gaara', 'Rock Lee'));
    ques.add(QuestionsAndAnswers(
        'Naruto first shows his nine-tails chakra when he fights who?',
        'Neji Hyuuga',
        'Sasuke Uchiha',
        'Haku',
        'Gaara',
        'Haku'));
    ques.add(QuestionsAndAnswers(
        'What is the forbidden technique used by Rock Lee that he used on Dosu and Gaara?',
        'Primary Lotus',
        'Fiery Lotus',
        'Shadow Lotus',
        'Lotus of Destruction',
        'Primary Lotus'));
    ques.add(QuestionsAndAnswers(
      'Sasuke\'s goal is gain enough power to kill whom?',
      'Itachi Uchiha',
      'Neji Hyuuga',
      'Naruto Uzumaki',
      'The Third Hokage',
      'Itachi Uchiha',
    ));
    // We must override build function.

    return MaterialApp(
        home: Scaffold(
      appBar: AppBar(
        title: Text('First App'),
      ),
      body: questionindex < 6
          ? Container(
              width: double.infinity,
              height: double.infinity,
              child:
                  /*Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [*/
                  /*Question(
                questions[questionindex]['Question']as String
            ),
            // Answer(_answerQuestion, options1[optionindex1]),
            // // Donot pass answerQuestion() since it will execute the button while making buttons
            // Answer(_answerQuestion, options1[optionindex1 + 1]),
            // Answer(_answerQuestion, options1[optionindex1 + 2]),
            // Answer(_answerQuestion, options1[optionindex1 + 3])
            ...((questions[questionindex]['Answers'])as List<String>).map((answer){
                return Answer(_answerQuestion, answer);
            }).toList()*/
                  ListView(
                children: [
                  Question(ques[questionindex].question),
                  Answer(_answerQuestion, ques[questionindex].answers[0],
                      ques[questionindex].correctAnswer),
                  SizedBox(
                    height: 8,
                  ),
                  Answer(_answerQuestion, ques[questionindex].answers[1],
                      ques[questionindex].correctAnswer),
                  SizedBox(
                    height: 8,
                  ),
                  Answer(_answerQuestion, ques[questionindex].answers[2],
                      ques[questionindex].correctAnswer),
                  SizedBox(
                    height: 8,
                  ),
                  Answer(_answerQuestion, ques[questionindex].answers[3],
                      ques[questionindex].correctAnswer),
                  SizedBox(
                    height: 30,
                  ),
                  Text(
                    displayMessage,
                    style: TextStyle(fontSize: 25, color: Colors.black),
                    textAlign: TextAlign.center,
                  ),
                ],
                scrollDirection: Axis.vertical,
              ))
          : Center(
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Container(
                        width: double.infinity,
                        child: Text(
                          'You scored: $score',
                          style: TextStyle(
                              fontSize: 30, fontWeight: FontWeight.bold),
                          textAlign: TextAlign.center,
                        )),
                    SizedBox(
                      height: 8,
                    ),
                    FlatButton(
                      child: Text(
                        "Restart",
                        style: TextStyle(fontSize: 30, color: Colors.blue),
                      ),
                      onPressed: _resetQuiz,
                    )
                  ]),
            ),
    ));
  }
}
