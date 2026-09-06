// Глава 6, «Анонимные функции: главный инструмент Flutter».
void main() {
  var scores = [98, 85, 77, 100];

  var best = scores.where((score) => score >= 90).toList();
  print(best);

  scores.sort((a, b) => b.compareTo(a));
  print(scores);

  var names = ['Аня', 'Тимур', 'Соня'];
  names.forEach((name) {
    print('Готовлю открытку...');
    print('$name, с праздником!');
  });
}
