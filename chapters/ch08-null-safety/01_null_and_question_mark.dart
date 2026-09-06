// Глава 8, «Почему „ничего“ опасно» и «Знак вопроса: разрешение на пустоту».
int? bestScore;        // может быть числом, а может — null
String? nickname;      // строка или «ничего»

void main() {
  var gameScores = {'Аня': 120, 'Тимур': 95};
  var score = gameScores['Марк'];   // Марка нет — в score легло null
  print(score);

  // print(score + 10);   // Dart не даст: а вдруг там null?
  // int total = null;    // ошибка: A value of type 'Null' can't be assigned to a variable of type 'int'

  print(bestScore);    // null — рекорд ещё не установлен
  bestScore = 120;
  print(bestScore);    // 120
  print(nickname);     // null
}
