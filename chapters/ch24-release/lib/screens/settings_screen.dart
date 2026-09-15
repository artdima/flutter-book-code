import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

/// Глава 16: настройки. Тема живёт наверху, сюда спускается функция-ручка.
class SettingsScreen extends StatefulWidget {
  const SettingsScreen({super.key, required this.onThemeModeChanged});

  final ValueChanged<ThemeMode> onThemeModeChanged;

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  final _prefs = SharedPreferencesAsync();
  bool _soundOn = true;
  ThemeMode _themeMode = ThemeMode.system;

  @override
  void initState() {
    super.initState();
    _loadSettings();
  }

  void _loadSettings() {
    _prefs.getBool('sound_on').then((value) {
      if (!mounted) return;
      setState(() => _soundOn = value ?? true);
    });
    _prefs.getString('theme_mode').then((name) {
      if (!mounted || name == null) return;
      setState(() => _themeMode = ThemeMode.values.byName(name));
    });
  }

  void _setSound(bool value) {
    setState(() => _soundOn = value);
    _prefs.setBool('sound_on', value);
  }

  void _setTheme(ThemeMode mode) {
    setState(() => _themeMode = mode);
    widget.onThemeModeChanged(mode);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Настройки')),
      body: ListView(
        children: [
          SwitchListTile(
            title: const Text('Звук'),
            subtitle: const Text('Щелчок на правильный и неправильный ответ'),
            value: _soundOn,
            onChanged: _setSound,
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
              selected: {_themeMode},
              onSelectionChanged: (selection) => _setTheme(selection.first),
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
