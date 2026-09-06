// Глава 4, «break и continue: выйти или пропустить».
void main() {
  var codes = [12, 7, 43, 99, 18];

  for (var code in codes) {
    print('Проверяю $code...');
    if (code == 43) {
      print('Нашёл! Секретный код — $code.');
      break;   // дальше искать незачем
    }
  }

  for (var i = 1; i <= 10; i++) {
    if (i % 2 == 0) {
      continue;   // чётные пропускаем
    }
    print(i);     // печатаются только 1, 3, 5, 7, 9
  }
}
