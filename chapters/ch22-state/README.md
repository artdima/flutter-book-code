# Глава 22. Общее состояние: когда setState перестаёт хватать

«Викторина» после рефакторинга — только те файлы, которые глава меняет. Копируются поверх своих в проект `quiz_app`.

- `lib/models/settings_model.dart` — `ChangeNotifier` с темой и звуком, единственный дом настроек.
- `lib/widgets/settings_scope.dart` — `InheritedNotifier`, свой `Theme.of` для настроек.
- `lib/main.dart` — модель создаётся и загружается в корне, `SettingsScope` над `MaterialApp`, тема берётся из модели.
- `lib/screens/start_screen.dart` — параметр `onThemeModeChanged` убран: курьер уволен.
- `lib/screens/settings_screen.dart` — был `StatefulWidget` с двумя чтениями из склада, стал `StatelessWidget` — 101 строка превратилась в 65.
- `lib/screens/game_screen.dart` — звук спрашивается у модели, а не у склада.

Внешних пакетов для состояния не добавлено: всё родное.
