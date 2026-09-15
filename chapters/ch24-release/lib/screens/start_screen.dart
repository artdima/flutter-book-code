import 'package:flutter/material.dart';

import 'online_game_screen.dart';
import 'settings_screen.dart';

/// Глава 14: лицо приложения.
class StartScreen extends StatelessWidget {
  const StartScreen({super.key, required this.onThemeModeChanged});

  final ValueChanged<ThemeMode> onThemeModeChanged;

  @override
  Widget build(BuildContext context) {
    final scheme = Theme.of(context).colorScheme;

    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Column(
            children: [
              Align(
                alignment: Alignment.centerRight,
                child: IconButton(
                  icon: const Icon(Icons.settings),
                  tooltip: 'Настройки',
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => SettingsScreen(
                          onThemeModeChanged: onThemeModeChanged,
                        ),
                      ),
                    );
                  },
                ),
              ),
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
              TextButton.icon(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const OnlineGameScreen(),
                    ),
                  );
                },
                icon: const Icon(Icons.cloud_download_outlined),
                label: const Text('Свежие вопросы'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
