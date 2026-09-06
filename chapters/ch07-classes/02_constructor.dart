// Глава 7, «Конструктор: как объект появляется на свет».
class Pet {
  String name;
  int age;
  int food;

  Pet(this.name, this.age, {this.food = 50});

  void feed() {
    food += 20;
    print('$name поел. Сытость: $food');
  }
}

void main() {
  var cat = Pet('Барсик', 2);
  var dog = Pet('Шарик', 5, food: 90);

  cat.feed();
  dog.feed();
}
