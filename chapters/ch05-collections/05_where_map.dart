// Глава 5, «Конвейер: where и map».
void main() {
  var scores = [98, 85, 77, 100];

  // Отбор циклом:
  var bestByLoop = <int>[];
  for (var score in scores) {
    if (score >= 90) {
      bestByLoop.add(score);
    }
  }
  print(bestByLoop);   // [98, 100]

  // То же самое одной строкой:
  var best = scores.where((score) => score >= 90).toList();
  print(best);   // [98, 100]

  var names = ['аня', 'тимур', 'соня'];
  var shouting = names.map((name) => name.toUpperCase()).toList();
  print(shouting);   // [АНЯ, ТИМУР, СОНЯ]

  var loudBest = scores
      .where((s) => s >= 90)
      .map((s) => '$s баллов — огонь!')
      .toList();
  print(loudBest);
}
