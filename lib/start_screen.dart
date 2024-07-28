// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

class StartScreen extends StatelessWidget {
  const StartScreen({
    super.key,
    required this.startQuiz,
  });

  final Function() startQuiz;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          Image.asset("assets/images/artificial-intelligence.png", width: 250),
          const SizedBox(
            height: 100,
          ),
          ElevatedButton(
            onPressed: startQuiz,
            child: const Text(
              "Start Quiz",
              style: TextStyle(color: Colors.white),
            ),
            style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all(Colors.black),
            ),
          )
        ],
      ),
    );
  }
}
