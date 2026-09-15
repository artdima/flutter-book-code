import 'package:flutter/material.dart';

/// Описание одного опыта из книги.
class Demo {
  const Demo(this.chapter, this.title, this.subtitle, this.icon, this.route);

  final int chapter;
  final String title;
  final String subtitle;
  final IconData icon;
  final String route;
}

const _chapters = {
  9: 'Глава 9. Всё вокруг — виджет',
  10: 'Глава 10. Расставляем всё по местам',
  11: 'Глава 11. Кнопки, ввод и состояние',
  12: 'Глава 12. Наводим красоту',
  13: 'Глава 13. Много экранов: навигация',
  // Новая глава про формы: номер временный, встанет на своё место при
  // перенумерации книги.
  14: 'Новая глава. Формы и валидация',
};

const _demos = <Demo>[
  Demo(9, 'Виджеты и Container', 'Text, Icon, Image, Container, свой InfoCard',
      Icons.widgets, '/widgets'),
  Demo(9, 'Красный экран', 'Ошибка в build — нарочно, чтобы научиться читать',
      Icons.error_outline, '/red'),
  Demo(10, 'Строки и столбцы', 'Column, Row, выравнивание, Expanded, Stack',
      Icons.view_column, '/layout'),
  Demo(10, 'Лента друзей', 'ListView.builder и ListTile', Icons.list, '/list'),
  Demo(10, 'Полка уровней', 'GridView.count', Icons.grid_view, '/grid'),
  Demo(10, 'Карточка героя', 'Мини-проект: Stack, CircleAvatar, StatBar',
      Icons.pets, '/profile'),
  Demo(11, 'Кликер', 'StatefulWidget и setState', Icons.add_circle_outline,
      '/counter'),
  Demo(11, 'Знакомство', 'TextField, контроллер, проверка ввода',
      Icons.person_outline, '/greeter'),
  Demo(11, 'Кнопки и переключатели', 'Switch, Checkbox, Slider',
      Icons.toggle_on, '/controls'),
  Demo(11, 'Магический шар', 'Мини-проект главы 11', Icons.blur_circular,
      '/magic'),
  Demo(12, 'Цвета и стили темы', 'colorScheme, textTheme, градиент, assets',
      Icons.palette, '/theme'),
  Demo(12, 'Экран-визитка', 'Логотип, название, слоган, карточка с тенью',
      Icons.badge, '/about'),
  Demo(13, 'Push и pop', 'Главная → Подробности и обратно', Icons.arrow_forward,
      '/nav'),
  Demo(13, 'Список → деталь', 'Данные уезжают параметрами конструктора',
      Icons.people, '/friends'),
  Demo(13, 'Результат обратно', 'pop со значением и then', Icons.color_lens,
      '/favorite-color'),
  Demo(13, 'Вкладки', 'NavigationBar и переключение body', Icons.tab, '/tabs'),
  Demo(13, 'Диалоги и SnackBar', 'showDialog, ScaffoldMessenger, шторка',
      Icons.chat_bubble_outline, '/dialogs'),
  Demo(13, 'Настройки', 'Именованный маршрут /settings', Icons.settings,
      '/settings'),
  Demo(14, 'Анкета участника', 'Form, TextFormField, validator, сброс формы',
      Icons.fact_check_outlined, '/survey'),
];

/// Хаб песочницы: список всех опытов части 2.
class PlaygroundScreen extends StatelessWidget {
  const PlaygroundScreen({
    super.key,
    required this.themeMode,
    required this.onThemeModeChanged,
  });

  final ThemeMode themeMode;
  final ValueChanged<ThemeMode> onThemeModeChanged;

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Моя песочница'),
        actions: [
          IconButton(
            tooltip: 'Светлая или тёмная тема',
            icon: Icon(isDark ? Icons.light_mode : Icons.dark_mode),
            onPressed: () => onThemeModeChanged(
              isDark ? ThemeMode.light : ThemeMode.dark,
            ),
          ),
        ],
      ),
      body: ListView(
        children: [
          for (final chapter in _chapters.entries) ...[
            Padding(
              padding: const EdgeInsets.fromLTRB(16, 24, 16, 4),
              child: Text(
                chapter.value,
                style: Theme.of(context).textTheme.titleMedium?.copyWith(
                      color: Theme.of(context).colorScheme.primary,
                    ),
              ),
            ),
            for (final demo in _demos.where((d) => d.chapter == chapter.key))
              ListTile(
                leading: Icon(demo.icon),
                title: Text(demo.title),
                subtitle: Text(demo.subtitle),
                trailing: const Icon(Icons.chevron_right),
                onTap: () => Navigator.pushNamed(context, demo.route),
              ),
          ],
          const SizedBox(height: 24),
        ],
      ),
    );
  }
}
