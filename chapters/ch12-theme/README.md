# Глава 12. Наводим красоту

Тема, стили и ассеты песочницы `widget_playground`.

- `lib/main.dart` — тема с зерном, тёмный режим и переключение ThemeMode; открывает экран темы, настройки и визитку.
- `lib/screens/theme_demo_screen.dart` — цвета и стили текста из темы, градиент, тень, картинки и шрифт.
- `lib/screens/settings_screen.dart` — экран настроек с переключателем темы.
- `lib/screens/about_screen.dart` — экран-визитка (задание 5).
- `pubspec.yaml` — разделы `assets:` и `fonts:`.
- `assets/images/` — cat.png и logo.png; `assets/fonts/` — Caveat (лицензия OFL, см. README там же).

Картинки и шрифты положите рядом с `lib` и сделайте полный перезапуск приложения.

Чтобы запустить: создайте проект `widget_playground` (Flutter: New Project → Application), скопируйте в него папки и файлы отсюда поверх своих, выполните `flutter pub get` и запустите. Или возьмите готовый проект целиком: [`projects/widget_playground`](../../projects/widget_playground).
