import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'models/settings_model.dart';
import 'screens/game_screen.dart';
import 'screens/start_screen.dart';
import 'widgets/settings_scope.dart';

void main() {
  runApp(const QuizApp());
}

class QuizApp extends StatefulWidget {
  const QuizApp({super.key});

  @override
  State<QuizApp> createState() => _QuizAppState();
}

class _QuizAppState extends State<QuizApp> {
  final _settings = SettingsModel(SharedPreferencesAsync());

  @override
  void initState() {
    super.initState();
    _settings.load();
  }

  @override
  void dispose() {
    _settings.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    const seed = Color(0xFF7C4DFF);

    return SettingsScope(
      settings: _settings,
      // Builder даёт контекст ниже SettingsScope — иначе of() его не найдёт.
      child: Builder(
        builder: (context) {
          final settings = SettingsScope.of(context);

          return MaterialApp(
            title: 'Викторина',
            theme: ThemeData(
              colorScheme: ColorScheme.fromSeed(seedColor: seed),
            ),
            darkTheme: ThemeData(
              colorScheme: ColorScheme.fromSeed(
                seedColor: seed,
                brightness: Brightness.dark,
              ),
            ),
            themeMode: settings.themeMode,
            routes: {
              '/': (context) => const StartScreen(),
              '/game': (context) => const GameScreen(),
            },
          );
        },
      ),
    );
  }
}
