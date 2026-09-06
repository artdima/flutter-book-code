import 'package:flutter/material.dart';

/// Глава 10: сетка на GridView.count и цикл прямо внутри списка детей.
class GridDemoScreen extends StatelessWidget {
  const GridDemoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Полка уровней')),
      body: GridView.count(
        padding: const EdgeInsets.all(8),
        crossAxisCount: 3,
        crossAxisSpacing: 8,
        mainAxisSpacing: 8,
        children: [
          for (var i = 1; i <= 30; i++)
            Container(
              color: Colors.teal,
              child: Center(
                child: Text(
                  '$i',
                  style: const TextStyle(color: Colors.white, fontSize: 20),
                ),
              ),
            ),
        ],
      ),
    );
  }
}
