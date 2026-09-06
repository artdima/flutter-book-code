// Глава 2, «var, final и const» и «Типы данных».
void main() {
  var score = 0;              // можно менять сколько угодно
  final playerName = 'Миша';  // задали один раз и всё
  const maxLives = 3;         // значение известно заранее и никогда не изменится

  score = score + 1;
  print('$playerName: счёт $score, жизней $maxLives');

  int age = 13;
  double height = 1.62;
  bool likesFlutter = true;
  String city = 'Москва';

  print('$age лет, рост $height, город $city, любит Flutter: $likesFlutter');

  // Dart вывел тип int при создании — и назад дороги нет:
  // var age = 13;
  // age = 'тринадцать';   // ошибка!
}
