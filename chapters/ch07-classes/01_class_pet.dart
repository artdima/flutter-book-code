// Глава 7, «Класс, поля и методы» и «Создаём объект».
class Pet {
  String name = '';
  int age = 0;
  int food = 50;

  void feed() {
    food += 20;
    print('$name поел. Сытость: $food');
  }

  void play() {
    food -= 15;
    print('$name наигрался! Сытость: $food');
  }
}

void main() {
  var cat = Pet();
  cat.name = 'Барсик';
  cat.age = 2;

  var dog = Pet();
  dog.name = 'Шарик';
  dog.age = 5;

  cat.feed();    // Барсик поел. Сытость: 70
  dog.play();    // Шарик наигрался! Сытость: 35
  print('${cat.name}: ${cat.food}');   // Барсик: 70
}
