import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:quiz_app/models/question.dart';
import 'package:quiz_app/widgets/answer_button.dart';

void main() {
  test('Question.isCorrect сравнивает с правильным индексом', () {
    const question = Question(
      text: 'Сколько ног у паука?',
      answers: ['6', '8', '10'],
      correctIndex: 1,
    );

    expect(question.isCorrect(1), isTrue);
    expect(question.isCorrect(0), isFalse);
  });

  test('Question переживает поездку в JSON и обратно', () {
    const question = Question(
      text: 'Какой океан самый большой?',
      answers: ['Атлантический', 'Тихий'],
      correctIndex: 1,
    );

    final restored = Question.fromJson(question.toJson());

    expect(restored.text, question.text);
    expect(restored.answers, question.answers);
    expect(restored.correctIndex, question.correctIndex);
  });

  testWidgets('AnswerButton с onPressed: null выключен', (tester) async {
    await tester.pumpWidget(
      const MaterialApp(
        home: Scaffold(body: AnswerButton(text: 'Тихий', onPressed: null)),
      ),
    );

    final button = tester.widget<FilledButton>(find.byType(FilledButton));
    expect(button.onPressed, isNull);
  });
}
