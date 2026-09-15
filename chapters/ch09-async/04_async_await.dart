// Глава 9, «async и await: читаем сверху вниз».
void main() async {
  print('Заказал кофе');

  var drink = await Future.delayed(
    const Duration(seconds: 2),
    () => 'капучино',
  );

  print('Готово: $drink');
}
