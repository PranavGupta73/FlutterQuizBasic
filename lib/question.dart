import 'package:flutter/material.dart';

class Question extends StatelessWidget {
  String questiontype;

  Question(this.questiontype);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      width: double.infinity,
      margin: EdgeInsets.all(20),
      child: Text(
        questiontype,
        style: TextStyle(fontSize: 28,fontWeight: FontWeight.bold,),
        textAlign: TextAlign.center,
      ),
    );
  }
}
