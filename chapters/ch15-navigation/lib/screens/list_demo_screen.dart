import 'package:flutter/material.dart';

/// Глава 10: ListView.builder превращает список данных в список виджетов.
class ListDemoScreen extends StatelessWidget {
  const ListDemoScreen({super.key});

  static const _friends = ['Аня', 'Тимур', 'Соня', 'Марк', 'Лена', 'Витя'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Лента друзей')),
      body: ListView.builder(
        itemCount: _friends.length,
        itemBuilder: (context, index) {
          return ListTile(
            leading: const Icon(Icons.person),
            title: Text(_friends[index]),
            subtitle: Text('Друг №${index + 1}'),
          );
        },
      ),
    );
  }
}
