import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quiz/answer_button.dart';
import 'package:quiz/data/question.dart';

class QuestionScreen extends StatefulWidget {
  const QuestionScreen({super.key, required this.selectAnswer});

  final void Function(String answer) selectAnswer;

  @override
  State<QuestionScreen> createState() {
    return _QuestionScreenState();
  }
}

class _QuestionScreenState extends State<QuestionScreen> {
  int currentQuestion = 0;
  List<String> selectedAnswer = [];

  void answerQuestion() {
    setState(() {
      currentQuestion++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 30.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
            questions[currentQuestion].text,
            textAlign: TextAlign.center,
            style: GoogleFonts.lato(
              fontSize: 20.0,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
          const SizedBox(
            height: 30.0,
          ),
          ...questions[currentQuestion].shuffleAnswer.map((data) {
            return AnswerButton(
              answer: data,
              selectAnswer: () {
                answerQuestion();
                widget.selectAnswer(data);
              },
            );
          })
        ],
      ),
    );
  }
}
