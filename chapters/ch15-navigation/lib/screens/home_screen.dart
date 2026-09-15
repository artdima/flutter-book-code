import 'package:flutter/material.dart';

import 'details_screen.dart';

/// Глава 13: push кладёт экран на стопку.
class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Главная')),
      body: Center(
        child: FilledButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const DetailsScreen()),
            );
          },
          child: const Text('Открыть подробности'),
        ),
      ),
    );
  }
}
