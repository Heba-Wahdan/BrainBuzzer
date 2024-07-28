import 'package:brain_buzzer/results_summary/question_badge.dart';
import 'package:flutter/material.dart';

class QuestionSummary extends StatelessWidget {
  final Map<String, Object> summaryCard;

  const QuestionSummary({
    super.key,
    required this.summaryCard,
  });

  @override
  Widget build(BuildContext context) {
    final isCorrectAnswer =
        summaryCard["user_answer"] == summaryCard["correct_answer"];
    return Row(
      children: [
        QuestionBadge(
            questionIndex: summaryCard["question_index"] as int,
            isCorrectAnswer: isCorrectAnswer),
        const SizedBox(
          width: 20,
        ),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                summaryCard["question"] as String,
                style: const TextStyle(
                  fontSize: 16,
                  color: Color.fromARGB(255, 255, 255, 255),
                ),
              ),
              const SizedBox(
                height: 0,
              ),
              Text(
                summaryCard["user_answer"] as String,
                style: const TextStyle(
                  fontSize: 16,
                  color: Colors.black,
                ),
              ),
              const SizedBox(
                height: 0,
              ),
              Text(
                summaryCard["correct_answer"] as String,
                style: const TextStyle(
                  fontSize: 16,
                  color: Colors.redAccent,
                ),
              ),
              const SizedBox(
                height: 15,
              ),
            ],
          ),
        )
      ],
    );
  }
}
