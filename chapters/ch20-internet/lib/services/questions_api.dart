import 'dart:convert';

import 'package:http/http.dart' as http;

import '../data/questions.dart';
import '../models/question.dart';

/// Глава 17: вопросы с сервера.
class QuestionsApi {
  static const _url = 'https://www.artdima.ru/book/questions.json';

  Future<List<Question>> fetchQuestions() async {
    final response = await http.get(Uri.parse(_url));

    if (response.statusCode != 200) {
      throw Exception('Сервер ответил кодом ${response.statusCode}');
    }

    final list = jsonDecode(utf8.decode(response.bodyBytes)) as List;
    return list
        .map((item) => Question.fromJson(item as Map<String, dynamic>))
        .toList();
  }
}

/// Глава 17: сеть — бонус, а не костыль. Нет интернета — играем на встроенных.
Future<List<Question>> loadAllQuestions() async {
  var online = <Question>[];
  try {
    online = await QuestionsApi().fetchQuestions();
  } catch (e) {
    // не вышло — ну и ладно, сыграем на встроенных
  }
  return [...questions, ...online];
}
