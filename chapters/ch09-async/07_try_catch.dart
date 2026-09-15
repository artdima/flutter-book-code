// Глава 9, «Когда что-то пошло не так».
void main() async {
  try {
    var score = await loadScore();
    print('Рекорд: $score');
  } catch (e) {
    print('Не получилось: $e');
  } finally {
    print('Убираю колёсико загрузки');
  }
}

Future<int> loadScore() async {
  await Future.delayed(const Duration(milliseconds: 500));
  throw Exception('нет связи с сервером');
}
