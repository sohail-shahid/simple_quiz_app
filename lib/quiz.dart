import 'package:flutter/material.dart';
import 'package:simple_quiz_app/data_providers/multiple_choice_quiz.dart';
import 'package:simple_quiz_app/question_screen.dart';
import 'package:simple_quiz_app/start_screen.dart';

class Quiz extends StatefulWidget {
  const Quiz({super.key});
  @override
  State<Quiz> createState() {
    return _QuizState();
  }
}

class _QuizState extends State<Quiz> {
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
        attemptedAnswers = [];
        activeScreenId = 'start-screen';
      });
    }
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(context) {
    return MaterialApp(
      home: Scaffold(
        body: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Colors.orange,
                Color.fromARGB(255, 165, 98, 15),
              ],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
          child: activeScreenId == 'start-screen'
              ? StartScreen(switchScreen)
              : QuestionScreen(
                  onAnswerSelect: onAnswerSelect,
                ),
        ),
      ),
    );
  }
}
