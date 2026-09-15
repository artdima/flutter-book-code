import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

/// Единственный дом настроек приложения: тема и звук.
class SettingsModel extends ChangeNotifier {
  SettingsModel(this._prefs);

  final SharedPreferencesAsync _prefs;

  ThemeMode _themeMode = ThemeMode.system;
  bool _soundOn = true;

  ThemeMode get themeMode => _themeMode;
  bool get soundOn => _soundOn;

  Future<void> load() async {
    final name = await _prefs.getString('theme_mode');
    final sound = await _prefs.getBool('sound_on');
    if (name != null) _themeMode = ThemeMode.values.byName(name);
    _soundOn = sound ?? true;
    notifyListeners();
  }

  Future<void> setThemeMode(ThemeMode mode) async {
    if (mode == _themeMode) return;
    _themeMode = mode;
    notifyListeners();
    await _prefs.setString('theme_mode', mode.name);
  }

  Future<void> setSoundOn(bool value) async {
    if (value == _soundOn) return;
    _soundOn = value;
    notifyListeners();
    await _prefs.setBool('sound_on', value);
  }
}
