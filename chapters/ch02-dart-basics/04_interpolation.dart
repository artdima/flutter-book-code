// Глава 2, «Собираем строки: интерполяция».
void main() {
  var name = 'Миша';
  var age = 13;

  print('Меня зовут $name, мне $age лет.');
  print('Через 5 лет мне будет ${age + 5}.');

  print('Привет, ' + name);   // работает, но читается хуже

  print('It\'s ok');
  print("It's ok");
}
