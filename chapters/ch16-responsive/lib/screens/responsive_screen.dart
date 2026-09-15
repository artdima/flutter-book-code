import 'package:flutter/material.dart';

import '../widgets/stat_bar.dart';

const tabletBreakpoint = 600.0;

/// Мини-проект главы про экраны: карточка героя из главы 10,
/// которая на широком экране перестраивается в две колонки.
class ResponsiveScreen extends StatelessWidget {
  const ResponsiveScreen({super.key});

  static const _skillNames = [
    'Прыжок с холодильника',
    'Мурлыканье',
    'Охота на шнурок',
    'Сон 16 часов',
    'Взгляд в пустоту',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Карточка на любом экране')),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Center(
          child: ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 900),
            child: LayoutBuilder(
              builder: (context, constraints) {
                final wide = constraints.maxWidth >= tabletBreakpoint;

                if (wide) {
                  return Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(child: _portrait()),
                      const SizedBox(width: 24),
                      Expanded(
                        flex: 2,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            _name(context),
                            const SizedBox(height: 24),
                            _stats(),
                            const SizedBox(height: 24),
                            _skills(),
                          ],
                        ),
                      ),
                    ],
                  );
                }

                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _portrait(),
                    const SizedBox(height: 16),
                    Center(child: _name(context)),
                    const SizedBox(height: 24),
                    _stats(),
                    const SizedBox(height: 24),
                    _skills(),
                  ],
                );
              },
            ),
          ),
        ),
      ),
    );
  }

  Widget _portrait() {
    return AspectRatio(
      aspectRatio: 1,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(16),
        child: const Image(
          image: NetworkImage('https://picsum.photos/400'),
          fit: BoxFit.cover,
        ),
      ),
    );
  }

  Widget _name(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        FittedBox(
          fit: BoxFit.scaleDown,
          child: Text(
            'Барсик Длинношёрстный',
            style: Theme.of(context).textTheme.headlineSmall,
          ),
        ),
        const SizedBox(height: 4),
        const Text('Уровень 7 · Хранитель дивана'),
      ],
    );
  }

  Widget _stats() {
    return const Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Характеристики',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
        SizedBox(height: 8),
        StatBar(label: 'Скорость', value: 0.8, color: Colors.blue),
        StatBar(label: 'Хитрость', value: 0.95, color: Colors.purple),
        StatBar(label: 'Сытость', value: 0.4, color: Colors.orange),
      ],
    );
  }

  Widget _skills() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text('Умения',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
        const SizedBox(height: 8),
        Wrap(
          spacing: 8,
          runSpacing: 8,
          children: [
            for (final skill in _skillNames) Chip(label: Text(skill)),
          ],
        ),
      ],
    );
  }
}
