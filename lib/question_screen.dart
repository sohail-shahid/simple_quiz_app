import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:simple_quiz_app/custom_widgets/multiple_option_button.dart';
import 'package:simple_quiz_app/data_providers/multiple_choice_quiz.dart';

class QuestionScreen extends StatefulWidget {
  const QuestionScreen({super.key, required this.onAnswerSelect});
  final void Function(String answer) onAnswerSelect;
  @override
  State<QuestionScreen> createState() {
    return _QuestionScreenState();
  }
}

class _QuestionScreenState extends State<QuestionScreen> {
  int currentQuestionIndex = 0;
  void onOptionSelect(String selectedOption) {
    widget.onAnswerSelect(selectedOption);
    setState(() {
      currentQuestionIndex += 1;
    });
  }

  @override
  Widget build(context) {
    var currentQuestion = MultipleChoiceQuiz().questions[currentQuestionIndex];
    return SizedBox(
      width: double.infinity,
      child: Container(
        margin: const EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              currentQuestion.question,
              style: GoogleFonts.lato(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: const Color.fromARGB(132, 52, 48, 48),
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(
              height: 20,
            ),
            ...currentQuestion.shuffledOptions.map(
              (option) => MultipleOptionButton(
                optionText: option,
                onOptionSelect: () {
                  onOptionSelect(option);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
