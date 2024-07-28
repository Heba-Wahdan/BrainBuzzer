import 'package:flutter/material.dart';

class QuestionBadge extends StatelessWidget {
  final int questionIndex;
  final bool isCorrectAnswer;

  const QuestionBadge(
      {super.key, required this.questionIndex, required this.isCorrectAnswer});
  @override
  Widget build(BuildContext context) {
    final questionNumber = questionIndex + 1;
    return Container(
      height: 30,
      width: 30,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(100),
          color: isCorrectAnswer
              ? const Color.fromARGB(255, 55, 145, 161)
              : const Color.fromARGB(255, 40, 39, 39)),
      child: Center(
        child: Text(
          questionNumber.toString(),
          style: const TextStyle(
              color: Color.fromARGB(255, 255, 255, 255),
              fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
