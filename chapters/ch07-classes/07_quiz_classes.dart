// Глава 7, «Мини-проект: классы для будущей викторины».
enum Difficulty { easy, normal, hard }

class Question {
  String text;
  List<String> answers;
  int correctIndex;
  Difficulty difficulty;

  Question(this.text, this.answers, this.correctIndex,
      {this.difficulty = Difficulty.normal});

  bool check(int answerIndex) => answerIndex == correctIndex;

  @override
  String toString() => '«$text» (${answers.length} вариантов)';
}

class GameResult {
  String playerName;
  int score;
  int total;

  GameResult(this.playerName, this.score, this.total);

  double get percent => score / total * 100;

  @override
  String toString() =>
      '$playerName: $score из $total (${percent.toStringAsFixed(0)}%)';
}

void main() {
  var questions = [
    Question('Столица Японии?', ['Пекин', 'Токио', 'Сеул'], 1),
    Question('Сколько ног у паука?', ['6', '8', '10'], 1, difficulty: Difficulty.easy),
    Question('Год первого полёта в космос?', ['1957', '1961', '1969'], 1,
        difficulty: Difficulty.hard),
  ];

  var score = 0;
  var myAnswers = [1, 1, 2];   // сыграем «вручную»

  for (var i = 0; i < questions.length; i++) {
    var ok = questions[i].check(myAnswers[i]);
    print('${questions[i]} — ${ok ? 'верно!' : 'мимо'}');
    if (ok) score++;
  }

  print(GameResult('Миша', score, questions.length));
}
