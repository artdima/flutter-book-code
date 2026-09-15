class Question {
  const Question({
    required this.text,
    required this.answers,
    required this.correctIndex,
  });

  final String text;
  final List<String> answers;
  final int correctIndex;

  bool isCorrect(int answerIndex) => answerIndex == correctIndex;
}
