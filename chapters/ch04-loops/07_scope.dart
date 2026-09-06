// Глава 4, «Где живут переменные: область видимости».
void main() {
  for (var row = 1; row <= 3; row++) {
    var line = '*' * row;
    print(line);
  }
  // print(line);   // ошибка: Undefined name 'line' — переменная умерла на скобке цикла

  var total = 0;                    // живёт снаружи — переживёт цикл
  for (var price in [120, 45, 80]) {
    total += price;
  }
  print('Итого: $total рублей');    // 245
}
