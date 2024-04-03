class MultipleChoiceQuestion {
  const MultipleChoiceQuestion(this.question, this.options, this.correctAnswer);
  final String question;
  final List<String> options;
  final String correctAnswer;

  List<String> getShuffledOptions() {
    final List<String> optionCopy = List.of(options);
    optionCopy.shuffle();
    return optionCopy;
  }
}
