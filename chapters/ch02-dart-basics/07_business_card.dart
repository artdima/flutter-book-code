// Глава 2, «Собираем всё вместе: программа-визитка».
void main() {
  const city = 'Пермь';
  final name = 'Миша';
  var age = 13;
  final hobbies = 'футбол, гитара и Flutter';

  final yearsToLicence = 18 - age;

  print('Привет! Меня зовут $name.');
  print('Мне $age лет, я живу в городе $city.');
  print('Люблю $hobbies.');
  print('До водительских прав ждать $yearsToLicence лет.');
  print('А через 5 лет мне будет ${age + 5}.');
}
