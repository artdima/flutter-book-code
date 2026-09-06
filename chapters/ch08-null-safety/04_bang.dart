// Глава 8, «Инструмент 4 (опасный): восклицательный знак !».
void main() {
  var gameScores = {'Аня': 120, 'Тимур': 95};

  var anyaScore = gameScores['Аня']!;   // я уверен: Аня в словаре есть
  print(anyaScore + 10);

  // А если уверенность подвела — программа упадёт прямо на бегу:
  // var markScore = gameScores['Марк']!;   // Null check operator used on a null value
}
