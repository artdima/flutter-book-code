import 'package:flutter/material.dart';

/// Глава 12 + 13: переключатель темы живёт в состоянии корня приложения,
/// сюда он приезжает параметром, а обратно — колбэком.
class SettingsScreen extends StatelessWidget {
  const SettingsScreen({
    super.key,
    required this.themeMode,
    required this.onThemeModeChanged,
  });

  final ThemeMode themeMode;
  final ValueChanged<ThemeMode> onThemeModeChanged;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Настройки')),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Тема', style: Theme.of(context).textTheme.titleMedium),
            const SizedBox(height: 12),
            SegmentedButton<ThemeMode>(
              segments: const [
                ButtonSegment(
                  value: ThemeMode.light,
                  icon: Icon(Icons.light_mode),
                  label: Text('Светлая'),
                ),
                ButtonSegment(
                  value: ThemeMode.system,
                  icon: Icon(Icons.brightness_auto),
                  label: Text('Как в системе'),
                ),
                ButtonSegment(
                  value: ThemeMode.dark,
                  icon: Icon(Icons.dark_mode),
                  label: Text('Тёмная'),
                ),
              ],
              selected: {themeMode},
              onSelectionChanged: (selection) {
                onThemeModeChanged(selection.first);
              },
            ),
            const SizedBox(height: 24),
            const Text(
              'Переключите тему и пройдитесь по экранам: всё, что берёт '
              'цвета из Theme.of(context), перекрасится само.',
            ),
          ],
        ),
      ),
    );
  }
}
