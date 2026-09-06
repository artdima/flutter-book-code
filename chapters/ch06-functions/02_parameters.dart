// Глава 6, «Параметры: данные на входе».
void greet(String name) {
  print('Привет, $name!');
}

void invite(String name, String date, int hour) {
  print('$name, приходи $date к $hour:00 — будет праздник!');
}

void main() {
  greet('Аня');
  greet('Тимур');

  var friends = ['Соня', 'Марк', 'Лена'];
  for (var friend in friends) {
    greet(friend);
  }

  invite('Аня', '12 марта', 15);
}
