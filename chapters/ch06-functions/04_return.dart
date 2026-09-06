// Глава 6, «Возврат значения: return».
int sum(List<int> numbers) {
  var total = 0;
  for (var n in numbers) {
    total += n;
  }
  return total;
}

String rateScore(int score) {
  if (score >= 90) {
    return 'блестяще';
  }
  if (score >= 60) {
    return 'неплохо';
  }
  return 'потренируйся ещё';
}

void main() {
  var scores = [98, 85, 77, 100];
  var result = sum(scores);
  print('Сумма очков: $result');
  print('А сумма [1, 2, 3] — это ${sum([1, 2, 3])}');

  for (var score in [95, 70, 40]) {
    print('$score — ${rateScore(score)}');
  }
}
