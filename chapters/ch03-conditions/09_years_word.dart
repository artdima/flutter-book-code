// Глава 3, «Чиним „мне 21 лет“». Проверьте на 1, 3, 5, 11, 13, 21, 22, 25, 111.
void main() {
  var age = 21;
  var lastDigit = age % 10;
  var lastTwo = age % 100;

  String word;
  if (lastTwo >= 11 && lastTwo <= 14) {
    word = 'лет';                       // 11, 12, 13, 14 — всегда «лет»
  } else if (lastDigit == 1) {
    word = 'год';                       // 1, 21, 31, 101…
  } else if (lastDigit >= 2 && lastDigit <= 4) {
    word = 'года';                      // 2–4, 22–24, 32–34…
  } else {
    word = 'лет';                       // всё остальное
  }

  print('Мне $age $word.');
}
