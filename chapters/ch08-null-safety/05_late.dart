// Глава 8, «Обещание „значение будет“: late».
class Game {
  late String playerName;   // узнаем на экране приветствия

  void start(String name) {
    playerName = name;
  }

  void greet() {
    print('Удачи, $playerName!');
  }
}

void main() {
  var game = Game();
  game.start('Миша');
  game.greet();

  // Нарушенное обещание: greet() до start() — LateInitializationError на бегу.
  // Game().greet();
}
