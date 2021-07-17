import 'package:flutter/material.dart';

var score = 0;

class Answer extends StatelessWidget {
  final Function selectHandler;
  final String buttonText;
  String CorrectAnswer;

  Answer(this.selectHandler, this.buttonText, this.CorrectAnswer);

  @override
  Widget build(BuildContext context) {
    return /*Container(
        width: double.infinity,
        margin: EdgeInsets.all(10),
        child:*/ SizedBox(
          width: double.infinity,
          height: 100,
          child: ElevatedButton(

              child: Text(
                buttonText,
                style: TextStyle(fontSize: 40),
                textAlign: TextAlign.center,
              ),
              onPressed: () {
                if (buttonText == CorrectAnswer) {
                  score++;
                }
                selectHandler();
              },
              style: ElevatedButton.styleFrom(primary: Colors.red),),
        );
  }
}
