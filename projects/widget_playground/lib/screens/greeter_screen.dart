import 'package:flutter/material.dart';

/// Глава 11: поле ввода, контроллер, dispose и проверка ввода.
class GreeterScreen extends StatefulWidget {
  const GreeterScreen({super.key});

  @override
  State<GreeterScreen> createState() => _GreeterScreenState();
}

class _GreeterScreenState extends State<GreeterScreen> {
  final _nameController = TextEditingController();
  String _greeting = '';

  void _sayHello() {
    final name = _nameController.text.trim(); // trim срезает пробелы по краям

    if (name.isEmpty) {
      setState(() {
        _greeting = 'Ну напиши хоть что-нибудь!';
      });
      return; // ранний выход — дальше и делать нечего
    }

    setState(() {
      _greeting = 'Привет, $name!';
    });
  }

  @override
  void dispose() {
    _nameController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Знакомство')),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            TextField(
              controller: _nameController,
              decoration: const InputDecoration(
                labelText: 'Имя',
                border: OutlineInputBorder(),
                prefixIcon: Icon(Icons.person),
              ),
              // чтобы кнопка перепроверялась при каждой букве
              onChanged: (_) => setState(() {}),
            ),
            const SizedBox(height: 12),
            ElevatedButton(
              // пока поле пустое — кнопка серая и ненажимаемая
              onPressed:
                  _nameController.text.trim().isEmpty ? null : _sayHello,
              child: const Text('Поздороваться'),
            ),
            const SizedBox(height: 24),
            Text(_greeting, style: const TextStyle(fontSize: 24)),
          ],
        ),
      ),
    );
  }
}
