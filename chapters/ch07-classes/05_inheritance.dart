// Глава 7, «Наследование: общий предок и потомки».
class Pet {
  String name;
  Pet(this.name);

  void makeSound() {
    print('$name издаёт какой-то звук.');
  }

  void feed() {
    print('$name поел.');
  }
}

class Cat extends Pet {
  Cat(super.name);

  @override
  void makeSound() {
    print('$name: Мяу!');
  }

  void purr() {
    print('$name мурчит...');
  }
}

class Dog extends Pet {
  Dog(super.name);

  @override
  void makeSound() {
    print('$name: Гав-гав!');
  }
}

void main() {
  var cat = Cat('Барсик');
  var dog = Dog('Шарик');

  cat.makeSound();   // Барсик: Мяу!
  dog.makeSound();   // Шарик: Гав-гав!
  cat.feed();        // Барсик поел.  — унаследовано от Pet!
  cat.purr();        // Барсик мурчит...
}
