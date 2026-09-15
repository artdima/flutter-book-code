import 'package:flutter/material.dart';

import 'color_pick_screen.dart';

/// Глава 13: принимаем результат в then и обязательно проверяем на null.
class FavoriteColorScreen extends StatefulWidget {
  const FavoriteColorScreen({super.key});

  @override
  State<FavoriteColorScreen> createState() => _FavoriteColorScreenState();
}

class _FavoriteColorScreenState extends State<FavoriteColorScreen> {
  Color _favoriteColor = Colors.grey;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Любимый цвет')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: 160,
              height: 160,
              decoration: BoxDecoration(
                color: _favoriteColor,
                borderRadius: BorderRadius.circular(24),
              ),
            ),
            const SizedBox(height: 24),
            FilledButton(
              onPressed: () {
                Navigator.push<Color>(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const ColorPickScreen(),
                  ),
                ).then((picked) {
                  // пользователь мог уйти стрелкой назад — тогда приедет null
                  if (picked != null) {
                    setState(() => _favoriteColor = picked);
                  }
                });
              },
              child: const Text('Выбрать цвет'),
            ),
            const SizedBox(height: 8),
            const Text('Уйдите назад стрелкой — цвет останется прежним'),
          ],
        ),
      ),
    );
  }
}
