import 'package:flutter/material.dart';

class StartScreen extends StatelessWidget {
  const StartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final scheme = Theme.of(context).colorScheme;

    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Column(
            children: [
              const Spacer(),
              Icon(Icons.psychology, size: 96, color: scheme.primary),
              const SizedBox(height: 16),
              Text(
                'Викторина',
                style: Theme.of(context).textTheme.displaySmall,
              ),
              Text(
                'Проверь себя!',
                style: Theme.of(context).textTheme.titleMedium,
              ),
              const SizedBox(height: 32),
              Card(
                child: Padding(
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [
                      Text('Правила простые:'),
                      SizedBox(height: 8),
                      Text('• на каждый вопрос — четыре варианта'),
                      Text('• правильный ответ — плюс очко'),
                      Text('• подсказок нет, интернет не поможет'),
                    ],
                  ),
                ),
              ),
              const Spacer(),
              SizedBox(
                width: double.infinity,
                child: FilledButton.icon(
                  onPressed: () {
                    Navigator.pushNamed(context, '/game');
                  },
                  icon: const Icon(Icons.play_arrow),
                  label: const Text('Играть'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
