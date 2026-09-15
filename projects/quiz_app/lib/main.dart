import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'screens/game_screen.dart';
import 'screens/start_screen.dart';

void main() {
  runApp(const QuizApp());
}

/// Глава 14: запуск, тема, маршруты. Глава 16: подъём состояния темы наверх.
class QuizApp extends StatefulWidget {
  const QuizApp({super.key});

  @override
  State<QuizApp> createState() => _QuizAppState();
}

class _QuizAppState extends State<QuizApp> {
  ThemeMode _themeMode = ThemeMode.system;

  @override
  void initState() {
    super.initState();
    _loadThemeMode();
  }

  Future<void> _loadThemeMode() async {
    final name = await SharedPreferencesAsync().getString('theme_mode');
    if (!mounted || name == null) return;
    setState(() => _themeMode = ThemeMode.values.byName(name));
  }

  void _setThemeMode(ThemeMode mode) {
    setState(() => _themeMode = mode);
    SharedPreferencesAsync().setString('theme_mode', mode.name);
  }

  @override
  Widget build(BuildContext context) {
    const seed = Color(0xFF7C4DFF);

    return MaterialApp(
      title: 'Викторина',
      theme: ThemeData(colorScheme: ColorScheme.fromSeed(seedColor: seed)),
      darkTheme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: seed,
          brightness: Brightness.dark,
        ),
      ),
      themeMode: _themeMode,
      routes: {
        // Экрана результата в маршрутах нет: ему нужны счёт и общее число
        // вопросов, а маршрут по имени параметров не передаёт — результат
        // открывает GameScreen через MaterialPageRoute (глава 15).
        '/': (context) => StartScreen(onThemeModeChanged: _setThemeMode),
        '/game': (context) => const GameScreen(),
      },
    );
  }
}
