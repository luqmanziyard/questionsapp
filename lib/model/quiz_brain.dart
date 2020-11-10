import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

import 'questions.dart';

class QuizBrain {
  int questionNumber = 0;
  List<Icon> scoreKeeper = [];
  List<Question> _questionBank = [
    Question(
      q: 'Cyclones spin in a clockwise direction in the southern hemisphere',
      a: true,
    ),
    Question(
      q: 'Goldfish only have a memory of three seconds',
      a: false,
    ),
    Question(
      q: 'The capital of Libya is Benghazi',
      a: false,
    ),
    Question(
      q: 'Dolly Parton is the godmother of Miley Cyrus',
      a: true,
    ),
    Question(
      q: 'Roger Federer has won the most Wimbledon titles of any player',
      a: false,
    ),
    Question(
      q: 'An octopus has five hearts',
      a: false,
    ),
    Question(
      q: 'Brazil is the only country in the Americas to have the official language of Portuguese',
      a: true,
    ),
    Question(
      q: 'The Channel Tunnel is the longest rail tunnel in the world',
      a: false,
    ),
    Question(
      q: 'Darth Vader famously says the line “Luke, I am your father” in The Empire Strikes Back',
      a: false,
    ),
    Question(
      q: 'Olivia Newton-John represented the UK in the Eurovision Song Contest in 1974, the year ABBA won with “Waterloo”',
      a: true,
    ),
    Question(
      q: 'Stephen Hawking declined a knighthood from the Queen',
      a: true,
    ),
    Question(
      q: 'The highest mountain in England is Ben Nevis',
      a: false,
    ),
    Question(
      q: 'Nicolas Cage and Michael Jackson both married the same woman',
      a: true,
    ),
    Question(
      q: 'Japan and Russia did not sign a peace treaty after World War Two so are technically still at war',
      a: true,
    ),
    Question(
      q: 'The mathematical name for the shape of a Pringle is hyperbolic paraboloid',
      a: true,
    ),
  ];
  addQuestion(BuildContext context) {
    if (questionNumber < _questionBank.length - 1) {
      questionNumber++;
      print(questionNumber);
      print(_questionBank[questionNumber].answer);
    } else {
      return Alert(
          context: context,
          title: 'Finished',
          type: AlertType.info,
          buttons: [
            DialogButton(
              onPressed: () {
                questionNumber = 0;
                scoreKeeper.clear();
                Navigator.pop(context);
              },
              child: Text('restart'),
            ),
          ]).show();
    }
  }

  String getQuestionText() {
    return _questionBank[questionNumber].question;
  }

  bool getQuestionsAnswer() {
    return _questionBank[questionNumber].answer;
  }

  addTickIcon() {
    scoreKeeper.add(Icon(
      Icons.check,
      color: Colors.green,
      size: 20,
    ));
  }

  addCrossIcon() {
    scoreKeeper.add(Icon(
      Icons.clear,
      color: Colors.red,
      size: 20,
    ));
  }
}
