import 'package:flutter/material.dart';
import 'package:simple_quiz_app/custom_widgets/result_summary.dart';
import 'package:simple_quiz_app/data_providers/multiple_choice_quiz.dart';

class ResultScreen extends StatelessWidget {
  const ResultScreen(this.restartQuiz,
      {super.key, required this.resultAnswers});
  final List<String> resultAnswers;
  final void Function() restartQuiz;
  List<Map<String, Object>> getSummayData() {
    List<Map<String, Object>> summaryList = [];
    var multipleQuestions = MultipleChoiceQuiz().questions;
    for (int i = 0; i < resultAnswers.length; i++) {
      var summary = {
        'index': i,
        'question': multipleQuestions[i].question,
        'correctAnswer': multipleQuestions[i].correctAnswer,
        'givenAnswer': resultAnswers[i],
      };
      summaryList.add(summary);
    }
    return summaryList;
  }

  @override
  Widget build(BuildContext context) {
    var result = getSummayData();
    var totalQuestions = result.length;
    var correctAnswers = result
        .where(
          (detail) => detail['correctAnswer'] == detail['givenAnswer'],
        )
        .length;
    return SizedBox(
      width: double.infinity,
      child: Container(
        margin: const EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              'You answered $correctAnswers out of $totalQuestions questions correctly',
              style: const TextStyle(
                color: Colors.green,
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(
              height: 30,
            ),
            ResultSummary(result: result),
            const SizedBox(
              height: 30,
            ),
            OutlinedButton.icon(
              onPressed: restartQuiz,
              style: OutlinedButton.styleFrom(foregroundColor: Colors.blueGrey),
              icon: const Icon(
                Icons.restart_alt,
                color: Color.fromARGB(132, 52, 48, 48),
              ),
              label: const Text(
                'Restart Quiz',
                style: TextStyle(
                  color: Color.fromARGB(132, 52, 48, 48),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
