# Глава 13. Много экранов: навигация

Песочница `widget_playground` целиком — с этой главы один экран живёт в одном файле.

- `lib/main.dart` — карта маршрутов `routes` и тема.
- `lib/screens/playground_screen.dart` — стартовое меню всех опытов глав 9–13.
- `lib/screens/home_screen.dart`, `details_screen.dart` — push и pop.
- `lib/screens/friends_screen.dart`, `friend_screen.dart` — список → экран детали, данные через конструктор.
- `lib/screens/favorite_color_screen.dart`, `color_pick_screen.dart` — pop со значением и then.
- `lib/screens/main_shell.dart`, `lib/widgets/tabs.dart` — вкладки и NavigationBar.
- `lib/screens/dialogs_screen.dart` — диалог, SnackBar, шторка.
- `lib/screens/settings_screen.dart` — именованный маршрут `/settings`.

Экраны глав 9–12, на которые тоже ссылается `main.dart`, лежат здесь же — папка запускается как есть (картинки и шрифты для главы 12 — в папке `ch12-theme`).

Чтобы запустить: создайте проект `widget_playground` (Flutter: New Project → Application), скопируйте в него папки и файлы отсюда поверх своих, выполните `flutter pub get` и запустите. Или возьмите готовый проект целиком: [`projects/widget_playground`](../../projects/widget_playground).
