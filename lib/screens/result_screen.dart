import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quiz/result.dart';
import 'package:quiz/data/question.dart';

class ResultScreen extends StatelessWidget {
  const ResultScreen(
      {super.key, required this.selectedAnswer, required this.restart});

  final List<String> selectedAnswer;
  final void Function() restart;

  List<Map<String, Object>> get summary {
    List<Map<String, Object>> summaryData = [];
    for (int i = 0; i < questions.length; i++) {
      summaryData.add({
        'question_index': i,
        'question': questions[i].text,
        'question_answer': questions[i].answers[0],
        'user_answer': selectedAnswer[i]
      });
    }
    return summaryData;
  }

  @override
  Widget build(BuildContext context) {
    final int numOfQuestion = questions.length;
    int correctCount = summary
        .where((data) => data['question_answer'] == data['user_answer'])
        .length;
    return Center(
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 40.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'You answered $correctCount out of $numOfQuestion question correctly',
              textAlign: TextAlign.center,
              style: GoogleFonts.lato(
                color: Colors.white,
                fontSize: 24.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(
              height: 30.0,
            ),
            Result(
              summary: summary,
            ),
            const SizedBox(
              height: 30.0,
            ),
            OutlinedButton.icon(
              onPressed: restart,
              icon: const Icon(Icons.restart_alt),
              label: const Text(
                'Restart',
              ),
              style: OutlinedButton.styleFrom(
                foregroundColor: Colors.white,
              ),
            )
          ],
        ),
      ),
    );
  }
}
