// Глава 5, «Перебираем список».
void main() {
  var scores = [98, 85, 77, 100];
  var total = 0;

  for (var score in scores) {
    total += score;
  }
  print('Сумма: $total, средний балл: ${total / scores.length}');

  for (var i = 0; i < scores.length; i++) {
    print('Игрок ${i + 1}: ${scores[i]} очков');
  }

  scores.forEach(print);   // напечатать каждый элемент
}
