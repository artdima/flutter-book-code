import 'package:flutter/material.dart';

class ResultScreen extends StatelessWidget {
  const ResultScreen({super.key, required this.score, required this.total});

  final int score;
  final int total;

  String get verdict {
    final percent = score / total;
    if (percent == 1.0) return 'Идеально! Ни одной ошибки!';
    if (percent >= 0.7) return 'Отличный результат!';
    if (percent >= 0.4) return 'Неплохо, но есть куда расти.';
    return 'Кажется, нужна перезагрузка. Ещё разок?';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Icon(
                score / total >= 0.7
                    ? Icons.emoji_events
                    : Icons.sentiment_satisfied,
                size: 96,
                color: Theme.of(context).colorScheme.primary,
              ),
              const SizedBox(height: 16),
              Text(
                '$score из $total',
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.displayMedium,
              ),
              Text(verdict, textAlign: TextAlign.center),
              const SizedBox(height: 32),
              FilledButton.icon(
                onPressed: () {
                  Navigator.pushReplacementNamed(context, '/game');
                },
                icon: const Icon(Icons.replay),
                label: const Text('Сыграть ещё'),
              ),
              const SizedBox(height: 8),
              TextButton(
                onPressed: () => Navigator.pop(context),
                child: const Text('На главную'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
