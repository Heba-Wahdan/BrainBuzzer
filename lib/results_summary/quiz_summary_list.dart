// ignore_for_file: public_member_api_docs, sort_constructors_first
// designed to display a summary of quiz questions,
import 'package:brain_buzzer/results_summary/question_summary_card.dart';
import 'package:flutter/material.dart';

class QuizSummary extends StatelessWidget {
  final List<Map<String, Object>> summaryData;
  const QuizSummary({
    super.key,
    required this.summaryData,
  });
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 400,
      width: 350,
      child: SingleChildScrollView(
        child: Column(
          children: summaryData
              .map((data) => QuestionSummary(summaryCard: data))
              .toList(),
        ),
      ),
    );
  }
}
