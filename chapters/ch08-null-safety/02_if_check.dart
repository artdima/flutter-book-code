// Глава 8, «Инструмент 1: старый добрый if».
void main() {
  var gameScores = {'Аня': 120, 'Тимур': 95};
  int? score = gameScores['Марк'];

  if (score != null) {
    print('Очки с бонусом: ${score + 10}');
  } else {
    print('Марк ещё не играл.');
  }
}
