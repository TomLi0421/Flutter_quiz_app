import 'package:flutter/material.dart';
import 'package:quiz/data/question.dart';
import 'package:quiz/screens/question_screen.dart';
import 'package:quiz/screens/result_screen.dart';
import 'package:quiz/screens/start_screen.dart';

class Quiz extends StatefulWidget {
  const Quiz({super.key});
  @override
  State<Quiz> createState() {
    return _QuizState();
  }
}

class _QuizState extends State<Quiz> {
  List<String> selectedAnswer = [];

  void storeSelectedAnswer(String answer) {
    selectedAnswer.add(answer);
    if (selectedAnswer.length == questions.length) {
      setState(() {
        activeScreen = 'result_screen';
      });
    }
  }

  String activeScreen = 'start_screen';

  void switchScreen() {
    setState(() {
      activeScreen = 'question_screen';
      selectedAnswer = [];
    });
  }

  @override
  Widget build(BuildContext context) {
    Widget screen = StartScreen(onTap: switchScreen);

    if (activeScreen == 'question_screen') {
      screen = QuestionScreen(
        selectAnswer: storeSelectedAnswer,
      );
    } else if (activeScreen == 'result_screen') {
      screen = ResultScreen(
        selectedAnswer: selectedAnswer,
        restart: switchScreen,
      );
    }

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [Color(0xFF7209b7), Color(0xFF4361ee)],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
          child: screen,
        ),
      ),
    );
  }
}
