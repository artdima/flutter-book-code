// Глава 4, «Цикл while: пока верно — повторяй».
void main() {
  var health = 100;
  var round = 0;

  while (health > 0) {
    round++;
    health -= 15;
    print('Раунд $round: осталось $health здоровья');
  }

  print('Бой окончен за $round раундов.');

  do {
    print('Это выполнится хотя бы один раз');
  } while (false);
}
