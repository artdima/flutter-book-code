# Глава 20. Иконка, сборка и публикация

Проект `quiz_app`, готовый к сборке.

- `pubspec.yaml` — `version: 1.0.0+1`, `flutter_launcher_icons` в dev_dependencies и его настройки; иконка — `assets/icon.png` (1024×1024). Команда: `dart run flutter_launcher_icons`.
- `android/app/src/main/AndroidManifest.xml` — разрешение на интернет для выпускной сборки (и `android:label` — имя на рабочем столе).
- `macos/Runner/Release.entitlements` — разрешение на сеть для mac-версии.

Сборка: `flutter build apk`, `flutter build web --base-href /quiz/`, `flutter build macos` — по тексту главы.

Чтобы запустить: создайте проект `quiz_app` (Flutter: New Project → Application), скопируйте в него папки и файлы отсюда поверх своих, выполните `flutter pub get` и запустите. Или возьмите готовый проект целиком: [`projects/quiz_app`](../../projects/quiz_app).
