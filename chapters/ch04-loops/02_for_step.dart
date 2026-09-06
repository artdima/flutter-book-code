// Глава 4, «Цикл for»: обратный отсчёт и шаг, не равный единице.
void main() {
  for (var second = 10; second >= 1; second--) {
    print(second);
  }
  print('Пуск!');

  for (var i = 5; i <= 60; i += 5) {
    print('$i минут');
  }
}
