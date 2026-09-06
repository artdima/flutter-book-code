// Глава 8, «Инструмент 2: безопасная точка ?.» и «Инструмент 3: запасное значение ??».
void main() {
  String? nickname;
  int? bestScore;

  print(nickname?.toUpperCase());   // null — и никакого падения

  var displayName = nickname ?? 'Гость';
  var startFrom = bestScore ?? 0;

  print('Привет, $displayName! Твой рекорд: $startFrom');

  bestScore ??= 50;   // если рекорда не было — теперь 50; был — не трогаем
  print(bestScore);
}
