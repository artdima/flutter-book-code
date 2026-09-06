// Глава 5, «Словарь: ячейки с подписями».
void main() {
  var capitals = {
    'Россия': 'Москва',
    'Франция': 'Париж',
    'Япония': 'Токио',
  };

  print(capitals['Япония']);   // Токио

  var gameScores = {'Аня': 120, 'Тимур': 95};

  gameScores['Соня'] = 60;      // добавить новую пару
  gameScores['Аня'] = 150;      // заменить значение по ключу
  gameScores.remove('Тимур');   // удалить пару
  print(gameScores.length);     // 2

  print(gameScores['Марк']);   // null — такого ключа нет

  for (var entry in gameScores.entries) {
    print('${entry.key}: ${entry.value} очков');
  }
}
