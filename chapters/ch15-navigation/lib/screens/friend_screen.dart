import 'package:flutter/material.dart';

/// Глава 13: данные приезжают параметрами конструктора.
class FriendScreen extends StatelessWidget {
  const FriendScreen({super.key, required this.name, required this.hobby});

  final String name;
  final String hobby;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(name)),
      body: Center(
        child: Text(
          '$name обожает: $hobby',
          style: const TextStyle(fontSize: 24),
        ),
      ),
    );
  }
}
