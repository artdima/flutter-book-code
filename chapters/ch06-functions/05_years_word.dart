// Глава 6, «Возврат значения: return» — склонение из главы 3, упакованное в функцию.
String yearsWord(int age) {
  var lastTwo = age % 100;
  if (lastTwo >= 11 && lastTwo <= 14) return 'лет';

  var lastDigit = age % 10;
  if (lastDigit == 1) return 'год';
  if (lastDigit >= 2 && lastDigit <= 4) return 'года';
  return 'лет';
}

void main() {
  for (var age in [1, 3, 13, 21, 25, 111]) {
    print('Мне $age ${yearsWord(age)}');
  }
}
