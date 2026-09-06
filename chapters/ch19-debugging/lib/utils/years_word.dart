/// Склонение «год / года / лет» — функция из главы 6, теперь под защитой теста.
String yearsWord(int age) {
  var lastTwo = age % 100;
  if (lastTwo >= 11 && lastTwo <= 14) return 'лет';

  var lastDigit = age % 10;
  if (lastDigit == 1) return 'год';
  if (lastDigit >= 2 && lastDigit <= 4) return 'года';
  return 'лет';
}
