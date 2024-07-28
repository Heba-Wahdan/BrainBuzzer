import 'package:brain_buzzer/question_screen.dart';
import 'package:brain_buzzer/questions_data.dart';
import 'package:brain_buzzer/result_screen.dart';
import 'package:brain_buzzer/start_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';

class BrainBuzzer extends StatefulWidget {
  const BrainBuzzer({super.key});

  @override
  State<BrainBuzzer> createState() {
    return _BrainBuzzer();
  }
}

class _BrainBuzzer extends State<BrainBuzzer> {
  List<String> selectAnswer = [];
  var activeScreen = "Start Screen";

  void switchScreen() {
    setState(() {
      activeScreen = "Question Screen";
    });
  }

  void restartQuiz() {
    setState(() {
      selectAnswer = [];
      activeScreen = "Question Screen";
    });
  }

  void chooseAnswer(String answer) {
    selectAnswer.add(answer);

    if (selectAnswer.length == questions.length) {
      setState(() {
        print("Final answers: $selectAnswer");
        activeScreen = "Result Screen";
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    Widget screenWidget = StartScreen(startQuiz: switchScreen);

    if (activeScreen == "Question Screen") {
      screenWidget = QuestionsScreen(
        onSelectedAnswer: chooseAnswer,
      );
    }

    if (activeScreen == "Result Screen") {
      screenWidget = ResultScreen(
        onRestart: restartQuiz,
        chosenAnswers: selectAnswer,
      );
    }
    return MaterialApp(
      home: Scaffold(
        body: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(colors: [
             Color.fromARGB(255, 170, 45, 112), 
              Color.fromARGB(255, 55, 145, 161),
            ], begin: Alignment.bottomCenter, end: Alignment.topRight),
          ),
          child:
              screenWidget, //i stored it at first in a widget so I can use here in the child property because it obly accepts widgets
        ),
      ),
    );
  }
}
