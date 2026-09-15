import 'package:flutter/material.dart';

/// Глава 10: Column, Row, выравнивание, переполнение, Expanded, Stack.
class LayoutDemoScreen extends StatefulWidget {
  const LayoutDemoScreen({super.key});

  @override
  State<LayoutDemoScreen> createState() => _LayoutDemoScreenState();
}

class _LayoutDemoScreenState extends State<LayoutDemoScreen> {
  bool _fixOverflow = false;
  MainAxisAlignment _mainAxis = MainAxisAlignment.start;
  CrossAxisAlignment _crossAxis = CrossAxisAlignment.start;

  @override
  Widget build(BuildContext context) {
    const longText = 'Это очень-очень-очень длинное сообщение, которое точно '
        'не поместится в одну строку на узком экране';

    return Scaffold(
      appBar: AppBar(title: const Text('Строки и столбцы')),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          const _Caption('Column: сверху вниз'),
          const Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Аня', style: TextStyle(fontSize: 32)),
              Icon(Icons.sports_soccer, size: 48),
              Text('Вратарь двора, гроза всего района'),
            ],
          ),
          const _Caption('Row: слева направо'),
          const Row(
            children: [
              Icon(Icons.star, color: Colors.amber),
              Icon(Icons.star, color: Colors.amber),
              Icon(Icons.star, color: Colors.amber),
              Icon(Icons.star_border),
              Icon(Icons.star_border),
              SizedBox(width: 8),
              Text('3 из 5'),
            ],
          ),
          const _Caption('Две оси: поиграйте переключателями'),
          SegmentedButton<MainAxisAlignment>(
            segments: const [
              ButtonSegment(
                value: MainAxisAlignment.start,
                label: Text('start'),
              ),
              ButtonSegment(
                value: MainAxisAlignment.center,
                label: Text('center'),
              ),
              ButtonSegment(
                value: MainAxisAlignment.spaceBetween,
                label: Text('between'),
              ),
            ],
            selected: {_mainAxis},
            onSelectionChanged: (selection) {
              setState(() => _mainAxis = selection.first);
            },
          ),
          const SizedBox(height: 8),
          SegmentedButton<CrossAxisAlignment>(
            segments: const [
              ButtonSegment(
                value: CrossAxisAlignment.start,
                label: Text('start'),
              ),
              ButtonSegment(
                value: CrossAxisAlignment.center,
                label: Text('center'),
              ),
              ButtonSegment(
                value: CrossAxisAlignment.end,
                label: Text('end'),
              ),
            ],
            selected: {_crossAxis},
            onSelectionChanged: (selection) {
              setState(() => _crossAxis = selection.first);
            },
          ),
          const SizedBox(height: 12),
          Container(
            height: 200,
            color: Theme.of(context).colorScheme.surfaceContainerHighest,
            child: Column(
              mainAxisAlignment: _mainAxis,
              crossAxisAlignment: _crossAxis,
              children: [
                Container(width: 80, height: 40, color: Colors.teal),
                Container(width: 140, height: 40, color: Colors.amber),
                Container(width: 200, height: 40, color: Colors.deepOrange),
              ],
            ),
          ),
          const _Caption('Переполнение и первая помощь Expanded'),
          SwitchListTile(
            title: const Text('Завернуть текст в Expanded'),
            value: _fixOverflow,
            onChanged: (v) => setState(() => _fixOverflow = v),
          ),
          Row(
            children: [
              const Icon(Icons.info),
              const SizedBox(width: 8),
              if (_fixOverflow)
                const Expanded(child: Text(longText))
              else
                const Text(longText),
            ],
          ),
          const _Caption('Доли flex: два к одному'),
          Row(
            children: [
              Expanded(
                flex: 2,
                child: Container(height: 60, color: Colors.teal),
              ),
              Expanded(
                flex: 1,
                child: Container(height: 60, color: Colors.amber),
              ),
            ],
          ),
          const _Caption('Мелкая пехота: Padding, SizedBox, Align'),
          Container(
            height: 100,
            color: Theme.of(context).colorScheme.surfaceContainerHighest,
            child: const Align(
              alignment: Alignment.bottomRight,
              child: Padding(
                padding: EdgeInsets.all(16),
                child: Text('Мне нужен воздух'),
              ),
            ),
          ),
          const _Caption('Stack: слои друг над другом'),
          Stack(
            children: [
              Image.network('https://picsum.photos/300/200'),
              Positioned(
                right: 8,
                bottom: 8,
                child: Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 8,
                    vertical: 4,
                  ),
                  decoration: BoxDecoration(
                    color: Colors.black54,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: const Text(
                    'Фото дня',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 24),
        ],
      ),
    );
  }
}

class _Caption extends StatelessWidget {
  const _Caption(this.text);

  final String text;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(0, 24, 0, 8),
      child: Text(
        text,
        style: Theme.of(context).textTheme.titleMedium?.copyWith(
              color: Theme.of(context).colorScheme.primary,
            ),
      ),
    );
  }
}
