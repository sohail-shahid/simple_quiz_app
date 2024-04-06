import 'package:flutter/material.dart';
import 'package:simple_quiz_app/data_providers/multiple_choice_quiz.dart';
import 'package:simple_quiz_app/question_screen.dart';
import 'package:simple_quiz_app/result_screen.dart';
import 'package:simple_quiz_app/quiz_start_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});
  @override
  State<HomeScreen> createState() {
    return _HomeScreenState();
  }
}

class _HomeScreenState extends State<HomeScreen> {
  var activeScreenId = 'start-screen';
  List<String> attemptedAnswers = [];

  void switchScreen() {
    setState(() {
      activeScreenId = 'question-screen';
    });
  }

  void onAnswerSelect(String answer) {
    attemptedAnswers.add(answer);
    if (attemptedAnswers.length == MultipleChoiceQuiz().questions.length) {
      setState(() {
        activeScreenId = 'result-screen';
      });
    }
  }

  void onRestartQuiz() {
    setState(() {
      activeScreenId = 'question-screen';
      attemptedAnswers = [];
    });
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(context) {
    Widget screen;
    if (activeScreenId == 'start-screen') {
      screen = QuizStartScreen(switchScreen);
    } else if (activeScreenId == 'result-screen') {
      screen = ResultScreen(
        onRestartQuiz,
        resultAnswers: attemptedAnswers,
      );
    } else {
      screen = QuestionScreen(
        onAnswerSelect: onAnswerSelect,
      );
    }
    return MaterialApp(
      home: Scaffold(
        body: Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Colors.white,
                  Color.fromARGB(255, 229, 225, 225),
                ],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
            ),
            child: screen),
      ),
    );
  }
}
