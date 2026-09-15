// Глава 9, «Future: расписка на будущее значение» — метод then.
void main() {
  Future.delayed(const Duration(seconds: 2), () => 'капучино')
      .then((drink) => print('Готово: $drink'));

  print('А я пока снимаю куртку');
}
