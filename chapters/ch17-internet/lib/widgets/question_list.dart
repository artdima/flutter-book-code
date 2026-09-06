import 'package:flutter/material.dart';

import '../models/question.dart';

/// Глава 17: список приехавших вопросов.
class QuestionList extends StatelessWidget {
  const QuestionList({super.key, required this.questions});

  final List<Question> questions;

  @override
  Widget build(BuildContext context) {
    if (questions.isEmpty) {
      return const Center(child: Text('Сервер прислал пустой список.'));
    }

    return ListView.builder(
      itemCount: questions.length,
      itemBuilder: (context, index) {
        final question = questions[index];
        return ListTile(
          leading: CircleAvatar(child: Text('${index + 1}')),
          title: Text(question.text),
          subtitle: Text('Вариантов: ${question.answers.length}'),
        );
      },
    );
  }
}
