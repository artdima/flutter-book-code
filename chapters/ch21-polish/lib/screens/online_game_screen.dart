import 'package:flutter/material.dart';

import '../models/question.dart';
import '../services/questions_api.dart';
import '../widgets/error_view.dart';
import '../widgets/question_list.dart';

/// Глава 17: экран, который умеет ждать — FutureBuilder и три судьбы обещания.
class OnlineGameScreen extends StatefulWidget {
  const OnlineGameScreen({super.key});

  @override
  State<OnlineGameScreen> createState() => _OnlineGameScreenState();
}

class _OnlineGameScreenState extends State<OnlineGameScreen> {
  // Не `late final`: кнопка «Повторить» кладёт сюда новое обещание,
  // а `final` разрешает присвоение ровно один раз.
  late Future<List<Question>> _futureQuestions;

  @override
  void initState() {
    super.initState();
    _futureQuestions = QuestionsApi().fetchQuestions();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Свежие вопросы')),
      body: FutureBuilder<List<Question>>(
        future: _futureQuestions,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }
          if (snapshot.hasError) {
            return ErrorView(
              message: 'Не удалось загрузить вопросы.\nПроверь интернет!',
              onRetry: () {
                setState(() {
                  _futureQuestions = QuestionsApi().fetchQuestions();
                });
              },
            );
          }
          final questions = snapshot.data!;
          return QuestionList(questions: questions);
        },
      ),
    );
  }
}
