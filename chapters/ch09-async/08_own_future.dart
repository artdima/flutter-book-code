// Глава 9, «Своя функция с ожиданием».
void main() async {
  var nickname = await loadNickname();
  print('Никнейм: $nickname');

  await saveScore(140);
}

Future<String> loadNickname() async {
  await Future.delayed(const Duration(seconds: 1));
  return 'Misha_2013';
}

Future<void> saveScore(int value) async {
  await Future.delayed(const Duration(milliseconds: 300));
  print('Сохранил $value');
}
