// Глава 4, «Мини-проект: компьютер играет в „Угадай число“».
import 'dart:math';

void main() {
  var secret = Random().nextInt(100) + 1;   // загадали от 1 до 100
  print('Загадано число от 1 до 100. Начинаем!');

  var low = 1;
  var high = 100;
  var attempts = 0;

  while (true) {
    var guess = (low + high) ~/ 2;   // середина диапазона
    attempts++;
    print('Попытка $attempts: а это не $guess?');

    if (guess == secret) {
      print('Угадал! Число $secret найдено за $attempts попыток.');
      break;
    } else if (guess < secret) {
      print('— Больше!');
      low = guess + 1;
    } else {
      print('— Меньше!');
      high = guess - 1;
    }
  }
}
