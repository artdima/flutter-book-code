import 'dart:math';

import 'package:flutter/material.dart';

/// Мини-проект главы 11: Магический шар.
class MagicBallScreen extends StatefulWidget {
  const MagicBallScreen({super.key});

  @override
  State<MagicBallScreen> createState() => _MagicBallScreenState();
}

class _MagicBallScreenState extends State<MagicBallScreen> {
  final _questionController = TextEditingController();
  final _random = Random();

  static const _answers = [
    'Определённо да!',
    'Даже не сомневайся.',
    'Звёзды говорят: да.',
    'Спроси завтра.',
    'Туманно... очень туманно.',
    'Сконцентрируйся и спроси ещё раз.',
    'Не рассчитывай.',
    'Мой ответ — нет.',
    'Крайне сомнительно.',
  ];

  String _answer = 'Задай вопрос — и узнаешь судьбу';
  int _questionsAsked = 0;
  bool _optimistMode = false;

  void _shake() {
    final question = _questionController.text.trim();
    if (question.isEmpty) {
      setState(() => _answer = 'Сначала задай вопрос!');
      return;
    }

    final pool = _optimistMode ? _answers.sublist(0, 3) : _answers;

    setState(() {
      _answer = pool[_random.nextInt(pool.length)];
      _questionsAsked++;
      _questionController.clear();
    });
  }

  @override
  void dispose() {
    _questionController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Магический шар')),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            TextField(
              controller: _questionController,
              decoration: const InputDecoration(
                labelText: 'Твой вопрос',
                border: OutlineInputBorder(),
                prefixIcon: Icon(Icons.help_outline),
              ),
              onSubmitted: (_) => _shake(),
            ),
            SwitchListTile(
              title: const Text('Режим оптимиста'),
              value: _optimistMode,
              onChanged: (v) => setState(() => _optimistMode = v),
            ),
            const SizedBox(height: 16),
            FilledButton.icon(
              onPressed: _shake,
              icon: const Icon(Icons.blur_circular),
              label: const Text('Встряхнуть шар'),
            ),
            const Spacer(),
            Text(
              _answer,
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontSize: 28,
                fontStyle: FontStyle.italic,
              ),
            ),
            const Spacer(),
            Text('Вопросов задано: $_questionsAsked'),
          ],
        ),
      ),
    );
  }
}
