import 'package:flutter/material.dart';

/// Глава 9: красный экран. Кнопка ломает build нарочно —
/// чтобы потренироваться читать ошибку и находить свою строку
/// в Debug Console. В настоящем приложении так, конечно, не пишут.
class RedScreenDemo extends StatefulWidget {
  const RedScreenDemo({super.key});

  @override
  State<RedScreenDemo> createState() => _RedScreenDemoState();
}

class _RedScreenDemoState extends State<RedScreenDemo> {
  bool _broken = false;

  @override
  Widget build(BuildContext context) {
    if (_broken) {
      final names = ['Аня'];
      final greeting = 'Привет, ${names[5]}!'; // RangeError — так и задумано
      return Scaffold(body: Center(child: Text(greeting)));
    }

    return Scaffold(
      appBar: AppBar(title: const Text('Красный экран')),
      body: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'Сейчас мы обратимся к пятому элементу списка, в котором '
              'один элемент. Экран зальёт красным — это нормально. '
              'Прочитайте первую строку, найдите в Debug Console ссылку '
              'на свой файл и вернитесь назад.',
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 24),
            FilledButton.icon(
              onPressed: () => setState(() => _broken = true),
              icon: const Icon(Icons.warning_amber),
              label: const Text('Сломать нарочно'),
            ),
          ],
        ),
      ),
    );
  }
}
