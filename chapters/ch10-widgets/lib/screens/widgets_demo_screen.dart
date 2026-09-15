import 'package:flutter/material.dart';

import '../widgets/info_card.dart';

/// Глава 9: Text, Icon, Image, Container и свой виджет InfoCard.
class WidgetsDemoScreen extends StatelessWidget {
  const WidgetsDemoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Виджеты и Container')),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          const Text(
            'Привет, виджеты!',
            style: TextStyle(
              fontSize: 32,
              fontWeight: FontWeight.bold,
              color: Colors.deepOrange,
            ),
          ),
          const SizedBox(height: 16),
          const Icon(Icons.rocket_launch, size: 64, color: Colors.purple),
          const SizedBox(height: 16),
          Image.network('https://picsum.photos/300/200'),
          const SizedBox(height: 24),
          Center(
            child: Container(
              width: 220,
              height: 120,
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.amber,
                borderRadius: BorderRadius.circular(24),
                border: Border.all(color: Colors.deepOrange, width: 3),
              ),
              child: const Center(
                child: Text('Карточка!', style: TextStyle(fontSize: 24)),
              ),
            ),
          ),
          const SizedBox(height: 24),
          const Text('Свой виджет InfoCard, три раза с разными параметрами:'),
          const SizedBox(height: 12),
          const Center(child: InfoCard(text: 'Первая', color: Colors.amber)),
          const SizedBox(height: 12),
          const Center(
            child: InfoCard(text: 'Вторая', color: Colors.lightGreen),
          ),
          const SizedBox(height: 12),
          const Center(
            child: InfoCard(text: 'Третья', color: Colors.lightBlueAccent),
          ),
        ],
      ),
    );
  }
}
