import 'package:brain_buzzer/questions_data.dart';
import 'package:brain_buzzer/results_summary/quiz_summary_list.dart';
import 'package:flutter/material.dart';

class ResultScreen extends StatelessWidget {
  final List<String> chosenAnswers;
  final Function() onRestart;

  const ResultScreen(
      {super.key, required this.chosenAnswers, required this.onRestart});
  List<Map<String, Object>> getSummaryData() {
    final List<Map<String, Object>> summary = [];

    for (int i = 0; i < chosenAnswers.length; i++) {
      summary.add({
        "question": questions[i].text,
        "question_index": i,
        "correct_answer": questions[i].answers[0],
        "user_answer": chosenAnswers[i]
      });
    }
    return summary;
  }

  @override
  Widget build(BuildContext context) {
    final summaryData = getSummaryData();
    final questionNum = questions.length;
    final correctAnswersNum = summaryData
        .where((data) => data["correct_answer"] == data["user_answer"])
        .length;
    return Center(
        child: Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          "You got $correctAnswersNum out of $questionNum correctly!",
          style: const TextStyle(
              color: Color.fromARGB(255, 255, 255, 255),
              fontWeight: FontWeight.bold,
              fontSize: 26),
        ),
        const SizedBox(
          height: 80,
        ),
        Container(
          height: 0.5,
          color: Color.fromARGB(255, 55, 145, 161),
        ),
        QuizSummary(summaryData: getSummaryData()),
        Container(
          height: 0.5,
          color: Color.fromARGB(255, 120, 31, 79),
        ),
        const SizedBox(
          height: 60,
        ),
        ElevatedButton.icon(
          onPressed: onRestart,
          icon: const Icon(
            Icons.refresh,
            color: Colors.white,
          ),
          label: const Text(
            "Restart Quiz",
            style: TextStyle(color: Colors.white),
          ),
          style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all(Colors.black),
          ),
        )
      ],
    ));
  }
}
