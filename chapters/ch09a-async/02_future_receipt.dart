// Глава 9, «Future: расписка на будущее значение».
void main() {
  Future<String> coffee = Future.delayed(
    const Duration(seconds: 2),
    () => 'капучино',
  );

  print(coffee);
  print('А я пока снимаю куртку');
}
