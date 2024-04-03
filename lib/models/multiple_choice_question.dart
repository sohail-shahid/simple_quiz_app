class MultipleChoiceQuestion {
  const MultipleChoiceQuestion(this.question, this.options, this.answer);
  final String question;
  final List<String> options;
  final String answer;

  List<String> getShuffledOptions() {
    final List<String> optionCopy = List.of(options);
    optionCopy.shuffle();
    return optionCopy;
  }
}
