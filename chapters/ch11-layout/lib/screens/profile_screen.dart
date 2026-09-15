import 'package:flutter/material.dart';

import '../widgets/stat_bar.dart';

/// Мини-проект главы 10: карточка героя.
class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Профиль героя')),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Stack(
                children: [
                  const CircleAvatar(
                    radius: 60,
                    backgroundImage: NetworkImage('https://picsum.photos/200'),
                  ),
                  Positioned(
                    right: 0,
                    bottom: 0,
                    child: Container(
                      padding: const EdgeInsets.all(6),
                      decoration: const BoxDecoration(
                        color: Colors.green,
                        shape: BoxShape.circle,
                      ),
                      child: const Text(
                        '7',
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 16),
            const Center(
              child: Text(
                'Барсик',
                style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
              ),
            ),
            const Center(child: Text('Уровень 7 · Хранитель дивана')),
            const SizedBox(height: 24),
            const Text(
              'Характеристики',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            const StatBar(label: 'Скорость', value: 0.8, color: Colors.blue),
            const StatBar(label: 'Хитрость', value: 0.95, color: Colors.purple),
            const StatBar(label: 'Сытость', value: 0.4, color: Colors.orange),
          ],
        ),
      ),
    );
  }
}
