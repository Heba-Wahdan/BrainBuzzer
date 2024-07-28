// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:brain_buzzer/answer_button_style.dart';
import 'package:brain_buzzer/questions_data.dart';

class QuestionsScreen extends StatefulWidget {
  const QuestionsScreen(
      {required this.onSelectedAnswer, super.key}); // Added const
  final void Function(String answer) onSelectedAnswer;
  @override
  State<QuestionsScreen> createState() {
    return _QuestionScreenState();
  }
}

class _QuestionScreenState extends State<QuestionsScreen> {
  var currentQuestionIndex = 0;

  void nextQuestion(String selectedAnswer) {
    widget.onSelectedAnswer(selectedAnswer);
    setState(() {
      currentQuestionIndex++;
    });
  }

  @override
  Widget build(BuildContext context) {
    final currentQuestion = questions[currentQuestionIndex];
    return Center(
      child: Container(
        margin: const EdgeInsets.all(50),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              style: TextStyle(
                fontSize: 23,
                color: Color.fromARGB(255, 255, 255, 255),
              ),
              currentQuestion.text,
              textAlign: TextAlign.center,
            ),
            const SizedBox(
              height: 25,
            ),
            ...currentQuestion.getShuffledAnswers().map(
                  (answer) => AnswerButton(
                    onTap: () {
                      nextQuestion(answer);
                    },
                    answerText: answer,
                  ),
                )
          ],
        ),
      ),
    );
  }
}
