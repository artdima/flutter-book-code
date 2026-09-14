// Глава 9, мини-проект «Экран загрузки».
// Чтобы увидеть запасную дорогу, замените в loadBestScore
// return 140 на throw Exception('сервер молчит');
void main() async {
  print('Загружаю профиль…');

  try {
    var data = await Future.wait([
      loadName(),
      loadBestScore(),
      loadQuestions(),
    ]);

    var name = data[0] as String;
    var best = data[1] as int;
    var questions = data[2] as List<String>;

    print('Привет, $name!');
    print('Твой рекорд: $best');
    print('Вопросов готово: ${questions.length}');
  } catch (e) {
    print('Не удалось загрузить профиль: $e');
    print('Играем без сохранений.');
  } finally {
    print('Колёсико убрано, показываю главный экран.');
  }
}

Future<String> loadName() async {
  await Future.delayed(const Duration(milliseconds: 400));
  return 'Михаил';
}

Future<int> loadBestScore() async {
  await Future.delayed(const Duration(milliseconds: 700));
  return 140;
}

Future<List<String>> loadQuestions() async {
  await Future.delayed(const Duration(seconds: 1));
  return ['Столица Франции?', 'Сколько ног у паука?', 'Самая длинная река?'];
}
