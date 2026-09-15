import 'package:flutter/material.dart';

/// Глава 13: pop снимает верхнюю карту.
class DetailsScreen extends StatelessWidget {
  const DetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Подробности')),
      body: Center(
        child: FilledButton(
          onPressed: () {
            Navigator.pop(context);
          },
          child: const Text('Назад'),
        ),
      ),
    );
  }
}
