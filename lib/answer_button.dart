import 'package:flutter/material.dart';

class AnswerButton extends StatelessWidget {
  const AnswerButton(
      {super.key, required this.answer, required this.selectAnswer});
  final String answer;
  final void Function() selectAnswer;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: selectAnswer,
      style: ElevatedButton.styleFrom(
        backgroundColor: const Color(0xFF3a0ca3),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(40.0),
        ),
      ),
      child: Text(
        answer,
        textAlign: TextAlign.center,
      ),
    );
  }
}
