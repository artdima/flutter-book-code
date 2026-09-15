import 'package:flutter/material.dart';

import '../widgets/settings_scope.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final settings = SettingsScope.of(context);

    return Scaffold(
      appBar: AppBar(title: const Text('Настройки')),
      body: ListView(
        children: [
          SwitchListTile(
            title: const Text('Звук'),
            subtitle: const Text('Щелчок на правильный и неправильный ответ'),
            value: settings.soundOn,
            onChanged: settings.setSoundOn,
          ),
          const Divider(),
          const Padding(
            padding: EdgeInsets.fromLTRB(16, 16, 16, 8),
            child: Text('Тема'),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: SegmentedButton<ThemeMode>(
              segments: const [
                ButtonSegment(
                  value: ThemeMode.system,
                  label: Text('Как в системе'),
                ),
                ButtonSegment(value: ThemeMode.light, label: Text('Светлая')),
                ButtonSegment(value: ThemeMode.dark, label: Text('Тёмная')),
              ],
              selected: {settings.themeMode},
              onSelectionChanged: (s) => settings.setThemeMode(s.first),
            ),
          ),
          const Divider(height: 32),
          ListTile(
            leading: const Icon(Icons.info_outline),
            title: const Text('О приложении'),
            onTap: () {
              showAboutDialog(
                context: context,
                applicationName: 'Викторина',
                applicationVersion: '1.0.0',
                children: const [
                  Text(
                    'Пример из книги «Разработка мобильных приложений '
                    'на Flutter».',
                  ),
                  Text('Вопросы и идеи: artdima.ru/book'),
                ],
              );
            },
          ),
        ],
      ),
    );
  }
}
