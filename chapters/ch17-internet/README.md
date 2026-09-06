# Глава 17. Вопросы из интернета

Проект `quiz_app` на конец главы: вопросы приезжают с сервера книги. Пакет `http` вписан в `pubspec.yaml` — `flutter pub get`.

- `lib/services/questions_api.dart` — запрос, проверка statusCode, разбор JSON; `loadAllQuestions` с try/catch.
- `lib/screens/online_game_screen.dart` — FutureBuilder: ожидание, ошибка, данные.
- `lib/widgets/error_view.dart`, `question_list.dart` — экран ошибки с кнопкой «Повторить» и список вопросов.
- `lib/screens/start_screen.dart` — кнопка «Свежие вопросы».

Чтобы запустить: создайте проект `quiz_app` (Flutter: New Project → Application), скопируйте в него папки и файлы отсюда поверх своих, выполните `flutter pub get` и запустите. Или возьмите готовый проект целиком: [`projects/quiz_app`](../../projects/quiz_app).
