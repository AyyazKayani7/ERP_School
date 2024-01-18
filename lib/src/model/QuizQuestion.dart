class QuizQuestion {
  final String question;
  final List<String> options;
  final int correctOptionIndex;
  int optionSelected =
      3; //// 0 means not selected, 1 means correct selected, 0 for false

  QuizQuestion({
    required this.question,
    required this.options,
    required this.correctOptionIndex,
  });
}
