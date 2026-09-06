// Глава 4, «Цикл for-in: пройтись по коллекции».
void main() {
  var friends = ['Аня', 'Тимур', 'Соня', 'Марк'];

  for (var friend in friends) {
    print('$friend, приходи на праздник!');
  }
}
