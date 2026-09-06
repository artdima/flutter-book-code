import 'package:flutter/material.dart';

/// Глава 12: цвета из темы, стили текста, градиенты, тени и assets.
class ThemeDemoScreen extends StatelessWidget {
  const ThemeDemoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    final texts = Theme.of(context).textTheme;

    return Scaffold(
      appBar: AppBar(title: const Text('Цвета и стили темы')),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          Container(
            width: double.infinity,
            padding: const EdgeInsets.all(16),
            color: colors.primaryContainer,
            child: Text(
              'Карточка в цветах темы',
              style: TextStyle(color: colors.onPrimaryContainer),
            ),
          ),
          const SizedBox(height: 8),
          Container(
            width: double.infinity,
            padding: const EdgeInsets.all(16),
            color: colors.primary,
            child: Text(
              'primary и onPrimary',
              style: TextStyle(color: colors.onPrimary),
            ),
          ),
          const SizedBox(height: 8),
          Container(
            width: double.infinity,
            padding: const EdgeInsets.all(16),
            color: colors.error,
            child: Text(
              'error и onError',
              style: TextStyle(color: colors.onError),
            ),
          ),
          const SizedBox(height: 8),
          Container(
            width: double.infinity,
            padding: const EdgeInsets.all(16),
            color: Colors.amber,
            child: const Text(
              'А это жёсткий Colors.amber — тему он не слушается. '
              'Переключите тёмный режим и сравните.',
              style: TextStyle(color: Colors.black),
            ),
          ),
          const SizedBox(height: 24),
          Text('Большой заголовок', style: texts.headlineLarge),
          Text('Заголовок раздела', style: texts.titleMedium),
          Text('Обычный текст', style: texts.bodyMedium),
          Text('Мелкая подпись', style: texts.labelSmall),
          const SizedBox(height: 8),
          Text(
            'Заголовок в цвете темы через copyWith',
            style: texts.headlineSmall?.copyWith(color: colors.primary),
          ),
          const SizedBox(height: 24),
          Container(
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              gradient: const LinearGradient(
                colors: [Color(0xFF00897B), Color(0xFF4DB6AC)],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
              borderRadius: BorderRadius.circular(20),
              boxShadow: const [
                BoxShadow(
                  color: Colors.black26,
                  blurRadius: 12,
                  offset: Offset(0, 6),
                ),
              ],
            ),
            child: const Text(
              'Карточка с характером',
              style: TextStyle(color: Colors.white, fontSize: 20),
            ),
          ),
          const SizedBox(height: 16),
          const Card(
            child: ListTile(
              leading: Icon(Icons.info_outline),
              title: Text('Готовый Card'),
              subtitle: Text('Тень, скругление и цвет поверхности уже в теме'),
            ),
          ),
          const SizedBox(height: 24),
          Text('Картинка из assets:', style: texts.titleMedium),
          const SizedBox(height: 8),
          Center(
            child: Image.asset('assets/images/cat.png', width: 200),
          ),
          const SizedBox(height: 24),
          Text('Шрифт из assets:', style: texts.titleMedium),
          const SizedBox(height: 8),
          const Text(
            'Почерк волшебника',
            style: TextStyle(fontFamily: 'Caveat', fontSize: 32),
          ),
          const Text(
            'Жирное начертание — weight: 700',
            style: TextStyle(
              fontFamily: 'Caveat',
              fontSize: 32,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 24),
        ],
      ),
    );
  }
}
