import 'package:flutter/material.dart';
import 'package:questions_app/model/questions.dart';
import 'package:questions_app/model/quiz_brain.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  QuizBrain quizBrain = QuizBrain();

  void checkAnswer(bool userPickedAnswer) {
    if (userPickedAnswer == quizBrain.getQuestionsAnswer()) {
      quizBrain.addTickIcon();
    } else {
      quizBrain.addCrossIcon();
    }
    setState(() {
      quizBrain.addQuestion(context);
    });
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: Colors.black,
      body: Column(
        children: <Widget>[
          Container(
            padding: EdgeInsets.symmetric(horizontal: 20),
            margin: EdgeInsets.symmetric(
              horizontal: 10,
              vertical: 10,
            ),
            width: double.infinity,
            height: height * 0.65,
            color: Colors.black,
            child: Center(
              child: Text(
                quizBrain.getQuestionText(),
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 24,
                    fontWeight: FontWeight.bold),
              ),
            ),
          ),
          Button(
            color: Colors.green,
            title: 'true',
            onTap: () {
              checkAnswer(true);
            },
          ),
          Button(
            color: Colors.red,
            title: 'false',
            onTap: () {
              checkAnswer(false);
            },
          ),
          Container(
            margin: EdgeInsets.only(right: 20, bottom: 10, left: 20),
            child: Row(
              children: quizBrain.scoreKeeper,
            ),
          ),
        ],
      ),
    );
  }
}

class Button extends StatelessWidget {
  Button({this.color, this.title, this.onTap});
  final Color color;
  final String title;
  final Function onTap;

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: width,
        height: height / 10,
        margin: EdgeInsets.only(
          right: 20,
          left: 20,
          bottom: 20,
        ),
        color: color,
        child: Center(
          child: Text(
            title,
            style: TextStyle(color: Colors.white, fontSize: 20),
          ),
        ),
      ),
    );
  }
}
