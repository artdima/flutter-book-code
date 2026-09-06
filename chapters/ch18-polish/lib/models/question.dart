/// Глава 14: чертёж вопроса. Глава 16: перевод в JSON и обратно.
class Question {
  const Question({
    required this.text,
    required this.answers,
    required this.correctIndex,
  });

  factory Question.fromJson(Map<String, dynamic> json) => Question(
    text: json['text'] as String,
    answers: List<String>.from(json['answers'] as List),
    correctIndex: json['correctIndex'] as int,
  );

  final String text;
  final List<String> answers;
  final int correctIndex;

  bool isCorrect(int answerIndex) => answerIndex == correctIndex;

  Map<String, dynamic> toJson() => {
    'text': text,
    'answers': answers,
    'correctIndex': correctIndex,
  };
}
