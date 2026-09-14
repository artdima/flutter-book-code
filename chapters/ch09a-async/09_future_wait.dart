// Глава 9, «Ждать по очереди и ждать разом».
void main() async {
  var start = DateTime.now();

  var parts = await Future.wait([
    loadPart('вопросы', 2),
    loadPart('картинки', 3),
    loadPart('рекорды', 1),
  ]);

  print(parts);
  print('заняло ${DateTime.now().difference(start).inSeconds} с');
}

Future<String> loadPart(String name, int seconds) async {
  await Future.delayed(Duration(seconds: seconds));
  return '$name — готово';
}
