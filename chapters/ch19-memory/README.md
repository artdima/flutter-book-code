# Глава 19. Приложение с памятью

Проект `quiz_app` на конец главы: рекорд и настройки переживают закрытие приложения. Пакет `shared_preferences` уже вписан в `pubspec.yaml` — выполните `flutter pub get`.

- `lib/screens/result_screen.dart` — StatefulWidget, проверка и сохранение рекорда.
- `lib/models/question.dart` — toJson и fromJson.
- `lib/services/records_service.dart` — таблица рекордов в JSON.
- `lib/main.dart` — подъём состояния: тема живёт в корне и сохраняется.
- `lib/screens/settings_screen.dart` — звук и тема; кнопка настроек — на стартовом экране.

Экраны таблицы рекордов и «Мои вопросы» книга оставляет вам — в эталонный проект они не входят.

Чтобы запустить: создайте проект `quiz_app` (Flutter: New Project → Application), скопируйте в него папки и файлы отсюда поверх своих, выполните `flutter pub get` и запустите. Или возьмите готовый проект целиком: [`projects/quiz_app`](../../projects/quiz_app).
