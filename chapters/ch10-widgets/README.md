# Глава 10. Всё вокруг — виджет

Проект `widget_playground` — песочница глав 10–16, создаётся в начале этой главы.

- `lib/main.dart` — первый экран главы: MaterialApp → Scaffold → AppBar и Center.
- `lib/screens/widgets_demo_screen.dart` — Text, Icon, Image, Container и свой виджет.
- `lib/widgets/info_card.dart` — виджет InfoCard.
- `lib/screens/red_screen_demo.dart` — красный экран: ошибка в build нарочно.

В книге код главы набирается прямо в `main.dart`. В готовой песочнице каждый опыт — отдельный экран в `lib/screens`, а `main.dart` (см. главу 15) — меню всех опытов. Чтобы запустить один экран, подставьте его в `home:` вместо Scaffold.

Чтобы запустить: создайте проект `widget_playground` (Flutter: New Project → Application), скопируйте в него папки и файлы отсюда поверх своих, выполните `flutter pub get` и запустите. Или возьмите готовый проект целиком: [`projects/widget_playground`](../../projects/widget_playground).
