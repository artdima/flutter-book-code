// Глава 7, «Именованные конструкторы».
class Pet {
  String name;
  int age;
  int food;

  Pet(this.name, this.age, {this.food = 50});

  Pet.newborn(String name)
      : this(name, 0, food: 100);
}

void main() {
  var puppy = Pet.newborn('Кнопка');
  print('${puppy.name}, возраст ${puppy.age}, сытость ${puppy.food}');
}
