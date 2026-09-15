import 'package:flutter/material.dart';

import 'screens/about_screen.dart';
import 'screens/settings_screen.dart';
import 'screens/theme_demo_screen.dart';

void main() {
  runApp(const PlaygroundApp());
}

/// Цвет-зерно всего приложения (глава 12).
const seedColor = Color(0xFF00897B);

class PlaygroundApp extends StatefulWidget {
  const PlaygroundApp({super.key});

  @override
  State<PlaygroundApp> createState() => _PlaygroundAppState();
}

class _PlaygroundAppState extends State<PlaygroundApp> {
  // themeMode — это состояние (глава 11), поэтому корень приложения stateful.
  ThemeMode _themeMode = ThemeMode.system;

  void _setThemeMode(ThemeMode mode) {
    setState(() => _themeMode = mode);
  }

  ThemeData _buildTheme(Brightness brightness) {
    return ThemeData(
      colorScheme: ColorScheme.fromSeed(
        seedColor: seedColor,
        brightness: brightness,
      ),
      filledButtonTheme: FilledButtonThemeData(
        style: FilledButton.styleFrom(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Моя песочница',
      debugShowCheckedModeBanner: false,
      theme: _buildTheme(Brightness.light),
      darkTheme: _buildTheme(Brightness.dark),
      themeMode: _themeMode,
      // Карта маршрутов появится в главе 13; здесь — только экраны этой главы.
      routes: {
        '/': (context) => const ThemeDemoScreen(),
        '/settings': (context) => SettingsScreen(
              themeMode: _themeMode,
              onThemeModeChanged: _setThemeMode,
            ),
        '/about': (context) => const AboutScreen(),
      },
    );
  }
}
