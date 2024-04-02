import 'package:flutter/material.dart';
import 'package:simple_quiz_app/custom_widgets/multiple_option_button.dart';
import 'package:simple_quiz_app/data_providers/multiple_choice_quiz.dart';

class QuestionScreen extends StatefulWidget {
  const QuestionScreen({super.key});
  @override
  State<QuestionScreen> createState() {
    return _QuestionScreenState();
  }
}

class _QuestionScreenState extends State<QuestionScreen> {
  final currentQuestion = MultipleChoiceQuiz().questions[0];
  @override
  Widget build(context) {
    return SizedBox(
      width: double.infinity,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            currentQuestion.question,
            style: const TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          MultipleOptionButton(
            optionText: currentQuestion.options[0],
            onOptionSelect: () {},
          ),
          MultipleOptionButton(
            optionText: currentQuestion.options[1],
            onOptionSelect: () {},
          ),
          MultipleOptionButton(
            optionText: currentQuestion.options[2],
            onOptionSelect: () {},
          ),
          MultipleOptionButton(
            optionText: currentQuestion.options[3],
            onOptionSelect: () {},
          ),
        ],
      ),
    );
  }
}
