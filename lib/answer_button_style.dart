import 'package:flutter/material.dart';

class AnswerButton extends StatelessWidget {
  final Function() onTap;
  final String answerText;

  const AnswerButton({
    super.key,
    required this.onTap,
    required this.answerText,
  });
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ButtonStyle(
          backgroundColor:
              MaterialStateProperty.all(Color.fromARGB(255, 36, 36, 36))),
      onPressed: onTap,
      child: Text(
        answerText,
        textAlign: TextAlign.center,
        style: const TextStyle(
          color: Color.fromARGB(255, 255, 255, 255),
          fontSize: 14,
        ),
      ),
    );
  }
}
