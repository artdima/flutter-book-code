// Глава 5, «Список: порядок имеет значение» и «Компьютер считает с нуля».
void main() {
  var playlist = ['Кино', 'Дайте танк (!)', 'Монеточка', 'Нервы'];
  print(playlist);

  List<int> scores = [98, 85, 77, 100];
  print(scores);

  print(playlist[0]);   // Кино
  print(playlist[1]);   // Дайте танк (!)
  print(playlist[3]);   // Нервы

  // print(playlist[4]);   // RangeError (index): Invalid value: 4 — полки с таким номером нет

  playlist[1] = 'Три дня дождя';   // вторая песня теперь другая
  print(playlist);
}
