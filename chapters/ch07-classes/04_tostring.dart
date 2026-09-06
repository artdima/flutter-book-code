// Глава 7, «toString: как объект представляется».
class Pet {
  String name;
  int age;

  Pet(this.name, this.age);

  @override
  String toString() => '$name, $age ${age == 1 ? 'год' : 'лет'}';
}

void main() {
  var cat = Pet('Барсик', 2);
  print(cat);   // Барсик, 2 лет  (хм — а склонение-то у нас уже есть в главе 6!)
}
