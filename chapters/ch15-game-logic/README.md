# Глава 15. Логика игры

Проект `quiz_app` на конец главы: игра играется.

- `lib/screens/game_screen.dart` — состояние игры, таймер, проверка ответа, подсветка кнопок.
- `lib/widgets/answer_button.dart` — кнопка варианта.
- `lib/screens/result_screen.dart` — экран результата со счётом через конструктор.
- `lib/main.dart` — маршрут `/result` удалён: результат открывается из игры через MaterialPageRoute.

Чтобы запустить: создайте проект `quiz_app` (Flutter: New Project → Application), скопируйте в него папки и файлы отсюда поверх своих, выполните `flutter pub get` и запустите. Или возьмите готовый проект целиком: [`projects/quiz_app`](../../projects/quiz_app).
