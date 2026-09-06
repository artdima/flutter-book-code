# Глава 18. Последние штрихи

Проект `quiz_app` на конец главы: анимация смены вопроса, звуки, «О приложении», «Похвастаться». Пакеты `audioplayers` и `share_plus` вписаны в `pubspec.yaml`, звуки лежат в `assets/sounds` — после `flutter pub get` нужен полный перезапуск.

- `lib/screens/game_screen.dart` — AnimatedSwitcher с ключом, звук ответа с учётом настройки.
- `lib/screens/result_screen.dart` — кнопка «Похвастаться» (в эталоне это OutlinedButton, чтобы не спорить с главной кнопкой).
- `lib/screens/settings_screen.dart` — пункт «О приложении» через showAboutDialog.
- `assets/sounds/` — correct, wrong, а также fanfare и fail для задания 2.

Чтобы запустить: создайте проект `quiz_app` (Flutter: New Project → Application), скопируйте в него папки и файлы отсюда поверх своих, выполните `flutter pub get` и запустите. Или возьмите готовый проект целиком: [`projects/quiz_app`](../../projects/quiz_app).
