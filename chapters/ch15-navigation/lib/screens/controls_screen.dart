import 'package:flutter/material.dart';

/// Глава 11: кнопки всех весов и переключатели,
/// которые своих значений не хранят.
class ControlsScreen extends StatefulWidget {
  const ControlsScreen({super.key});

  @override
  State<ControlsScreen> createState() => _ControlsScreenState();
}

class _ControlsScreenState extends State<ControlsScreen> {
  bool _isSubscribed = false;
  bool? _agreed = false;
  double _volume = 0.5;

  void _say(String text) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(text), duration: const Duration(seconds: 1)),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Кнопки и переключатели')),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          ElevatedButton(
            onPressed: () => _say('Нажали главную!'),
            child: const Text('Главная кнопка'),
          ),
          const SizedBox(height: 8),
          FilledButton(
            onPressed: () => _say('Залитая'),
            child: const Text('Залитая'),
          ),
          const SizedBox(height: 8),
          OutlinedButton(
            onPressed: () => _say('С рамкой'),
            child: const Text('С рамкой'),
          ),
          const SizedBox(height: 8),
          TextButton(
            onPressed: () => _say('Просто текст'),
            child: const Text('Просто текст'),
          ),
          const SizedBox(height: 8),
          IconButton(
            onPressed: () => _say('Сердечко'),
            icon: const Icon(Icons.favorite),
          ),
          const SizedBox(height: 8),
          const ElevatedButton(
            onPressed: null, // null выключает кнопку
            child: Text('Выключенная кнопка'),
          ),
          const Divider(height: 40),
          SwitchListTile(
            title: const Text('Подписаться на новости'),
            value: _isSubscribed,
            onChanged: (newValue) {
              setState(() {
                _isSubscribed = newValue;
              });
            },
          ),
          CheckboxListTile(
            title: const Text('Согласен со всем на свете'),
            value: _agreed,
            tristate: true,
            onChanged: (newValue) {
              setState(() {
                _agreed = newValue;
              });
            },
          ),
          const SizedBox(height: 8),
          Text('Громкость: ${(_volume * 100).round()}%'),
          Slider(
            value: _volume,
            onChanged: (newValue) {
              setState(() {
                _volume = newValue;
              });
            },
          ),
        ],
      ),
    );
  }
}
