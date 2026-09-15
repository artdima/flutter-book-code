import 'package:flutter/material.dart';

import 'screens/about_screen.dart';
import 'screens/controls_screen.dart';
import 'screens/counter_screen.dart';
import 'screens/dialogs_screen.dart';
import 'screens/favorite_color_screen.dart';
import 'screens/friends_screen.dart';
import 'screens/greeter_screen.dart';
import 'screens/grid_demo_screen.dart';
import 'screens/home_screen.dart';
import 'screens/layout_demo_screen.dart';
import 'screens/list_demo_screen.dart';
import 'screens/magic_ball_screen.dart';
import 'screens/main_shell.dart';
import 'screens/playground_screen.dart';
import 'screens/profile_screen.dart';
import 'screens/red_screen_demo.dart';
import 'screens/responsive_screen.dart';
import 'screens/settings_screen.dart';
import 'screens/survey_screen.dart';
import 'screens/theme_demo_screen.dart';
import 'screens/widgets_demo_screen.dart';

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
      // Карта маршрутов — «оглавление» приложения (глава 13).
      routes: {
        '/': (context) => PlaygroundScreen(
              themeMode: _themeMode,
              onThemeModeChanged: _setThemeMode,
            ),
        '/settings': (context) => SettingsScreen(
              themeMode: _themeMode,
              onThemeModeChanged: _setThemeMode,
            ),
        '/about': (context) => const AboutScreen(),
        '/widgets': (context) => const WidgetsDemoScreen(),
        '/red': (context) => const RedScreenDemo(),
        '/layout': (context) => const LayoutDemoScreen(),
        '/list': (context) => const ListDemoScreen(),
        '/grid': (context) => const GridDemoScreen(),
        '/profile': (context) => const ProfileScreen(),
        '/counter': (context) => const CounterScreen(),
        '/greeter': (context) => const GreeterScreen(),
        '/controls': (context) => const ControlsScreen(),
        '/magic': (context) => const MagicBallScreen(),
        '/theme': (context) => const ThemeDemoScreen(),
        '/nav': (context) => const HomeScreen(),
        '/friends': (context) => const FriendsScreen(),
        '/favorite-color': (context) => const FavoriteColorScreen(),
        '/tabs': (context) => const MainShell(),
        '/dialogs': (context) => const DialogsScreen(),
        '/survey': (context) => const SurveyScreen(),
        '/responsive': (context) => const ResponsiveScreen(),
      },
    );
  }
}
