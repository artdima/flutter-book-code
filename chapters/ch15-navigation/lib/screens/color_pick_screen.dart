import 'package:flutter/material.dart';

/// Глава 13: экран, который возвращает результат через pop со значением.
class ColorPickScreen extends StatelessWidget {
  const ColorPickScreen({super.key});

  static const _palette = [
    Colors.teal,
    Colors.deepPurple,
    Colors.orange,
    Colors.pink,
    Colors.green,
    Colors.blue,
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Выберите цвет')),
      body: GridView.count(
        padding: const EdgeInsets.all(16),
        crossAxisCount: 3,
        crossAxisSpacing: 12,
        mainAxisSpacing: 12,
        children: [
          for (final color in _palette)
            InkWell(
              onTap: () => Navigator.pop(context, color),
              child: Container(
                decoration: BoxDecoration(
                  color: color,
                  borderRadius: BorderRadius.circular(16),
                ),
              ),
            ),
        ],
      ),
    );
  }
}
